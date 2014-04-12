<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：社区服务--居民论坛--帖子列表
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="forum/load.do" method="post">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 50px">
					<tr >
						<td>
							标题：<input type="text" name="subject" value="<c:out value="${param.subject }" />"/>
						</td>
						
						<td>发布人：
							<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询" >
								<input type="text" name="username" value="${param.username }"  readonly="readonly" size="20" toName="user.username"/>
							</a>
							<input type="hidden"  name="id" class="clear_user" toName="user.id"  value="${param.id }" />
						</td>
						<td>发布时间：
								<input type="text" size="12" readonly="readonly" onFocus="WdatePicker()" name="startDate" value="${param.startDate }" />
								<span class="limit">-</span>
								<input type="text" size="12" readonly="readonly" onFocus="WdatePicker()" name="endDate" value="${param.endDate }" />
						</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset" resetClass="clear_user">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="forum/add.do">
				<li><a class="add" href="forum/add.do?rel=${param.rel }" target="navTab" rel="${param.rel}_add"><span>发表新帖</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="forum/delete.do">
				<li><a class="delete" href="forum/delete.do" target="selectedTodo" rel="ids" title="确定要删除吗?" ><span>批量删除</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="forum/details.do">
				<li><a class="edit" href="forum/details.do?id={id}&rel=${param.rel}&bz=0" target="dialog" width="750" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>查看详情</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th  align="center">标题</th>
				<th width="140"  align="center">用户</th>
				<th width="150"  align="center" orderField="publishTime"  class="${fromParam.orderDirection}">发表时间</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tbforum" items="${requestScope.tbForums }" varStatus="status">
				
				<tr target="id" rel="${tbforum.id }">
				
					<td ><input name="ids" value="${tbforum.id }" type="checkbox"></td>
					<td>${status.count }</td>
					
					<td title="${tbforum.subject }">	
						<a href="forum/details.do?id=${tbforum.id }" target="navTab" rel="${param.rel}_show">
							<c:if test="${tbforum.isTop==1}"><img src="resource/images/arrow_up.gif"  style="margin-top: 3px;"/></c:if>
							<c:out value="${tbforum.subject }" /></a>
					</td>
					<td ><my:outTrueName id="${tbforum.username }"/></td>
					<td >
						<fmt:formatDate value="${tbforum.publishTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>