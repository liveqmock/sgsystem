/**
 * @requires jquery.validate.js
 * @author liujincheng
 * 添加jquery校验方法
 */
(function($){
	if ($.validator) {
		//参数method是一个函数,接收三个参数(value,element,param) 
		//value是元素的值,element是元素本身 
		//param是参数,
		$.validator.addMethod("fileUpload", function(value, element) {
			var $this=$(element);//当前元素
			var includeTypes=$this.attr("includeTypes");//只能上传的类型
			if(includeTypes){
				var sz_includeTypes=includeTypes.split(",");
				
			}
			var ex=$this.attr("excludeTypes");//不能上传的类型
			alert("===="+$this.attr("excludeTypes"));
			return this.optional(element) || /^\w+$/i.test(value);
		}, "Letters, numbers or underscores only please");
		
		
		
		$.validator.addClassRules({
			fileUpload: {fileUpload: true}
			
		});
		//$.validator.setDefaults({errorElement:"span"});
		//$.validator.autoCreateRanges = true;
		
	}

})(jQuery);