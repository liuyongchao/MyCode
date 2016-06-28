define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.callParent();
		this.nameValue = justep.Bind.observable("abc");
	};
		Model.prototype.range1Touchstart = function(event){
		var rows = event.bindingContext.$object.val("PROFI_MAX_VALUE");
		alert(rows);	
		this.comp("range1",event.currentTarget.parentNode).set({
			max : rows
		})
	};	
		Model.prototype.button1Click = function(event){
		var professionItemData = this.comp('professionItemData');
		var ExpertScoreData = this.comp('ExpertScoreData');	
		var PRO_UUID = [];
		var PRO_NAME = [];
		var STAGE_UUID = [];
		var STAGE_NAME = [];
		var PROF_UUID = [];
		var PROF_NAME = [];
		var PROFI_UUID = [];
		var PROFI_NAME = [];
		var PROFI_SCORE_REMARK = [];
		
		professionItemData.each(function(param){
			PRO_UUID.push(param.row.val('PRO_UUID')),
			PRO_NAME.push(param.row.val('PRO_NAME')),
			STAGE_UUID.push(param.row.val('STAGE_UUID')),
			STAGE_NAME.push(param.row.val('STAGE_NAME')),
			PROF_UUID.push(param.row.val('PROF_UUID')),
			PROF_NAME.push(param.row.val('PROF_NAME')),
			PROFI_UUID.push(param.row.val('PROFI_UUID')),
			PROFI_NAME.push(param.row.val('PROFI_NAME')),
			PROFI_SCORE_REMARK.push(param.row.val('PROFI_SCORE_REMARK'));
		});
		for(i = 0;i < PROFI_SCORE_REMARK.length; i++){
			stage_uuid = STAGE_UUID[i];
			stage_name = STAGE_NAME[i];
			prof_uuid = PROF_UUID[i];
			prof_name = PROF_NAME[i];
			profi_uuid = PROFI_UUID[i];
			profi_name = PROFI_NAME[i];
			profi_score_remark = PROFI_SCORE_REMARK[i];
		ExpertScoreData.newData({
				defaultValues : [ {
					"UUID":justep.UUID.createUUID(),
					"ES_ID" :justep.UUID.createUUID(),
					"STAGE_UUID" : stage_uuid,
					"STAGE_NAME" : stage_name,
					"PROF_UUID" : prof_uuid,
					"PROF_NAME" : prof_name,
					"PROFI_UUID" : profi_uuid,
					"PROFI_NAME" : profi_name,
					"ES_VALUE" : profi_score_remark
				} ]
			});
		ExpertScoreData.saveData();
		}

			

	};
	
	
		Model.prototype.backBtnClick = function(event){		
			var ss = this.comp("data2").getCurrentRowID();
			alert(ss);				
	};
	
	
	
	
	
		
	
	
	Model.prototype.data2CustomRefresh = function(event){

		//me = this;
		/*var data = this.comp("data2");
			var user_uuid = "xsj3ESAzotgDPxHR9xR";
			var pro_uuid = "7E8F5D9100534F9A9F231358C2C68594";
			var prof_uuid = "9c5956bb64544651b06f45b539893106";
			var stage_uuid ="b1dc77512003424f940c59c80550069c";
			justep.Baas.sendRequest({
				"url" : "/cgsgrade/Cgsgrade_action",
				"action" : "getEsSum",
				"async" : false,
				"params" : {"USER_UUID":user_uuid,
							"PRO_UUID":pro_uuid,
							"PROF_UUID":prof_uuid,
							"STAGE_UUID":stage_uuid						
				},
				"success" : function(ret) {
				//debugger;
				//var jsonobj = JSON.parse(ret);
				//alert(ret);
				//debugger;
				data.loadData(ret);
				data是json
				//alert(data.count);				
				}
			});*/
	};
	
	
	
	
	
		
	
	
		Model.prototype.button2Click = function(event){
			var ss = this.comp("data2").getCurrentRowID();
			alert(ss);
	};
	
	
	
	
	
		
	
	
		Model.prototype.insertButClick = function(event){
			
			justep.Baas.sendRequest({
				"url" : "/cgsgrade/cgsgrade_action",
				"action" : "InsertBlob",
				"async" : false,
				"params" : {
					"UUID":justep.UUID.createUUID(),
					"EF_ID":justep.UUID.createUUID(),
					"EF_01":"d://login.jpg"
				},
				"success" : function(data) {
				}
			});
	};
	
	
//上传
	Model.prototype.dataValueChanged = function(event){
	//debugger;
	//debugger;	
		var data = this.comp('data');
		var expertFileData = this.comp('expertFileData');
				
		var row=data.getCurrentRow();
		
		var jsonList = eval("(" + row.val('fileName') + ")");	
		jsonList[0].ownerID = row.getID(); 
		alert(row.val('fileName')+" ; "+JSON.stringify(jsonList));
		var ownerID = row.getID();
		 
		var realFileName = jsonList[0]["realFileName"];
		var storeFileName = jsonList[0]["storeFileName"];
		var operateType = "preview";
		var previewUrl=this.comp("attachmentSimple1").getFileUrl(realFileName,storeFileName,ownerID,operateType);
		//debugger;
/*		alert(realFileName);
		alert(storeFileName);
		alert(ownerID);
		alert(operateType);*/
		
		//operateType = "download";
		//var downloadUrl=this.comp("attachmentSimple").getFileUrl(realFileName,storeFileName,ownerID,operateType);
    

		 var fid=1;
		if(expertFileData.getCount()>0){
			expertFileData.last();
			fid=expertFileData.getValue("EF_ID")+"1";
		}
			var options = {
				"defaultValues" : [ {
					"UUID" : justep.UUID.createUUID(),
					"EF_ID" : justep.UUID.createUUID(),
					"GE_UUID" : realFileName,
					"EF_REMARK" : previewUrl
					
				} ]
			};
			expertFileData.newData(options);
	};
		
		Model.prototype.button3Click = function(event){
			//var data = this.comp('data');
		var expertFileData = this.comp('expertFileData');
		expertFileData.saveData();
		//data.refreshData();
		//expertFileData.refreshData();
	};
		
		Model.prototype.readButClick = function(event){
			justep.Baas.sendRequest({
				"url" : "/cgsgrade/attachment",
				"action" : "InsertBlob",
				"async" : false,
				"params" : {
					"UUID":justep.UUID.createUUID(),
					"EF_ID":justep.UUID.createUUID()
				},
				"success" : function(data) {
				}
			});
	};
		
		Model.prototype.button4Click = function(event){
justep.Baas.sendRequest({
				"url" : "/cgsgrade/attachment",
				"action" : "readBlob",
				"async" : false,
				"params" : {
					"UUID":"C714B8C366A000019AEFBAFA976046D0",
				},
				"success" : function(data) {
				}
			});
	};
		
		Model.prototype.getImageUrlClick = function(row){
			if (row !== undefined) {
                        var jsonList = eval("(" + row.val('fImg') + ")");
                        var ownerID = row.getID();
                        if (jsonList !== undefined && jsonList !== null) {
                                var realFileName = jsonList[0]["realFileName"];
                                var storeFileName = jsonList[0]["storeFileName"];
                                var operateType = "browse";
                                var url = '$UI/system/service/doc/common/simpleFileStore.j?realFileName=' + realFileName + '&storeFileName=' + storeFileName + '&ownerID=' + ownerID + '&operateType=' + operateType;
                                return require.toUrl(url);
                        }
                }
	};
		
		Model.prototype.button5Click = function(event){
			this.nameValue = justep.Bind.observable("abc"); 
	};
		
		return Model;
});