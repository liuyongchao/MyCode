define(function(require){	
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!phonegap-plugin-barcodescanner")
	var Model = function(){
		this.callParent();
		this.CurrentRow_user;
		this.user_UUID;
	};
/**接受windowdialog数据*/
	Model.prototype.modelParamsReceive = function(event){
		var CurrentRow_user = event.params.data.operate;
		this.CurrentRow_user = CurrentRow_user;
		var user_UUID = event.params.data.operate.val("SID");
		var userData  = this.comp("userData");
		 userData.setFilter('userData',"SID='"+user_UUID+"'");
		 userData.refreshData(); 	
		this.user_UUID = user_UUID;
		
		
	};
/**单击“扫一扫”启动扫码功能*/
	Model.prototype.sweepBtnClick = function(event){
		var me = this;
		cordova.plugins.barcodeScanner.scan(
		function (result) {
		  var projectGeData = me.comp("projectGeData");
		  projectGeData.filters.clear();
		  projectGeData.setFilter("pu_code_value","PU_CODE_VALUE='"+result.text+"'");
		  projectGeData.refreshData();
		  if(projectGeData.count()<=0){
			  alert("信息不匹配，请核对您的二维码信息后重新操作！");
			  projectGeData.clear();
		  }else{
			  //projectGeData.setFilter("pu_code_value","PU_CODE_VALUE='"+result.text+"'");
			  projectGeData.setFilter("user_uuid","USER_UUID='"+me.user_UUID+"'");
			  projectGeData.refreshData();
			  if(projectGeData.count()<=0){
				  alert("信息不匹配，请核对您的二维码信息后重新操作！02");	  
			  }else{
				  //projectGeData.setFilter("pu_code_value","PU_CODE_VALUE='"+result.text+"'");
				  //projectGeData.setFilter("user_uuid","USER_UUID='"+me.user_UUID+"'");
				  projectGeData.setFilter("grade_state","GRADE_STATE='0'");
				  projectGeData.refreshData();
				  if(projectGeData.count()<=0){
				  alert("您对此项目已评分，请勿重复操作！");
				  }else{
				 //跳转评分，需要传递的参数
				 var CurrentRow_projectge = projectGeData.getCurrentRow();
			     me.comp("windowDialog1").open({
				"data" : {
					"operate" : CurrentRow_projectge,
					"operates" : me.CurrentRow_user			
				}
			})
				}
			  }			 			  			  			  
		  }		
      },
      function (error) {
          alert("Scanning failed: " + error);
      }
   );
	};
/**菜单功能键显示*/
	Model.prototype.menuBtnClick = function(event){
		this.comp("popMenu1").show();
	};
/**操作说明跳转*/
	Model.prototype.instructionBtnClick = function(event){
		this.comp("windowDialog2").open();
	};

	Model.prototype.personInfoBtnClick = function(event){
		this.comp("PersonlnfoDialog").open({
			"data" : {
				"operate" : this.user_UUID
			}
		})
	};

	Model.prototype.IdentityInfoBtnClick = function(event){
		this.comp("IdentityInfoDialog").open({
			"data" : {
				"operate" : this.user_UUID
			}
		})
	};



	Model.prototype.personalBtnClick = function(event){
		this.comp("personalDialog").open({
			"data" : {
				"operate" : this.user_UUID
			}
		})
	};



	Model.prototype.credentialsBtnClick = function(event){
		this.comp("credentialsDialog").open({
			"data" : {
				"operate" : this.user_UUID
			}
		})
	};

	Model.prototype.gradeBtnClick = function(event){
		this.comp("gradeDialog").open({
			"data" : {
				"operate" : this.CurrentRow_user
				
			}
		})
	};

	Model.prototype.gradedClick = function(event){
		this.comp("gradedDialog").open({
			"data" : {
				"operate" : this.user_UUID
			}
		})
	};

	return Model;
});