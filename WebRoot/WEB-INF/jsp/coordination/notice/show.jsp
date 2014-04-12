<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：协同办公--通知管理--详情
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<my:validationAuthority url="notice/show.do">
						<li><a href="javascript:;"><span>通知</span></a></li>
					</my:validationAuthority>
					<my:validationAuthority url="notice/download.do">
						<li><a href="javascript:;"><span>附件</span></a></li>
					</my:validationAuthority>
					<%--无notice/cyqk.do 请求，在此处只是为了验证权限	--%>
					<my:validationAuthority url="notice/cyqk.do">
						<li><a href="javascript:;"><span>查阅情况</span></a></li>
					</my:validationAuthority>
				</ul>
			</div>
		</div>
		<div class="tabsContent" >
			<my:validationAuthority url="notice/show.do">
				<div >
						<div  style="border:solid 1px #CCC;background:#fff;" layoutH="44" >
								
								<div class="div_titlebold" ><c:out value="${requestScope.n.noticeTitle}" /></div>
								<div class="div_sendUser">发送人：<my:outTrueName id="${requestScope.n.noticeSendId }"/> &nbsp;&nbsp;<fmt:formatDate value="${n.noticeCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" />	</div>	
								<div class="divider"></div>
									
								<div style="margin:10px;" >
									<my:scriptEscape value="${requestScope.nc.noticeContent}"/>
								</div>
						
						</div>
						
				</div>
			</my:validationAuthority>
			<my:validationAuthority url="notice/download.do">
				<div >
					<div  style="border:solid 1px #CCC;background:#fff;" layoutH="44" >
						
						<c:forEach  var="f"  items="${requestScope.nfs }" >
							
							<c:url var="url_download" value="notice/download.do" >
								<c:param name="newName" value="${f.fileNewName }" />
								<c:param name="name" value="${f.fileName}" />
								<c:param name="ext" value="${f.fileExt}" />
							</c:url>
							<div style="margin-top: 10px;margin-left: 20px;" ><a href="${url_download }" target="_blank">
									<img src="resource/images/icons/${f.fileExt }.gif" 
									onerror="javascript:this.src='resource/images/icons/page.gif'" align="top" />&nbsp;<c:out value="${f.fileName }"/>&nbsp;&nbsp;&nbsp;下载</a>
									 &nbsp;&nbsp;<my:fileSizeFormat value="${f.fileSize }"/>
									</dd>
							</div>
							<div class="divider"></div>
						</c:forEach>
											
							
					</div>
					
				</div>
			</my:validationAuthority>
			<my:validationAuthority url="notice/cyqk.do">
				<div>
					<div  style="border:solid 1px #CCC;background:#fff;" layoutH="44" >
						
						<table class="list" width="700" >
							<thead>
								<tr>
									<th  align="center">接收人员</th>
									<th width="170" >阅读状态(${requestScope.readNum }/${requestScope.allNum })</th>
									<th width="170" >阅读时间</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="nr" items="${requestScope.nrs }" >
									<tr>
										<td >
											<my:outTrueName id="${nr.userId }"/>
										</td>
										<td>
											<c:if test="${empty nr.readTime }">
												
												<img src="resource/images/email_close.gif" alt="未读"  style="margin-top: 3px;"/>
											</c:if>
											
										
										</td>
										<td >
											<fmt:formatDate value="${nr.readTime }" pattern="yyyy-MM-dd HH:mm:ss" />
										</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
		
				</div>
			</my:validationAuthority>
			
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>