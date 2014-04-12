/**
 * 鼠标拖拉改变元素大小 元素属性 reStyleSize 定义需要改变的是宽还是高，w:宽，h：高，如果reStyleSize属性为空，默认是宽和高
 */
(function($){
	$.fn.extend({
		myreSize: function(){
			return this.each(function(i,el){
				//需要改变的属性，w：宽，h：高，wh：宽和高,默认是宽和高
				var t=el.attributes["reStyleSize"].value||"wh";
	            //初始化参数 
	            var els = el.style;
	            //鼠标的 X 和 Y 轴坐标 
	            var x=0;
	            var y=0;
	            //设置鼠标拖拉样式
	            els.cursor="col-resize";
	            //当按下鼠标按钮时
	            $(el).mousedown(function(e) {
	                //按下元素后，计算当前鼠标与对象计算后的坐标 
	                x = e.clientX - el.offsetWidth;
	               y = e.clientY - el.offsetHeight;
	                //在支持 setCapture 
	                el.setCapture ? (
	                //捕捉焦点 
	                el.setCapture(),
	                //设置事件 
	                el.onmousemove = function(ev) {
	                    mouseMove(ev || event)
	                },
	                el.onmouseup = mouseUp
	            ) : (
	                //绑定事件 
	                $(document).bind("mousemove", mouseMove).bind("mouseup", mouseUp)

	            )
	                //防止默认事件发生 
	                e.preventDefault()

	            });
	            //移动事件 
	            function mouseMove(e) {
	                //运算 判断需要改变的是宽还是高
	            	if(t=="w"){
	            		els.width = e.clientX - x + 'px';
	            	}else if(t=="h"){
	            		els.height = e.clientY - y + 'px';
	            	}else{
	            		els.width = e.clientX - x + 'px';
	            		els.height = e.clientY - y + 'px';
	            	}
	            }
	            //停止事件 
	            function mouseUp() {
	                //在支持 releaseCapture 做些东东 
	                el.releaseCapture ? (
	                //释放焦点 
	                el.releaseCapture(),
	                //移除事件 
	                el.onmousemove = el.onmouseup = null

	            ) : (
	                //卸载事件 
	                $(document).unbind("mousemove", mouseMove).unbind("mouseup", mouseUp)

	            )

	            }
			})
		}
	});
	
})(jQuery);