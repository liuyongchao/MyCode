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
		var property = this.comp('nameInput').val();
		var type = this.comp('typeInput').val();
		
		if(this.arr.indexOf(property+type) >= 0){
			justep.Util.hint("规则重复！");
			return;
		}
		if(!property){
			justep.Util.hint("规则名称不能为空！");
			return;
		}
		if(!type){
			justep.Util.hint("规则类型不能为空！");
			return;
		}
		
		this.comp('windowReceiver1').windowEnsure({data:{
			property:property,
			type:type
		}});
	};

	Model.prototype.windowReceiver1Receive = function(event){
		this.arr = event.data;
	};

	return Model;
});