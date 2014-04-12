<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--消息提醒 -- 查看
--%>

<div class="pageContent" >

		<div class="pageFormContent nowrap"  layoutH="25">
			
			<dl style="margin-top: 10px;">
				<dt>
					发送时间：
				</dt>
				<dd>
					<fmt:formatDate value="${msg.msgTime }" pattern="yyyy-MM-dd HH:mm:ss" />
				</dd>
			</dl>
			<dl>
				<dt>
					内容：
				</dt>
				<dd>
					<span style="font-weight: bold;">系统提醒您：</span>
					<c:choose>
						<c:when test="${msg.msgType==1}">
							<a href="notice/show.do?id=${msg.tableId }" target="navTab" >
								您有新通知，请点击我查看！
							</a>
						</c:when>
						<c:when test="${msg.msgType==2}">
							<a href="meeting/find.do?id=${msg.tableId }" target="navTab" >
								您有新会议，请点击我查看！
							</a>
						</c:when>
						<c:when test="${msg.msgType==3}">
							<a href="news/look.do?id=${msg.tableId }" target="navTab" >
								有最新新闻发布，请点击我查看！
							</a>
						</c:when>
						<c:when test="${msg.msgType==4}">
							<a href="journal/show.do?id=${msg.tableId }" target="navTab" >
								您有新共享日志，请点击我查看！
							</a>
						</c:when>
						<c:otherwise>无此类型</c:otherwise>
				
					</c:choose>
					
				</dd>
			</dl>



		</div>

</div>







