define([ 'require', '$UI/system/lib/base/object', '$UI/system/templates/common/js/templateService', '$UI/system/components/designerCommon/js/webSocketMng' ],
//
function(require, Object, templateService, webSocket) {

	var URL = require('$UI/system/lib/base/url');
	var justep = require("$UI/system/lib/justep");
	var nativePath = templateService.getNativePath();
	var projectName = "", webIDE;
	var thisurl = new URL(location.href);
	var key = thisurl.getParam('key');

	if (!!key) {
		webIDE = true;
		projectName = sessionStorage.getItem("appPath");
	} else {
		webIDE = false;
		var targetPath = webSocket.getRequestParameter("targetPath");
		if((!targetPath) &&(webSocket.getRequestParameter("overrideURL"))){
			projectName = "apploader";
		}else{
			appPath = targetPath.substr(nativePath.length + 1);
			appPath = appPath.replace(/\\/g, '/');
			projectName = appPath.split('/')[0];
		}		
	}
	if (projectName === 'plugins' || projectName === 'templates') {
		projectName = "";
	}
	var appEngine = Object.extend({
		constructor : function(reqURL) {
			this.callParent();
			this.getCompiled = true;

			this.loadConfig(this.getProjectName());
			this.reqURL = reqURL + (this.getEdit() ? '?edit=true' : '');
			this.webIDE = webIDE;
			this.config.webIDE = this.webIDE;
			this.DEFAULT_HASH = 'version';// version or md5

			this.ide = { // TODO : 放到页面去
				model3Selected : webIDE ? true : false,
				packageWizEnable : webIDE ? false : true,
				packerEnable : webIDE ? true : false,
			}
		},

		getEdit : function() {
			return this.edit;
		},
		getProjectName : function() {
			return projectName;
		},

		getNativePath : function(appName) {
			return nativePath;
		},
		getAppBuilderServerUrl : function() {
			if (webIDE) {
				return (this.config.platform && (this.config.platform.indexOf('ios') >= 0)) ? "http://mac.cloudx5.com:9999/app-builder" : "http://android-packer.system:8080/app-builder";
			} else {
				return this.config.proxyBuilderServer || ""
			}
		},
		setAppBuilderServerUrl : function(url) {
			templateService.setAppBuilderServerUrl(url);
		},

		loadConfig : function(projectName) {
			var self = this;
			$.ajax({
				async : false,
				contentType : 'application/json',
				processData : false,
				type : 'GET',
				url : require.toUrl('$UI/system/deploy/app/getAppConfig.j?projectName=' + projectName),
				success : function(result) {
					if (result.msg) {
						alert(result.msg);
					}
					self.edit = true;
					if (result.extBrowser === true) {
						result.browserEngine = 'crossWalk';
					}
					result.browserEngine = result.browserEngine ? result.browserEngine : 'auto';
					self.config = result;
					if (self.config.mode == '1' || self.config.mode == '2') {
						self.getCompile.call(self);
					}
				},
				error : function(xhr, status, err) {
					self.edit = false;
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
					config.browserEngine = 'auto';
					self.config = config;
					if (projectName && !webIDE) {
						alert('加载应用配置失败，请检查目录“Native\\' + projectName + '”是否正常');
					}
				}
			});
		},

		getPlugins : function(projectName) {
			var plugins = $.ajax({
				async : false,
				contentType : 'application/json',
				processData : false,
				type : 'GET',
				url : require.toUrl('$UI/system/deploy/app/getRegPlugins.j?projectName=' + projectName),
				success : function(result) {
				},
				error : function(xhr, status, err) {
					alert('加载应用配置失败，请检查目录“Native\\' + projectName + '”是否正常!');
				}
			});

			return plugins.responseJSON;
		},

		getCompile : function() {
			var useMd5 = (this.DEFAULT_HASH === 'md5' && !this.config.hash && this.getProjectName() && this.config.indexURL) || (this.config.hash === 'md5')
			var self = this;
			if (!useMd5) {
				self.getCompiled = true;
				return {
					"hash" : "no"
				};
			}
			var config = this.config;

			var url = config.serverURL + config.webPath + "/compileInfo.json"
			var plugins = $.ajax({
				async : false,
				contentType : 'application/json',
				processData : false,
				type : 'GET',
				url : require.toUrl('$UI/system/deploy/compile/downloadCompile.j?url=' + url + '&projectName=' + projectName),
				success : function(result) {
					if (result.msg === 'ok') {
						self.getCompiled = true;
					} else {
						self.getCompiled = false;
					}
				},
				error : function(xhr, status, err) {
					self.getCompiled = false;
				}
			});

			return plugins.responseJSON;
		},

		getDownloadInfo : function(projectName, appName) {
			var downloadInfo = $.ajax({
				async : false,
				contentType : 'application/json',
				processData : false,
				type : 'GET',
				url : require.toUrl('$UI/system/deploy/package/getDownloadInfo.j?projectName=' + projectName + '&appName=' + appName),
				success : function(result) {
				},
				error : function(xhr, status, err) {
					alert('获取App下载信息失败');
				}
			});

			return downloadInfo.responseJSON;
		},
		startIpaService : function(ip, projectName) {
			var downloadInfo = $.ajax({
				async : false,
				contentType : 'application/json',
				processData : false,
				type : 'GET',
				url : require.toUrl('$UI/system/deploy/package/startIpaService.j?ip=' + ip + '&projectName=' + projectName),
				success : function(result) {
					console.log(result);
				},
				error : function(xhr, status, err) {
					alert('获取App下载信息失败');
				}
			});

			return downloadInfo.responseJSON;
		},

		getConfig : function() {
			return this.config;
		},

		build : function(param, buildFinishedNotify) {
			var self = this;
			var config = this.getConfig();
			if (config.hash === 'md5' || (this.DEFAULT_HASH === 'md5' && !config.hash)) {
				config.resourceVersion = "d";
			}
			$.ajax({
				async : param.async === true,
				data : JSON.stringify(this.getConfig()),
				dataType : 'json',
				contentType : 'application/json',
				processData : false,
				type : 'POST',
				url : require.toUrl(this.reqURL),
				success : function(result) {
					/* pack 时间太长， safari下60s会报错，这里直接返回并通过checkPacking监测 */
					if (result.code === 'BUSY') {
						var refreshID = window.packCheckId = window.setInterval(function() {
							var result = $.ajax({
								async : false,
								data : {},
								dataType : 'json',
								contentType : 'application/json',
								processData : false,
								type : 'POST',
								url : require.toUrl(param.checkStatusURL ? param.checkStatusURL : "$UI/system/deploy/package/checkPacking.j")
							}).responseJSON;
							if (result.code !== 'BUSY') {
								window.clearInterval(refreshID);
								if (buildFinishedNotify) {
									buildFinishedNotify(result);
								}
							}

						}, 2000);
					} else {
						if (buildFinishedNotify) {
							buildFinishedNotify(result);
						}
					}
				},
				error : function(xhr, status, err) {
					if (buildFinishedNotify) {
						buildFinishedNotify({
							flag : false,
							message : err
						});
					}
				}
			});
		},

		closeDialog : function() {
			window.packRefreshID && window.clearInterval(window.packRefreshID);
			window.packCheckId && window.clearInterval(window.packCheckId);
			templateService.closeDialog();
		}
	});
	return appEngine;
});
