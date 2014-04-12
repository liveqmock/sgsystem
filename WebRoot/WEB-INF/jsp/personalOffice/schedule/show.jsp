<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--日程安排--详情
--%>

<div class="pageContent" >					
			
	<div class="pageFormContent"   layoutH="20">
			<dl>
				<dt>主题：</dt>
				<dd>
					<c:out value="${requestScope.s.schTitle }" />
				</dd>
			</dl>
			<dl class="nowrap">
				<dt>日程类型：</dt>
				<dd>
					<c:out value="${applicationScope.listId2Name[requestScope.s.schType]}" />
				</dd>
			</dl>
			<dl>
				<dt>开始时间：</dt>
				<dd>
					<fmt:formatDate value="${requestScope.s.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />
				</dd>
			</dl>
			
			<dl>
				<dt>结束时间：</dt>
				<dd>
					<fmt:formatDate value="${requestScope.s.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />
				</dd>
			</dl>
			<dl>
				<dt>提醒时间：</dt>
				<dd>
					<fmt:formatDate value="${requestScope.s.warnTime }" pattern="yyyy-MM-dd HH:mm:ss" />
				</dd>
			</dl>
			<div class="divider"></div>
			<div style="margin-left: 10px;margin-right: 10px;">
				<my:scriptEscape value="${requestScope.s.schContent }" />
			</div>
				
		
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保持</button></div></div></li>
			<li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
	</div>

</div>		
	