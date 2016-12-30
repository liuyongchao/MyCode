define(function(require) {
	var xpaas = require("$UI/system/deploy/paas/xpaas");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.xpaas = xpaas;
		this.enableBaas = true;
		this.enableUI = true;
		this.enableAPP = true;
		this.enableSQL = justep.Bind.observable(true);

		this.baasPublish = justep.Bind.observable(true);
		this.uiPublish = justep.Bind.observable(true);
		this.sqlPublish = justep.Bind.observable(true);
		this.appPublish = justep.Bind.observable(true);
		this.userDataPublish = justep.Bind.observable(true);

		this.baasPublished = justep.Bind.observable(0);
		this.uiPublished = justep.Bind.observable(0);
		this.sqlPublished = justep.Bind.observable(0);
		this.appPublished = justep.Bind.observable(0);
		this.userDataPublished = justep.Bind.observable(0);

		this.compileBaaS = justep.Bind.observable(true);
		this.compileUI = justep.Bind.observable(true);
		this.packApp = justep.Bind.observable(true);

		this.sqlLabel = justep.Bind.observable('用于数据库初始化，在 Baas/sql目录');
		this.baasLabel = justep.Bind.observable('BaaS（在Baas目录）提供后台服务，供UI通过ajax调用');
		this.userDataLabel = justep.Bind.observable('包含文档数据，例如默认图片；文档数据在model目录同级的data目录下');

	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		this.appEngine = this.getParent().appEngine;
		var errFun = function(err) {
			if (self.comp('serverURL')) {
				self.comp('serverURL').set({
					value : err
				});
				self.comp('serverURL').domNode.style.color = 'red';
			}
		};
		xpaas.ready(function() {

			if (xpaas.baasType == xpaas.TEMPLATE_TYPE.php) {
				self.sqlLabel.set('用于数据库初始化，在 Baas.php/sql目录');
				self.baasLabel.set('BaaS（在Baas.php目录）提供后台服务，供UI通过ajax调用');
			}
			if (xpaas.baasType == xpaas.TEMPLATE_TYPE.bex5) {
				self.enableSQL.set(false);
			}

			xpaas.loadAppByID(self.appEngine.getConfig().paasServiceID, function(res) {

				if (res && res.object) {
					console.log(res.object);
					xpaas.cloud = res.object;
					xpaas.config.paasDistFiles = xpaas.cloud.dist || "";

					if (self.comp('serverURL')) {
						self.comp('serverURL').set({
							value : xpaas.config.serverURL + (('1' == xpaas.cloud.deployState) ? "" : "【未部署】")
						});
						self.baasPublish.set(xpaas.baas.published());
						self.sqlPublish.set(xpaas.sql.published());
						self.appPublish.set(xpaas.app.published());
						self.userDataPublish.set(xpaas.userData.published());

						self.baasPublished.set(xpaas.baas.published() ? 1 : 0);
						self.uiPublished.set(xpaas.ui.published() ? 1 : 0);
						self.sqlPublished.set(xpaas.sql.published() ? 1 : 0);
						self.appPublished.set(xpaas.app.published() ? 1 : 0);
						self.userDataPublished.set(xpaas.userData.published() ? 1 : 0);

						self.fileExistBaas = xpaas.baas.fileExist();
						self.fileExistAPP = xpaas.app.fileExist();
						self.fileExistWWW = xpaas.ui.fileExist();
						self.fileExistData = xpaas.userData.fileExist();

						self.getParent().hasDownloadBtn.set('1' == xpaas.cloud.deployState ? true : false);
						self.getParent().hasFinishBtn.set(true);
					}
				} else {
					errFun("当前Web服务地址没有关联到CloudX5，如需部署到CloudX5，请在“编辑本地App”里面设置正确的Web服务地址");
				}
			}, function() {
				errFun("加载失败，请重试。");
			})
		});

		xpaas.error(function() {
			errFun("当前Web服务地址没有关联到CloudX5，如需部署到CloudX5，请在“编辑本地App”里面设置正确的Web服务地址");
		});

		this.getParent().comp("cancelBtn").set({
			label : "关闭"
		});
		this.getParent().comp("finishBtn").set({
			label : "部署"
		});

	};

	Model.prototype.hasBackBtn = function(wizard) {
		return false;
	};

	Model.prototype.hasNextBtn = function(wizard) {
		return false;
	};

	Model.prototype.downloadPage = function(wizard) {
		this.getParent().openPage({
			id : "downloadApp",
			url : "$UI/system/deploy/paas/downloadApp.w",
			fromId : "deployInfo"
		});
	};

	Model.prototype.finish = function() {
		if (!this.__comfirm()) {
			return;
		}
		this.__setConfig();
		this.getParent().openPage({
			id : "waittingDialog",
			url : "$UI/system/deploy/paas/waittingDialog.w",
			fromId : "deployInfo"
		});
		return true;
	};

	Model.prototype.getTitle = function(wizard) {
		return '选择部署的资源';
	};

	Model.prototype.__setConfig = function() {
		var config = this.appEngine.getConfig();
		config.paasDistFiles = "";
		config.baasType = xpaas.baasType;
		if (this.baasPublish.get()) {
			config.paasDistFiles = xpaas.baas.name;
			config.compileBaaS = true;

		} else {
			config.compileBaaS = false;
		}

		if (this.uiPublish.get()) {
			var ui = xpaas.ui.name;
			config.paasDistFiles = config.paasDistFiles.length == 0 ? ui : config.paasDistFiles + "," + ui;
			if (config.model == '3') {
				config.compileUI = true;
			} else {
				config.compileUI = false;
			}
		} else {
			config.compileUI = false;
		}
		if (this.appPublish.get()) {
			config.paasDistFiles = config.paasDistFiles.length == 0 ? xpaas.app.name : config.paasDistFiles + "," + xpaas.app.name;
			config.packApp = false;
		} else {
			config.packApp = false;
		}
		if (this.sqlPublish.get()) {
			config.paasDistFiles = config.paasDistFiles.length == 0 ? xpaas.sql.name : config.paasDistFiles + "," + xpaas.sql.name
		}
		if (this.userDataPublish.get()) {
			config.paasDistFiles = config.paasDistFiles.length == 0 ? xpaas.userData.name : config.paasDistFiles + "," + xpaas.userData.name
		}
	}
	Model.prototype.__comfirm = function() {
		var config = this.appEngine.getConfig();

		if (config.mode == '4') {
			alert("模式4不支持CloudX5");
			return false;
		}
		if (!config.paasServiceID || "" === config.paasServiceID) {
			alert("当前服务地址不是CloudX5服务，请先在 “编辑本地App” 中配置CloudX5信息");
			return false;
		}

		if (!this.baasPublish.get() && !this.uiPublish.get() && !this.sqlPublish.get() && !this.appPublish.get() && !this.userDataPublish.get()) {
			alert("请选择要部署的资源");
			return false;
		}

		if (config.mode == '1' || config.mode == '2') {
			if (this.uiPublish.get() && !this.fileExistWWW) {
				alert("请先执行“编译使用到的UI资源”生成www" + config.webPath + "目录，才能部署UI！");
				return false;
			}
		}

		if (this.appPublish.get() && !this.fileExistAPP) {
			alert("请先执行“生成本地App包”，才能发布App！");
			return false;
		}

		if (!xpaas.ui.published() && !this.uiPublish.get()) {
			alert("请部署UI资源，才能正常启动服务！");
			return false;
		}

		if (this.userDataPublish.get() && !this.fileExistData) {
			alert("用户数据缺失，请检查data目录后再试！");
			return false;
		}
		return true;
	}

	Model.prototype.baasPublishChange = function(event) {

	};

	Model.prototype.uiPublishChange = function(event) {

	};

	Model.prototype.appPublishChange = function(event) {

	};

	return Model;
});
