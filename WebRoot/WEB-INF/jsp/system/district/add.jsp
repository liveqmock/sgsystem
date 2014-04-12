<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：系统管理--地区管理 -- 新增
--%>

<div class="pageContent" >
				
<form method="post" action="district/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"  layoutH="58">
			<dl style="margin-top: 10px;">
				<dt>序号：</dt>
				<dd>
					<input type="text" name="disSort" maxlength="4" class="required digits" min="1" max="9999" size="25"/>
					<span class="info">用于同级下排序，值越小越靠前(数值范围：1-9999 整数)</span>
				</dd>
			</dl>
			
			<dl>
				<dt>名称：</dt>
				<dd>
					<input type="text" name="disName" class="required" maxlength="50" size="25" />
					
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="disDesc" cols="70" rows="2" maxlength="50"></textarea>
				</dd>
			</dl>
			<input type="hidden" name="superId" value="${param.id}"/>
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
										
						
					
		

	

