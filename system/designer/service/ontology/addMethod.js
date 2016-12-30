define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.NOBtnClick = function(event){
		this.comp('windowReceiver1').windowCancel();
	
	};

	Model.prototype.OkBtnClick = function(event){
		var name = this.comp('nameInput').val();
		var rows = this.data.find(['name'],[name]);
		if(rows.length>0){
			justep.Util.hint("不能含有重复的名字！");
			return;
		}
		this.comp('windowReceiver1').windowEnsure({data:name});
	};

	Model.prototype.windowReceiver1Receive = function(event){
		this.data = event.data;
	};

	return Model;
});