define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiver1Receive = function(event){
		var user_uuid = event.params.data.operate;
		var userData = this.comp("userData");
		userData.setFilter("username","SID='"+user_uuid+"'");
		userData.refreshData();
		this.comp("list1").refresh("projectData");
	};

	return Model;
});