<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:148px;top:2px;left:297px;height:auto;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="rpcNameData" idColumn="name"><column label="RPC的名字" name="name" type="String" xid="xid1"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="typeData" idColumn="value"><column label="类型" name="value" type="String" xid="xid2"></column>
  <data xid="default2">[{&quot;value&quot;:&quot;Integer&quot;},{&quot;value&quot;:&quot;Long&quot;},{&quot;value&quot;:&quot;Float&quot;},{&quot;value&quot;:&quot;Double&quot;},{&quot;value&quot;:&quot;String&quot;},{&quot;value&quot;:&quot;Byte&quot;},{&quot;value&quot;:&quot;Binary&quot;},{&quot;value&quot;:&quot;Boolean&quot;},{&quot;value&quot;:&quot;Date&quot;},{&quot;value&quot;:&quot;Datetime&quot;},{&quot;value&quot;:&quot;Password&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="rpcData" idColumn="id" onValueChange="rpcDataValueChange"><column label="id" name="id" type="String" xid="xid3"></column>
  <column label="rpc的name" name="parent" type="String" xid="xid4"></column>
  <column label="label" name="label" type="String" xid="xid5"></column>
  <column label="desc" name="desc" type="String" xid="xid6"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="paramsData" idColumn="name" onAfterNew="paramsDataAfterNew" onValueChange="paramsDataValueChange"><column name="rpcName" type="String" xid="xid8"></column>
  <column label="参数名称" name="name" type="String" xid="xid9"></column>
  <column label="描述" name="desc" type="String" xid="xid10"></column>
  <column label="参数类型" name="dataType" type="String" xid="xid11"></column>
  <column label="默认值" name="default" type="String" xid="xid12"></column>
  <column label="是否必须" name="required" type="String" xid="xid13"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="requireData" idColumn="value"><column name="value" type="String" xid="xid7"></column>
  <data xid="default6">[{&quot;value&quot;:&quot;true&quot;},{&quot;value&quot;:&quot;false&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="requestType" idColumn="value"><column label="请求类型" name="value" type="String" xid="xid14"></column>
  <data xid="default10">[{&quot;value&quot;:&quot;RequestParam&quot;},{&quot;value&quot;:&quot;RequestBody&quot;},{&quot;value&quot;:&quot;RequestHeader&quot;},{&quot;value&quot;:&quot;PathVariable&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="type" idColumn="value"><column label="请求类型" name="value" type="String" xid="xid15"></column>
  <data xid="default11">[{&quot;value&quot;:&quot;GET&quot;},{&quot;value&quot;:&quot;POST&quot;},{&quot;value&quot;:&quot;PUT&quot;},{&quot;value&quot;:&quot;DELETE&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="replyData" idColumn="name" onAfterNew="replyDataAfterNew" onValueChange="replyDataValueChange"><column name="rpcName" type="String" xid="xid16"></column>
  <column label="名称" name="name" type="String" xid="xid17"></column>
  <column label="类型" name="dataType" type="String" xid="xid18"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="httpRequest" idColumn="url" onValueChange="httpRequestValueChange"><column name="rpcName" type="String" xid="xid19"></column>
  <column label="请求类型" name="method" type="String" xid="xid20"></column>
  <column label="请求路径" name="url" type="String" xid="xid21"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="httpParams" idColumn="name" onValueChange="httpParamsValueChange" onAfterNew="httpParamsAfterNew" confirmRefresh="false" confirmDelete="false"><column name="rpcName" type="String" xid="xid22"></column>
  <column label="参数名称" name="name" type="String" xid="xid23"></column>
  <column label="映射名称" name="to" type="String" xid="xid24"></column>
  <column label="请求体" name="kind" type="String" xid="xid25"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="paramsNameData" idColumn="name"><column name="name" type="String" xid="xid26"></column></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left" label="添加服务" xid="addRpc" onClick="addRpcClick" icon="linear linear-bus">
   <i xid="i1" class="linear linear-bus"></i>
   <span xid="span1">添加服务</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left" label="删除服务" xid="removeRpc" icon="linear linear-calendarfull" onClick="removeRpcClick">
   <i xid="i4" class="linear linear-calendarfull"></i>
   <span xid="span4">删除服务</span></a></div>
   <div class="x-titlebar-title" xid="title1"></div>
   <div class="x-titlebar-right reverse" xid="right1"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="保存" xid="saveBtn" onClick="saveBtnClick">
   <i xid="i2"></i>
   <span xid="span2">保存</span></a></div></div></div>
   <div class="x-panel-content" xid="content1" style="padding:3px;"><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents1">
   <div class="x-contents-content" xid="content2"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="height:100%;border:1px solid #ddd;padding-top:0px;">
   <div class="x-col x-col-fixed" xid="rpcClass" style="width:auto;border-right:1px solid #ddd;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="rpcNameData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="margin-bottom:5px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block" xid="rpcBtn" onClick="rpcBtnClick">
   <i xid="i3"></i>
   <span xid="span3" bind-text='val("name")'></span></a></li></ul> </div></div>
   <div class="x-col" xid="col2">
  
  <div xid="div1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1"><![CDATA[服务描述]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="rpcLabel" bind-ref='$model.rpcData.ref("label")'></input></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label2"><![CDATA[服务详细描述]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="rpcDesc" bind-ref='$model.rpcData.ref("desc")'></input></div></div>
  <div xid="div2"><div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel6">
   <div class="panel-heading" xid="heading4">
    <h4 class="panel-title" xid="h44"><![CDATA[参数关系设置]]></h4></div> 
   <div class="panel-body" xid="body2" style="overflow:auto;padding:0px;">
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1" style="padding:1px;">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="添加新参数" xid="addRelation" icon="glyphicon glyphicon-plus" onClick="addRelationClick">
      <i xid="i7" class="glyphicon glyphicon-plus" style="color:#009124;"></i>
      <span xid="span7">添加新参数</span></a> 
     
     <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="deleteRelationBtn" icon="glyphicon glyphicon-remove" onClick="deleteRelationBtnClick">
      <i xid="i7" class="glyphicon glyphicon-remove" style="color:#B00000;"></i>
      <span xid="span7">删除</span></a> 
     </div> 
    <table component="$UI/system/components/justep/list/list" class="x-list table table-condensed table-hover" xid="list2" data="paramsData">
     <thead xid="thead1">
      <tr xid="tr1">
       <th xid="default1">参数名称</th>
       <th xid="default2">描述</th>
       <th xid="default3">参数类型</th>
       <th xid="default4">默认值</th>
       <th xid="default5">是否必须</th>
       </tr> </thead> 
     <tbody class="x-list-template" xid="listTemplate1">
      <tr xid="tr2">
       <td xid="td1" style="width:13%;">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref='ref("name")'></input></td>
  <td xid="td2" style="width:13%;">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref='ref("desc")'></input></td>
  <td xid="td6" style="width:13%;">
   <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup4">
    <select component="$UI/system/components/justep/select/select" class="form-control" xid="select1" bind-optionsValue="value" bind-optionsLabel="value" bind-options="$model.typeData" bind-ref='ref("dataType")'></select>
    <div class="input-group-btn" xid="layoutWizard4">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" label="button" xid="chooseObjectBtn" icon="icon-android-more">
      <i xid="i14" class="icon-android-more"></i>
      <span xid="span14"></span></a> </div> </div> </td><td xid="td4" style="width:13%;">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref='ref("default")'></input></td>
  <td xid="td3" style="width:13%;">
   <select component="$UI/system/components/justep/select/select" class="form-control" xid="select2" bind-optionsValue="value" bind-optionsLabel="value" bind-options="$model.requireData" bind-ref='ref("required")'></select></td></tr> </tbody> </table> </div> </div></div>
  <div xid="div4">
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel2">
   <div class="panel-heading" xid="heading1">
    <h4 class="panel-title" xid="h41"><![CDATA[返回值关系设置]]></h4></div> 
   <div class="panel-body" xid="body1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2" style="padding:1px;">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="添加返回值" xid="addReply" icon="glyphicon glyphicon-plus" onClick="addReplyClick">
    <i xid="i10" class="glyphicon glyphicon-plus" style="color:#009124;"></i>
    <span xid="span6">添加返回值</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="deleteReply" icon="glyphicon glyphicon-remove" onClick="deleteReplyClick">
    <i xid="i10" class="glyphicon glyphicon-remove" style="color:#B00000;"></i>
    <span xid="span6">删除</span></a> 
   </div><table component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="replyData" bind-visible=" $model.replyData.count()&gt;0">
   <thead xid="thead2">
    <tr xid="tr3">
     <th xid="default1">返回值名称</th>
       <th xid="default3">返回值类型</th>
     </tr> </thead> 
   <tbody class="x-list-template" xid="listTemplate2">
    <tr xid="tr4">
     <td xid="td7" style="width:13%;">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref='ref("name")'></input></td>
  <td xid="td9" style="width:13%;">
   <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup2" style="width:100%;">
    <select component="$UI/system/components/justep/select/select" class="form-control" xid="select3" bind-optionsValue="value" bind-optionsLabel="value" bind-options="$model.typeData" bind-ref='ref("dataType")'></select>
    <div class="input-group-btn" xid="div5">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" label="button" xid="button6" icon="icon-android-more">
      <i xid="i12" class="icon-android-more"></i>
      <span xid="span12"></span></a> </div> </div> </td></tr> </tbody> </table></div>
   </div></div>
  <div xid="div6"><div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel3">
   <div class="panel-heading" xid="heading2">
    
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col1"><h4 class="panel-title" xid="h42"><![CDATA[请求相关设置]]></h4></div>
   <div class="x-col" xid="col3"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
   <label class="x-label" xid="label4"><![CDATA[请求类型]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select5" bind-options="type" bind-optionsValue="value" bind-optionsLabel="value" bind-ref='$model.httpRequest.ref("method")'></select></div></div>
   <div class="x-col" xid="col4"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
   <label class="x-label" xid="label5"><![CDATA[URL]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input9" bind-ref='$model.httpRequest.ref("url")'></input></div></div></div></div> 
   <div class="panel-body" xid="body3">
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar3" style="padding:1px;">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="添加新参数" xid="addHttpParam" icon="glyphicon glyphicon-plus" onClick="addHttpParamClick">
      <i xid="i15" class="glyphicon glyphicon-plus" style="color:#009124;"></i>
      <span xid="span13">添加新参数</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="deleteHttpParam" icon="glyphicon glyphicon-remove" onClick="deleteHttpParamClick">
      <i xid="i15" class="glyphicon glyphicon-remove" style="color:#B00000;"></i>
      <span xid="span13">删除</span></a> 
     </div> 
    <table component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="httpParams" bind-visible=" $model.httpParams.count()&gt;0">
     <thead xid="thead3">
      <tr xid="tr5">
       <th xid="default9">参数名称</th>
       <th xid="default9">参数映射</th>
       <th xid="default8">请求类型</th></tr> </thead> 
     <tbody class="x-list-template" xid="listTemplate3">
      <tr xid="tr6">
       <td xid="td10" style="width:13%;">
        <select component="$UI/system/components/justep/select/select" class="form-control" xid="paramSelect" bind-options="$model.paramsNameData" bind-optionsValue="name" bind-ref='ref("name")' bind-focus="paramSelectFocus"></select></td> 
       <td xid="td12" style="width:13%;">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref='ref("to")'></input></td><td xid="td11" style="width:13%;">
        <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup3" style="width:100%;">
         <select component="$UI/system/components/justep/select/select" class="form-control" xid="select4" bind-optionsValue="value" bind-optionsLabel="value" bind-options="$model.requestType" bind-ref='ref("kind")'></select>
         <div class="input-group-btn" xid="div7">
          </div> </div> </td> 
  </tr> </tbody> </table> 
  </div> </div></div></div>
   </div></div>
  <div class="x-contents-content" xid="content3"><label xid="loadingLabel" style="display:block;width:150px;margin:auto;margin-top:50px;font-size:20px;color:#aaa;" class="source-loading-label">正在加载...</label></div></div></div>
   <div class="x-panel-bottom" xid="bottom2"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group " tabbed="true" xid="buttonGroup2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="设计" xid="designBtn" style="width:80px;" target="content2">
    <i xid="i18"></i>
    <span xid="span17">设计</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="源码" xid="sourceBtn" style="width:80px;" target="content3" onClick="sourceBtnClick">
    <i xid="i17"></i>
    <span xid="span18">源码</span></a> 
   </div></div></div>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="rpcNameDialog" type="Prompt" message="添加服务的名称：" onOK="rpcNameDialogOK" style="top:90px;left:29px;"></span>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="deleteDialog" type="OKCancel" onOK="deleteDialogOK"></span>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="paramNameDialog" type="Prompt" message="参数名称：" onOK="paramNameDialogOK"></span>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="replyDialog" message="返回值名称：" type="Prompt" onOK="replyDialogOK"></span>
  </div>