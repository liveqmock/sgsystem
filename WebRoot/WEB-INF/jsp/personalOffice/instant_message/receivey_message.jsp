<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--即时消息--已收消息
--%>
<div class="pageHeader" style="border:1px #B8D0D6 solid;">
	<c:choose>
		<c:when test="${empty param.type}">
			<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}_receiveMessage');" action="instantMessage/selectReceiveMessage.do" method="get">
		</c:when>
		<c:otherwise>
			<form id="pagerForm" onsubmit="return navTabSearch(this);" action="instantMessage/selectReceiveMessage.do" method="get">
		</c:otherwise>
	</c:choose>
	
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input name="type" type="hidden" value="${param.type }"/>
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 50px">
				<tr >
					<td>
						发件人：
						<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询">
							<input type="text" name="userName" value="${param.userName }"  readonly="readonly" size="20" toName="user.name"/>
						</a>
						<input type="hidden"  name="sendUid" class="clear_user" toName="user.id"  value="${param.sendUid }" />
					</td>
					<td>
						<select class="combox"   name="readState"  sValue="${param.readState}" >
							<option value="">全部</option>
							<option value="0">未读</option>
							<option value="1">已读</option>
						</select>
					</td>
					<td>发送时间：
							<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="startDate" value="${param.startDate }" />
							<span class="limit">-</span>
							<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="endDate" value="${param.endDate }" />
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
					<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset" resetClass="clear_user">重置</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
	<div class="panelBar">
		 <ul class="toolBar">
		 	<my:validationAuthority url="instantMessage/del.do">	
			  <li><a class="delete" href="instantMessage/del.do?rel=${param.rel}_receiveMessage" target="selectedTodo" rel="ids" title="确定要删除吗?" ><span>批量删除</span></a></li>
			</my:validationAuthority>
		 </ul>
	</div>
	<c:choose>
		<c:when test="${empty param.type}">
			 <table class="table" width="1050" layoutH="155" rel="${param.rel}_receiveMessage">
		</c:when>
		<c:otherwise>
			<table class="table" width="1050" layoutH="115" >
		</c:otherwise>
	</c:choose>
		<thead>
			<tr>
				<th width="22" align="center" ><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="25" align="center">状态</th>
				<th width="140" >发件人</th>
				<th width="120"  align="center" orderField="createTime"  class="${fromParam.orderDirection}" >时间</th>
				<th width="300"  align="center">信息</th>
				<my:validationAuthority url="instantMessage/add.do">
					<th width="30" align="center">回复</th>
				</my:validationAuthority>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.msgs }" varStatus="status">
				
				<tr>
					<td ><input name="ids" value="${m.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td>
						<c:choose>
							<c:when test="${m.readState==0 }">
								 <img src="resource/images/email_close.gif" alt="未读"  style="margin-top: 3px;"/>
							</c:when>
							<c:otherwise>
								<img src="resource/images/email_open.gif" alt="已读" style="margin-top: 3px;"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<my:outTrueName id="${m.sendUid}"/>
					</td>	
					<td>
						<fmt:formatDate value="${m.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
						
					<td >
						<a href="instantMessage/show.do?id=${m.id }&type=1&rel=${param.rel}_show" target="navTab"  rel="${param.rel}_show" title="信息查看">
							<my:scriptEscape value="${m.messageContent}" />
						</a>
					</td>
					<my:validationAuthority url="instantMessage/add.do">
					<td>
						<a href="instantMessage/addPage.do?userId=${m.sendUid }&rel=${param.rel}_add" target="navTab" rel="${param.rel}_add" title="回复消息">
							<img src="resource/images/reply.gif" alt="回复消息" title="回复消息" style="margin-top: 3px;"/>
						</a>
					</td>
					</my:validationAuthority>
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	<c:choose>
		<c:when test="${empty param.type}">
			 <div class="panelBar">
				<div class="pages">
					<span>显示&nbsp;</span>
					<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, '${param.rel}_receiveMessage')"  sValue="${requestScope.fromParam.numPerPage}" >
						<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
					</select>
					<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
				</div>
				
				<div class="pagination" rel="${param.rel}_receiveMessage"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>
			
			</div>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
		</c:otherwise>
	</c:choose>
	
</div>					

