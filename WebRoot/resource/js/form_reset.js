/**
 * 将表单内所有的输入框清空值 
 * 在按钮上添加 formreset="reset"   
 * 默认只清除 input[type='text'] textarea
 * resetClass="class名称" 一些需要特殊处理的，如果没有，可不加此属性
 */
(function($){
	$.fn.extend({
		formReset: function(){
			return this.each(function(i,el){
				
				$(this).click(function(){
					var resetName=$(this).attr("resetClass");
					var $form=$(this).closest("form");
					$form.find("input[type='text']").val("").find("textarea").val("");
					$("."+resetName,$form).val("");
				});
				
			})
		}
	});
	
})(jQuery);
