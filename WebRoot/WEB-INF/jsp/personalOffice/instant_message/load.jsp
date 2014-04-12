<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--即时消息
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<my:validationAuthority url="instantMessage/add.do">
						<li><a href="javascript:;"><span>全部用户</span></a></li>
					</my:validationAuthority>
					<my:validationAuthority url="instantMessage/selectReceiveMessage.do">
						<li><a href="instantMessage/selectReceiveMessage.do?rel=${param.rel }" target="ajax" rel="${param.rel }_receiveMessage"><span>已收消息</span></a></li>
					</my:validationAuthority>
					<my:validationAuthority url="instantMessage/selectSendMessage.do">
						<li><a href="instantMessage/selectSendMessage.do?rel=${param.rel }" target="ajax" rel="${param.rel }_sendMessage"><span>已发消息</span></a></li>
					</my:validationAuthority>
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<my:validationAuthority url="instantMessage/add.do">
				<!-- 用户管理 -->
				<div fillSpace="sidebar" >
					<!-- 左侧部门选项 -->
					<div layoutH="44" style="float:left; display:block; overflow:auto; width:270px; border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
					  	
					  	<ul id="jsgt_deptLb_tree" class="ztree"></ul>
					  
					    
					</div>
					<!-- 右侧 -->
					<div id="${param.rel }_box" class="unitBox" >
							
							<img src="resource/images/big/arrow_left_48.png" style="vertical-align: middle;"/>
							<span style="font-weight: bold;">请先点击左侧选择部门</span>
						
						
					</div>
		
				</div>
			</my:validationAuthority>
			<my:validationAuthority url="instantMessage/selectReceiveMessage.do">
				<div id="${param.rel }_receiveMessage">
					<%@ include file="/WEB-INF/jsp/personalOffice/instant_message/receivey_message.jsp" %>
				</div>
			</my:validationAuthority>	
			<my:validationAuthority url="instantMessage/selectSendMessage.do">	
				<div id="${param.rel }_sendMessage">
					<%@ include file="/WEB-INF/jsp/personalOffice/instant_message/send_message.jsp" %>
				</div>
			</my:validationAuthority>
			
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>

<script type="text/javascript">
	
	$.ajax({
		url:"dept/load/all.do",
		cache: false,
		dataType:"json",
		success:function(json){
			var setting = {
					view: {
						dblClickExpand: false,
						showIcon: false
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
			var rel='<%= request.getParameter("rel") %>';
			var zNodes = new Array();
			zNodes.push({id : 0,name : "全部部门",open:true,href:"instantMessage/queryUsers.do?deptId="+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box",open:true});
			$.each(json, function(i, d) {
				
				zNodes.push({id : d.id,name : d.deptName,pId : d.superId,href:"instantMessage/queryUsers.do?deptId="+d.id+"&rel="+rel+"_box",dwzTarget:"ajax",
					rel:rel+"_box",open:true});
				
			});
			$.fn.zTree.init($("#jsgt_deptLb_tree"), setting, zNodes);
		}
	});
	
</script>	
	

