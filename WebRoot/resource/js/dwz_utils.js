/**
 * 自定义dwz插件
 */
(function($){
	$.fn.extend({
		//列表查询
		showSelectList: function(){
			return this.each(function(){
				var showType = $(this).attr("showType");
				//地区列表查询
				/*
				if("sf"==showType){
					$.selectDistrict($(this),"402881ea3f5b1d14013f5b1fdc080006");
				}else if("dq"==showType){
					$.selectDistrict($(this),"0");
				}*/
			});
		},
		//清除指定文本域内容
		delText: function(){
			return this.each(function(){
				$(this).click(function(){
					var $this=$(this);
					var $unitBox = $this.parents(".unitBox:first");
					$("."+$this.attr("resetClass"),$unitBox).val("");
				});
				
			});
		},
		//上传文件的删除按钮
		delFile: function(){
			return this.each(function(){
				$(this).click(function(){
					//获取删除按钮的前面的file input
					var file=$(this).prev();
					file.after(file.clone().val(""));
					file.remove();
				});
				
			});
		}
	});
	$.extend({
		//查询地区 此方法已去除
		selectDistrict:function(s,id){
			$.ajax({
				url:"district/query.do",
				dataType:"json",
				data:{"_t":new Date().getTime(),"id":id},
				success:function(data){
						//添加DWZ信息提示
						DWZ.ajaxDone(data);
						if (data.statusCode != DWZ.statusCode.ok)return false;
						var h="";
						$.each(data.dis,function(j,d){
							h+="<option value='"+d.id+"'>"+d.disName+"</option>";
						});	
						s.append(h);
						s.combox();
						
						s.change(function(){
							var newSelect=s.after("<select name='"+s.name+"'></select>");
							$.selectDistrict(newSelect,s.val());
						});
				},
				error:DWZ.ajaxError
			});
		}
	});
})(jQuery);