<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：协同办公--日志管理 --修改
--%>

<div class="pageContent" >
			
<form method="post" action="journal/update.do"  class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="56">
			<dl>
				<dt>日期：</dt>
				<dd>
					<input type="text"  name="journalTime" class="required" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value="${requestScope.j.journalTime }" pattern="yyyy-MM-dd HH:mm:ss" />"/>
				</dd>
			</dl>
			<dl>
				<dt>日志类型：</dt>
				<dd>
					<select class="combox required"   name="journalType" sValue="<c:out value="${requestScope.j.journalType}" />">
						<my:outOptions type="5"/>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>共享用户：</dt>
				<dd>
					<a href="user/lookUpPage.do?type=2" lookupGroup="user" title="用户查询" >
						<textarea  readonly="readonly" class="clear_user" toName="user.name" cols="65" rows="2" ><my:outTrueName id="${requestScope.userIds }"/></textarea>
					</a>
					<input type="hidden"  name="userIds" toName="user.id" class="clear_user" maxlength="65530" value="${requestScope.userIds }"/>
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
					<label >&nbsp;&nbsp;&nbsp;发送提醒<input style="vertical-align:middle;" type="checkbox" name="isSendMsg" value="1" /></label>
				</dd>
			</dl>
			<dl>
				<dt>主题：</dt>
				<dd >
					<input type="text" name="journalTitle" class="required" maxlength="100"   size="45" value="<c:out value="${requestScope.j.journalTitle }" />"/>
				</dd>
			</dl>
			<dl>
				<dt>内容：</dt>
				<dd>
					<textarea  name="journalContent" cols="100" rows="10" class="editor" minlength="1" maxlength="65530"><c:out value="${requestScope.j.journalContent }" /></textarea>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.j.id }"/>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		
	</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>
										
						
					