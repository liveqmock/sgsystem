
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：系统管理--菜单管理 -- 菜单查找带回
--%>

<div class="pageContent">
	<div class="pageFormContent" layoutH="58" style="padding-left: 20px;">
		
		<ul id="menu_gllookup_tree" class="ztree"></ul>
	
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
		</ul>
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
			}
	};
	var menus=eval("("+'<%= request.getAttribute("menus") %>'+")");
	var zNodes = new Array();
	$.each(menus, function(i, m) {
		
		zNodes.push({id : m.id,name : m.menuName,pId : m.menuSuperId,open:false,icon:m.menuIcon,click:"$.bringBack({id:'"+m.id+"',name:'"+m.menuName+"'})"});
	
	});

	$.fn.zTree.init($("#menu_gllookup_tree"), setting, zNodes);
	
</script>								
						
					
		

	

