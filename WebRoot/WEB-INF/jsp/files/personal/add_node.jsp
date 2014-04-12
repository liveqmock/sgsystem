<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：个人文档管理：创建目录
--%>

<div class="pageContent" align="center">
		
	<form method="post" action="personalFiles/addNode.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
							
		<div class="pageFormContent nowrap" style="padding-left:10px;"  layoutH="58">
				<div class="unit" style="margin-top: 20px;">
					<label>文件夹名：</label>
					
					<input type="text" name="wdName"  maxlength="50" class="required"  size="25"/>
					<span class="info">同一目录下文件夹名称不可重复</span>
					
				</div>
				<div class="unit">
					<label>备注：</label>
					<textarea  name="wdDesc" cols="30" rows="2" maxlength="50"></textarea>
				
				</div>
				<input type="hidden" name="wdSuperId" value="${param.id }"/>
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
										
						
					
		

	

