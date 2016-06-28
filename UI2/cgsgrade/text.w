<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/wing/wing" class="x-wing" xid="wing1"> 
    <div class="x-wing-left" xid="left1"/>  
    <div class="x-wing-content" xid="content2"> 
      <div class="x-wing-backdrop" xid="div3"/>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="button" xid="button2" onClick="button2Click"> 
        <i xid="i1"/>  
        <span xid="span1"/>
      </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="图片上传" xid="insertBut" onClick="insertButClick">
   <i xid="i4"></i>
   <span xid="span5">图片上传</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="图片读取" xid="readBut" onClick="readButClick">
   <i xid="i5"></i>
   <span xid="span6">图片读取</span></a>
  <div component="$UI/system/components/justep/attachment/attachmentSimple" actionUrl="/baas/cgsgrade/attachment/simpleFileStore" xid="attachmentSimple1" bind-ref='data.ref("fileName")'>
   <div class="x-attachment" xid="div4">
    <div class="x-attachment-content x-card-border" xid="div6">
     <div class="x-doc-process" xid="div7">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar1"></div></div> 
     <div xid="div8" data-bind="foreach:$attachmentItems">
      <div class="x-attachment-cell" xid="div9">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div10">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" xid="div11" data-bind="visible:$state.get() == 'upload'">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'" xid="div12"></div></div> 
     <div class="x-attachment-cell" xid="div13" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')" xid="div14"></div></div> 
     <div style="clear:both;" xid="div15"></div></div> </div> </div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="图片保存" xid="button3" onClick="button3Click">
   <i xid="i6"></i>
   <span xid="span7">图片保存</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="图片读取test" xid="button4" onClick="button4Click">
   <i xid="i7"></i>
   <span xid="span8">图片读取test</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="getImageUrl" xid="getImageUrl" onClick="getImageUrlClick">
   <i xid="i8"></i>
   <span xid="span9">getImageUrl</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="按钮隐藏" xid="button5" onClick="button5Click">
   <i xid="i9"></i>
   <span xid="span10">按钮隐藏</span></a>
  <div component="$UI/system/components/justep/output/output" class="x-output" xid="output2" bind-value="nameValue" style="height:102px;"></div></div>  
    <div class="x-wing-right" xid="right1"/>
  </div>
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:306px;left:898px;"> 
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="ExpertScoreData" queryAction="queryPG_EXPERTSCORE" saveAction="savePG_EXPERTSCORE"
      url="/cgsgrade/cgsgrade_action" tableName="PG_EXPERTSCORE" idColumn="UUID"> 
      <column label="UUID" name="UUID" type="String" xid="default22"/>  
      <column label="ESID" name="ES_ID" type="String" xid="default23"/>  
      <column label="用户ID" name="USER_ID" type="String" xid="default24"/>  
      <column label="用户姓名" name="USER_NAME" type="String" xid="default25"/>  
      <column label="项目编号" name="PRO_ID" type="String" xid="default26"/>  
      <column label="项目名称" name="PRO_NAME" type="String" xid="default27"/>  
      <column label="阶段ID" name="STAGE_ID" type="String" xid="default28"/>  
      <column label="阶段名称" name="STAGE_NAME" type="String" xid="default29"/>  
      <column label="专业ID" name="PROF_ID" type="String" xid="default30"/>  
      <column label="专业名称" name="PROF_NAME" type="String" xid="default31"/>  
      <column label="评分项ID" name="PROFI_ID" type="String" xid="default32"/>  
      <column label="专家评分项值" name="ES_VALUE" type="String" xid="default33"/>  
      <column label="用户UUID" name="USER_UUID" type="String" xid="default34"/>  
      <column label="项目UUID" name="PRO_UUID" type="String" xid="default35"/>  
      <column label="阶段UUID" name="STAGE_UUID" type="String" xid="default36"/>  
      <column label="专业UUID" name="PROF_UUID" type="String" xid="default37"/>  
      <column label="版本" name="VERSION" type="Integer" xid="default38"/>  
      <column label="备注" name="ES_REMARK" type="String" xid="default39"/>  
      <column label="评分项UUID" name="PROFI_UUID" type="String" xid="default40"/>  
      <column label="评分项名称" name="PROFI_NAME" type="String" xid="default41"/>  
      <master xid="default77"/>
    </div>  
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="professionItemData" queryAction="queryPG_PROFESSIONITEM" idColumn="UUID"
      url="/cgsgrade/cgsgrade_action" tableName="PG_PROFESSIONITEM"> 
      <master xid="default72"/>  
      <column label="UUID" name="UUID" type="String" xid="default59"/>  
      <column label="PROFIID" name="PROFI_ID" type="String" xid="default60"/>  
      <column label="阶段ID" name="STAGE_ID" type="String" xid="default61"/>  
      <column label="阶段名称" name="STAGE_NAME" type="String" xid="default62"/>  
      <column label="专业ID" name="PROF_ID" type="String" xid="default63"/>  
      <column label="专业名称" name="PROF_NAME" type="String" xid="default64"/>  
      <column label="评分项号" name="PROFI_NUM" type="String" xid="default65"/>  
      <column label="分项名称" name="PROFI_NAME" type="String" xid="default66"/>  
      <column label="分项描述" name="PROFI_DESC" type="String" xid="default67"/>  
      <column label="评分项更新时间" name="PROFI_UPDATE_TIME" type="Date" xid="default68"/>  
      <column label="信息更新人" name="PROFI_UP_USER_ID" type="String" xid="default69"/>  
      <column label="备注" name="PROFI_REMARK" type="String" xid="default70"/>  
      <column label="版本" name="VERSION" type="Integer" xid="default71"/>  
      <column label="评分项最大值" name="PROFI_MAX_VALUE" type="String" xid="default73"/>  
      <column label="专业评分项（缓存字段）" name="PROFI_SCORE_REMARK" type="String" xid="default74"/>  
      <column label="阶段UUID" name="STAGE_UUID" type="String" xid="default75"/>  
      <column label="专业UUID" name="PROF_UUID" type="String" xid="default76"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data1" idColumn="col">
      <column label="fds" name="col" type="String" xid="xid1"></column>
  <data xid="default1">[{&quot;col&quot;:&quot;1&quot;}]</data>
  <column name="SUM" type="String" xid="xid3"></column></div>  
    <div component="$UI/system/components/justep/data/baasData" autoLoad="false"
      xid="projectGeData" queryAction="queryPG_PROJECTGE" saveAction="savePG_PROJECTGE"
      url="/cgsgrade/cgsgrade_action" tableName="PG_PROJECTGE" idColumn="UUID"> 
      <column label="UUID" name="UUID" type="String" xid="default6"/>  
      <column label="主键" name="PU_ID" type="String" xid="default15"/>  
      <column label="项目专家组UUID" name="PE_UUID" type="String" xid="default3"/>  
      <column label="项目专家ID" name="PE_ID" type="String" xid="default2"/>  
      <column label="用户UUID" name="USER_UUID" type="String" xid="default14"/>  
      <column label="用户ID" name="USER_ID" type="String" xid="default13"/>  
      <column label="用户专家UUID" name="UE_UUID" type="String" xid="default12"/>  
      <column label="用户专家ID" name="UE_ID" type="String" xid="default11"/>  
      <column label="专家组UUID" name="EGM_UUID" type="String" xid="default10"/>  
      <column label="专家组ID" name="EGM_ID" type="String" xid="default9"/>  
      <column label="项目UUID" name="PRO_UUID" type="String" xid="default8"/>  
      <column label="项目ID" name="PRO_ID" type="String" xid="default7"/>  
      <column label="二维码码值" name="PU_CODE_VALUE" type="String" xid="default5"/>  
      <column label="评审状态" name="GRADE_STATE" type="String" xid="default4"/>  
      <column label="备注" name="PU_REMARK" type="String" xid="default42"/>  
      <column label="更新时间" name="PU_UP_TIME" type="Date" xid="default43"/>  
      <column label="更新人ID" name="PU_UP_USER_ID" type="String" xid="default44"/>  
      <column label="版本" name="VERSION" type="Integer" xid="default45"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data2" idColumn="SUM(ES_VALUE)" onCustomRefresh="data2CustomRefresh">
      <column label="总分" name="SUM(ES_VALUE)" type="String" xid="xid2"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="data" idColumn="id" autoNew="false" limit="-1" onValueChanged="dataValueChanged" confirmRefresh="false" confirmDelete="false">
   <column name="id" type="String" xid="column2"></column>
   <column name="fileName" type="String" xid="column1"></column>
   <data xid="default58">[{&quot;id&quot;:&quot;1&quot;,&quot;fileName&quot;:&quot;&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="expertFileData" queryAction="queryPG_EFILE" saveAction="savePG_EFILE" url="/cgsgrade/cgsgrade_action" idColumn="UUID" tableName="PG_EFILE">
   <column label="EF_UUID" name="UUID" type="String" xid="default50"></column>
  <column label="专家意见ID（唯一性）" name="EF_ID" type="String" xid="default51"></column>
  <column label="用户姓名" name="USER_NAME" type="String" xid="default52"></column>
  <column label="文件更新时间" name="EF_UPDATE_TIME" type="Date" xid="default53"></column>
  <column label="信息更新人" name="EF_UP_USER_ID" type="String" xid="default54"></column>
  <column label="备注" name="EF_REMARK" type="String" xid="default55"></column>
  <column label="版本" name="VERSION" type="Integer" xid="default57"></column>
  <column label="GE_UUID" name="GE_UUID" type="String" xid="default78"></column>
  <column label="文件类型" name="TYPE" type="String" xid="default79"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="标题"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn x-orange btn-only-icon " icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">标题</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content  x-scroll-view" xid="content1" _xid="C7082A0D49600001395211671A60E700"
      style="bottom: 0px;"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1"> 
        <div class="x-content-center x-pull-down container" xid="div1"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i2"/>  
          <span class="x-pull-down-label" xid="span2">下拉刷新...</span> 
        </div>  
        <div class="x-scroll-content" xid="div2"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list1" data="data2"> 
            <ul class="x-list-template" xid="listTemplateUl1"> 
              <li xid="li1"> 
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row1"> 
                  <div class="x-col" xid="col1"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output1" bind-ref='ref("test")'/> 
                  </div>  
                  <div class="x-col" xid="col3"> 
                    <div component="$UI/system/components/justep/labelEdit/labelEdit"
                      class="x-label-edit" xid="labelEdit1"> 
                      <label class="x-label" xid="label1" bind-text="val(&quot;PROFI_SCORE_REMARK&quot;)"/>  
                      <input component="$UI/system/components/justep/input/range"
                        class="x-edit" xid="range1" bind-ref="ref(&quot;PROFI_SCORE_REMARK&quot;)"
                        bind-touchstart="range1Touchstart"/> 
                    </div> 
                  </div> 
                </div> 
              </li> 
            </ul> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row2"></div> 
        </div>  
        <div class="x-content-center x-pull-up" xid="div5"> 
          <span class="x-pull-up-label" xid="span3">加载更多...</span>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="遍历数据" xid="button1" onClick="button1Click"> 
            <i xid="i3"/>  
            <span xid="span4">遍历数据</span> 
          </a> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
