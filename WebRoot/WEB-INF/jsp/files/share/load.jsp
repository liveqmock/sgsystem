<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：共享文档管理
--%>
<div class="pageContent" style="padding:1px">
		
	<div class="pageHeader">
		<form id="pagerForm" onsubmit="return navTabSearch(this);" action="shareFiles/load.do" method="get">
			<div class="searchBar">
				<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
				
				<input type="hidden" name="wdSuperId" value="${id }" />
				<div class="searchBar">
					<table class="searchContent" style="margin-left: 10px">
						<tr >
							<td>
							
								<a class="button" href="shareFiles/tree/load.do?rel=${param.rel}" target="navTab" rel="${param.rel }" title="共享文档--树状模式"><span>树状模式</span></a>
								
							</td>
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
			</div>
		</form>
  </div>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<my:validationAuthority url="shareFiles/addNodePage.do">	
					<li><a class="add" href="shareFiles/addNodePage.do?id=${id }&rel=${param.rel}" target="dialog" width="500" height="250" rel="${param.rel}_addfile"><span>创建文件夹</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="shareFiles/addFilePage.do">	
					<li><a class="add" href="shareFiles/addFilePage.do?id=${id }&rel=${param.rel}&reType=navTabId" target="dialog" width="800" height="300" rel="${param.rel}_addnode"><span>创建文件</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="shareFiles/updatePage.do">	
					<li><a class="edit" href="shareFiles/updatePage.do?id={id}&rel=${param.rel}&reType=navTabId" target="dialog" width="800" height="300" rel="${param.rel}_update" warn="请先选择文件或文件夹！"><span>修改</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="shareFiles/delFile.do">	
					<li><a class="delete" href="shareFiles/delFile.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一个文件"><span>批量删除文件</span></a></li>
				</my:validationAuthority>	
			</ul>
		</div>
		<div class="panelBar" style="border-top: none;height: 20px;">
				<a href="shareFiles/load.do?rel=${param.rel}" target="navTab" rel="${param.rel}" style="line-height: 18px;">共享文档</a>
				<c:forEach var="s" items="${superFiles }" >
					 >><a href="shareFiles/load.do?wdSuperId=${s.id }&rel=${param.rel}" target="navTab" rel="${param.rel}" style="line-height: 18px;"><c:out value="${s.wdName }" /></a>
				</c:forEach>
		</div>
		<table class="table" width="1100" layoutH="137">
			<thead>
				<tr>
					<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl" /></th>
					<th >文件名</th>
					<th width="150" align="center" orderField="wdCreateTime"  class="${fromParam.orderDirection}">创建时间</th>
					<th width="140" align="center" >创建人</th>
					<th width="250" align="center">备注</th>
					<th  width="100" align="center">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${requestScope.files }" >
					
					<tr target="id" rel="${m.id }">
						<c:choose>
							<c:when test="${m.wdType==0}">
								<td><input name="ids" value="${m.id }" type="checkbox" disabled="disabled"></td>
								<td title="<c:out value="${m.wdName }" />"><a href="shareFiles/load.do?wdSuperId=${m.id }&rel=${param.rel}" target="navTab" rel="${param.rel}" ><img src="resource/images/icons/folder_share.gif" align="top"/>&nbsp;<c:out value="${m.wdName }" /></a></td>
								<td ><fmt:formatDate value="${m.wdCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td ><my:outTrueName id="${m.wdUserId }"/></td>
								<td title="<c:out value="${m.wdDesc}" />"><c:out value="${m.wdDesc}" /></td>
								<td>
									<my:validationAuthority url="shareFiles/updatePage.do">	
										<a class="btnEdit" href="shareFiles/updatePage.do?id=${m.id}&rel=${param.rel}" target="dialog" width="800" height="300" rel="${param.rel}_update" >修改</a></li>
									</my:validationAuthority>
									<my:validationAuthority url="shareFiles/delNode.do">	
										<a class="btnDel" href="shareFiles/delNode.do?id=${m.id }" target="ajaxTodo"  title="确定要删除文件吗?<br/>只能删除空文件夹，如果文件夹不为空，请先清空文件夹内文件！" >删除</a>
									</my:validationAuthority>
								</td>
								
							</c:when>
							<c:otherwise>
								<td><input name="ids" value="${m.id }" type="checkbox" /></td>
								<td title="<c:out value="${m.wdName }" />">
									<a href="shareFiles/show.do?id=${m.id }" target="dialog" rel="${param.rel}_show" width="800" height="450" >
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
										<a class="btnEdit" href="shareFiles/updatePage.do?id=${m.id}&rel=${param.rel}&reType=navTabId" target="dialog" width="800" height="300" rel="${param.rel}_update" >修改</a></li>
									</my:validationAuthority>
									<my:validationAuthority url="shareFiles/delFile.do">	
										<a class="btnDel" href="shareFiles/delFile.do?ids=${m.id }" target="ajaxTodo"  title="确定要删除文件吗?" >删除文件</a>
									</my:validationAuthority>
								</td>
								
							</c:otherwise>
						</c:choose>
						
					</tr>
					
				</c:forEach>
				
			</tbody>
		</table>
		
		<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
		
	</div>




</div>
			



	

