define([ 'require', '$UI/system/lib/base/observable', '$UI/system/lib/base/object', '$UI/system/templates/common/js/templateService', '$UI/system/components/designerCommon/js/webSocketMng' ],
		function(require, Observable, Object, templateService, webSocket) {
			var justep = require("$UI/system/lib/justep");
			var URL = require('$UI/system/lib/base/url');
			var projectName = "", nativePath = "", edit, webIDE, sessionId, paasConsoleURL;
			var urlParam = new URL(location.href);
			var key = urlParam.getParam('key');
			var nativePath = templateService.getNativePath();

			var token = webSocket.getRequestParameter("token");
			var templateType = {
				"php" : "3",
				"bex5" : "6"
			};

			if (!!key) {
				webIDE = true;
				edit = true;
				projectName = sessionStorage.getItem("appPath");
				paasConsoleURL = sessionStorage.getItem('paasURL');
				sessionId = sessionStorage.getItem('sessionId');
			} else {
				webIDE = false;
				edit = webSocket.getRequestParameter("edit");
				var targetPath = webSocket.getRequestParameter("targetPath");
				appPath = targetPath.substr(nativePath.length + 1);
				appPath = appPath.replace(/\\/g, '/');
				projectName = appPath.split('/')[0];
				paasConsoleURL = templateService.getCloudX5ConsoleUrl();
			}

			var appPath = nativePath + "/" + projectName + "/";

			var XPaaS = Object.extend({
				mixins : Observable,
				constructor : function() {
					var self = this;
					this.callParent();
					Observable.prototype.constructor.call(this);
					this.TEMPLATE_TYPE = templateType;
					this.paasToken = "";
					this.sessionId = "";
					this.__setConsole(paasConsoleURL);
					this.ide = webIDE ? "webide" : "studio";
					this.baasType = "2";
					if (webIDE) {
						sessionId && self.setSessionID(sessionId, function(sessionId) {
							self.sessionId = sessionId;
						});
					} else {
						this.login(token, function success(paasToken) {
							self.paasToken = paasToken;
						}, null, false);
					}

					this.loadConfig();

				},
				getPaasURL : function() {
					return paasConsoleURL;
				},
				getPassToken : function() {
					return this.paasToken;
				},
				getSessionId : function() {
					return sessionId;
				},
				__getBaasType : function() {
					var self = this;
					var dtd = $.Deferred();

					if (this.timer) {
						clearTimeout(this.timer);
					}
					this.timer = setTimeout(function() {
						self.timer = null;
						dtd.resolve('-1');
						self.errorFired = true;
						self.readyFired = false;
						self.fireEvent('xpaasError');
					}, 3000);

					if ((self.paasToken || self.sessionId) && self.config.paasServiceID) {
						self.templateInfo(function(templates) {
							var template = templates.object;
							self.loadProjectByServiceID(self.config.paasServiceID, function(project) {
								var app = project && project.object || {};
								if (app.tempId) {
									for ( var i in template) {
										if (app.tempId == template[i].id) {
											if (self.timer) {
												clearTimeout(self.timer);
											}
											dtd.resolve(template[i].type);
											app.templateType = template[i].type;
											self.fireEvent('xpaasReady', {
												"source" : "loadProjectByServiceID",
												"project" : app
											});
											self.errorFired = false;
											self.readyFired = true;
											break;
										}
									}
								} else {
									self.fireEvent('xpaasError');
									self.errorFired = true;
									self.readyFired = false;
									dtd.resolve('-1');
								}
							});
						});
					}
					return dtd;
				},
				__onXpaasReadyFun : function(event) {
					var self = this;
					if (event.source === 'loadProjectByServiceID') {
						var type = event.project.templateType;
						self.baasType = "" + type
						self.baas = {
							"name" : type == templateType.php ? "baas.php.tar.gz" : "baas.java.tar.gz",
							"file" : appPath + "dist/paas/" + (type == templateType.php ? "baas.php.tar.gz" : "baas.java.tar.gz"),
							"published" : function() {
								return self.config.paasDistFiles.indexOf(this.name) > -1; // todo
							},
							"fileExist" : function() {
								return templateService.fileExists(appPath + "dist/paas/" + this.name)
							},

						};

						self.sql = {
							"name" : "sql.tar.gz",
							"publish" : type == templateType.bex5 ? false : true,
							"published" : function() {
								return type == templateType.bex5 ? false : (self.config.paasDistFiles.indexOf(this.name) > -1);
							}
						};
						self.ui = {
							"name" : self.config.mode == '3' ? "model.tar.gz" : "www.tar.gz",
							"published" : function() {
								return self.config.paasDistFiles.indexOf(this.name) > -1;
							},
							"fileExist" : function() {
								var exist = self.config.mode == '3' ? true : templateService.fileExists(appPath + "www" + self.config.webPath + "/www.zip");
								return exist;
							},
						};
						self.app = {
							"name" : "app.tar.gz",
							"file" : appPath + "dist/paas/app.tar.gz",
							"published" : function() {
								return self.config.paasDistFiles.indexOf(this.name) > -1;
							},
							"fileExist" : function() {
								return templateService.fileExists(appPath + "dist/app.apk") || templateService.fileExists(appPath + "dist/app.ipa")
							},

						};
						self.userData = {
							"name" : "data.tar.gz",
							"file" : appPath + "dist/paas/data.tar.gz",
							"published" : function() {
								return self.config.paasDistFiles.indexOf(this.name) > -1;
							},
							"fileExist" : function() {
								return self.config.userDataDirExist || false;
							},

						};
					}
				},

				ready : function(callback) {
					var self = this;
					if (this.readyFired) {
						callback && callback();
					} else {
						var xpaasReadyFun = function(event) {
							callback && callback.call(self);
							self.off('xpaasReady', xpaasReadyFun);
						};
						callback && this.on("xpaasReady", xpaasReadyFun);
					}

				},
				error : function(callback) {
					var self = this;
					if (this.errorFired) {
						callback && callback();
					} else {
						var xpaasErrorFun = function(event) {
							callback && callback.call(self);
							self.off('xpaasError', xpaasErrorFun);
						};
						callback && this.on("xpaasError", xpaasErrorFun);
					}
				},
				loadConfig : function() {
					var self = this;
					self.on("xpaasReady", self.__onXpaasReadyFun);
					$.ajax({
						async : false,
						contentType : 'application/json',
						processData : false,
						type : 'GET',
						url : require.toUrl('$UI/system/deploy/app/getAppConfig.j?projectName=' + projectName),
						success : function(result) {
							self.config = result;
							self.__getBaasType();

						},
						error : function(xhr, status, err) {
							var config = {};
							config.appName = projectName;
							config.mode = webIDE ? 3 : 1;
							config.appID = justep.UUID.createUUID();
							config.genAndroid = true;
							config.genIOSDis = true;
							config.compileUI = true;
							config.platform = "android";
							config.releaseMode = "release";
							config.serverURL = "http://" + location.host;
							config.indexURL = "";
							config.uiResDirs = "";
							self.config = config;

							self.readyFired = false;
							self.fireEvent('xpaasError');
							self.errorFired = true;
						}
					});
				},
				__requestUIserver : function(url, successCallback, failCallback, async) {
					var self = this;
					var data = $.ajax({
						async : async === false ? false : true,
						contentType : 'application/json',
						processData : false,
						type : 'GET',
						url : require.toUrl(url),
						success : function(result) {
							successCallback && successCallback(result);
						},
						error : function(xhr, status, err) {
							failCallback && failCallback(err);
						}
					});
					return data.responseJSON;
				},

				__setConsole : function(token, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=set&paasConsoleURL=' + paasConsoleURL, function(result) {
					}, function(xhr, status, err) {
					}, false)
				},

				login : function(token, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=login&token=' + token, function(result) {
						if (result.paasToken) {
							successCallback && successCallback(result.paasToken);
						} else {
							failCallback && failCallback(result.msg);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					}, false)
				},

				setSessionID : function(sessionID, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=setSessionID&sessionID=' + sessionID, function(result) {
						if (result.sessionID) {
							successCallback && successCallback(result.sessionID);
						} else {
							failCallback && failCallback(result.msg);
						}
					}, function(err) {
					}, false);
				},

				checkApp : function(path, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=checkApp&path=' + path, function(result) {
						successCallback && successCallback(result);
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				loadProject : function(successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=loadProject', function(result) {
						if (result.totalNum > 0) {
							successCallback && successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},
				loadProjectByServiceID : function(serviceID, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=loadProject&serviceID=' + serviceID, function(result) {
						if (result.success == true) {
							successCallback && successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				loadApp : function(projectId, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=loadApp&projectId=' + projectId, function(result) {
						if (result.totalNum > 0) {
							successCallback && successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				loadAppByID : function(paasServiceID, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=loadApp&paasServiceID=' + paasServiceID, function(result) {
						if (result.success == true) {
							successCallback && successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				checkState : function(serviceID, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=state&serviceID=' + serviceID, function(result) {
						if (result.object) {
							successCallback && successCallback(result.object);
						} else {
							failCallback && failCallback(result.msg);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				templateInfo : function(successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=templateInfo', function(result) {
						if (result.success == true) {
							successCallback && successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},
			});

			return new XPaaS();
		});
