
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理--权限修改
--%>
<div class="pageContent" style="padding:1px">
	  	
	  	<form method="post" action="role/power/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	  	
		  	<div class="pageFormContent" layoutH="56" style="margin-left: 100px;">
				<ul id="role_power_tree" class="ztree"></ul>
			</div>
			
			<div class="formBar">
				
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeExpandAllNodes('role_power_tree',true)">展开</button>
						</div>
					</div>
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeExpandAllNodes('role_power_tree',false)">合并</button>
						</div>
					</div>
				<my:validationAuthority url="role/power/update.do">	
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeCheckAllNodes('role_power_tree',true)">全选</button>
						</div>
					</div>
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeCheckAllNodes('role_power_tree',false)">全部取消 </button>
						</div>
					</div>
				</my:validationAuthority>
				<ul style="float:left;margin-left:15%;">
					<my:validationAuthority url="role/power/update.do">
						<li>
							<div class="buttonActive" >
								<div class="buttonContent">
									<button type="submit" onclick="ber_updateRolePower(this,event)">保存</button>
									<!-- 角色id -->
									<input type="hidden" name="roleId" value="${param.id }"  />
									
									<!-- 需要添加的菜单关联 -->
									<input type="hidden" name="addMenuIds"  />
									<!-- 需要删除的菜单关联 -->
									<input type="hidden" name="delMenuIds"  />
									<!-- 需要添加的操作关联 -->
									<input type="hidden" name="addActionIds"  />
									<!-- 需要删除的操作关联 -->
									<input type="hidden" name="delActionIds"  />
									
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
	
	var isChange=true;
	if($(("button[type='submit']"),$("#role_power_tree").closest("form")).length==0){
		isChange=false;
	}
	if(isChange){
		var setting = {
				check: {
					enable: true
				},
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
	}else{
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
	}
	
	
	var powers=eval("("+'<%= request.getAttribute("p").toString() %>'+")");
	
	var zNodes = new Array();
	
	$.each(powers.menus, function(i, m) {
		
		if($.inArray(m.id,powers.hasMenus)==-1){
			zNodes.push({id : m.id,name : m.menuName,pId : m.menuSuperId,open:false,isMenu:true,icon:m.menuIcon});
		}else{
			zNodes.push({id : m.id,name : m.menuName,pId : m.menuSuperId,open:false,isMenu:true,checked:true,icon:m.menuIcon});
		}
	});
	
	$.each(powers.actions, function(i, a) {
		if($.inArray(a.id,powers.hasActions)==-1){
			if(isChange){
				zNodes.push({id : a.id,name : a.actionName,pId : a.menuId,isMenu:false,icon:"resource/images/menu/3.png"});
			}
		}else{
			zNodes.push({id : a.id,name : a.actionName,pId : a.menuId,isMenu:false,checked:true,icon:"resource/images/menu/3.png"});
		}
		
	});
	
	$.fn.zTree.init($("#role_power_tree"), setting, zNodes);
	
	function ber_updateRolePower(bt,event){
		var $this=$(bt);
		var treeObj = $.fn.zTree.getZTreeObj("role_power_tree");
		
		//获取所有改变的节点
		var nodes = treeObj.getChangeCheckedNodes();
		
		if(nodes.length==0){
			alertMsg.error("未更改，无需保存");
			event.preventDefault();
			return false;
		}
		var addMenuIds = new Array();
		var delMenuIds = new Array();
		var addActionIds = new Array();
		var delActionIds = new Array();
		for ( var i = 0,k=nodes.length; i <k ; i++) {
			var node=nodes[i];
			//checkedOld:节点初始化时的勾选状态  true 表示节点初始化时 输入框被勾选  false 表示节点初始化时 输入框未勾选
			//为节点自定义isMenu属性，true:菜单,false:操作
			if(node.checkedOld){
				//原先被勾选，现在取消勾选
				if(node.isMenu){
					//删除关联菜单
					delMenuIds.push(node.id);
				}else{
					//删除关联操作
					delActionIds.push(node.id);
				}
			}else{
				//原先未勾选，现在勾选了
				if(node.isMenu){
					//添加关联菜单
					addMenuIds.push(node.id);
				}else{
					//添加关联操作
					addActionIds.push(node.id);
				}
			}
		}
		
		$this.nextAll("input[name='addMenuIds']").val(addMenuIds.join(","));
		$this.nextAll("input[name='delMenuIds']").val(delMenuIds.join(","));
		$this.nextAll("input[name='addActionIds']").val(addActionIds.join(","));
		$this.nextAll("input[name='delActionIds']").val(delActionIds.join(","));
	}
	
</script>	
	

