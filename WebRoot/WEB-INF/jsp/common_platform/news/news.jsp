<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--个人办公--新闻
	模块
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this)" action="news/load_news.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 100px">
					<tr >
						<td>
							标题：<input type="text" name="newstitle"  value="<c:out value="${param.newstitle }" />"/>
						</td>
						<td>
						      <select class="combox"   name="typeid" sValue="${param.typeid}" >
			                    <option value="">全部类型</option>
			          	       	<my:outOptions type="3"/>
			                 </select>
						</td>
						<td>发布时间：
								<input type="text"  readonly="readonly" size="13" onFocus="WdatePicker()" name="startDate" value="${param.startDate }" />
								<span class="limit">-</span>
								<input type="text"  readonly="readonly" size="13" onFocus="WdatePicker()" name="endDate" value="${param.endDate }" />
						</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset_notice_loadme">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" width="1100" layoutH="88">
		<thead>
			<tr>
				<th width="28" align="center">行号</th>
				<th width="100" align="center" >新闻类型</th>
				<th   align="center" >标题</th>
				<th  width="60" align="center"  orderField="hits"  class="${fromParam.orderDirection}">点击数</th>
				<th  width="60"  align="center"  orderField="contents"  class="${fromParam.orderDirection}">评论(条)</th>
				<th  width="140" align="center" >发布人</th>
				<th  width="150"  align="center" orderField="createdtime"  class="${fromParam.orderDirection}" >发布时间</th>
			</tr>
		</thead>

	<tbody>
			<c:forEach var="n" items="${news }" varStatus="status" >
				<tr >
					<td>${status.count }</td>
					<td ><my:outSelectValue id="${n.typeid }"/></td>
					<td title="<c:out value="${n.newstitle}"></c:out>" >
						<a  href="news/look.do?id=${n.id}&rel=${param.rel}_look" target="navTab" rel="${param.rel}_look">
						<c:choose>
						    <c:when test="${n.stick==1 }">
						       <img style="margin-top: 3px;" src="resource/images/arrow_up.gif"> <c:out value="${n.newstitle}"></c:out>
						    </c:when>
						    <c:otherwise>
						    	 <c:out value="${n.newstitle}"></c:out>
						    </c:otherwise>
						</c:choose>
						</a>
					</td>
					
					
					<td title="${n.hits}"><c:out value="${n.hits}"></c:out> </td>
					<td title="${n.contents}"><c:out value="${n.contents}"></c:out> </td>
					<td title="<my:outTrueName id="${n.promulgator }"/>"><my:outTrueName id="${n.promulgator }"/></td>
					<td ><fmt:formatDate value="${n.createdtime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>
		</tbody>
			</table>
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>
