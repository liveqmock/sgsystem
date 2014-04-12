/*
 * 
 * 上传按钮样式美化
 * 为上传输入框添加  fileupload='no'
 */
(function($) {
    $.fn.filestyle = function(options) {
        var settings = {
        	image: "resource/images/add.gif",//默认按钮图片地址, resourceVersion:资源目录
            imageheight : 22,//默认按钮图片高度
	        imagewidth : 20,//默认按钮图片 宽度
	        width : 160//默认输入框宽度
        };        
        if(options) {
            $.extend(settings, options);
        };                
        return this.each(function(){
            var self = this;
            //判断当前上传输入框是否已被美化
            if($(self).attr("fileupload")=="yes"){
            	return;
            }
            if($(self).attr("image"))settings.image=$(self).attr("image");
            if($(self).attr("imageheight"))settings.imageheight=$(self).attr("imageheight");
            if($(self).attr("imagewidth"))settings.imagewidth=$(self).attr("imagewidth");
            if($(self).attr("width"))settings.width=$(self).attr("width");
            
            var wrapper = $("<div title='\u9009\u62E9\u6587\u4EF6'></div>")
                            .css({
                                "width": settings.imagewidth + "px",
                                "height": settings.imageheight + "px",
                                "background": "url(" + settings.image + ") 0 0 no-repeat",
                                "background-position": "left",
                                "display": "inline",
                                "position": "absolute",
                                "overflow": "hidden"
                            });
                            
            var filename = $('<input class="file readonly" readonly="readonly" />')
                             .addClass($(self).attr("class"))
                             .css({
                                 "display": "inline",
                                 "width": settings.width + "px"
                             });
           
            $(self).before(filename);
          
            $(self).wrap(wrapper);
            $(self).css({
                        "position": "relative",
                        "height": settings.imageheight + "px",
                        "width": settings.width + "px",
                        "display": "inline",
                        "cursor": "pointer",
                        "opacity": "0.0"
                    })
             //美化之后添加标记，防止重复美化
            $(self).attr("fileupload","yes");
            if ($.browser.mozilla) {
                if (/Win/.test(navigator.platform)) {
                    $(self).css("margin-left", "-102px");                    
                } else {
                    $(self).css("margin-left", "-168px");                    
                };
            } else {
                $(self).css("margin-left", settings.imagewidth - settings.width + "px");                
            };
            //获取fileValue值 为输入框赋初始值
            filename.val($(self).attr("fileValue"));
            $(self).bind("change", function() {
                filename.val($(self).val());
            });
        });
        
    };
    
})(jQuery);
