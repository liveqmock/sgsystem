<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人文档管理--查找带回(单选)
--%>
<div class="pageHeader" >
	<form id="pagerForm" onsubmit="return dialogSearch(this);" action="personalFiles/lookUpPage.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden"  name="type" value="${param.type }"/>
		<input type="hidden" name="wdSuperId" value="${id }" />
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 10px">
				<tr >
					<td>
						文件名：<input type="text" name="wdName" value="<c:out value="${param.wdName }" />"/>
					</td>
					<td>上传时间：
						<input type="text"  readonly="readonly" class="date" name="startDate" value="${param.startDate }" />
						<span class="limit">-</span>
						<input type="text"  readonly="readonly" class="date" name="endDate" value="${param.endDate }" />
					</td>
					
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
					<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" >
	<div class="panelBar" style="height: 20px;" >
		<a href="personalFiles/lookUpPage.do?rel=${param.rel}" target="dialog" rel="${param.rel}" style="line-height: 18px;">个人文档</a>
		<c:forEach var="s" items="${superFiles }" >
			 >><a href="personalFiles/load.do?wdSuperId=${s.id }&rel=${param.rel}" target="dialog" rel="${param.rel}" style="line-height: 18px;"><c:out value="${s.wdName }" /></a>
		</c:forEach>
	</div>
	<table class="table" width="99%" layoutH="108" >
		<thead>
			<tr>
				<th >文件名</th>
				<th width="200" align="center" orderField="time"  class="${fromParam.orderDirection}">创建时间</th>
				<th  align="center">备注</th>
				<th width="60" align="center">带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="f" items="${requestScope.files }" >
				<tr >
					<c:choose>
						
						<c:when test="${f.wdType==0}">
							
							<td title="<c:out value="${f.wdName }" />"><a href="personalFiles/lookUpPage?wdSuperId=${f.id }&rel=${param.rel}" target="dialog" rel="${param.rel}" ><img src="${resVersion}/images/icons/folder_Close.gif" align="top"/>&nbsp;<c:out value="${f.wdName }" /></a></td>
							<td ><fmt:formatDate value="${f.wdCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td title="<c:out value="${f.wdDesc}" />"><c:out value="${f.wdDesc}" /></td>
							<td></td>
							
						</c:when>
						<c:otherwise>
							
							<td title="<c:out value="${f.wdName }" />"><a href="personalFiles/show?id=${f.id }" target="dialog" rel="${param.rel}_show" width="800" height="450" ><img src="${resVersion}/images/icons/${f.wdExt }.gif" onerror="javascript:this.src='${resVersion}/images/icons/page.gif'" align="top" />&nbsp;<c:out value="${f.wdName }" /></a></td>
							<td ><fmt:formatDate value="${f.wdCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>	
							<td title="<c:out value="${f.wdDesc}" />"><c:out value="${f.wdDesc}" /></td>
							
							<td>
								<a class="btnSelect" href="javascript:$.bringBack({id:'${f.id }', name:'${f.wdName }.${f.wdExt }'})" title="查找带回">选择</a>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_dialog.jsp" %>
	
</div>					
	

	

