
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--人员评分
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>人员评分</span></a></li>
					
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<!-- 用户管理 -->
			<div fillSpace="sidebar" >
				<!-- 左侧部门选项 -->
				<div layoutH="44" style="float:left; display:block; overflow:auto; width:180px; border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
				  	
				  	<ul id="intergration_scoring_tree" class="ztree"></ul>
				  
				    
				</div>
				<!-- 右侧 -->
				<div id="${param.rel }" class="unitBox" >
						
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
		 {id:1,name:"内部销售人员",href:"scoringMonth/loadQuery.do?type=402881e53ff988d2013ff9a5b9f80002"+"&rel="+rel+"",dwzTarget:"ajax",rel:rel}
		,{id:2,name:"驻外销售人员",href:"scoringMonth/loadQuery.do?type=402881e53ff988d2013ff9a5f9520004"+"&rel="+rel+"",dwzTarget:"ajax",rel:rel}
	];

$.fn.zTree.init($("#intergration_scoring_tree"), setting, zNodes);
</script>	
	

