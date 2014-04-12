<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：共享文档管理：创建文件
--%>

<div class="pageContent" >					
<form method="post" action="shareFiles/addFile.do" enctype="multipart/form-data"   class="pageForm required-validate" onsubmit="return iframeCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:50px;"  layoutH="58">
			<dl style="margin-top: 20px;">
				<dt>文件名：</dt>
				<dd>
					<input type="text" name="wdName"  maxlength="50" class="required"  size="25"/>
					
				</dd>
			</dl>
			<dl>
				<dt>文件：</dt>
				<dd >
					<div align="left"><input type="file" fileupload="no" name="file"  class="required"/></div>
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="wdDesc" cols="70" rows="2" maxlength="50"></textarea>
				</dd>
			</dl>
			<input type="hidden" name="wdSuperId" value="${param.id }"/>
			<input type="hidden" name="${param.reType }" value="${param.rel }"/>
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
										
						
					
		

	

