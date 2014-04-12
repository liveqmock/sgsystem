<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-内部邮件-回复邮件
--%>

<div class="pageContent" >
			
<form method="post" action="email/addIn.do" enctype="multipart/form-data"  onsubmit="return iframeCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="56">
			
			<dl>
				<dt>发件人：</dt>
				<dd>
					<my:outTrueName id="${email.emInbox.eiUid }"/>
				</dd>
			</dl>
			<dl>
				<dt>发件时间：</dt>
				<dd>
					<fmt:formatDate value="${email.emInbox.eiDate}" pattern="yyyy-MM-dd HH:mm:ss" />
				</dd>
			</dl>
			<dl>
				<dt>标题：</dt>
				<dd >
					<c:out value="${email.emInbox.eiName }"/>
				</dd>
			</dl>
			<c:if test="${size>0}">
				<dl>
					<dt>附件：</dt>
					
				
					<dd>
						
						<c:forEach  var="f"  items="${requestScope.emFile }" >
							
							<c:url var="url_download" value="email/download.do" >
								<c:param name="newName" value="${f.efNewName }" />
								<c:param name="name" value="${f.efName}" />
								<c:param name="ext" value="${f.efExt}" />
							</c:url>
								<div style="margin-top: 5px;margin-left: 10px;" >
									<img src="resource/images/icons/${f.efExt }.gif" onerror="javascript:this.src='resource/images/icons/page.gif'" align="middle" />
									<a href="${url_download }" target="_blank">
									
									<c:out value="${f.efName }"/></a>
								</div>
							
							</c:forEach>
					</dd>
				</dl>
			</c:if>
			<div class="divider"></div>
			<div >
				<my:scriptEscape value="${email.emInbox.eiDetail }"/>
			</div>
			<input type="hidden" name="id" value="${email.emInbox.id}"/>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		
	</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><a class="buttonActive" href="email/addPageIn.do?id=${email.emInbox.id}" target="navTab" rel="${param.rel}_find"><span>回复</span></a></li>
				<li><a class="buttonActive" href="email/forwardIn.do?id=${email.emInbox.id}" target="navTab" rel="${param.rel}_find"><span>转发</span></a></li>
			</ul>
		</div>
	
</form>
</div>
										
						
					
		

	

