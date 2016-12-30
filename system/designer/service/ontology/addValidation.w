<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:395px;left:264px;height:auto;"/> 

  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1"><![CDATA[规则名称]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="nameInput"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label2"><![CDATA[规则类型]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="typeInput"></input></div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="取消" style="margin-right:12%" xid="NOBtn" onClick="NOBtnClick">
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default pull-right" label="确定" style="margin-right:20px;" xid="OkBtn" onClick="OkBtnClick">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div></div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" onReceive="windowReceiver1Receive" style="top:296px;left:229px;"></span></div>