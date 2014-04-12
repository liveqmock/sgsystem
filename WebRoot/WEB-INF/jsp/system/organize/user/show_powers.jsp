<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--用户管理 --单个用户所有权限
--%>
				
<div class="pageContent" style="padding:1px">
	  	
	  
	  	
		  	<div class="pageFormContent" layoutH="56" >
				<ul id="user_show_power_tree" class="ztree"></ul>
			</div>
			
			<div class="formBar">
				
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeExpandAllNodes('user_show_power_tree',true)">展开</button>
						</div>
					</div>
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeExpandAllNodes('user_show_power_tree',false)">合并</button>
						</div>
					</div>
				<ul style="float:left;margin-left:15%;">
					
					<li>
						<div class="button" >
							<div class="buttonContent">
								<button type="button" class="close">关闭</button>
							</div>
						</div>
					</li>
					
				</ul>
		</div>
		
</div>

<script type="text/javascript">
		$.ajax({
			url:"user/showPowers.do?id=<%=(String)request.getParameter("id")%>",
			cache: false,
			dataType:"json",
			success:function(json){
				
				if(json.noRole){
					$("#user_show_power_tree").html("用户没有任何权限。请先为用户添加角色。");
					return ;
				}
				
				var setting = {
						view: {
							dblClickExpand: false,
							showIcon: true
						},
						data: {
							simpleData: {
								enable: true
							}
						}
				};
				
				var zNodes = new Array();
				
				$.each(json.menus, function(i, m) {
					
					
					zNodes.push({id : m.id,name : m.menuName,pId : m.menuSuperId,open:false,icon:m.menuIcon});
					
				});
				
				$.each(json.actions, function(i, a) {
					
					zNodes.push({id : a.id,name : a.actionName,pId : a.menuId,icon:"resource/images/menu/3.png"});
				
				});
				
				$.fn.zTree.init($("#user_show_power_tree"), setting, zNodes);
			}
		});

	
	
	
</script>	
					
		

	

