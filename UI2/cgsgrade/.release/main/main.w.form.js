define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/panel/panel');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/cgsgrade/main'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cmEnA3i';
	this._flag_='e4bf65e16a3d00066ec9b60bf661eff8';
	this.callParent(contextUrl);
 require('$UI/system/templates/direct/list12/template/freewall/freewall');
 require('$UI/system/templates/direct/list12/template/freewall/index');
 require('css!$UI/system/templates/direct/list12/template/photoswipe/photoswipe').load();
 require('css!$UI/system/templates/direct/list12/template/photoswipe/default-skin').load();
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"fBigImg":{"define":"fBigImg","label":"大图","name":"fBigImg","relation":"fBigImg","type":"String"},"fSmallImg":{"define":"fSmallImg","label":"小图","name":"fSmallImg","relation":"fSmallImg","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"imgDataCustomRefresh"},"idColumn":"id","limit":20,"xid":"imgData"});
}}); 
return __result;});