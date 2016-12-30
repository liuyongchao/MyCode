<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" class="window"
  sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:55px;left:561px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full o-containerParentApp"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="56"> 
      <nav class="navbar navbar-default " role="navigation" xid="default1"> 
        <a class="navbar-brand" bind-text="$model.title" xid="a1"/> 
      </nav> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div xid="containerParentPackage" class="composeParent"/> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1" height="60" style="padding-top: 4px;"> 
      <nav class="navbar navbar-default" role="navigation" xid="default2"> 
        <div class="navbar-buttons-container" xid="div1"> 
          <div class="btn-group-single pull-right" style="display:inline-block"
            xid="div2"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-dialog-back"
              bind-css="{hide: !$model.hasDownloadBtn.get()}" xid="downloadBtn" label="下载已生成App"
              onClick="downloadBtnClick" style="width:120px;"> 
              <i xid="i2"/>  
              <span xid="span2">下载已生成App</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-dialog-back"
              bind-css="{hide: !$model.hasBackBtn.get()}" onClick="backBtnClick" xid="button3"
              label="上一步"> 
              <i xid="i1"/>  
              <span xid="span3">上一步</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-dialog-next"
              bind-css="{hide: !$model.hasNextBtn.get()}" onClick="nextBtnClick" xid="button4"
              label="下一步"> 
              <i xid="i3"/>  
              <span xid="span4">下一步</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-dialog-next"
              bind-css="{hide: !$model.hasFinishBtn.get()}" onClick="finishBtnClick"
              xid="button2" label="完成" bind-enable=" $model.hasFinishEnable.get()"> 
              <i xid="i4"/>  
              <span xid="span5">完成</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-dialog-back"
              bind-css="{hide: !$model.hasCancelBtn.get()}" onClick="cancelBtnClick"
              xid="cancelBtn" label="取消"> 
              <i xid="i5"/>  
              <span xid="span6">取消</span> 
            </a> 
          </div> 
        </div> 
      </nav> 
    </div> 
  </div>  
  <link rel="stylesheet" href="../common/common.css"/> 
</div>
