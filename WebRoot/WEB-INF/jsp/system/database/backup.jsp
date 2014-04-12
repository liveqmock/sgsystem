<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：公司文档管理：创建文件
--%>
<div class="pageContent" >					
<form method="post" action="database/backup.do"  class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:50px;"  layoutH="58">
			<dl style="margin-top: 20px;">
				<dt>文件名：</dt>
				<dd>
					<input type="text" name="name"  maxlength="50" class="required"  size="25"/><br/>
					<span class="info">为备份文件命名，例：首次备份.sql。</span>
				</dd>
			</dl>
			<dl>
				<dt>提醒：</dt>
				<dd>系统本身有自动备份功能，建议在特殊情况下才进行手动备份。<br/>因备份时会锁住所有表，为不影响使用，建议在系统不使用的时候备份。<br/>数据量越大，备份时间越长，如需导出备份文件，请等到数据完全备份完成之后再导出。</dd>
			</dl>
			
			<input type="hidden" name="navTabId" value="${param.rel }"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">备份</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
	
</form>
</div>
										
						
					
		

	

