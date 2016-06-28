<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:122px;left:762px;"><div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="userData" queryAction="querySA_OPPERSON" saveAction="saveSA_OPPERSON" url="/cgsgrade/cgsgrade_action" tableName="SA_OPPERSON" idColumn="SID"><column label="SID" name="SID" type="String" xid="default1"></column>
  <column label="名称" name="SNAME" type="String" xid="default2"></column>
  <column label="编码" name="SCODE" type="String" xid="default3"></column>
  <column label="身份证号" name="SIDCARD" type="String" xid="default4"></column>
  <column label="数字编号" name="SNUMB" type="Integer" xid="default5"></column>
  <column label="登录名" name="SLOGINNAME" type="String" xid="default6"></column>
  <column label="密码(MD5)" name="SPASSWORD" type="String" xid="default7"></column>
  <column label="SPASSWORDTIMELIMIT" name="SPASSWORDTIMELIMIT" type="Integer" xid="default8"></column>
  <column label="SPASSWORDMODIFYTIME" name="SPASSWORDMODIFYTIME" type="Date" xid="default9"></column>
  <column label="密级" name="SSAFELEVELID" type="String" xid="default11"></column>
  <column label="SSEQUENCE" name="SSEQUENCE" type="Integer" xid="default12"></column>
  <column label="SVALIDSTATE" name="SVALIDSTATE" type="Integer" xid="default13"></column>
  <column label="描述" name="SDESCRIPTION" type="String" xid="default14"></column>
  <column label="性别" name="SSEX" type="String" xid="default15"></column>
  <column label="SJOINDATE" name="SJOINDATE" type="Date" xid="default17"></column>
  <column label="出生地" name="SHOMEPLACE" type="String" xid="default18"></column>
  <column label="学历" name="SDEGREE" type="String" xid="default19"></column>
  <column label="专业" name="SSPECIALITY" type="String" xid="default21"></column>
  <column label="学年制" name="SSCHOOLLENGTH" type="String" xid="default22"></column>
  <column label="职称" name="STITLE" type="String" xid="default23"></column>
  <column label="婚姻状况" name="SMARRIAGE" type="String" xid="default24"></column>
  <column label="证件号码" name="SCARDNO" type="String" xid="default25"></column>
  <column label="证件类型" name="SCARDKIND" type="String" xid="default26"></column>
  <column label="家庭住址" name="SFAMILYADDRESS" type="String" xid="default27"></column>
  <column label="邮编" name="SZIP" type="String" xid="default28"></column>
  <column label="MSN" name="SMSN" type="String" xid="default29"></column>
  <column label="QQ" name="SQQ" type="String" xid="default30"></column>
  <column label="移动电话" name="SMOBILEPHONE" type="String" xid="default32"></column>
  <column label="家庭电话" name="SFAMILYPHONE" type="String" xid="default33"></column>
  <column label="办公电话" name="SOFFICEPHONE" type="String" xid="default34"></column>
  <column label="VERSION" name="VERSION" type="Integer" xid="default35"></column>
  <column label="国家" name="SCOUNTRY" type="String" xid="default38"></column>
  <column label="省" name="SPROVINCE" type="String" xid="default39"></column>
  <column label="市" name="SCITY" type="String" xid="default40"></column>
  <column label="英文名称" name="SENGLISHNAME" type="String" xid="default41"></column>
  <column label="MUSER_ID" name="MUSER_ID" type="String" xid="default42"></column>
  <column label="MUSER_ORG_CODE" name="MUSER_ORG_CODE" type="String" xid="default43"></column>
  <column label="MUSER_ORG_NAME" name="MUSER_ORG_NAME" type="String" xid="default44"></column>
  <column label="MUSER_REMARK" name="MUSER_REMARK" type="String" xid="default45"></column>
  <master xid="default46"></master>
  <filter name="filter0" xid="filter1"></filter>
  <filter name="filter1" xid="filter2"></filter></div>
  </div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" title="用户登录" style="background-color:#3A6EE6;">
   <div class="x-titlebar-left" xid="left1"></div>
   <div class="x-titlebar-title" xid="title1">用户登录</div>
   <div class="x-titlebar-right reverse" xid="right1"></div></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="height:190px;"><img src="$UI/cgsgrade/img/login.jpg" alt="" xid="image1" style="height:189px;width:100%;"></img></div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="title" xid="controlGroup1" style="width:100%;">
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col x-col-fixed" xid="col2" style="width:auto;"><i xid="i5" class="icon-ios7-person-outline" style="height:32px;width:34px;"></i></div>
   <div class="x-col" xid="col1"><input component="$UI/system/components/justep/input/input" class="form-control" xid="usernameInput" bind-value='"e2"'></input></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col x-col-fixed" xid="col5" style="width:auto;"><i xid="i6" class="icon-ios7-locked-outline" style="height:32px;width:34px;"></i></div>
  <div class="x-col" xid="col3"><input component="$UI/system/components/justep/input/password" class="form-control" xid="passwordInput" bind-value='"F3D3A7EF80A1E7BDA2511A3A0B7E6CF8"'></input></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
   <div class="x-col" xid="col9"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="用户登录" xid="loginBtn" style="width:100%;background-color:#3A6EE6;;" onClick="loginBtnClick">
   <i xid="i1"></i>
   <span xid="span2">用户登录</span></a></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
   <div class="x-col" xid="col12"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="用户注册" xid="registerBtn" style="width:100%;background-color:#3A6EE6;;">
   <i xid="i2"></i>
   <span xid="span3">用户注册</span></a></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
   <div class="x-col" xid="col13"></div>
   <div class="x-col" xid="col14"></div>
   <div class="x-col" xid="col15"></div></div></div></div>
   </div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1" src="$UI/cgsgrade/detail.w"></span></div>