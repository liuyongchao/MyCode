define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.data2CustomRefresh = function(event){
var _this = this;
			var user_uuid = "xsj3ESAzotgDPxHR9xR";
			var pro_uuid = "7E8F5D9100534F9A9F231358C2C68594";
			var prof_uuid = "9c5956bb64544651b06f45b539893106";
			var stage_uuid ="b1dc77512003424f940c59c80550069c";
			justep.Baas.sendRequest({
				"url" : "/cgsgrade/attachment",
				"action" : "getEsSum2",
				"async" : false,
				"params" : {					
				},
				"success" : function(data) {
				//alert(eval(data));
				//alert(JSON.stringify(data));
				var data2 = JSON.stringify(data);
				var str = "";
				for(var i = 0; i < data2.length; i++) {
					str += "," + data2[i].UUID
					
				}
				alert(str);
//				debugger;
//				_this.comp("data2").loadData(data);
//				_this.comp("data2").refreshData();
//					alert(data.getValue("test"));
				/*data是json*/
				//alert(data.count);
				
				}
			});
	};

	Model.prototype.modelLoad = function(event){
		var data = this.comp("data2");
		//alert(data.getCount());
	};

	return Model;
});