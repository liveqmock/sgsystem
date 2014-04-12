<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：协同办公--通知管理
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="notice/loadtome.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr >
						<td>
							标题：<input type="text" name="noticeTitle" value="<c:out value="${param.noticeTitle }" />"/>
						</td>
						<td>
							<select class="combox"   name="noticeType"  sValue="${param.noticeType}" >
								<option value="">全部类型</option>
								<my:outOptions type="1"/>
							</select>
						</td>
						<td>
							发布人:
							<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户选择" >
								<input type="text" name="userName" size="20"  readonly="readonly"  toName="user.name" value="${param.userName }"/>
							</a>
							<input type="hidden" name="noticeSendId"  class="reset_notice_loadme" toName="user.id"  value="${param.noticeSendId }" />
						</td>
						<td>发布时间：
								<input type="text"  readonly="readonly" size="15" onFocus="WdatePicker()" name="startDate" value="${param.startDate }" />
								<span class="limit">-</span>
								<input type="text"  readonly="readonly" size="15" onFocus="WdatePicker()" name="endDate" value="${param.endDate }" />
						</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset"  resetClass="reset_notice_loadme">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	
	<table class="table" width="1100" layoutH="87">
		<thead>
			<tr>
				<th width="28" align="center">行号</th>
				<th width="170"  align="center">通知类型</th>
				<th  align="center">标题</th>
				<th width="140"  align="center">发送人</th>
				<th width="150"  align="center" orderField="noticeCreateTime"  class="${fromParam.orderDirection}">发送时间</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.notices }" varStatus="status">
				
				<tr >
					<td>${status.count }</td>
					<td>
						<my:outSelectValue id="${m.noticeType }"/>
					
					</td>
					<td title="<c:out value="${m.noticeTitle }" />">
						<a href="notice/show.do?id=${m.id }" target="navTab" rel="${param.rel}_show">
							<c:out value="${m.noticeTitle }" />
						</a>
					</td>
					<td ><my:outTrueName id="${m.noticeSendId }"/></td>
					<td >
						<fmt:formatDate value="${m.noticeCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>