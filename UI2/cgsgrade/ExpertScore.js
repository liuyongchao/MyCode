define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!cordova-plugin-camera");
	var Model = function(){
		this.callParent();
		this.pro_id;
		this.rows;
		//this.pe_uuid;
		this.options;
		this.userData;		
		this.projectgeData;
		this.commitBtn = justep.Bind.observable(false);
		this.lastBtn = justep.Bind.observable(false);
		this.nextBtn = justep.Bind.observable(true);
		this.div4 = justep.Bind.observable(false);
		this.showList = justep.Bind.observable(true);
		this.showList3 = justep.Bind.observable(false);
		this.attachmentSimple = justep.Bind.observable(false);
		this.docArray=[];
	};

/** 接受windowDialog传递的当前行信息 */
	Model.prototype.modelParamsReceive = function(event){
debugger;
/** 设置评分按钮成效 */		
		this.comp("commitBtn").set("disabled",false);
		
		this.comp("scrollView1").set({vaule : false});
		
		var CurrentRow_projectge = event.params.data.operate;
		this.projectgeData = CurrentRow_projectge;
		
		var CurrentRow_user = event.params.data.operates;
		this.userData = CurrentRow_user;
				
		var pro_uuid = event.params.data.operate.val("PRO_UUID");
		var projectData = this.comp("projectData" );		
		projectData.setFilter("pro_uuid","UUID='"+pro_uuid+"'");
		projectData.refreshData();
		this.comp("list1").refresh("projectData");

/** 通过PRO_UUID、PROF_UUID、STAGE_UUID过滤符合条件的评分项 */
/** 获得PROF_UUID */
		var prof_uuid = projectData.getCurrentRow().val("PROF_UUID");
		var pe_uuid = event.params.data.operate.val("PE_UUID");
		//this.pe_uuid = pe_uuid;
		var projectExpertData = this.comp("projectExpertData" );
		
		 projectExpertData.filters.clear();
		 
		projectExpertData.setFilter("pe_uuid","UUID='"+pe_uuid+"'");
		projectExpertData.refreshData();

/** 获得STAGE_UUID */
		var stage_uuid = projectExpertData.getCurrentRow().val("STATE_UUID");

/** PROFESSIONITEM表中过滤PROF_UUID和STAGE_UUID，获得专业、阶段评分项 */
		var professionItemData = this.comp("professionItemData" );

/** 清出professionItemData过滤条件 */		
		professionItemData.filters.clear();

/** 清空手机缓存数据 */
			professionItemData.clear();
			
		
		professionItemData.setFilter("prof_uuid","PROF_UUID='"+prof_uuid+"'");
		professionItemData.setFilter("stage_uuid","STAGE_UUID='"+stage_uuid+"'");
		professionItemData.refreshData();

/** 刷新List组件获得过滤后数据 */				
		this.comp("list2").refresh("professionItemData");
	};	
/** 设置rang3的默认最大值为0，然后根据触摸设置每评分项最大值，目的防止开始触摸位置大于评分项最大值 */	
	Model.prototype.range3Touchstart = function(event){	
		this.comp("scorePopOver").show();
		var rows = event.bindingContext.$object.val("PROFI_MAX_VALUE");	
		this.comp("range3",event.currentTarget.parentNode).set({
			max : rows
		})	
	};

	Model.prototype.range3Touchend = function(event){
		this.comp("scorePopOver").hide();
	};		
	
	Model.prototype.deleteArrayVaule=function(array,value){
		
	// var tempArray=[];
		for(var i=0;i<array.length;i++){
			if(array[i]==value){
				array.splice(i,1);
				break;
			}
		}
	}
	Model.prototype.addArrayVaule=function(array,value){
		
	// var tempArray=[];
		for(var i=0;i<array.length;i++){
			if(array[i]==value){
				array.push(value);
				break;
			}
		}
	}
/** 评分保存按钮功能实现 */
Model.prototype.commitBtnClick = function(event){
		var projectData = this.comp("projectData" );
		var ExpertScoreData = this.comp('ExpertScoreData');
		var projectExpertData = this.comp("projectExpertData" );
		var professionItemData = this.comp('professionItemData');

/** user表字段 */		
		var user_name = this.userData.val("SNAME");

/** projectge表字段 */
		// var pe_uuid = this.projectgeData.val("PE_UUID");
		// var pe_id = this.projectgeData.val("PE_ID");
		var ue_uuid = this.projectgeData.val("UE_UUID");
		var ue_id = this.projectgeData.val("UE_ID");
		var user_uuid = this.projectgeData.val("USER_UUID");
		var user_id = this.projectgeData.val("USER_ID");
		var egm_uuid = this.projectgeData.val("EGM_UUID");
		var egm_id = this.projectgeData.val("EGM_ID");
		var pro_uuid = this.projectgeData.val("PRO_UUID");
		var pro_id = this.projectgeData.val("PRO_ID");

/** projectexpert表字段 */
		var pro_name = projectExpertData.getCurrentRow().val("PRO_NAME");

/** professionitem表字段 */		
		var prof_uuid = professionItemData.getCurrentRow().val("PROF_UUID");
		var prof_id = professionItemData.getCurrentRow().val("PROF_ID");
		var prof_name = professionItemData.getCurrentRow().val("PROF_NAME");
		var profi_uuid = professionItemData.getCurrentRow().val("PROFI_UUID");
		var profi_id = professionItemData.getCurrentRow().val("PROFI_ID");
		var profi_name = professionItemData.getCurrentRow().val("PROFI_NAME");
		var stage_uuid = professionItemData.getCurrentRow().val("STAGE_UUID");
		var stage_id = professionItemData.getCurrentRow().val("STAGE_ID");
		var stage_name = professionItemData.getCurrentRow().val("STAGE_NAME");
		var es_value = professionItemData.getCurrentRow().val("ES_VALUE");				
/** 定义json变量为公共变量包含字段u */	


/** 所需字段名定义数组 */					
		var PROFI_UUID = [];
		var PROFI_ID = [];
		var PROFI_NAME = [];
		var PROFI_SCORE_REMARK = [];

/** professionItemData以数组方式存储 */		
		professionItemData.each(function(param){		
			PROFI_UUID.push(param.row.val('UUID')),
			PROFI_ID.push(param.row.val('PROFI_ID')),
			PROFI_NAME.push(param.row.val('PROFI_NAME')),
			PROFI_SCORE_REMARK.push(param.row.val('PROFI_SCORE_REMARK'));
		});
		
		var es_uuid=new Array();
		var pge_uuid = this.projectgeData.val("UUID");
		var pge_id = this.projectgeData.val("PU_ID");	
		for(i = 0;i < PROFI_SCORE_REMARK.length; i++){

/** professionItemData */						
			profi_uuid = PROFI_UUID[i];
			profi_id = PROFI_ID[i];
			profi_name = PROFI_NAME[i];
			profi_score_remark = PROFI_SCORE_REMARK[i];
// debugger;
		ExpertScoreData.newData({
				defaultValues : [ {
					"UUID" : justep.UUID.createUUID(),
					"ES_ID": justep.UUID.createUUID(),

/** professionItemData */	
					"PROF_UUID" : prof_uuid,
					"PROF_ID" : prof_id,
					"PROF_NAME" : prof_name,					
					"STAGE_UUID" : stage_uuid,
					"STAGE_ID" : stage_id,
					"STAGE_NAME" : stage_name,				
					"PROFI_UUID" : profi_uuid,
					"PROFI_ID" : profi_id,
					"PROFI_NAME" : profi_name,
					"ES_VALUE" : profi_score_remark,

/** projectgeData */
					// "PE_UUID":pe_uuid,
					// "PE_ID":pe_id,
					"PGE_UUID": pge_uuid,
					"PGE_ID": pge_id,
					"UE_UUID": ue_uuid,
					"UE_ID" : ue_id,
					"USER_UUID" : user_uuid,
					"USER_ID" : user_id,
					"EGM_UUID" : egm_uuid,
					"EGM_ID" : egm_id,
					"PRO_UUID" : pro_uuid,
					"PRO_ID" : pro_id,

/** projectexpectData */
					"PRO_NAME" : pro_name,

/** userData */
					"USER_NAME" : user_name,
					"ES_UP_USER_ID" : user_name
				} ]
			});	
			
		

/** 前后端交互 */

		 es_uuid.push( "'"+ExpertScoreData.getCurrentRowID()+"'");

		}
		ExpertScoreData.saveData();
		var es_uuid=es_uuid.join(",").toString();
		console.log(es_uuid);
	justep.Baas.sendRequest({
				"url" : "/cgsgrade/cgsgrade_action",
				"action" : "getCount",
				"async" : false,
				"params" : {"ES_UUID":es_uuid,	
							},
				"success" : function(data) {
					//console.log(data);
			//	alert("111");
				},"error":function(data){
				this.comp("commitFalseDialog").show();
				
				}
			});	
/** 添加项目评审状态 */
			this.projectgeData.data.setValue("GRADE_STATE",1);			
			this.projectgeData.data.saveData();
			
/** 前后端交互，更新时间 */		
			justep.Baas.sendRequest({
				"url" : "/cgsgrade/cgsgrade_action",
				"action" : "getCount",
				"async" : false,
				"params" : {"PGE_UUID":pge_uuid	
							},
				"success" : function(data) {
				},
				"error":function(data){
				this.comp("commitFalseDialog").show();
				}
			});	
			
			
/** 前后端交互,存储评审文件 */
// debugger
		for (var i = 0; i < this.docArray.length; i++) {
			var array_element = this.docArray[i];
//console.log(array_element);
				
			var ef_uuid = justep.UUID.createUUID();
			justep.Baas.sendRequest({
				"url" : "/cgsgrade/attachment",
				"action" : "InsertBlob",
				"async" : false,
				"params" : {
					"UUID" : ef_uuid,
					"EF_ID": justep.UUID.createUUID(),
					"PGE_UUID": pge_uuid,
					"file_name": array_element,
					"USER_NAME" : user_name,
					"TYPE":"JPG"
				},
				"success" : function(data) {
				}
			});
		}
		

/** 前后端交互,读取评审文件test */
/*		
			justep.Baas.sendRequest({
				"url" : "/cgsgrade/attachment",
				"action" : "readBlob",
				"async" : false,
				"params" : {
					"UUID":ef_uuid,
				},
				"success" : function(data) {
				}
			});*/
/** 点击保存按钮后失效 */		
			this.comp("commitBtn").set("disabled",true);
			this.comp("commitSucDialog").show();
	};	

/** 点击下一步，隐藏list组件，并更改 */
	Model.prototype.nextBtnClick = function(event){
		this.commitBtn.set(!this.lastBtn.get());
		this.lastBtn.set(!this.lastBtn.get());
		this.nextBtn.set(!this.nextBtn.get());
		this.showList.set(!this.showList.get());
		this.showList3.set(!this.showList3.get());
		this.attachmentSimple.set(!this.attachmentSimple.get());
		this.div4.set(!this.showList.get());
		if (this.showList.get() == false) {
			this.getElementByXid("label1").innerText = "总评分/等级";
			this.comp("nextBtn").set("disabled",true);
			this.comp("lastBtn").set("disabled",false);
		} else {
			this.getElementByXid("label1").innerText = "设计质量评分";
			this.comp("lastBtn").set("disabled",true);
			this.comp("nextBtn").set("disabled",false);
		}
	};
	
	
	    Model.prototype.getImageUrl = function(row){
        if(row !== undefined){
        var jsonList = eval("(" + row.val('("PROFI_UP_USER_ID")') + ")");
        var ownerID = row.getID();
        if(jsonList !== undefined ){
                var realFileName = jsonList[0]["realFileName"];
                var storeFileName = jsonList[0]["storeFileName"];
                var operateType = "browse";
                var url = '$UI/system/service/doc/common/simpleFileStore.j?realFileName=' + realFileName + '&storeFileName='+storeFileName + '&ownerID='+ownerID + '&operateType=' + operateType;
                return require.toUrl(url);
        }
        }    
    };
    
    
  // 上传
	Model.prototype.dataValueChanged = function(event){
	var data = this.comp("data");
	var filename=data.getCurrentRow().val("fileName");
		/*
		 * var data = this.comp('data'); //var expertFileData =
		 * this.comp('expertFileData');
		 * 
		 * var row=data.getCurrentRow();
		 * 
		 * var jsonList = eval("(" + row.val('fileName') + ")");
		 * jsonList[0].ownerID = row.getID(); //alert(row.val('fileName')+" ;
		 * "+JSON.stringify(jsonList)); var ownerID = row.getID();
		 * 
		 * var realFileName = jsonList[0]["realFileName"]; var storeFileName =
		 * jsonList[0]["storeFileName"]; var operateType = "preview"; var
		 * previewUrl=this.comp("attachmentSimple").getFileUrl(realFileName,storeFileName,ownerID,operateType);
		 */
		
		
		
		
		// operateType = "download";
		// var
		// downloadUrl=this.comp("attachmentSimple").getFileUrl(realFileName,storeFileName,ownerID,operateType);
    
/*
 * var fid=1; if(expertFileData.getCount()>0){ expertFileData.last();
 * fid=expertFileData.getValue("EF_ID")+"1"; } var options = { "defaultValues" : [ {
 * "UUID" : justep.UUID.createUUID(), "EF_ID" : fid, "User_Name" : realFileName,
 * "EF_REMARK" : previewUrl, "Pro_Name" : "" } ] };
 * 
 * expertFileData.newData(options);
 */
	};
	Model.prototype.photographicBtnClick = function(event){
		// var data = this.comp('data');
		//var expertFileData = this.comp('expertFileData');
		//expertFileData.saveData();
		// data.refreshData();
		// expertFileData.refreshData();
        };	
	
	
	
	Model.prototype.sumDataCustomRefresh = function(event){
			var data = this.comp("sumData");
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
				// debugger;
				// var jsonobj = JSON.parse(ret);
				// alert(ret);
				// debugger;
				data.loadData(ret);
				/* data是json */
				// alert(data.count);
				}
			});
	};																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
	
	Model.prototype.dataDataChange = function(event){
	//debugger
	var data = this.comp("data");
	this.docArray=[];
	var list=[];
			data.eachAll(function(param){
			var fileName = param.row.val("fileName");
			if(fileName!==""){
			  var jsonList = eval("(" + param.row.val("fileName") + ")");
				if(jsonList !== undefined){
					for(var i=0;i<jsonList.length;i++){
						//var realFileName = jsonList[i]["realFileName"];
						var storeFileName = jsonList[i]["storeFileName"];
					list.push(storeFileName);
					}
				}}
			});
			this.docArray=list;
	}		
	
	//自定义函数
	Model.prototype.getGradeValue = function(p1){
		if (p1 >= 90) {
			return '优秀';
		}
		if (p1 >= 75&&p1 <90) {
			return '良好';
		}
		if (p1 >= 60&&p1 <75) {
			return '合格';
		}
		if (p1 < 60) {
			return '不合格';
		}	
	};
	return Model;
});




