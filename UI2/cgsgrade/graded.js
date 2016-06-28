define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.windowReceiver1Receive = function(event) {
		var user_uuid = event.params.data.operate;
		var gradedData = this.comp("gradedData");
		justep.Baas.sendRequest({
			"url" : "/cgsgrade/cgsgrade_action",
			"action" : "graded",
			"async" : false,
			"params" : {
				"USER_UUID" : user_uuid
			},
			"success" : function(ret) {
				gradedData.loadData(ret);
			}
			
		});	
//		gradedData.refreshData();
/*var lRow = gradedData.getLastRow(), row, PU_UP_TIME = [];
gradedData.first();
do {
    row = gradedData.getCurrentRow();
    PU_UP_TIME.push(gradedData.val('PU_UP_TIME'));
    gradedData.next();
} while (lRow != row);
alert(PU_UP_TIME);*/
		//data.getValue("PU_UP_TIME")
		//alert(gradedData.getCount());
		//alert(data.getValue("PU_UP_TIME"));
		//var ss = justep.Date.toString(data.getValue("PU_UP_TIME"),'yyyy-MM-dd');
		//var strDate = justep.Date.toString(ss,date.STANDART_FORMAT_SHOT);
		//alert(ss);

	};

	Model.prototype.li2Click = function(event) {
		var gradedData = this.comp("gradedData");
		var pge_uuid = event.bindingContext.$object.val("UUID");
		var projectGeData = this.comp("projectGeData");
		projectGeData.setFilter(null,"UUID = '" + pge_uuid + "'");
		projectGeData.refreshData();
		var CurrentRow_projectge = projectGeData.getCurrentRow();
		this.comp("windowDialog").open({
			"data" : {
				"operate" : CurrentRow_projectge
			}
		})
	};

	return Model;
});