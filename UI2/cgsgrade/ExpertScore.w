<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:139px;left:350px;"
    onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/baasData" autoLoad="false"
      xid="projectData" queryAction="queryPG_PROJECT" url="/cgsgrade/cgsgrade_action"
      tableName="PG_PROJECT" idColumn="UUID"> 
      <column label="主键" name="UUID" type="String" xid="default1"/>  
      <column label="项目编号" name="PRO_ID" type="String" xid="default2"/>  
      <column label="项目名称" name="PRO_NAME" type="String" xid="default3"/>  
      <column label="承建单位编码" name="PRO_BUILD_CODE" type="String" xid="default4"/>  
      <column label="承建单位名称" name="PRO_BUILD_NAME" type="String" xid="default5"/>  
      <column label="项目负责人" name="PRO_BUILDER_NAME" type="String" xid="default6"/>  
      <column label="项目性质" name="PRO_PROPERTY" type="String" xid="default7"/>  
      <column label="项目状态" name="PRO_STATUS" type="String" xid="default8"/>  
      <column label="起始年度" name="PRO_STARTTIME" type="String" xid="default9"/>  
      <column label="结束年度" name="PRO_ENDTIME" type="String" xid="default10"/>  
      <column label="信息更新时间" name="PRO_UP_TIME" type="Date" xid="default11"/>  
      <column label="信息更新人" name="PRO_UP_USER_ID" type="String" xid="default12"/>  
      <column label="备注" name="PRO_REMARK" type="String" xid="default13"/>  
      <column label="版本" name="VERSION" type="Integer" xid="default14"/>  
      <column label="专业UUID" name="PROF_UUID" type="String" xid="default15"/>  
      <column label="专业ID" name="PROF_ID" type="String" xid="default16"/>  
      <column label="专业名称" name="PROF_NAME" type="String" xid="default17"/> 
    </div>  
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="ExpertScoreData" queryAction="queryPG_EXPERTSCORE" saveAction="savePG_EXPERTSCORE"
      url="/cgsgrade/cgsgrade_action" tableName="PG_EXPERTSCORE" idColumn="UUID"> 
      <master xid="default71"/>  
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
  <column label="GE表ID" name="PGE_ID" type="String" xid="default226"></column></div>  
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="professionItemData" queryAction="queryPG_PROFESSIONITEM" idColumn="UUID"
      url="/cgsgrade/cgsgrade_action" tableName="PG_PROFESSIONITEM"> 
      <master xid="default72" data="professionItemData"/>  
      <column label="UUID" name="UUID" type="String" xid="default92"/>  
      <column label="PROFIID" name="PROFI_ID" type="String" xid="default93"/>  
      <column label="阶段ID" name="STAGE_ID" type="String" xid="default94"/>  
      <column label="阶段名称" name="STAGE_NAME" type="String" xid="default95"/>  
      <column label="专业ID" name="PROF_ID" type="String" xid="default96"/>  
      <column label="专业名称" name="PROF_NAME" type="String" xid="default97"/>  
      <column label="评分项号" name="PROFI_NUM" type="String" xid="default98"/>  
      <column label="分项名称" name="PROFI_NAME" type="String" xid="default99"/>  
      <column label="分项描述" name="PROFI_DESC" type="String" xid="default100"/>  
      <column label="评分项更新时间" name="PROFI_UPDATE_TIME" type="Date" xid="default101"/>  
      <column label="信息更新人" name="PROFI_UP_USER_ID" type="String" xid="default102"/>  
      <column label="备注" name="PROFI_REMARK" type="String" xid="default103"/>  
      <column label="版本" name="VERSION" type="Integer" xid="default104"/>  
      <column label="评分项最大值" name="PROFI_MAX_VALUE" type="String" xid="default105"/>  
      <column label="专业评分项（缓存字段）" name="PROFI_SCORE_REMARK" type="String" xid="default106"/>  
      <column label="阶段UUID" name="STAGE_UUID" type="String" xid="default107"/>  
      <column label="专业UUID" name="PROF_UUID" type="String" xid="default108"/>  
      <rule xid="rule1"> 
        <col name="PROFI_SCORE_REMARK" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default38"/>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id" autoNew="false" limit="-1" confirmRefresh="false" confirmDelete="false" onDataChange="dataDataChange"> 
      <column name="id" type="String" xid="xid3"/>  
      <column name="fileName" type="String" xid="xid2"/>  
      <data xid="default58">[{"id":"1","fileName":""}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="expertFileData" queryAction="queryPG_EFILE" saveAction="savePG_EFILE" url="/cgsgrade/cgsgrade_action" idColumn="UUID" tableName="PG_EFILE">
   <column label="EF_UUID" name="UUID" type="String" xid="default156"></column>
  <column label="专家意见ID（唯一性）" name="EF_ID" type="String" xid="default157"></column>
  <column label="用户姓名" name="USER_NAME" type="String" xid="default158"></column>
  <column label="文件更新时间" name="EF_UPDATE_TIME" type="Date" xid="default159"></column>
  <column label="信息更新人" name="EF_UP_USER_ID" type="String" xid="default160"></column>
  <column label="备注" name="EF_REMARK" type="String" xid="default161"></column>
  <column label="版本" name="VERSION" type="Integer" xid="default163"></column>
  <column label="GE_UUID" name="GE_UUID" type="String" xid="default164"></column>
  <column label="文件类型" name="TYPE" type="String" xid="default165"></column></div><div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="projectExpertData" queryAction="queryPG_PROJECTEXPERT" url="/cgsgrade/cgsgrade_action"
      tableName="PG_PROJECTEXPERT" idColumn="UUID">
      <column label="UUID" name="UUID" type="String" xid="default18"/>  
      <column label="PEID" name="PE_ID" type="String" xid="default19"/>  
      <column label="项目UUID" name="PRO_UUID" type="String" xid="default20"/>  
      <column label="项目ID" name="PRO_ID" type="String" xid="default21"/>  
      <column label="项目名称" name="PRO_NAME" type="String" xid="default22"/>  
      <column label="专家组主表UUID" name="EGM_UUID" type="String" xid="default23"/>  
      <column label="专家组主表ID" name="EGM_ID" type="String" xid="default24"/>  
      <column label="专家组ID" name="EGM_GROUP_ID" type="String" xid="default25"/>  
      <column label="专家组名称" name="EGM_GROUP_NAME" type="String" xid="default26"/>  
      <column label="描述信息" name="PE_DESC" type="String" xid="default27"/>  
      <column label="信息更新时间" name="PE_UP_TIME" type="Date" xid="default28"/>  
      <column label="信息更新人" name="PE_UP_USER_ID" type="String" xid="default29"/>  
      <column label="备注" name="PE_REMARK" type="String" xid="default30"/>  
      <column label="版本" name="VERSION" type="Integer" xid="default31"/>  
      <column label="流程状态" name="PROSTATE" type="String" xid="default32"/>  
      <column label="发起流程备注" name="PE_STAREMARK" type="String" xid="default33"/>  
      <column label="分配专家备注" name="PE_SETEXPREMARK" type="String" xid="default34"/>  
      <column label="评审结束备注" name="PE_ENDREMARK" type="String" xid="default35"/>  
      <column label="阶段名称" name="STATE_NAME" type="String" xid="default36"/>  
      <column label="项目整理备注" name="PE_HANDLEREMARK" type="String" xid="default37"/>  
      <column label="阶段UUID" name="STATE_UUID" type="String" xid="default75"/>
    </div>  
    <div component="$UI/system/components/justep/data/baasData" autoLoad="false"
      xid="userData" queryAction="querySA_OPPERSON" saveAction="savePG_USER" url="/cgsgrade/cgsgrade_action"
      tableName="SA_OPPERSON" idColumn="SID"> 
      <column label="SID" name="SID" type="String" xid="default130"/>  
      <column label="名称" name="SNAME" type="String" xid="default133"/>  
      <column label="编码" name="SCODE" type="String" xid="default125"/>  
      <column label="身份证号" name="SIDCARD" type="String" xid="default127"/>  
      <column label="数字编号" name="SNUMB" type="Integer" xid="default121"/>  
      <column label="登录名" name="SLOGINNAME" type="String" xid="default123"/>  
      <column label="密码(MD5)" name="SPASSWORD" type="String" xid="default117"/>  
      <column label="SPASSWORDTIMELIMIT" name="SPASSWORDTIMELIMIT" type="Integer"
        xid="default119"/>  
      <column label="SPASSWORDMODIFYTIME" name="SPASSWORDMODIFYTIME" type="Date"
        xid="default136"/>  
      <column label="所属部门" name="SMAINORGID" type="String" xid="default111"/>  
      <column label="密级" name="SSAFELEVELID" type="String" xid="default109"/>  
      <column label="SSEQUENCE" name="SSEQUENCE" type="Integer" xid="default90"/>  
      <column label="SVALIDSTATE" name="SVALIDSTATE" type="Integer" xid="default88"/>  
      <column label="描述" name="SDESCRIPTION" type="String" xid="default86"/>  
      <column label="性别" name="SSEX" type="String" xid="default84"/>  
      <column label="SBIRTHDAY" name="SBIRTHDAY" type="Date" xid="default82"/>  
      <column label="SJOINDATE" name="SJOINDATE" type="Date" xid="default80"/>  
      <column label="出生地" name="SHOMEPLACE" type="String" xid="default114"/>  
      <column label="学历" name="SDEGREE" type="String" xid="default113"/>  
      <column label="毕业院校" name="SGRADUATESCHOOL" type="String" xid="default76"/>  
      <column label="专业" name="SSPECIALITY" type="String" xid="default134"/>  
      <column label="学年制" name="SSCHOOLLENGTH" type="String" xid="default131"/>  
      <column label="职称" name="STITLE" type="String" xid="default128"/>  
      <column label="婚姻状况" name="SMARRIAGE" type="String" xid="default126"/>  
      <column label="证件号码" name="SCARDNO" type="String" xid="default124"/>  
      <column label="证件类型" name="SCARDKIND" type="String" xid="default122"/>  
      <column label="家庭住址" name="SFAMILYADDRESS" type="String" xid="default120"/>  
      <column label="邮编" name="SZIP" type="String" xid="default118"/>  
      <column label="MSN" name="SMSN" type="String" xid="default137"/>  
      <column label="QQ" name="SQQ" type="String" xid="default116"/>  
      <column label="电子邮件" name="SMAIL" type="String" xid="default115"/>  
      <column label="移动电话" name="SMOBILEPHONE" type="String" xid="default112"/>  
      <column label="家庭电话" name="SFAMILYPHONE" type="String" xid="default110"/>  
      <column label="办公电话" name="SOFFICEPHONE" type="String" xid="default91"/>  
      <column label="VERSION" name="VERSION" type="Integer" xid="default89"/>  
      <column label="SPHOTO" name="SPHOTO" type="String" xid="default87"/>  
      <column label="SPHOTOLASTMODIFIED" name="SPHOTOLASTMODIFIED" type="Date"
        xid="default85"/>  
      <column label="国家" name="SCOUNTRY" type="String" xid="default83"/>  
      <column label="省" name="SPROVINCE" type="String" xid="default81"/>  
      <column label="市" name="SCITY" type="String" xid="default79"/>  
      <column label="英文名称" name="SENGLISHNAME" type="String" xid="default78"/>  
      <column label="MUSER_ID" name="MUSER_ID" type="String" xid="default77"/>  
      <column label="MUSER_ORG_CODE" name="MUSER_ORG_CODE" type="String" xid="default135"/>  
      <column label="MUSER_ORG_NAME" name="MUSER_ORG_NAME" type="String" xid="default132"/>  
      <column label="MUSER_REMARK" name="MUSER_REMARK" type="String" xid="default129"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sumData" idColumn="SUM">
      <column name="SUM" type="String" xid="xid1"/>  
      <rule xid="rule2"> 
        <col name="SUM" xid="ruleCol2"> 
          <calculate xid="calculate2"> 
            <expr xid="default39">$model.professionItemData.sum("PROFI_SCORE_REMARK")</expr>
          </calculate> 
        </col> 
      </rule>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="专家评分"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">专家评分</div>  
        <div class="x-titlebar-right reverse" xid="right1" style="width:228px;">
          <div component="$UI/system/components/justep/output/output" class="x-output"
            xid="output9" style="font-size:large;font-weight:bold;color:#FFFFFF;text-align:center;"
            bind-text="$model.professionItemData.sum(&quot;PROFI_SCORE_REMARK&quot;)+&quot;分&quot;"/>  
          <div component="$UI/system/components/justep/output/output" class="x-output"
            xid="output12" bind-text="&quot;总分：&quot;" style="font-size:x-small;font-weight:bold;color:#FFFFFF;text-align:center;vertical-align:text-bottom;"/>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1" _xid="C7078F51120000017B1A279017801AF0"
      style="bottom: 0px;" supportpulldown="true"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1" style="z-index:auto;" autoPullUp="true" onPullDown="false"> 
        <div class="x-scroll-content" xid="div2"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list1" data="projectData" autoLoad="false"> 
            <ul class="x-list-template" xid="listTemplateUl1"> 
              <li xid="li1"> 
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row1"> 
                  <div class="x-col x-col-fixed clearfix" xid="col1" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;"> 
                    <label xid="label2" style="width:auto;"><![CDATA[项目号]]></label> 
                  </div>  
                  <div class="x-col" xid="col4" style="background-color:#C0C0C0;"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output " xid="output1" bind-ref="ref(&quot;PRO_ID&quot;)" style="font-weight:bold;text-align:center;"/> 
                  </div> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row2"> 
                  <div class="x-col x-col-fixed" xid="col5" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;"> 
                    <label xid="label3"><![CDATA[项目编码]]></label> 
                  </div>  
                  <div class="x-col" xid="col7" style="background-color:#C0C0C0;"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output2" style="font-weight:bold;text-align:center;"
                      bind-ref="ref(&quot;PRO_BUILD_CODE&quot;)"/> 
                  </div> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row3"> 
                  <div class="x-col x-col-fixed" xid="col8" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;"> 
                    <label xid="label4"><![CDATA[项目名称]]></label> 
                  </div>  
                  <div class="x-col" xid="col10" style="background-color:#C0C0C0;"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output3" bind-ref="ref(&quot;PRO_NAME&quot;)" style="font-weight:bold;text-align:center;"/> 
                  </div> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row4"> 
                  <div class="x-col x-col-fixed" xid="col11" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;"> 
                    <label xid="label5"><![CDATA[承担单位]]></label> 
                  </div>  
                  <div class="x-col" xid="col13" style="background-color:#C0C0C0;"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output4" style="font-weight:bold;text-align:center;"
                      bind-ref="ref(&quot;PRO_BUILD_NAME&quot;)"/> 
                  </div> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row5"> 
                  <div class="x-col x-col-fixed" xid="col14" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;"> 
                    <label xid="label6"><![CDATA[项目负责人]]></label> 
                  </div>  
                  <div class="x-col" xid="col16" style="background-color:#C0C0C0;"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output5" style="font-weight:bold;text-align:center;"
                      bind-ref="ref(&quot;PRO_BUILDER_NAME&quot;)"/> 
                  </div> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row6"> 
                  <div class="x-col x-col-fixed" xid="col17" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;"> 
                    <label xid="label7"><![CDATA[项目性质]]></label> 
                  </div>  
                  <div class="x-col" xid="col19" style="background-color:#C0C0C0;"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output6" style="font-weight:bold;text-align:center;"
                      bind-ref="ref(&quot;PRO_PROPERTY&quot;)"/> 
                  </div> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row7"> 
                  <div class="x-col x-col-fixed" xid="col20" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;"> 
                    <label xid="label8"><![CDATA[起始年度]]></label> 
                  </div>  
                  <div class="x-col" xid="col21" style="background-color:#C0C0C0;"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output8" style="font-weight:bold;text-align:center;"
                      bind-ref="ref(&quot;PRO_STARTTIME&quot;)"/> 
                  </div>  
                  <div class="x-col x-col-fixed" xid="col22" style="width:85px;text-align:center;background-color:#808080;color:#FFFFFF;"> 
                    <label xid="label9"><![CDATA[结束年度]]></label> 
                  </div>  
                  <div class="x-col" xid="col29" style="background-color:#C0C0C0;"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output7" style="font-weight:bold;text-align:center;"
                      bind-ref="ref(&quot;PRO_ENDTIME&quot;)"/> 
                  </div> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row8"> 
                  <div xid="col23"/>  
                  <div class="none" xid="col24"/>  
                  <div class="x-col" xid="col25"/> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row9"> 
                  <div class="x-col" xid="col26" style="text-align:center;background-color:#2FA4E7;color:#FFFFFF;width:100%;"> 
                    <label xid="label1"><![CDATA[设计质量评分]]></label>
                  </div>
                </div>
              </li> 
            </ul> 
          </div>  
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list2" data="professionItemData" bind-visible="showList" autoLoad="false"> 
            <ul class="x-list-template" xid="listTemplateUl2"> 
              <li xid="li2"> 
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row11"></div>
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row10"> 
                  <div class="x-col" xid="col6"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output11" bind-ref="ref(&quot;PROFI_NAME&quot;)"/> 
                  </div>  
                  <div class="x-col" xid="col12"> 
                    <div component="$UI/system/components/justep/labelEdit/labelEdit"
                      class="x-label-edit x-label30" xid="labelEdit3"> 
                      <label class="x-label" xid="label12" bind-text='val("PROFI_SCORE_REMARK")'/>  
                      <input component="$UI/system/components/justep/input/range"
                        class="x-edit" xid="range3" bind-ref="ref(&quot;PROFI_SCORE_REMARK&quot;)"
                        bind-touchstart="range3Touchstart" bind-touchend="range3Touchend"
                        bind-touchmove="range3Touchstart" max="0"/> 
                    </div> 
                  </div> 
                </div> 
              </li> 
            </ul> 
          </div>  
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list3" bind-visible="showList3"> 
            <ul class="x-list-template" xid="listTemplateUl3"> 
              <li xid="li3">
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row12"> 
                  <div xid="col2" class="x-col" style="text-align:center;background-color:#808080;color:#FFFFFF;">
                    <label xid="label10"><![CDATA[总分]]></label>
                  </div>  
                  <div class="x-col" xid="col3" style="background-color:#C0C0C0;text-align:center;"
                    bind-text="$model.professionItemData.sum(&quot;PROFI_SCORE_REMARK&quot;)"/>  
                  <div class="x-col" xid="col9" style="text-align:center;background-color:#808080;color:#FFFFFF;">
                    <label xid="label11"><![CDATA[等级]]></label>
                  </div>  
                  <div class="x-col" xid="col28" style="background-color:#C0C0C0;text-align:center;" bind-text=' $model.getGradeValue( $model.professionItemData.sum("PROFI_SCORE_REMARK"))'/>
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row13"> 
                  <div class="x-col" xid="col15"/>  
                  <div class="x-col" xid="col18"/>  
                  <div class="x-col" xid="col27"/>
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row14"> 
                  <div class="x-col" xid="col32" style="text-align:center;background-color:#2FA4E7;color:#FFFFFF;width:100%;">
                    <label xid="label13"><![CDATA[专家评审建议]]></label>
                  </div>
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row15"> 
                  <div class="x-col" xid="col34">
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-link" label="拍照上传" xid="photographicBtn" icon="icon-android-camera"
                      style="width:100%;"> 
                      <i xid="i1" class="icon-android-camera"/>  
                      <span xid="span1">拍照上传</span>
                    </a>
                  </div> 
                </div>
              </li>
            </ul> 
          </div>  
          <div component="$UI/system/components/justep/attachment/attachmentSimple"
            xid="attachmentSimple" bind-ref="data.ref(&quot;fileName&quot;)" actionUrl="/baas/cgsgrade/attachment/simpleFileStore"
            compress="true" bind-visible="attachmentSimple"> 
            <div class="x-attachment" xid="div1"> 
              <div class="x-attachment-content x-card-border" xid="div3"> 
                <div class="x-doc-process" xid="div5"> 
                  <div class="progress-bar x-doc-process-bar" role="progressbar"
                    style="width:0%;" xid="progressBar1"/>
                </div>  
                <div data-bind="foreach:$attachmentItems" xid="div6"> 
                  <div class="x-attachment-cell" xid="div7"> 
                    <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}"
                      xid="div8"> 
                      <a data-bind="visible:$model.$state.get() == 'remove'"
                        class="x-remove-barget" xid="a1"/>
                    </div> 
                  </div> 
                </div>  
                <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
                  xid="div9"> 
                  <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
                    xid="div10"/>
                </div>  
                <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                  xid="div11"> 
                  <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')"
                    xid="div12"/>
                </div>  
                <div style="clear:both;" xid="div13"/>
              </div> 
            </div> 
          </div>
        </div>  
        <div class="x-content-center x-pull-up" xid="div14" style="height:41px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-default pull-right"
            label="下一步" xid="nextBtn" onClick="nextBtnClick" bind-visible="nextBtn"> 
            <i xid="i2"/>  
            <span xid="span3">下一步</span>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-default pull-left"
            label="上一步" xid="lastBtn" onClick="nextBtnClick" bind-visible="lastBtn"> 
            <i xid="i4"/>  
            <span xid="span2">上一步</span>
          </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-default pull-right" label="提交" xid="commitBtn" bind-visible="commitBtn" onClick="commitBtnClick" style="width:70px;">
   <i xid="i6"></i>
   <span xid="span6">提交</span></a></div>
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="scorePopOver" opacity="0"> 
    <div class="x-popOver-overlay" xid="div19"/>  
    <div class="x-popOver-content" xid="div20">
      <div component="$UI/system/components/justep/output/output" class="x-output"
        xid="output10" bind-text='$model.professionItemData.sum("PROFI_SCORE_REMARK")+"分"'
        style="opacity:0.5;font-size:60px;font-weight:bold;color:#FF0000;font-family:华文隶书;text-decoration:none;height:60px;width:200px;text-align:center;line-height:inherit;"/>
    </div>
  </div>
<span component="$UI/system/components/justep/messageDialog/messageDialog" xid="commitSucDialog" message="您的评分，提交成功！" title="温馨提示：" style="top:10px;left:125px;" onOK="{operation:'window.close'}"></span>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="commitFalseDialog" title="错误警告：" message="评分提交失败，请重新提交！" style="top:13px;left:59px;"></span>
  </div>
