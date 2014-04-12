
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--用户管理
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>用户管理</span></a></li>
					
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<!-- 用户管理 -->
			<div fillSpace="sidebar" >
				<!-- 左侧部门选项 -->
				<div layoutH="44" style="float:left; display:block; overflow:auto; width:270px; border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
				  	
				  	<ul id="user_deptLb_tree" class="ztree"></ul>
				  
				    
				</div>
				<!-- 右侧 -->
				<div id="${param.rel }_box" class="unitBox" >
						
						<img src="resource/images/big/arrow_left_48.png" style="vertical-align: middle;"/>
						<span style="font-weight: bold;">请先点击左侧选择部门</span>
					
					
				</div>
	
			</div>
			
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
			zNodes.push({id : 0,name : "全部部门",open:true,href:"user/queryUsers.do?deptId="+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box",open:true});
			$.each(json, function(i, d) {
				
				zNodes.push({id : d.id,name : d.deptName,pId : d.superId,href:"user/queryUsers.do?deptId="+d.id+"&rel="+rel+"_box",dwzTarget:"ajax",
					rel:rel+"_box",open:true});
				
			});
			
			$.fn.zTree.init($("#user_deptLb_tree"), setting, zNodes);
			
			
		}
	});

</script>	
	

