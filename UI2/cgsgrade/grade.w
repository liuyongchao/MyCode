<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:194px;left:431px;"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="gradeData" idColumn="UUID">
   <column isCalculate="false" label="PGE_UUID" name="UUID" type="String" xid="xid1"></column>
  <column label="阶段名称" name="STAGE_NAME" type="String" xid="xid2"></column>
  <column label="项目名称" name="PRO_NAME" type="String" xid="xid3"></column>
  <column label="起始时间" name="PE_GRADE_START_TIME" type="Date" xid="xid4"></column>
  <column label="截止时间" name="PE_GRADE_END_TIME" type="Date" xid="xid5"></column></div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="projectGeData" queryAction="queryPG_PROJECTGE" saveAction="savePG_PROJECTGE" url="/cgsgrade/cgsgrade_action" tableName="PG_PROJECTGE" idColumn="UUID">
   <column label="UUID" name="UUID" type="String" xid="default19"></column>
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
   <column label="版本" name="VERSION" type="Integer" xid="default36"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="待评项目"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">待评项目</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="gradeData" autoLoad="true">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2" bind-click="li2Click">
     
      
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col x-col-fixed clearfix" xid="col1" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
    <label xid="label2" style="width:auto;"><![CDATA[项目名称]]></label></div> 
   <div class="x-col" xid="col4" style="background-color:#C0C0C0;">
    <div component="$UI/system/components/justep/output/output" class="x-output " xid="output1" bind-ref='ref("PRO_NAME")' style="font-weight:bold;text-align:center;"></div></div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col x-col-fixed clearfix" xid="col3" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
    <label xid="label1" style="width:auto;"><![CDATA[阶段名称]]></label></div> 
   <div class="x-col" xid="col2" style="background-color:#C0C0C0;">
    <div component="$UI/system/components/justep/output/output" class="x-output " xid="output2" bind-ref='ref("STAGE_NAME")' style="font-weight:bold;text-align:center;"></div></div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row12">
      <div class="x-col x-col-fixed" xid="col40" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
       <label xid="label19"><![CDATA[起始时间]]></label></div> 
      <div class="x-col" xid="col39" style="background-color:#C0C0C0;">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output19" style="font-weight:bold;text-align:center;" bind-ref='ref("PE_GRADE_START_TIME")'></div></div> 
      <div class="x-col x-col-fixed" xid="col33" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
       <label xid="label20"><![CDATA[截止时间]]></label></div> 
      <div class="x-col" xid="col38" style="background-color:#C0C0C0;">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output20" style="font-weight:bold;text-align:center;" bind-ref='ref("PE_GRADE_END_TIME")'></div></div> </div></li> </ul> </div></div>
  </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" onReceive="windowReceiver1Receive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" src="$UI/cgsgrade/ExpertScore.w"></span></div>