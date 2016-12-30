/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function (require) {
	require('css!./contents').load();
	
	var $ = require("jquery");
	var Contents = require("../contents");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var Component = require("$UI/system/lib/base/component");
	var Content = require("../content");
	var bind = require("bind");
	
	xuiService.regComponents({"$UI/system/components/justep/contents/content":Content});//动态注册组件

	var cls = Contents.extend({
		init:function(value, bindingContext){
			var result = this.callParent(value, bindingContext);
			$('>.x-contents-content', this.$domNode).each(function(i, b){
				$(this).attr("d_canAddChild", "true").attr('d_resizable', false).selectable(true);
			});
			return result;
		},
		add: function(){
			xuiService.getXuiDoc().createComponent("$UI/system/components/justep/contents/content", this, {paintComponent:true}, function(el){
				var id = $(el).attr('d_id');
				$('[d_id=' + id + ']').attr("d_canAddChild", "true").attr('d_resizable', false).selectable(true);
			});
		}
	});
	
	Content.prototype.onRemove = function(event){
		var index = this.$domNode.index();
		this.owner.remove(index);
	}

	return {'$UI/system/components/justep/contents/contents':cls};
});