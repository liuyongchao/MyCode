define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var button = require("$UI/system/components/justep/button/button");
	var EditorManager = require("$UI/system/designer/webIde/lib/editorManager");
	var bizModel = require("$UI/system/designer/webIde/bizDesigner/common/bizModel");
	var TextEditor = require("$UI/system/designer/webIde/common/TextEditor");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.addRpcClick = function(event) {
		this.comp("rpcNameDialog").show();
	};

	Model.prototype.rpcNameDialogOK = function(event) {
		var name = event.input;
		if (name) {
			var data = this.comp("rpcNameData");
			
			var rows = data.find([ "name" ], [ name ]);
			if (rows.length > 0) {
				justep.Util.hint("服务名称不能重复!", {
					type : "danger"
				});
			} else {
				data.newData({
					defaultValues : [ {
						name : name
					} ]
				});
				this.addConcept({
					name : name
				});
				//生成rpc结构
				var dom = $(this.bizDoc.docRoot).find("rpc[name='"+name+"']");
				dom.append("<label></label>");
				dom.append("<description language='zh_CN'></description>");
				dom.append("<param></param>");
				dom.append("<reply></reply>");
				dom.append("<http></http>");
			}
		} else {
			justep.Util.hint("服务名称必须填写!", {
				type : "danger"
			});
		}
	};

	Model.prototype.modelLoad = function(event) {
		// 获取文件路径
		this.filePath = "BIZ/demo/misc/ontology/orgs.service.m";
		// 加载文档模型对象

		this.bizDoc = bizModel.loadFile(this.filePath, true);

		this.queryHasRelationList();
	};

	/** 查询has-relation * */
	Model.prototype.queryHasRelationList = function(rpcName) {
		var self = this;
		var data = this.comp("rpcNameData");
		var rpcData = this.comp("rpcData");
		var paramsData = this.comp("paramsData");
		var replyData = this.comp("replyData");
		var httpRequest = this.comp("httpRequest");
		var httpParams = this.comp("httpParams");
		var paramsNameData = this.comp("paramsNameData");

		if (!rpcName) {
			this.bizDoc.queryAsJson("rpc", function($node, jsonItem) {
				data.newData({
					defaultValues : [ {
						name : jsonItem.name
					} ]
				});
			});
		} else {
			paramsData.clear();
			rpcData.clear();
			replyData.clear();
			httpRequest.clear();
			httpParams.clear();
			paramsNameData.clear();
			
			rpcData.newData();
			rpcData.setValue("parent", rpcName);
			// 生成描述
			self.bizDoc.queryAsJson("rpc[name=" + rpcName + "]>", function($node, jsonItem) {
				var dom = $node[0];
				var str = dom.innerHTML.replace(/\s/ig, '');
				rpcData.setValue("parent",rpcName);
				if (dom.nodeName == "label") {
					rpcData.setValue("label", str);
				} else if (dom.nodeName == "description") {
					rpcData.setValue("desc", str);
				}
			});

			// 生成参数定义
			self.bizDoc.queryAsJson("rpc[name=" + rpcName + "]>param>field", function($node, jsonItem) {
				paramsData.newData();
				var dom = $node[0];
				paramsData.setValue("rpcName", rpcName);
				paramsData.setValue("name", jsonItem.name);
				paramsData.setValue("dataType", jsonItem.dataType);
				if (jsonItem["default"]) {
					paramsData.setValue("default", jsonItem["default"]);
				}
				if (jsonItem.required) {
					paramsData.setValue("required", jsonItem.required);
				}
				var desc = $(self.bizDoc.docRoot).find("rpc[name=" + rpcName + "]>param>field[name=" + jsonItem.name + "]>description");
				if (desc.length > 0) {
					paramsData.setValue("desc", desc.html());
				}
			});

			// 生成返回值
			self.bizDoc.queryAsJson("rpc[name=" + rpcName + "]>reply>field", function($node, jsonItem) {
				replyData.newData();
				replyData.setValue("rpcName", rpcName);
				replyData.setValue("name", jsonItem.name);
				replyData.setValue("dataType", jsonItem.dataType);
			});
			
			//生成http相关描述
			paramsData.each(function(obj){
				var row = obj.row;
				paramsNameData.newData();
				paramsNameData.setValue("name",row.val("name"));
			});
			
			
			var http = $(this.bizDoc.docRoot).find("rpc[name='"+rpcName+"']>http");
			httpRequest.newData();
			httpRequest.setValue("rpcName",rpcName);
			httpRequest.setValue("method",http.attr("method"));
			if(http.attr("url")){
				httpRequest.setValue("url",http.attr("url"));
			}
			self.bizDoc.queryAsJson("rpc[name='"+rpcName+"']>http>param",function($node,jsonItem){
				httpParams.newData();
				httpParams.setValue("rpcName",rpcName);
				if(jsonItem.to){
					httpParams.setValue("to",jsonItem.to);
				}
				httpParams.setValue("kind",jsonItem.kind);
			})
			
		}
	}

	Model.prototype.sourceBtnClick = function(event) {
		var self = this;
		if (!self.sourceEditor) {
			self.bracketsEditorManager = EditorManager.createBracketsEditor(self.getElementByXid('content3'));
			self.bracketsEditorManager.then(function(manager) {
				$(self.getElementByXid("loadingLabel")).hide();
				self.sourceEditor = new TextEditor({
					mode : "xml",
					mainModel : self,
					filePath : self.filePath,
					autoLoad : false,
					manager : manager
				});
				self.sourceEditor.setContent(self.bizDoc.asXml());
				self.sourceEditor.show();
			});
		}
	};

	// 添加rpc
	Model.prototype.addConcept = function(attrs) {
		this.bizDoc.append("", "<rpc></rpc>", attrs);
	}

	/** 设置关系属性* */
	Model.prototype.setHasRelationTreeAttrs = function(conceptName, relationName, attrs) { // attrs
		// = {}
		this.bizDoc.setAttr("rpc[name='" + conceptName + "']>label", attrs);
	}

	Model.prototype.rpcBtnClick = function(event) {
		// 获取每个点击的rpc名称
		this.saveBtnClick();
		var rpcName = event.source.$domNode.children("span").html();
		this.queryHasRelationList(rpcName);
	};

	Model.prototype.addRelationClick = function(event) {
		var rpcData = this.comp("rpcData"); 
		if (rpcData.count() > 0) {
			this.comp("paramNameDialog").show();
		} else {
			justep.Util.hint("请选择服务！", {
				type : "danger"
			});
		}
	};

	Model.prototype.saveBtnClick = function(event) {
//		var self = this;
//		var data = this.comp("rpcNameData");
//		var rpcData = this.comp("rpcData");
//		var rpcName = rpcData.getValue("parent");// 当前rpcName
//		var params = this.comp("paramsData");
//		// 处理label
//		this.bizDoc.setLabel("rpc[name=" + rpcName + "]", this.comp("rpcLabel").val());
//		// 处理desc
//		$(this.bizDoc.docRoot).find("rpc[name=" + rpcName + "]>description").html(this.comp("rpcDesc").val())

		// 保存doc
		this.bizDoc.save();

	};

	Model.prototype.removeRpcClick = function(event) {
		var data = this.comp("rpcData");
		this.comp("deleteDialog").show({
			title : "确定要删除" + data.getValue("parent") + "吗？"
		});
	};

	Model.prototype.deleteDialogOK = function(event) {
		var data = this.comp("rpcData");
		var rpcNameData = this.comp("rpcNameData");
		rpcNameData.remove(rpcNameData.getRowByID(data.getValue("parent")));
	};

	Model.prototype.paramNameDialogOK = function(event) {
		var rpcData = this.comp("rpcData");
		var rpcName = rpcData.getValue("parent");// 当前rpcName
		var data = this.comp("paramsData");
		var rows = data.find(["name"],[event.input]);
		if (event.input) {
			if(rows.length==0){
				data.newData({
					defaultValues : [ {
						rpcName : rpcName,
						name : event.input,
						dataType : "",
						required : "",
						desc : "",
						"default" : ""
					} ]
				});
			}else{
				justep.Util.hint("参数名不允许重复！", {
					type : "danger"
				});
			}
		} else {
			justep.Util.hint("参数名称必填！", {
				type : "danger"
			});
		}
	};

	Model.prototype.paramsDataAfterNew = function(event) {
		var params = this.comp("paramsNameData");
		var rpcData = this.comp("rpcData");
		
		var rpcName = rpcData.getValue("parent");// 当前rpcName
		if (rpcName) {
			if (event.rows[0].val("name")) {
				var dom = $(this.bizDoc.docRoot).find("rpc[name='" + rpcName + "']>param");
				dom.append("<field name = '" + event.rows[0].val("name") + "'></field>");
			}
		}
	};

	Model.prototype.deleteRelationBtnClick = function(event) {
		var param = this.comp("paramsData");
		var row = param.getCurrentRow();
		if(row){
			param.deleteData(row);
			var rpcName = row.val("rpcName");
			if (rpcName) {
				var dom = $(this.bizDoc.docRoot).find("rpc[name='" + rpcName + "']>param>field[name='" + row.val("name") + "']");
				dom.remove();
			}
		}
	};

	Model.prototype.addReplyClick = function(event) {
		var rpcData = this.comp("rpcData");
		if (rpcData.count() > 0) {
			this.comp("replyDialog").show();
		} else {
			justep.Util.hint("请选择服务！", {
				type : "danger"
			});
		}
	};
	
	Model.prototype.replyDataAfterNew = function(event) {
		var rpcData = this.comp("rpcData");
		var rpcName = rpcData.getValue("parent");// 当前rpcName
		if (rpcName) {
			if (event.rows[0].val("name")) {
				var dom = $(this.bizDoc.docRoot).find("rpc[name='" + rpcName + "']>reply");
				dom.append("<field name = '" + event.rows[0].val("name") + "'></field>");
			}
		}
	};

	Model.prototype.paramsDataValueChange = function(event) {
		var params = this.comp("paramsData");
		var oldValue = event.oldValue;
		var newValue = event.newValue;
		var col = event.col;
		var row = event.row;
		var dom;
		if (col == "name") {
			dom = $(this.bizDoc.docRoot).find("rpc[name=" + row.val("rpcName") + "]>param>field[name=" + oldValue + "]");
			dom.attr(col, newValue);
		} else if (col == "desc") {
			dom = $(this.bizDoc.docRoot).find("rpc[name=" + row.val("rpcName") + "]>param>field[name=" + row.val("name") + "]");
			if (dom.children("description").length > 0) {
				dom.children("description").html(newValue);
			} else {
				dom.append("<description language='zh_CN'>" + newValue + "</description>");
			}
		}else{
			dom = $(this.bizDoc.docRoot).find("rpc[name=" + row.val("rpcName") + "]>param>field[name=" + row.val("name") + "]");
			dom.attr(col, newValue);
		}
	};

	Model.prototype.replyDataValueChange = function(event){
		var reply = this.comp("replyData");
		var oldValue = event.oldValue;
		var newValue = event.newValue;
		var col = event.col;
		var row = event.row;
		var dom;
		if(col == "name"){
			dom = $(this.bizDoc.docRoot).find("rpc[name=" + row.val("rpcName") + "]>reply>field[name=" + oldValue + "]");
			dom.attr(col, newValue);
		}else{
			dom = $(this.bizDoc.docRoot).find("rpc[name=" + row.val("rpcName") + "]>reply>field[name=" + row.val("name") + "]");
			dom.attr(col, newValue);
		}
	};

	Model.prototype.replyDialogOK = function(event){
		var rpcData = this.comp("rpcData");
		var rpcName = rpcData.getValue("parent");// 当前rpcName
		var data = this.comp("replyData");
		if (event.input) {
			data.newData({
				defaultValues : [ {
					rpcName : rpcName,
					name : event.input,
					dataType : ""
				} ]
			});
		} else {
			justep.Util.hint("返回值名称必填！", {
				type : "danger"
			});
		}
	}; 

	Model.prototype.deleteReplyClick = function(event){
		var reply = this.comp("replyData");
		var row = reply.getCurrentRow();
		if(row){
			reply.deleteData(row);
			var rpcName = row.val("rpcName");
			if (rpcName) {
				var dom = $(this.bizDoc.docRoot).find("rpc[name='" + rpcName + "']>reply>field[name='" + row.val("name") + "']");
				dom.remove();
			}
		}
	};

	Model.prototype.httpRequestValueChange = function(event){
		var http = this.comp("httpRequest");
		var col = event.col;
		var row = event.row;
		var dom = $(this.bizDoc.docRoot).find("rpc[name=" + row.val("rpcName") + "]>http");
		dom.attr(col,event.newValue);
	};

	Model.prototype.httpParamsValueChange = function(event){//debugger;
		var http = this.comp("httpParams");
		var oldValue = event.oldValue;
		var newValue = event.newValue;
		var col = event.col;
		var row = event.row;
		if(http.find(["name"],[newValue]).length > 0){
			justep.Util.hint("参数名称不允许重复！", {
				type : "danger"
			});
			setTimeout(function(){
				http.deleteData(row);
			},100);
			return;
		}else{
			var dom;
			if(row.val("rpcName")){
				if(col == "name"){
					dom = $(this.bizDoc.docRoot).find("rpc[name=" + row.val("rpcName") + "]>http>param[name=" + oldValue + "]");
					dom.attr(col, newValue);
				}else{
					dom = $(this.bizDoc.docRoot).find("rpc[name=" + row.val("rpcName") + "]>http>param[name=" + row.val("name") + "]");
					dom.attr(col, newValue);
				}
			}
		}
	};

	Model.prototype.httpParamsAfterNew = function(event){
		var rpcData = this.comp("rpcData");
		var rpcName = rpcData.getValue("parent");// 当前rpcName
		if (rpcName) {
			if (event.rows[0].val("name")) {
				var dom = $(this.bizDoc.docRoot).find("rpc[name='" + rpcName + "']>http");
				dom.append("<param name = '" + event.rows[0].val("name") + "'></param>");
			}
		}
	};

	Model.prototype.addHttpParamClick = function(event){
		var rpcData = this.comp("rpcData");
		if (rpcData.count() > 0) {
			this.comp("httpParams").newData();
		} else {
			justep.Util.hint("请选择服务！", {
				type : "danger"
			});
		}
	};

	Model.prototype.httpParamDialogOK = function(event){
		var rpcData = this.comp("rpcData");
		var rpcName = rpcData.getValue("parent");// 当前rpcName
		var data = this.comp("httpParams");
		if (event.input) {
			data.newData({
				defaultValues : [ {
					rpcName : rpcName,
					name : event.input,
					to : "",
					kind:""
				} ]
			});
		} else {
			justep.Util.hint("返回值名称必填！", {
				type : "danger"
			});
		}
	};

	Model.prototype.deleteHttpParamClick = function(event){
		var data = this.comp("httpParams");
		var row = data.getCurrentRow();
		if(row){
			data.deleteData(row);
			var rpcName = row.val("rpcName");
			if (rpcName) {
				var dom = $(this.bizDoc.docRoot).find("rpc[name='" + rpcName + "']>http>param[name='" + row.val("name") + "']");
				dom.remove();
			}
		}
	};

	Model.prototype.rpcDataValueChange = function(event){
		var rpc = this.comp("rpcData");
		var oldValue = event.oldValue;
		var newValue = event.newValue;
		var col = event.col;
		var row = event.row;
		var dom;
		if(col == "label"){
			dom =  $(this.bizDoc.docRoot).find("rpc[name='"+row.val("parent")+"']>label");
			if(dom.length > 0){
				dom.html(newValue);
			}else{
				$(this.bizDoc.docRoot).find("rpc[name='"+row.val("parent")+"']").append("<label>"+newValue+"</label>");
			}
		}else{
			dom =  $(this.bizDoc.docRoot).find("rpc[name='"+row.val("parent")+"']>description");
			dom.html(newValue);
			if(dom.length > 0){
				dom.html(newValue);
			}else{
				$(this.bizDoc.docRoot).find("rpc[name='"+row.val("parent")+"']").append("<description language='zh_CN'>"+newValue+"</description>");
			}
		}
	};

	Model.prototype.paramSelectFocus = function(event){
		var mainData = this.comp("paramsData");
		var data = this.comp("paramsNameData");
		data.clear();
		mainData.each(function(obj){
			var row = obj.row;
			data.newData({
					defaultValues : [ {
						name : row.val("name")
					} ]
				});
		});
	};

	return Model;
});