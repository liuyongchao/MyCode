<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:309px;left:597px;" onParamsReceive="modelParamsReceive">
  <div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="projectExpertData" idColumn="UUID" queryAction="queryPG_PROJECTEXPERT" url="/cgsgrade/cgsgrade_action" tableName="PG_PROJECTEXPERT"><column label="UUID" name="UUID" type="String" xid="default46"></column>
  <column label="PEID" name="PE_ID" type="String" xid="default47"></column>
  <column label="项目UUID" name="PRO_UUID" type="String" xid="default48"></column>
  <column label="项目ID" name="PRO_ID" type="String" xid="default49"></column>
  <column label="项目名称" name="PRO_NAME" type="String" xid="default50"></column>
  <column label="专家UUID" name="USER_UUID" type="String" xid="default51"></column>
  <column label="专家ID" name="USER_ID" type="String" xid="default52"></column>
  <column label="专家姓名" name="USER_NAME" type="String" xid="default53"></column>
  <column label="专家组主表UUID" name="EGM_UUID" type="String" xid="default54"></column>
  <column label="专家组主表ID" name="EGM_ID" type="String" xid="default55"></column>
  <column label="专家组ID" name="EGM_GROUP_ID" type="String" xid="default56"></column>
  <column label="专家组名称" name="EGM_GROUP_NAME" type="String" xid="default57"></column>
  <column label="描述信息" name="PE_DESC" type="String" xid="default58"></column>
  <column label="信息更新时间" name="PE_UP_TIME" type="Date" xid="default59"></column>
  <column label="信息更新人" name="PE_UP_USER_ID" type="String" xid="default60"></column>
  <column label="备注" name="PE_REMARK" type="String" xid="default61"></column>
  <column label="版本" name="VERSION" type="Integer" xid="default62"></column>
  <column label="流程状态" name="PROSTATE" type="String" xid="default63"></column></div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="projectGeData" queryAction="queryPG_PROJECTGE" saveAction="savePG_PROJECTGE" url="/cgsgrade/cgsgrade_action" tableName="PG_PROJECTGE" idColumn="UUID"><column label="UUID" name="UUID" type="String" xid="default19"></column>
  <column label="PU主键" name="PU_ID" type="String" xid="default20"></column>
  <column label="项目专家组UUID" name="PE_UUID" type="String" xid="default21"></column>
  <column label="项目专家ID" name="PE_ID" type="String" xid="default22"></column>
  <column label="用户UUID" name="USER_UUID" type="String" xid="default23"></column>
  <column label="用户ID" name="USER_ID" type="String" xid="default24"></column>
  <column label="用户专家UUID" name="UE_UUID" type="String" xid="default25"></column>
  <column label="用户专家ID" name="UE_ID" type="String" xid="default26"></column>
  <column label="专家组UUID" name="EGM_UUID" type="String" xid="default27"></column>
  <column label="专家组ID" name="EGM_ID" type="String" xid="default28"></column>
  <column label="项目UUID" name="PRO_UUID" type="String" xid="default29"></column>
  <column label="项目ID" name="PRO_ID" type="String" xid="default30"></column>
  <column label="二维码码值" name="PU_CODE_VALUE" type="String" xid="default31"></column>
  <column label="评审状态" name="GRADE_STATE" type="String" xid="default32"></column>
  <column label="备注" name="PU_REMARK" type="String" xid="default33"></column>
  <column label="更新时间" name="PU_UP_TIME" type="Date" xid="default34"></column>
  <column label="更新人ID" name="PU_UP_USER_ID" type="String" xid="default35"></column>
  <column label="版本" name="VERSION" type="Integer" xid="default36"></column></div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="userData" queryAction="querySA_OPPERSON" saveAction="saveSA_OPPERSON" url="/cgsgrade/cgsgrade_action" idColumn="SID" tableName="SA_OPPERSON">
   <master xid="default1"></master>
   <filter name="filter0" xid="filter1"></filter>
   <filter name="filter1" xid="filter2"></filter>
   <column label="SID" name="SID" type="String" xid="default92"></column>
   <column label="名称" name="SNAME" type="String" xid="default93"></column>
   <column label="编码" name="SCODE" type="String" xid="default94"></column>
   <column label="身份证号" name="SIDCARD" type="String" xid="default95"></column>
   <column label="数字编号" name="SNUMB" type="Integer" xid="default96"></column>
   <column label="登录名" name="SLOGINNAME" type="String" xid="default97"></column>
   <column label="密码(MD5)" name="SPASSWORD" type="String" xid="default98"></column>
   <column label="SPASSWORDTIMELIMIT" name="SPASSWORDTIMELIMIT" type="Integer" xid="default99"></column>
   <column label="SPASSWORDMODIFYTIME" name="SPASSWORDMODIFYTIME" type="Date" xid="default100"></column>
   <column label="所属部门" name="SMAINORGID" type="String" xid="default101"></column>
   <column label="密级" name="SSAFELEVELID" type="String" xid="default102"></column>
   <column label="SSEQUENCE" name="SSEQUENCE" type="Integer" xid="default103"></column>
   <column label="SVALIDSTATE" name="SVALIDSTATE" type="Integer" xid="default104"></column>
   <column label="描述" name="SDESCRIPTION" type="String" xid="default105"></column>
   <column label="性别" name="SSEX" type="String" xid="default106"></column>
   <column label="SBIRTHDAY" name="SBIRTHDAY" type="Date" xid="default107"></column>
   <column label="SJOINDATE" name="SJOINDATE" type="Date" xid="default108"></column>
   <column label="出生地" name="SHOMEPLACE" type="String" xid="default109"></column>
   <column label="学历" name="SDEGREE" type="String" xid="default110"></column>
   <column label="毕业院校" name="SGRADUATESCHOOL" type="String" xid="default111"></column>
   <column label="专业" name="SSPECIALITY" type="String" xid="default112"></column>
   <column label="学年制" name="SSCHOOLLENGTH" type="String" xid="default113"></column>
   <column label="职称" name="STITLE" type="String" xid="default114"></column>
   <column label="婚姻状况" name="SMARRIAGE" type="String" xid="default115"></column>
   <column label="证件号码" name="SCARDNO" type="String" xid="default116"></column>
   <column label="证件类型" name="SCARDKIND" type="String" xid="default117"></column>
   <column label="家庭住址" name="SFAMILYADDRESS" type="String" xid="default118"></column>
   <column label="邮编" name="SZIP" type="String" xid="default119"></column>
   <column label="MSN" name="SMSN" type="String" xid="default120"></column>
   <column label="QQ" name="SQQ" type="String" xid="default121"></column>
   <column label="电子邮件" name="SMAIL" type="String" xid="default122"></column>
   <column label="移动电话" name="SMOBILEPHONE" type="String" xid="default123"></column>
   <column label="家庭电话" name="SFAMILYPHONE" type="String" xid="default124"></column>
   <column label="办公电话" name="SOFFICEPHONE" type="String" xid="default125"></column>
   <column label="VERSION" name="VERSION" type="Integer" xid="default126"></column>
   <column label="SPHOTOLASTMODIFIED" name="SPHOTOLASTMODIFIED" type="Date" xid="default127"></column>
   <column label="国家" name="SCOUNTRY" type="String" xid="default128"></column>
   <column label="省" name="SPROVINCE" type="String" xid="default129"></column>
   <column label="市" name="SCITY" type="String" xid="default130"></column>
   <column label="英文名称" name="SENGLISHNAME" type="String" xid="default131"></column>
   <column label="MUSER_ID" name="MUSER_ID" type="String" xid="default132"></column>
   <column label="MUSER_ORG_CODE" name="MUSER_ORG_CODE" type="String" xid="default133"></column>
   <column label="MUSER_ORG_NAME" name="MUSER_ORG_NAME" type="String" xid="default134"></column>
   <column label="MUSER_REMARK" name="MUSER_REMARK" type="String" xid="default135"></column></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" title="地调项目">
   <div class="x-titlebar-left" xid="left1"></div>
   <div class="x-titlebar-title" xid="title1">地调项目</div>
   <div class="x-titlebar-right reverse" xid="right1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="menuBtn" icon="icon-android-add" onClick="menuBtnClick">
   <i xid="i13" class="icon-android-add"></i>
   <span xid="span13"></span></a></div></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents1">
   <div class="x-contents-content" xid="homeContent"></div>
  <div class="x-contents-content" xid="projectContent" style="background-color:#C0C0C0;"></div>
  <div class="x-contents-content" xid="scoreContent"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup2"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="评审项目" xid="button5">
   <i xid="i5"></i>
   <span xid="span5">评审项目</span></a></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col" xid="col1"></div>
   <div class="x-col" xid="col2"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="扫一扫" xid="sweepBtn" onClick="sweepBtnClick">
   <i xid="i6"></i>
   <span xid="span6">扫一扫</span></a></div>
   <div class="x-col" xid="col3"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="操作说明" xid="instructionBtn" onClick="instructionBtnClick">
   <i xid="i7"></i>
   <span xid="span7">操作说明</span></a></div>
  <div class="x-col" xid="col5"></div></div>
  
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup3"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="待评项目" xid="gradeBtn" onClick="gradeBtnClick">
   <i xid="i9"></i>
   <span xid="span9">待评项目</span></a>
  </div><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup9">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="已评项目" xid="graded" onClick="gradedClick">
    <i xid="i19"></i>
    <span xid="span19">已评项目</span></a> </div><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup8">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="个人动态" xid="button7">
    <i xid="i17"></i>
    <span xid="span17">个人动态</span></a></div><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup4"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="评分组员" xid="button10">
   <i xid="i10"></i>
   <span xid="span10">评分组员</span></a></div>
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup5"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="评分标准" xid="button11">
   <i xid="i11"></i>
   <span xid="span11">评分标准</span></a></div>
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup6">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="分值精度" xid="button12">
    <i xid="i12"></i>
    <span xid="span12">分值精度</span></a> </div>
  </div>
  <div class="x-contents-content" xid="ownContent"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col x-col-fixed" xid="col6" style="width:auto;"><img src="" alt="" xid="image1" height="128px" style="width:128px;"></img>
  </div>
   <div class="x-col" xid="col7"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row16">
   <div class="x-col" xid="col28"></div>
   <div class="x-col" xid="col29"></div>
   <div class="x-col" xid="col30"></div></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row14">
   <div class="x-col" xid="col22"><label xid="label6"><![CDATA[姓　名：]]></label></div>
   <div class="x-col" xid="col23"><label xid="label8" bind-text='$model.userData.val("SNAME")'>label</label></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row17">
   <div class="x-col" xid="col31"></div>
   <div class="x-col" xid="col32"></div>
   <div class="x-col" xid="col33"></div></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row15">
   <div class="x-col" xid="col25"><label xid="label7"><![CDATA[用户名：]]></label></div>
   <div class="x-col" xid="col26"><label xid="label9" bind-text='$model.userData.val("SCODE")'>label</label></div>
   </div>
  </div>
   <div class="x-col x-col-fixed x-col-center" xid="col8" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="personInfoBtn" icon="icon-chevron-right" onClick="personInfoBtnClick">
   <i xid="i15" class="icon-chevron-right"></i>
   <span xid="span15"></span></a></div></div>
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup7">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="个人帐号" xid="personalBtn" onClick="personalBtnClick">
    <i xid="i20"></i>
    <span xid="span20">个人帐号</span></a> </div>
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup10">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="身份信息" xid="IdentityInfoBtn" onClick="IdentityInfoBtnClick">
    <i xid="i23"></i>
    <span xid="span23">身份信息</span></a> </div>
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup11">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="认证信息" xid="credentialsBtn" onClick="credentialsBtnClick">
    <i xid="i24"></i>
    <span xid="span24">认证信息</span></a> </div></div></div></div>
   <div class="x-panel-bottom" xid="bottom1"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="true" xid="buttonGroup1" selected="button1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="首页" xid="button1" icon="icon-home" target="homeContent">
   <i xid="i1" class="icon-home"></i>
   <span xid="span1">首页</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="项目" xid="button2" icon="icon-android-storage" target="projectContent">
   <i xid="i2" class="icon-android-storage"></i>
   <span xid="span2">项目</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="评分" xid="button3" icon="icon-edit" target="scoreContent">
   <i xid="i3" class="icon-edit"></i>
   <span xid="span3">评分</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="我的" xid="button4" icon="icon-ios7-person" target="ownContent">
   <i xid="i4" class="icon-ios7-person"></i>
   <span xid="span4">我的</span></a></div>
  </div></div>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="popMenu1" anchor="menuBtn">
   <div class="x-popMenu-overlay" xid="div1"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menu1"><li class="x-menu-item" xid="item1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="扫一扫" xid="menuSweepBtn" bind-click="sweepBtnClick">
    <i xid="i8"></i>
    <span xid="span8">扫一扫</span></a> </li>
  <li class="x-menu-item" xid="item2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="操作说明" xid="button8" onClick="instructionBtnClick">
    <i xid="i14"></i>
    <span xid="span14">操作说明</span></a> </li></ul></div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1" src="$UI/cgsgrade/ExpertScore.w" style="top:8px;left:38px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog2" src="$UI/cgsgrade/instruction.w" style="top:12px;left:221px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="PersonlnfoDialog" src="$UI/cgsgrade/Personlnfo.w" style="top:9px;left:160px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="IdentityInfoDialog" src="$UI/cgsgrade/IdentityInfo.w" style="top:10px;left:48px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="personalDialog" src="$UI/cgsgrade/personal.w" style="top:10px;left:59px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="credentialsDialog" src="$UI/cgsgrade/Credentials.w" style="top:13px;left:63px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="gradeDialog" src="$UI/cgsgrade/grade.w" style="top:10px;left:82px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="gradedDialog" src="$UI/cgsgrade/graded.w" style="top:12px;left:106px;"></span></div>