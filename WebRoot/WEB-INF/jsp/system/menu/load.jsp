<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--菜单管理
--%>

<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>菜单管理</span></a></li>
					<c:if test="${sessionScope.dev }">
						<li><a href="javascript:;"><span>操作管理</span></a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<!-- 菜单管理 -->
			<div>
				<!-- 左侧部门选项   reStyleSize='w' 设置此元素可以改变宽度,鼠标拉动改变  -->
				<div  layoutH="44" style="float:left; display:block; overflow:auto; width:250px; border:solid 1px #CCC; line-height:21px; background:#fff">	
					
					<ul id="menu_gl_tree" class="ztree"></ul>
				    
				</div>
				<!-- 右侧 -->
				<div id="${param.rel }_box" class="unitBox" >
					<c:choose>
						<c:when test="${sessionScope.dev }">
							<%@ include file="/WEB-INF/jsp/system/menu/add.jsp"%>
						</c:when>
						<c:otherwise>
							 <img src="resource/images/big/arrow_left_48.png" style="vertical-align: middle;"/>
							 <span style="font-weight: bold;">请先点击左侧选择菜单</span>	
						</c:otherwise>
					</c:choose>
						
									
				</div>
			</div>
			<c:if test="${sessionScope.dev }">
				<!--  操作管理-->
				<div>
					<!-- 左侧菜单选项 -->
					<div  layoutH="44" style="float:left; display:block; overflow:auto; width:250px; border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
					  	
					  	<ul id="menu_action_tree" class="ztree"></ul>
					    
					</div>
					<!-- 右侧 -->
					<div id="${param.rel }_action_box" class="unitBox" >
							
							<img src="resource/images/big/arrow_left_48.png" style="vertical-align: middle;"/>
							<span style="font-weight: bold;">请先点击左侧选择菜单</span>
						
					</div>
				</div>
			</c:if>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>
<script type="text/javascript">
	var setting = {
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
	var rel='<%= request.getParameter("rel") %>';
	var menus=eval("("+'<%= request.getAttribute("menus").toString() %>'+")");
	var zNodes = new Array();
	
	$.each(menus, function(i, m) {
		
		zNodes.push({id : m.id,name : m.menuName,
			pId : m.menuSuperId,icon:m.menuIcon,
			href:"menu/updatePage.do?id="+m.id+"&rel="+rel,dwzTarget:"ajax",
			rel:rel+"_box",open:m.menuOpen});
		
	});
	
	$.fn.zTree.init($("#menu_gl_tree"), setting, zNodes);
	
	var zNodes_action = new Array();
	
	$.each(menus, function(i, m) {
		
		zNodes_action.push({id : m.id,name : m.menuName,
			pId : m.menuSuperId,icon:m.menuIcon,
			href:"menu/action/query.do?menuId="+m.id+"&menuName="+encodeURIComponent(m.menuName)+"&rel="+rel,dwzTarget:"ajax",
			rel:rel+"_action_box",open:m.menuOpen});
		
	});
	$.fn.zTree.init($("#menu_action_tree"), setting, zNodes_action);
	
</script>	

	

