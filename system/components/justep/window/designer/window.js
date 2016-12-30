/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function (require) {
    var $ = require("jquery");
    var RTWindow = require("../window");
    var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	var fileSelectorUrl  = "$UI/system/designer/webIde/editors/fileSelector/fileSelector.w";
    var Window = RTWindow.extend({
    	
		init : function(value, bindingContext) {
			this.$domNode.css("width","100%").css("height","100%").attr("d_canAddChild","true").attr("d_canRemove","false");
			this.callParent(value, bindingContext);
		},
		
		getResource:function(){
			var resourceNode = xuiDoc.dataModel.$root.find("resource:first")[0];
			if(!resourceNode){
				this.addDir();
			}
			resourceNode = xuiDoc.dataModel.$root.find("resource:first")[0];
			return resourceNode;
		},
		
		/**添加js引用*/
		addJS:function(event){
			var resouce = this.getResource();
			xuiService.openPage(fileSelectorUrl, {
				title : "js文件选择",
				width:480,
				extName:"js"
			}, function(result) {
				var value = result.value;
				if(value){
					var idx = value.lastIndexOf(".");
					if("js" != value.substring(idx+1)){
						alert("必须选择一个js文件");
						return;
					}
					value = value.substring(0,idx);
					var templateContent = '<require   url="'+value+'"></require>';
					xuiDoc.createComponent("$/UI2/system/components/justep/resource#require",resouce.getAttribute("d_id"),{templateContent:templateContent,paintComponent:true});
				}
			});
		},

		/**添加css引用*/
		addCSS:function(event){
			var resouce = this.getResource();
			xuiService.openPage(fileSelectorUrl, {
				title : "css文件选择",
				width:480,
				extName:"css"
			}, function(result) {
				var value = result.value;
				if(value){
					var idx = value.lastIndexOf(".");
					if("css" != value.substring(idx+1)){
						alert("必须选择一个css文件");
						return;
					}
					value = value.substring(0,idx);
					var templateContent = '<require   url="css!'+value+'"></require>';
					xuiDoc.createComponent("$/UI2/system/components/justep/resource#require",resouce.getAttribute("d_id"),{templateContent:templateContent,paintComponent:true});
				}
			});
		},
		
		/**添加Cordova 插件引用*/
		addCordovaPlugin:function(){
			var resouce = this.getResource();
			xuiService.openPage("$UI/system/components/justep/resource/designer/selectCordovaPlugins.w", {
				title : "cordova插件选择"
			}, function(result) {
				var values = result; 
				if(values){
					values = values.split(",");
					var configs = [];
					for(var i = 0;i<values.length;i+=1){
						var templateContent = '<require   url="cordova!'+values[i]+'"></require>';
						xuiDoc.createComponent("$/UI2/system/components/justep/resource#require",resouce.getAttribute("d_id"),{templateContent:templateContent,paintComponent:true});
					}
				}
			});			
		},
		
		/**添加w文件引用*/
		addWFileRef:function(){
			var resouce = this.getResource();
			xuiService.openPage(fileSelectorUrl, {
				title : "w文件选择",
				width:480,
				extName:"w,html"
			}, function(result) {
				var value = result.value;
				if(value){
					var idx = value.lastIndexOf(".");
					if("w" != value.substring(idx+1) && "html" != value.substring(idx+1)){
						alert("必须选择一个w文件");
						return;
					}
					value = value.substring(0,idx);
					var templateContent = '<require   url="w!'+value+'"></require>';
					xuiDoc.createComponent("$/UI2/system/components/justep/resource#require",resouce.getAttribute("d_id"),{templateContent:templateContent,paintComponent:true});
				}
			});
		},
		
		addDir:function(){
			xuiDoc.createComponent("$/UI2/system/components/justep/resource",this,{paintComponent:true});
		},
		
		/**添加资源目录*/
		addResource : function(event){
		    xuiDoc.createComponent("$/UI2/system/components/justep/resource",this,{paintComponent:true});
		}
    });
	
    return {'$UI/system/components/justep/window/window':Window};
});