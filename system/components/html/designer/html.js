define(function(require){
	var $ = require("jquery"),
	ViewComponent = require("$UI/system/lib/base/viewComponent");
	
	var Label = ViewComponent.extend({
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			this.$domNode = $(this.domNode);
			this.$domNode.text(this.$domNode.attr('bind-text'));
		},
        set: function(values){
        	if('bind-text' in values){
        		this.$domNode.text(values['bind-text']);
        	}else if('text' in values){
        		this.$domNode.text(values['text']);
        	}
        }
		
	});
	
	var Image = ViewComponent.extend({
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			this.$domNode = $(this.domNode);
			this.$domNode.attr('src',require.toUrl(this.$domNode.attr('src')));
		},
        set: function(values){
        	if('src' in values){
    			this.$domNode.attr('src',require.toUrl(values['src']));
        	}
        }
		
	});
	
	return {'label(html)':Label,
		'image(html)':Image};
});