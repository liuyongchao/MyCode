define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.path =[];
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event) {
	    debugger;
		var CurrentRow_projectge = event.params.data.operate;
		var projectData = this.comp("projectData");
		var ExpertScoreData = this.comp("ExpertScoreData");

		// 过滤项目信息
		var pro_uuid = CurrentRow_projectge.val("PRO_UUID");
		projectData.setFilter(null, "UUID = '" + pro_uuid + "'");
		projectData.refreshData();
		this.comp("list1").refresh("projectData");

		// 过滤评分项信息，説明：評分項信息不能刪除，否則後期改動對應不上
		var pge_uuid = CurrentRow_projectge.val("UUID");
		var me = this;
		ExpertScoreData.setFilter(null, "PGE_UUID = '" + pge_uuid + "'");
		ExpertScoreData.refreshData();
	
		this.comp("list2").refresh("ExpertScoreData");		
		//前后端交互,读取评审文件test		
			justep.Baas.sendRequest({
				"url" : "/cgsgrade/attachment",
				"action" : "readBlob",
				"async" : false,
				"params" : {
					"PGE_UUID":pge_uuid
				},
				"success" : function(data) {
					me.path = data.path;
				}
			});
		//alert("test="+me.path);
	};
	// 分数等级评定
	Model.prototype.getGradeValue = function(data){
		if (data >= 90) {
			return "优秀";
		}
		if (data < 90 && data >= 75) {
			return "良好";
		}
		if (data >= 60 && data < 75) {
			return "合格";
		}
		if (data < 60) {
			return "不合格";
		}

	};
	Model.prototype.col26Click = function(event){
	this.comp("windowDialog1").open({
		"data" : {
			"operate" : this.path
		}
	})
	};
	return Model;
});