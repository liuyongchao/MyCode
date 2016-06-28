define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.CurrentRow_user;
	};
	Model.prototype.windowReceiver1Receive = function(event) {
		var CurrentRow_user = event.params.data.operate;
		this.CurrentRow_user = CurrentRow_user;
		var user_uuid = CurrentRow_user.val("SID");
		var data = this.comp("gradeData");
		justep.Baas.sendRequest({
			"url" : "/cgsgrade/cgsgrade_action",
			"action" : "grade",
			"async" : false,
			"params" : {
				"USER_UUID" : user_uuid,
			},
			"success" : function(ret) {
				data.loadData(ret);
			}
		});
		data.refreshData();
		// alert(data.getValue("PE_GRADE_START_TIME"));
	};
	Model.prototype.li2Click = function(event) {
		var gradeData = this.comp("gradeData");
		var pge_uuid = event.bindingContext.$object.val("UUID");
		var projectGeData = this.comp("projectGeData");
		projectGeData.setFilter(null,"UUID = '" + pge_uuid + "'");
		projectGeData.refreshData();
		var CurrentRow_projectge = projectGeData.getCurrentRow();
		this.comp("windowDialog").open({
			"data" : {
				"operate" : CurrentRow_projectge,
				"operates" : this.CurrentRow_user
			}
		})

	};
	return Model;
});