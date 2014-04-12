<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：系统管理--数据库管理--上传文件，恢复数据
--%>
<div class="pageContent" >					
<form method="post" action="database/uploadFile/restore.do" enctype="multipart/form-data"   class="pageForm required-validate" onsubmit="return iframeCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:50px;"  layoutH="58">
			
			<dl style="margin-top: 50px;">
				<dt>备份文件：</dt>
				<dd >
					<div align="left"><input type="file" fileupload="no" name="file" class="required" /></div>
					<span class="info">选择需要恢复的备份文件。</span>
				</dd>
			</dl>
			<dl>
				<dt>提醒：</dt>
				<dd>恢复数据之前最好先进行一次备份。</dd>
			</dl>
			<input type="hidden" name="navTabId" value="${param.rel }"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">恢复</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
	
</form>
</div>
										
						
					
		

	

