define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	/*用户登录*/
	Model.prototype.loginBtnClick = function(event){
		var username = this.comp("usernameInput").val();
		var userpassword = this.comp("passwordInput").val();
		var userData = this.comp("userData");
		//username = "e2";
		
		//userpassword = "F3D3A7EF80A1E7BDA2511A3A0B7E6CF8";
//		userData.clear();
		userData.setFilter("username","SCODE='"+username+"' and SPASSWORD='"+userpassword+"'");
//		userData.setFilter("userpassword","SPASSWORD='"+userpassword+"'");
		userData.refreshData();
		if (userData.count()> 0) {
		var CurrentRow_user = this.comp("userData").getCurrentRow();
			this.comp("windowDialog1").open({
				"data" : {
					"operate" : CurrentRow_user
				}
			});
		}else{
		alert('没有符合条件数据');
		}

	}
	return Model;
});