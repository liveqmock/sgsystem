
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：积分考核--考核项管理
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>考核项管理</span></a></li>
					
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<!-- 考核项管理 -->
			<div fillSpace="sidebar" >
				<!-- 左侧分组选项 -->
				<div layoutH="44" style="float:left; display:block; overflow:auto; width:150px; border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
				  	
				  	<ul id="intergration_assess_set" class="ztree"></ul>
				  
				    
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
	var zNodes = [
					{id:1,name:"销售人员积分考核项",href:"assess/assessQuery.do?asGroup=1"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
					,{id:2,name:"大区经理积分考核项",href:"assess/assessQuery.do?asGroup=2"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
					,{id:2,name:"年度积分自动考核项",href:"assess/assessQuery.do?asGroup=3"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				];
	
	$.fn.zTree.init($("#intergration_assess_set"), setting, zNodes);
	
</script>	
	

