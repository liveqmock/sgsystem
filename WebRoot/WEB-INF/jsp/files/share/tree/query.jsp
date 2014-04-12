<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：共享文档管理--树状模式查询
--%>
<div class="pageHeader" style="border:1px #B8D0D6 solid;" >
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}');" action="shareFiles/tree/query.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden" name="wdSuperId" value="${param.wdSuperId }"/>
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 50px">
				<tr >
					<td>
						文件名：<input type="text" name="wdName" value="<c:out value="${param.wdName }" />"/>
					</td>
					<td>上传时间：
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
		 		
				<my:validationAuthority url="shareFiles/addFilePage.do">
					<li><a class="add" href="shareFiles/addFilePage.do?id=${param.wdSuperId }&rel=${param.rel}&reType=rel" target="dialog" width="800" height="300" rel="${param.rel}_addnode"><span>创建文件</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="shareFiles/updatePage.do">
					<li><a class="edit" href="shareFiles/updatePage.do?id={id}&rel=${param.rel}&reType=rel" target="dialog" width="800" height="300" rel="${param.rel}_update" warn="请先选择文件或文件夹！"><span>修改</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="shareFiles/delFile.do">
					<li><a class="delete" href="shareFiles/delFile.do?rel=${param.rel}" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一个文件"><span>批量删除文件</span></a></li>
				</my:validationAuthority>
			</ul>
		</div>
	<table class="table" width="800" layoutH="160" rel="${param.rel}">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl" /></th>
				<th >文件名</th>
				<th width="150" align="center" orderField="wdCreateTime"  class="${fromParam.orderDirection}">创建时间</th>
				<th width="140" align="center" >创建人</th>
				<th width="250"  align="center">备注</th>
				<th  width="100" >操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.files }" >
					
				<tr target="id" rel="${m.id }">
						
						<td><input name="ids" value="${m.id }" type="checkbox" /></td>
						<td title="<c:out value="${m.wdName }" />">
							<a href="shareFiles/show.do?id=${m.id }" target="dialog" rel="${param.rel }_show" width="800" height="300" >
							<img src="resource/images/icons/${m.wdExt }.gif" onerror="javascript:this.src='resource/images/icons/page.gif'" align="top" />&nbsp;<c:out value="${m.wdName }" /></a>
						</td>
						<td ><fmt:formatDate value="${m.wdCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>	
						<td ><my:outTrueName id="${m.wdUserId }"/></td>
						<td title="<c:out value="${m.wdDesc}" />"><c:out value="${m.wdDesc}" /></td>
						<td>
							<my:validationAuthority url="shareFiles/download.do">
								<c:url var="url_download" value="shareFiles/download.do" >
									<c:param name="newName" value="${m.wdNewName }" />
									<c:param name="name" value="${m.wdName}.${m.wdExt}" />
									<c:param name="ext" value="${m.wdExt}" />
								</c:url>
								<a class="btnAttach" href="${url_download }" target="_blank" title="下载文件"></a>
							</my:validationAuthority>
							<my:validationAuthority url="shareFiles/updatePage.do">
								<a class="btnEdit" href="shareFiles/updatePage.do?id=${m.id}&rel=${param.rel}&reType=rel" target="dialog" width="800" height="300" rel="${param.rel}_update" >修改</a></li>
							</my:validationAuthority>
							<my:validationAuthority url="shareFiles/delFile.do">
								<a class="btnDel" href="shareFiles/delFile.do?ids=${m.id }&rel=${param.rel}" target="ajaxTodo"  title="确定要删除文件吗?" >删除文件</a>
							</my:validationAuthority>
						</td>
							
						
					</tr>
					
				</c:forEach>
			
		</tbody>
	</table>
	
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab_div.jsp" %>
	
	
</div>					

