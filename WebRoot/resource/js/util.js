//文件上传验证
var isIE = /msie/i.test(navigator.userAgent) && !window.opera;  

function fileChange(target) {   
	    var fileSize = 0;   
	    alert(isIE);
	    if (isIE && !target.files) {    
		      var filePath = target.value;   
		      var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
		      
			  if(!fileSystem.FileExists(filePath)){
			     alert("附件不存在，请重新输入！");
				 var file=document.getElementById(id); 
		       	 file.outerHTML=file.outerHTML;
		       	 return;
			  }
		      var file = fileSystem.GetFile (filePath);
		      fileSize = file.Size;   //ie安全问题
    	} else {   
	     	  fileSize = target.files[0].size; 
	    }  
	    alert(size);
        var size = fileSize / 1024;   
        
        if(size>100000){ 
       		 alert("附件大小不能大于100M！"); 
       		 //var file=document.getElementById(id); 
       		// file.outerHTML=file.outerHTML
        }  
        if(size<=0){
        	alert("附件大小不能为0M！"); 
        	//var file=document.getElementById(id); 
       		// file.outerHTML=file.outerHTML
        } 
} 


//传入需要清空的文本框的class
function selectDelButton(className){
	$("."+className).val("");
}



//获取页面传值 ?传值的参数
function Utilrequest(paras){    
		var url = location.href;     
		var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");     
		var paraObj = {}     
		for (i=0; j=paraString[i]; i++){     
			paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);     
		}     
		var returnValue = paraObj[paras.toLowerCase()];     
		if(typeof(returnValue)=="undefined"){     
			return "";     
		}else{     
			return returnValue;    
		}  
}
//时钟
function Clock() {
	var date = new Date();
	this.year = date.getFullYear();
	this.month = date.getMonth() + 1;
	this.date = date.getDate();
	this.day = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")[date.getDay()];
	this.hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
	this.minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
	this.second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

	this.toString = function() {
		return this.year + "年" + this.month + "月" + this.date + "日 " + this.hour + ":" + this.minute + ":" + this.second + " " + this.day; 
	};
	
	this.toSimpleDate = function() {
		return this.year + "-" + this.month + "-" + this.date;
	};
	
	this.toDetailDate = function() {
		return this.year + "-" + this.month + "-" + this.date + " " + this.hour + ":" + this.minute + ":" + this.second;
	};
	
	this.display = function(ele) {
		var clock = new Clock();
		ele.innerHTML = clock.toString();
		window.setTimeout(function() {clock.display(ele);}, 1000);
	};
}
//时间人性格式化
function changetime(dateTimeStamp){
	var minute = 1000 * 60;
	var hour = minute * 60;
	var day = hour * 24;	 	
	var now = new Date();
	var old;
	var diffValue;
	if(!+[1,]){
		//"ie浏览器";
		dateTimeStampt=dateTimeStamp.replace("T"," ");
		
		old= new Date(Date.parse(dateTimeStamp.replace(/-/g,   "/")));
		diffValue = now.getTime() - (old.getTime()-3600000);
	}else{
		old=new Date(dateTimeStamp);
		diffValue = now.getTime() - old.getTime();
	}
	var dayC =diffValue/day;
	var hourC =diffValue/hour;
	var minC =diffValue/minute;
	 	
	 if(dayC>=3){
		  
		 if(now.getFullYear()==old.getFullYear()){
			 	time= dateTimeStamp.replace("T"," ");
				return time.substring(time.indexOf("-")+1,time.length);
			
			 
		 }else{
			 return dateTimeStamp.replace("T"," ");
		 }
	 }else if(dayC>=2){
		 return "前天 "+dateTimeStamp.split("T")[1];
	 }else if(dayC>=1){
		 return "昨天 "+dateTimeStamp.split("T")[1];
	 }else if(hourC>=1){
	 	return parseInt(hourC) +"小时前";
	 }else if(minC>=1){
	 	return parseInt(minC) +"分钟前";
	 }else{
	 	return Math.floor(diffValue/1000)+"秒前";
	 }	 
}

//artDialog 拓展方法 右下角滑动通知
artDialog.notice = function (options) {
    var opt = options || {},
        api, aConfig, hide, wrap, top,
        duration = 800;
    var config = {
        left: '100%',
        top: '100%',
        fixed: true,
        drag: false,
        resize: false,
        follow: null,
        lock: false,
        init: function(here){
            api = this;
            aConfig = api.config;
            wrap = api.DOM.wrap;
            top = parseInt(wrap[0].style.top);
            hide = top + wrap[0].offsetHeight;
            
            wrap.css('top', hide + 'px')
                .animate({top: top + 'px'}, duration, function () {
                    opt.init && opt.init.call(api, here);
                });
        },
        close: function(here){
            wrap.animate({top: hide + 'px'}, duration, function () {
                opt.close && opt.close.call(this, here);
                aConfig.close = $.noop;
                api.close();
            });
            
            return false;
        }
    };	
    for (var i in opt) {
        if (config[i] === undefined) config[i] = opt[i];
    };
    return artDialog(config);
};

//重载  setTimeout 方法，提供参数传递
var __sto = setTimeout;
window.setTimeout = function(callback,timeout,param){
	var args = Array.prototype.slice.call(arguments,2);
	var _cb = function(){
		callback.apply(null,args);
	}
	__sto(_cb,timeout);
}
/**
 * dwz打开标签，弹窗，点击事件，解决一些冲突问题，可以使用此方法
 * @param a	a链接
 * @returns {Boolean}
 */
function dwzClickOpen(a,event){
	var $this = $(a);
	var target=$this.attr("target");
	if(target=="navTab"){
		var title = $this.attr("title") || $this.text();
		var tabid = $this.attr("rel") || "_blank";
		var fresh = eval($this.attr("fresh") || "true");
		var external = eval($this.attr("external") || "false");
		var url = unescape($this.attr("href")).replaceTmById($(event.target).parents(".unitBox:first"));
		DWZ.debug(url);
		if (!url.isFinishedTm()) {
			alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
			return false;
		}
		navTab.openTab(tabid, url,{title:title, fresh:fresh, external:external});
		return false;
		
	}else if(target=="dialog"){
		var title = $this.attr("title") || $this.text();
		var rel = $this.attr("rel") || "_blank";
		var options = {};
		var w = $this.attr("width");
		var h = $this.attr("height");
		if (w) options.width = w;
		if (h) options.height = h;
		options.max = eval($this.attr("max") || "false");
		options.mask = eval($this.attr("mask") || "false");
		options.maxable = eval($this.attr("maxable") || "true");
		options.minable = eval($this.attr("minable") || "true");
		options.fresh = eval($this.attr("fresh") || "true");
		options.resizable = eval($this.attr("resizable") || "true");
		options.drawable = eval($this.attr("drawable") || "true");
		options.close = eval($this.attr("close") || "");
		options.param = $this.attr("param") || "";

		var url = unescape($this.attr("href")).replaceTmById($(event.target).parents(".unitBox:first"));
		DWZ.debug(url);
		if (!url.isFinishedTm()) {
			alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
			return false;
		}
		$.pdialog.open(url, rel, title, options);
		
		return false;
	}else if(target=="ajax"){
		var rel = $this.attr("rel");
		if (rel) {
			var $rel = $("#"+rel);
			$rel.loadUrl($this.attr("href"), {}, function(){
				$rel.find("[layoutH]").layoutH();
			});
		}
		return false;
		
		
	}
	
}
/**
 * 自定义单选
 * @param input	单选元素this
 */
function myRadio(input){
	var $in=$(input);
	var $form=$in.closest("form");
	$("input[radioType='"+$in.attr("radioType")+"']",$form).attr("checked",false);
	$in.attr("checked",true);
}
/**
 * 点击提交按钮，先对密码进行加密
 * @param {} bt
 */
function encryptePassword(bt){
	var key = RSAUtils.getKeyPair($("#exponent",$form).val(), '', $("#modulus",$form).val());  
	var $form=$(bt).closest("form");
	$("[encryptTo]",$form).each(function(){
		var enName=$(this).attr("encryptTo");
		var password = RSAUtils.encryptedString(key, encodeURIComponent($(this).val())); 
		if($("input[name='"+enName+"']",$form).length>0){
			$("input[name='"+enName+"']",$form).val(password);
		}else{
			$(this).after('<input type="hidden" name="'+enName+'" value="'+password+'" />');
		}
		
		$(this).removeAttr("name");
	});
}

