<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：系统管理--组织机构 -- 角色管理--添加角色
--%>

<div class="pageContent" >
				
<form method="post" action="role/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="58">
	
			<dl style="margin-top: 10px;">
				<dt>角色名称：</dt>
				<dd>
					<input type="text" name="roleName" class="required" minlength="2" maxlength="20" size="25" />
					
				</dd>
			</dl>
			<dl>
				<dt>说明：</dt>
				<dd>
					<textarea  name="roleDesc" cols="70" rows="2" maxlength="255"></textarea>
				</dd>
			</dl>
			
			
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
	
</form>
</div>
										
						
					
		

	

