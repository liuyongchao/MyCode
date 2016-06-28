<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:224px;left:775px;"> 
  <div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="projectData" queryAction="queryPG_PROJECT" url="/cgsgrade/cgsgrade_action" tableName="PG_PROJECT" idColumn="UUID">
   <column label="主键" name="UUID" type="String" xid="default1"></column>
   <column label="项目编号" name="PRO_ID" type="String" xid="default2"></column>
   <column label="项目名称" name="PRO_NAME" type="String" xid="default3"></column>
   <column label="承建单位编码" name="PRO_BUILD_CODE" type="String" xid="default4"></column>
   <column label="承建单位名称" name="PRO_BUILD_NAME" type="String" xid="default5"></column>
   <column label="项目负责人" name="PRO_BUILDER_NAME" type="String" xid="default6"></column>
   <column label="项目性质" name="PRO_PROPERTY" type="String" xid="default7"></column>
   <column label="项目状态" name="PRO_STATUS" type="String" xid="default8"></column>
   <column label="起始年度" name="PRO_STARTTIME" type="String" xid="default9"></column>
   <column label="结束年度" name="PRO_ENDTIME" type="String" xid="default10"></column>
   <column label="信息更新时间" name="PRO_UP_TIME" type="Date" xid="default11"></column>
   <column label="信息更新人" name="PRO_UP_USER_ID" type="String" xid="default12"></column>
   <column label="备注" name="PRO_REMARK" type="String" xid="default13"></column>
   <column label="版本" name="VERSION" type="Integer" xid="default14"></column>
   <column label="专业UUID" name="PROF_UUID" type="String" xid="default15"></column>
   <column label="专业ID" name="PROF_ID" type="String" xid="default16"></column>
   <column label="专业名称" name="PROF_NAME" type="String" xid="default17"></column></div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="ExpertScoreData" queryAction="queryPG_EXPERTSCORE" saveAction="savePG_EXPERTSCORE" url="/cgsgrade/cgsgrade_action" tableName="PG_EXPERTSCORE" idColumn="UUID">
   <master xid="default71"></master>
   <column label="UUID" name="UUID" type="String" xid="default199"></column>
   <column label="ESID" name="ES_ID" type="String" xid="default200"></column>
   <column label="用户ID" name="USER_ID" type="String" xid="default201"></column>
   <column label="用户姓名" name="USER_NAME" type="String" xid="default202"></column>
   <column label="项目编号" name="PRO_ID" type="String" xid="default203"></column>
   <column label="项目名称" name="PRO_NAME" type="String" xid="default204"></column>
   <column label="阶段ID" name="STAGE_ID" type="String" xid="default205"></column>
   <column label="阶段名称" name="STAGE_NAME" type="String" xid="default206"></column>
   <column label="专业ID" name="PROF_ID" type="String" xid="default207"></column>
   <column label="专业名称" name="PROF_NAME" type="String" xid="default208"></column>
   <column label="评分项ID" name="PROFI_ID" type="String" xid="default209"></column>
   <column label="专家评分项值" name="ES_VALUE" type="String" xid="default210"></column>
   <column label="用户UUID" name="USER_UUID" type="String" xid="default211"></column>
   <column label="项目UUID" name="PRO_UUID" type="String" xid="default212"></column>
   <column label="阶段UUID" name="STAGE_UUID" type="String" xid="default213"></column>
   <column label="专业UUID" name="PROF_UUID" type="String" xid="default214"></column>
   <column label="版本" name="VERSION" type="Integer" xid="default215"></column>
   <column label="备注" name="ES_REMARK" type="String" xid="default216"></column>
   <column label="评分项UUID" name="PROFI_UUID" type="String" xid="default217"></column>
   <column label="评分项名称" name="PROFI_NAME" type="String" xid="default218"></column>
   <column label="分数更新时间" name="ES_UPDATE_TIME" type="Date" xid="default219"></column>
   <column label="分数更新人" name="ES_UP_USER_ID" type="String" xid="default220"></column>
   <column label="用户专家UUID" name="UE_UUID" type="String" xid="default221"></column>
   <column label="用户专家ID" name="UE_ID" type="String" xid="default222"></column>
   <column label="专家组UUID" name="EGM_UUID" type="String" xid="default223"></column>
   <column label="专家组ID" name="EGM_ID" type="String" xid="default224"></column>
   <column label="GE表主键" name="PGE_UUID" type="String" xid="default225"></column>
   <column label="GE表ID" name="PGE_ID" type="String" xid="default226"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="已评项目"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">已评项目</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content  x-scroll-view" xid="content1" _xid="C71683711940000198D11B90149D6410" style="bottom: 0px;"><div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1" style="z-index:auto;" autoPullUp="true" onPullDown="false">
   <div class="x-scroll-content" xid="div2">
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="projectData" autoLoad="false">
     <ul class="x-list-template" xid="listTemplateUl1">
      <li xid="li1">
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
        <div class="x-col x-col-fixed clearfix" xid="col1" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label2" style="width:auto;">项目号</label></div> 
        <div class="x-col" xid="col4" style="background-color:#C0C0C0;">
         <div component="$UI/system/components/justep/output/output" class="x-output " xid="output1" bind-ref='ref("PRO_ID")' style="font-weight:bold;text-align:center;"></div></div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
        <div class="x-col x-col-fixed" xid="col5" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label3">项目编码</label></div> 
        <div class="x-col" xid="col7" style="background-color:#C0C0C0;">
         <div component="$UI/system/components/justep/output/output" class="x-output" xid="output2" style="font-weight:bold;text-align:center;" bind-ref='ref("PRO_BUILD_CODE")'></div></div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
        <div class="x-col x-col-fixed" xid="col8" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label4">项目名称</label></div> 
        <div class="x-col" xid="col10" style="background-color:#C0C0C0;">
         <div component="$UI/system/components/justep/output/output" class="x-output" xid="output3" bind-ref='ref("PRO_NAME")' style="font-weight:bold;text-align:center;"></div></div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
        <div class="x-col x-col-fixed" xid="col11" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label5">承担单位</label></div> 
        <div class="x-col" xid="col13" style="background-color:#C0C0C0;">
         <div component="$UI/system/components/justep/output/output" class="x-output" xid="output4" style="font-weight:bold;text-align:center;" bind-ref='ref("PRO_BUILD_NAME")'></div></div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
        <div class="x-col x-col-fixed" xid="col14" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label6">项目负责人</label></div> 
        <div class="x-col" xid="col16" style="background-color:#C0C0C0;">
         <div component="$UI/system/components/justep/output/output" class="x-output" xid="output5" style="font-weight:bold;text-align:center;" bind-ref='ref("PRO_BUILDER_NAME")'></div></div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
        <div class="x-col x-col-fixed" xid="col17" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label7">项目性质</label></div> 
        <div class="x-col" xid="col19" style="background-color:#C0C0C0;">
         <div component="$UI/system/components/justep/output/output" class="x-output" xid="output6" style="font-weight:bold;text-align:center;" bind-ref='ref("PRO_PROPERTY")'></div></div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7">
        <div class="x-col x-col-fixed" xid="col20" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label8">起始年度</label></div> 
        <div class="x-col" xid="col21" style="background-color:#C0C0C0;">
         <div component="$UI/system/components/justep/output/output" class="x-output" xid="output8" style="font-weight:bold;text-align:center;" bind-ref='ref("PRO_STARTTIME")'></div></div> 
        <div class="x-col x-col-fixed" xid="col22" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label9">结束年度</label></div> 
        <div class="x-col" xid="col29" style="background-color:#C0C0C0;">
         <div component="$UI/system/components/justep/output/output" class="x-output" xid="output7" style="font-weight:bold;text-align:center;" bind-ref='ref("PRO_ENDTIME")'></div></div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8">
        <div xid="col23"></div>
        <div class="none" xid="col24"></div>
        <div class="x-col" xid="col25"></div></div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row9">
        <div class="x-col" xid="col26" style="text-align:center;background-color:#2FA4E7;color:#FFFFFF;width:100%;" bind-click="col26Click">
         <label xid="label1">设计质量评分</label></div> </div> </li> </ul> </div> 
    
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3">
     <ul class="x-list-template" xid="listTemplateUl3">
      <li xid="li3">
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row12">
        <div xid="col2" class="x-col" style="text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label10">总分</label></div> 
        <div class="x-col" xid="col3" style="background-color:#C0C0C0;text-align:center;" bind-text='$model.ExpertScoreData.sum("ES_VALUE")'></div>
        <div class="x-col" xid="col9" style="text-align:center;background-color:#808080;color:#FFFFFF;">
         <label xid="label11">等级</label></div> 
        <div class="x-col" xid="col28" style="background-color:#C0C0C0;text-align:center;" bind-text=' $model.getGradeValue($model.ExpertScoreData.sum("ES_VALUE"))'></div></div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row13">
        <div class="x-col" xid="col15"></div>
        <div class="x-col" xid="col18"></div>
        <div class="x-col" xid="col27"></div></div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row14">
        <div class="x-col" xid="col32" style="text-align:center;background-color:#2FA4E7;color:#FFFFFF;width:100%;">
         <label xid="label13">专家评审建议</label></div> </div> 
       </li> </ul> </div> 
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="ExpertScoreData" autoLoad="false">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11"></div>
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row10">
      <div class="x-col x-col-80" xid="col6">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output11" bind-ref='ref("PROFI_NAME")'></div></div> 
      <div class="x-col x-col-20" xid="col12">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output9" bind-text=' val("ES_VALUE")+"分"'></div></div> </div> </li> </ul> </div></div> 
   </div></div>
  </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1" src="$UI/cgsgrade/main.w"></span></div>