/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var RTWindowDialog = require("../windowDialog");
	require('css!./css/windowDialog').load();
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();

	function create(comp, clz) {
		var $domNode = $(comp.domNode);
		comp.domNode.style.position = "absolute";
		if (!comp.domNode.style.top) {
			comp.domNode.style.top = "10px";
			comp.domNode.style.left = "10px";
		}
		$domNode.addClass(clz);
	}

	var dialog = RTWindowDialog.extend({
		init : function(value, bindingContext) {
			create(this, 'x-window-dialog');
			this.callParent(value, bindingContext);
		},
		editMapping : function(config){
			var src = xuiDoc.get(this,"src");
			if(!src){
				alert("请先设置src属性");
				return;
			}
			var self = this;
			xuiService.openPage("$UI/system/components/justep/windowDialog/designer/editMapping.w", {
				title : "编辑Mapping",
				xml : config.nodeXml,
				modelRoot : config.modelRoot,
				src: src,
				height: '80%',
				width: '80%'
			}, function(result) {
				xuiDoc.replaceChild(self, result.mapping, {
					xpathCondition : "*[local-name()='result']",
					jqCondition : "result",
					paintComponent : false
				});
			});
		}
	});

	return {
		'$UI/system/components/justep/windowDialog/windowDialog' : dialog
	};
});