<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--消息提醒-未读消息查询
--%>
<div class="pageHeader" style="border:1px #B8D0D6 solid;" >

	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel }_notread');" action="msgwarn/load/notread.do" method="post">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		
		<input type="hidden" name="deptId" value="${param.deptId }"/>
		
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 50px">
				<tr >
					<td>
						<select class="combox"   name="msgType"  sValue="${param.noticeType}" >
							<option value="">全部提醒</option>
							<option value="1">通知</option>
							<option value="2">会议</option>
							<option value="3">投票</option>
							<option value="4">共享日志</option>
						</select>
					</td>
					<td>发布时间：
							<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="startDate" value="${param.startDate }" />
							<span class="limit">-</span>
							<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="endDate" value="${param.endDate }" />
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
					<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
	<div class="panelBar">
		 <ul class="toolBar">
		 		<my:validationAuthority url="msgwarn/del.do">
					<li><a class="delete" href="msgwarn/del.do?rel=${param.rel }_notread" target="selectedTodo" rel="ids" title="确定要删除吗?" ><span>批量删除</span></a></li>
				</my:validationAuthority>
			</ul>
		</div>
	<table class="table" width="1000" layoutH="156" rel="${param.rel }_notread">
		<thead>
			<tr>
				<th width="22" align="center" ><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th align="center">内容</th>
				<th width="150" align="center" orderField="msgTime"  class="${fromParam.orderDirection}" >发送时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.msgs }" varStatus="status">
				
				<tr target="id" rel="${m.id }" >
					<td ><input name="ids" value="${m.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td>
						<c:choose>
							<c:when test="${m.msgType==1}">
								<a href="msgwarn/show.do?id=${m.id }" target="navTab" rel="${param.rel}_show">
									您有新通知，请及时查看！
								</a>
							</c:when>
							<c:when test="${m.msgType==2}">
								<a href="msgwarn/show.do?id=${m.id }" target="navTab" rel="${param.rel}_show">
									您有新会议，请及时查看！
								</a>
							</c:when>
							<c:when test="${m.msgType==3}">
								<a href="msgwarn/show.do?id=${m.id }" target="navTab" rel="${param.rel}_show">
									有新发布的新闻，请及时查看！
								</a>
							</c:when>
							<c:when test="${m.msgType==4}">
								<a href="msgwarn/show.do?id=${m.id }" target="navTab" rel="${param.rel}_show">
									您有新共享日志，请及时查看！
								</a>
							</c:when>
							<c:otherwise>无此类型</c:otherwise>
						</c:choose>
					
					
					
					
					</td>
					
					<td >
						<fmt:formatDate value="${m.msgTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, '${param.rel }_notread')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination" rel="${param.rel }_notread"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>

	</div>
</div>					

