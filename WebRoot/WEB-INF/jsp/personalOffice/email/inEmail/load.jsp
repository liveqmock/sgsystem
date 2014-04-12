<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-内部邮件-收件箱
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="email/loadIn.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<input type="hidden" name="puGrouping" value="${param.peGrouping }"/>
			<div class="searchBar">
				<table class="searchContent" style="margin-left:50px">
					<tr >
						
						<td>
							标题：<input type="text" name="name"  value="<c:out value="${param.name }" />" />
						</td>
						<td>
							邮件状态：
							</td>
							<td><select name="status" class="combox"  sValue="${param.status}">
								<option value="">--请选择--</option>
								<option value="1">已读</option>
								<option value="0">未读</option>
							</select>
						</td>
						<td>发送日期：
								<input type="text"  readonly="readonly" onFocus="WdatePicker()"  name="date1" value="${param.date1 }" />
								<span class="limit">-</span>
								<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="date2" value="${param.date2 }" />
						</td>
						
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="email/delIn.do">
				<li><a class="delete" href="email/delIn.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一条信息"><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="60" align="center">状态</th>
				<th  align="center">标题</th>
				<th width="170" align="center">发件人</th>
				<th width="150" align="center">发送时间</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${values }" >
				
				<tr target="id" rel="${v.emInbox.id }">
				
					<td title="id：${v.emInbox.id }"><input name="ids" value="${v.ei.id }" type="checkbox"></td>
					
					<td title="${v.emInboxOutboxUser.ioStatus}">
						<c:choose>
							<c:when test="${ v.eiou.ioStatus=='未读' }">
								 <img src="resource/images/email_close.gif" alt="未读"  style="margin-top: 3px;"/>
							</c:when>
							<c:otherwise>
								<img src="resource/images/email_open.gif" alt="已读" style="margin-top: 3px;"/>
							</c:otherwise>
						</c:choose>
					</td>
					
					<td title="<c:out value="${v.ei.eiName}" />">
						<a href="email/findIn.do?id=${v.ei.id}" target="navTab" rel="${param.rel}_find">
						<c:out value="${v.ei.eiName}" />
						</a>
					</td>
					<td ><my:outTrueName id="${v.ei.eiUid }"/></td>

					<td title="<fmt:formatDate value="${v.ei.eiDate}" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate value="${v.ei.eiDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
	
</div>



	

