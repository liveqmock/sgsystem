
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--用户管理--角色修改
--%>
<div class="pageContent" >
	  	
	  	<form method="post" action="user/updateRole.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
	  	
		  	<div class="pageFormContent" layoutH="60" >
				<ul id="user_role_tree" class="ztree"></ul>
			</div>
			
			<div class="formBar">
				<my:validationAuthority url="user/updateRole.do">
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeCheckAllNodes('user_role_tree',true)">全选</button>
						</div>
					</div>
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeCheckAllNodes('user_role_tree',false)">全部取消 </button>
						</div>
					</div>
				</my:validationAuthority>
				<ul style="float:left;margin-left:200px;">
					<my:validationAuthority url="user/updateRole.do">
						<li >
							<div class="buttonActive" >
								<div class="buttonContent">
									<button type="submit"  onclick="ber_updateUserRole(this,event)">保存</button>
									<!-- 角色id -->
									<input type="hidden" name="userId" value="${param.id }"  />
									
									<!-- 需要添加的角色关联 -->
									<input type="hidden" name="addRoleIds"  />
									<!-- 需要删除的角色关联 -->
									<input type="hidden" name="delRoleIds"  />
									
									<input type="hidden" name="callbackType" value="closeCurrent"/>
								</div>
							</div>
						</li>
					</my:validationAuthority>
					<li>
						<div class="button" >
							<div class="buttonContent">
								<button type="button" class="close">关闭</button>
							</div>
						</div>
					</li>
					
				</ul>
			</div>
		</form>
</div>
<script type="text/javascript">
	<!--
	var isUpdate=$("button[type='submit']",$("#user_role_tree").closest("form")).length;
	if(isUpdate==0){
		var setting = {
				
			view: {
				dblClickExpand: false,
				showIcon: false
			},
			data: {
				simpleData: {
					enable: true
				},
				key: {
					title: "title"
				}
			}
		};
	}else{
		var setting = {
				check: {
					enable: true
				},
				view: {
					dblClickExpand: false,
					showIcon: false
				},
				data: {
					simpleData: {
						enable: true
					},
					key: {
						title: "title"
					}
				}
		};
	}
	
	var m=eval("("+'<%= request.getAttribute("m").toString() %>'+")");
	
	var zNodes = new Array();
	
	if(isUpdate==0){
		$.each(m.roles, function(i, r) {
			
			if($.inArray(r.id,m.hasRoles)!=-1){
				zNodes.push({id : r.id,name : r.roleName,title:r.roleDesc});
			}
		});
	}else{
		$.each(m.roles, function(i, r) {
			
			if($.inArray(r.id,m.hasRoles)==-1){
				zNodes.push({id : r.id,name : r.roleName,title:r.roleDesc});
			}else{
				
				zNodes.push({id : r.id,name : r.roleName,title:r.roleDesc,checked:true});
				
			}
		});
	}
	
	
	
	$.fn.zTree.init($("#user_role_tree"), setting, zNodes);

	function ber_updateUserRole(bt,event){
		var $this=$(bt);
		var treeObj = $.fn.zTree.getZTreeObj("user_role_tree");
		//获取所有改变的节点
		var nodes = treeObj.getChangeCheckedNodes();
		if(nodes.length==0){
			alertMsg.error("未更改，无需保存");
			event.preventDefault();
			return false;
		}
		var addRoleIds = new Array();
		var delRoleIds = new Array();
		for ( var i = 0,k=nodes.length; i <k ; i++) {
			var node=nodes[i];
			
			//checkedOld:节点初始化时的勾选状态  true 表示节点初始化时 输入框被勾选  false 表示节点初始化时 输入框未勾选
			//为节点自定义isMenu属性，true:菜单,false:操作
			if(node.checkedOld){
				//原先被勾选，现在取消勾选
		
				//删除角色关联
				//alert("删除菜单"+node.name);
				delRoleIds.push(node.id);
				
			}else{
				//原先未勾选，现在勾选了
				addRoleIds.push(node.id);
				
			}
		}
		$this.nextAll("input[name='addRoleIds']").val(addRoleIds.join(","));
		$this.nextAll("input[name='delRoleIds']").val(delRoleIds.join(","));
	}
	//-->
</script>	
	