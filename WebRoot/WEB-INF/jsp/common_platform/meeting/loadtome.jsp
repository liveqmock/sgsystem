<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--会议管理
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="meeting/loadtome.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 50px">
					<tr >
						<td>
							会议室：
<%--							<input type="text" name="roomName" value="<c:out value="${param.roomName }" />"/>--%>
						</td><td>
							<select class="combox" name="room.id"  sValue="${param.room.id}" >
								<option value="" >全部会议室</option>
									<c:forEach var="l" items="${requestScope.list}">
	
										<option value="${l.id }">
											${l.mrName }
										</option>
									
								</c:forEach>
							</select>
						</td>
						<td>
							会议标题：<input type="text" name="MName" value="<c:out value="${param.MName }" />"/>
						</td>
						<td>会议日期：
								<input type="text"  readonly="readonly" onFocus="WdatePicker()" size="13"  name="MDate" value="${param.MDate }" />
								<span class="limit">-</span>
								<input type="text"  readonly="readonly" onFocus="WdatePicker()" size="13" name="MDate2" value="${param.MDate2 }" />
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

	<table class="table" width="1100" layoutH="87">
		<thead>
			<tr>
				<th width="28" align="center">行号</th>
				<th width="140" align="center">会议类型</th>
				<th width="150" align="center">会议室</th>
				<th width="220" align="center">会议主题</th>
				<th width="90" align="center" orderField="MDate"  class="${fromParam.orderDirection}">会议日期</th>
				<th width="80" align="center">开始时间</th>
				<th width="80" align="center">结束时间</th>
				<th width="140" align="center">发布人</th>
				<th width="140" align="center" >发布时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${values }" varStatus="status">
				
				<tr >
				
					<td>${status.count }</td>
					<td>
						<my:outSelectValue id="${v.MType }"/>
					</td>
					<td>
						<c:forEach var="l" items="${requestScope.list}">
									<c:if test="${l.id ==v.room.id}">
										<c:out value="${l.mrName}" />
									</c:if>
						</c:forEach>
					</td>
					<td title="${v.MName }">
						<a href="meeting/find.do?id=${v.id }" target="navTab" rel="${param.rel}_find">
						<c:out value="${v.MName }" />
						</a>
					</td>
					
					<td title="${v.MDate}">
						<fmt:formatDate value="${v.MDate}" pattern="yyyy-MM-dd" />					
					</td>
					
					<td title="${v.MStatime }"><c:out value="${v.MStatime }" /></td>
					
					<td title="${v.MEndtime}"><c:out value="${v.MEndtime}" /></td>
					
					<td title="<my:outTrueName id="${v.MUid }"/>"><my:outTrueName id="${v.MUid }"/></td>
					<td title="${v.MPublished}"><c:out value="${v.MPublished}" /></td>
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>



	

