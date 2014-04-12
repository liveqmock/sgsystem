//页面加载完成之后执行  
$(function() {
	//先为cookie设置字体默认值
	if(!$.cookie("core_font_size")){
		$.cookie("core_font_size","12");
	}
	$fontLink=$("head").find("link[href$='font-size.css']");
	$fontLink.attr("href",$fontLink.attr("href").replace("12",$.cookie("core_font_size")));
	DWZ.init("resource/js/dwz/dwz.frag.xml", {
		loginUrl:"sy_login.do", //超时之后跳转到登陆页面
		//loginTitle:"登陆超时",	//如果设置loginTitle，将会以弹出框的形式打开loginUrl， 弹出登录对话框标题
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"resource/js/dwz/themes"}); // themeBase 相对于index页面的主题base路径
			myInit();
		}
	
	});
});
//初始化信息
function myInit(){
	//主题更换
	$("#li_Theme").hover(
		  function () {
		   	$("#themeList").show();
		  },
		  function () {
			$("#themeList").hide();
		  }
		);
	//欢迎页面渐渐消失
	$("#div_wecomeImg").animate({ opacity: 'hide'}, 3000);
	//设置时钟
	new Clock().display(document.getElementById("clock"));
	if(msgWarn){
		selectMyMsg();
		//设置定时查询有没有未读信息
		intervalProcess=setInterval("selectMyMsg()",msgWarnTime*60000);
	}
	//退出系统
	$("#loginGoout").click(function(){
		$.dialog( {
			lock: true,
			id:1,
			title : "退出系统",
			content :"<font color='red'>确认退出系统?</font>",			
			ok:function(){
				window.location.href="sy_login/out.do";
			},
			cancel:function(){},
			okVal:"退出",
			cancelVal:"取消",
			width:230,
			height:70,
			icon:"warning"
		
		});
	});	
	if(showOnLine){
		//在线人员
		$("#onlineNum").click(function(){
			$.ajax({
				url:"main/online.do",
				dataType:"json",
				success:function(data){
					//添加DWZ信息提示
					DWZ.ajaxDone(data);
					if (data.statusCode != DWZ.statusCode.ok)return false;
					$("#onlineNum").html("&nbsp;"+data.onlineNum+"&nbsp;");
					var onlineSetting = {
							view: {
								dblClickExpand: false
							},
							data: {
								simpleData: {
									enable: true
								}
							},
							callback: {
								onClick: zTreeClick
							}
					};
					var onlineZNodes = new Array();
					
					$.each(data.depts, function(i, m) {
						onlineZNodes.push({id : m.id,name : m.deptName,pId : m.superId,
							iconSkin:"mypoint",clickOpen:true,open:true});
					});
					
					$.each(data.users, function(i, m) {
						
						if(m.sex=='女'){
							onlineZNodes.push({id : m.id,name : m.trueName,pId : m.deptId,
								icon:"resource/images/user/U11.png",href:"instantMessage/addPage.do?userId="+m.id+"&rel=xttx_jsgt_add",dwzTarget:"navTab",
								rel:"xttx_jsgt_add",click:"$.dialog.list['111'].close()"
							});
						}else{
							onlineZNodes.push({id : m.id,name : m.trueName,pId : m.deptId,
								icon:"resource/images/user/U01.png",href:"instantMessage/addPage.do?userId="+m.id+"&rel=xttx_jsgt_add",dwzTarget:"navTab",
								rel:"xttx_jsgt_add",click:"$.dialog.list['111'].close()"
							});
						}
						
					});
					var zTobj=$.fn.zTree.init($("#online_tree"), onlineSetting, onlineZNodes);
					//获取所有部门节点
					var nodes = zTobj.getNodesByParam("clickOpen", true, null);
					for ( var i = 0,k=nodes.length; i <k ; i++) {
						if(!nodes[i].isParent){
							//删除部门下没有用户的部门
							zTobj.removeNode(nodes[i]);
						}
					}
					$.dialog( {
						id:111,
						title : "在线人员",
						content :document.getElementById("div_online")	
						
						
					});
					
				},
				error: DWZ.ajaxError
			});
			
			
		});	
	}
	if(scheduleWarn){
		//查询出日程安排提醒
		$.ajax({
			url:"schedule/queryWarn.do",
			dataType:"json",
			cache: false,
			success:function(data){
				//添加DWZ信息提示
				DWZ.ajaxDone(data);
				if (data.statusCode != DWZ.statusCode.ok){
					
					return false;
				}
				var nowTime=new Date().getTime();
				$.each(data.sch,function(i,m){
					var html='<a href="javascript:;" onclick="navTab.openTab(\'grbg_rcapck\',\'schedule/show.do?id='+m.id+'\',{title:\'日程安排详情\', fresh:true, external:false});$.dialog.list[\''+m.id+'\'].close();">'+m.title+'</a>';
					
					setTimeout(scheduleWarnNotice,new Date(m.time)-nowTime,html,m.id);
					
				});
				
				
			},
			error:function(xhr, ajaxOptions, thrownError){
				if (alertMsg) {
					alertMsg.error("<div>Http status: " + xhr.status + " " + xhr.statusText + "</div>" 
						+ "<div>ajaxOptions: "+ajaxOptions + "</div>"
						+ "<div>thrownError: "+thrownError + "</div>"
						+ "<div>"+xhr.responseText+"</div>");
				} else {
					alert("Http status: " + xhr.status + " " + xhr.statusText + "\najaxOptions: " + ajaxOptions + "\nthrownError:"+thrownError + "\n" +xhr.responseText);
				}
			},
			beforeSend:function(){
				//隐藏数据加载提示框
				$("#background,#progressBar").hide();
			}
		});
	}	
	//字体大小切换
	$(".changeFont").click(function(){
		var fz=$(this).attr("fz");
		$fontLink.attr("href",$fontLink.attr("href").replace($.cookie("core_font_size"),fz));
		$.cookie("core_font_size",fz)
	});
}
//查询消息提醒
function selectMyMsg(){

	$.ajax({
		url:"main/warnmsg.do",
		dataType:"json",
		cache: false,
		success:function(data){
			//添加DWZ信息提示
			DWZ.ajaxDone(data);
			if (data.statusCode != DWZ.statusCode.ok){
				//停止定时任务
				clearInterval(intervalProcess);
				return false;
			}
			//更新在线人员数量
			$("#onlineNum").html("&nbsp;"+data.onlineNum+"&nbsp;");
			//更新底部数字
			$("#ft_jhst").text(data.instantmsg_num);//即时沟通
			$("#ft_wdyj").text(data.email_num);//未读邮件
			$("#ft_rcap").text(data.todaySchedule_num);//日程安排
			$("#ft_xxtx").text(data.warnmsg_num);//消息提醒
			var html="";
			if(data.warnmsg_num!=0){
				html+='<a href="javascript:;" onclick="navTab.openTab(\'grbg_xxtx\', \'msgwarn/load.do?rel=grbg_xxtx\',{title:\'消息提醒\', fresh:true, external:false});$.dialog.list[\'234\'].close();">您有('+data.warnmsg_num+')条未读提醒，点击查看！</a><br/><br/>';
			}
			if(data.instantmsg_num!=0){
				html+='<a href="javascript:;" onclick="navTab.openTab(\'xxtx_jsgt\', \'instantMessage/selectReceiveMessage.do?rel=xxtx_jsgt&readState=0&type=2\',{title:\'未读即时沟通\', fresh:true, external:false});$.dialog.list[\'234\'].close();">您有('+data.instantmsg_num+')条即时沟通，点击查看！</a>';
			}
			if(html.length!=0){
				$.dialog.notice({
					id:234,
				    title: '消息提醒',
				    width: 270,
				    content: html,
				    time: 10
				});
			}
		},
		error:function(xhr, ajaxOptions, thrownError){
			//停止定时任务
			clearInterval(intervalProcess);
			if (alertMsg) {
				alertMsg.error("<div>Http status: " + xhr.status + " " + xhr.statusText + "</div>" 
					+ "<div>ajaxOptions: "+ajaxOptions + "</div>"
					+ "<div>thrownError: "+thrownError + "</div>"
					+ "<div>"+xhr.responseText+"</div>");
			} else {
				alert("Http status: " + xhr.status + " " + xhr.statusText + "\najaxOptions: " + ajaxOptions + "\nthrownError:"+thrownError + "\n" +xhr.responseText);
			}
		},
		beforeSend:function(){
			//隐藏数据加载提示框
			$("#background,#progressBar").hide();
		}
	});
}
//日程提醒弹出框
function scheduleWarnNotice(html,id){
	
	$.dialog.notice({
		id:id,
	    title: '日程安排提醒',
	    width: 250,
	    content: html
	    
	});
	
}

