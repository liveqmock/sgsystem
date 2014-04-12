<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--
	左侧菜单
--%>

<div id="sidebar_s">
	<div class="collapse">
		<div class="toggleCollapse"><div></div></div>
	</div>
</div>
<div id="sidebar">
	<div class="toggleCollapse"><h2>导航</h2><div title="收缩左侧菜单">收缩</div></div>
	
	<div class="accordion" fillSpace="sidebar">
		<div class="accordionHeader">
			<!-- 此处可添加功能 -->
			<%--<h2><span>Folder</span>系统菜单</h2>--%>
			<h6>
				<a href="javascript:;" onclick="zTreeExpandAllNodes('left_menu_tree',false)"><img src="resource/images/green_plus.gif"  style="margin-top: 5px;"/></a>
				<a href="javascript:;" onclick="zTreeExpandAllNodes('left_menu_tree',true)"><img src="resource/images/green_minus.gif"  style="margin-top: 5px;"/></a>
			</h6>
			
		</div>
		<div class="accordionContent">
				<%--初始化左侧菜单	--%>
			<ul id="left_menu_tree" class="ztree" style="font-size:250px;"></ul>
		</div>
		
		<script type="text/javascript">
		
			var setting = {
					view: {
					 showLine: false,
isParent:true,
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
			var menus=eval("("+'<%= request.getAttribute("menus") %>'+")");
			var zNodes = new Array();
			
			$.each(menus, function(i, m) {
				
				zNodes.push({id : m.id,name : m.menuName,
					pId : m.menuSuperId,icon:m.menuIcon,
					href:m.menuUrl,dwzTarget:m.menuTarget,
					rel:m.menuRel,external:m.menuExternal,fresh:m.menuFresh,
					open:m.menuOpen,clickOpen:true});
				
			});
			
			$.fn.zTree.init($("#left_menu_tree"), setting, zNodes);
			
			
		</script>	
		
		
	</div>
</div>