<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：文档管理--公司文档 --查询单个文件
--%>
				
<div class="pageContent" >					
				
	<div class="pageFormContent nowrap" style="border-bottom:1px #B8D0D6 solid;"  layoutH="25">
			<dl>
				<dt>文件：</dt>
				<dd>
					<img src="resource/images/icons/${requestScope.f.wdExt }.gif" onerror="javascript:this.src='resource/images/icons/page.gif'" align="top" />&nbsp;<c:out value="${requestScope.f.wdName }"/>.<c:out value="${requestScope.f.wdExt }"/>
					<my:validationAuthority url="companyFiles/download.do">	
						<c:url var="url_download" value="companyFiles/download.do" >
						<c:param name="newName" value="${requestScope.f.wdNewName }" />
						<c:param name="name" value="${requestScope.f.wdName}.${requestScope.f.wdExt}" />
						<c:param name="ext" value="${requestScope.f.wdExt}" />
					</c:url>
					<a  href="${url_download }" target="_blank" style="margin-left: 5px;color: blue;">立即下载</a></dd>
				</my:validationAuthority>
			</dl>
			<dl>
				<dt>大小：</dt>
				<dd><my:fileSizeFormat value="${requestScope.f.wdSize }"/></dd>
			</dl>
			<dl>
				<dt>上传日期：</dt>
				<dd>
					<fmt:formatDate value="${requestScope.f.wdCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" />
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<c:out value="${requestScope.f.wdDesc }"/>
				</dd>
			</dl>
			
		</div>
	

</div>	
					
		

	

