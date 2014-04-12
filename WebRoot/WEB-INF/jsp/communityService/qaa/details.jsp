<%@ page language="java" import="java.util.*,com.jxoa.commons.model.Member" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：社区服务--居民答疑--问题详情
--%>
<form method="post" action="jmdy/saveAnswer.do"  class="pageForm " onsubmit="return validateCallback(this,dialogAjaxDone)">
<div class="pageContent" >
	<div class="pageFormContent nowrap" style="padding-left:10px;"  layoutH="56">
	        <dl>
				<dt>
					标题：
				</dt>
				<dd>
					<c:out value="${question.questionTitle}" />
				</dd>
			</dl>
			<dl>
		       <dt>
		                               类型：
		       </dt>
		       <dd>
		        <c:out value="${question.questionType }"></c:out>
		      </dd>
			</dl>
			<dl>
				<dt>
                                                发布时间：
				</dt>
				<dd>
					<fmt:formatDate value="${question.publishTime }" pattern="yyyy-MM-dd HH:mm:ss" />
				</dd>
			</dl>
			<dl>
				<dt>
                                                发布人：
				</dt>
				<dd>
					<my:outUserName id="${question.publisher }" />
				</dd>
			</dl>
			<dl>
				<dt>
                                               状态：
				</dt>
				<dd>
					<c:choose>
							<c:when test="${question.questionStatus==1}">
								<span style="line-height: 20px;color:green">已回复</span>
							</c:when>
							<c:otherwise>
								<span style="line-height: 20px;color:red">未回复</span>
							</c:otherwise>
						</c:choose>
				</dd>
			</dl>
			
			<br/><br/>
			<dl>
				<dt>
                                              回复人：
				</dt>
				<dd> <my:outUserName id="${question.responser}" />
				</dd>
			</dl>
			<dl>
				<dt>
                                              回复时间：
				</dt>
				<dd><fmt:formatDate value="${question.responseTime }" pattern="yyyy-MM-dd HH:mm:ss" />
				</dd>
			</dl>
			<dl>
			<dl>
			<dt>
                                               回复内容：
				</dt>
				<dd>
					<textarea  name="responseContent" class="required combox" cols="70" rows="5" maxlength="255" disabled >${question.responseContent}</textarea>
				</dd>
			</dl>
			<input type="hidden" name="questionTitle" value="${question.questionTitle }">
			<input type="hidden"  name="publishTime" value="<fmt:formatDate  value="${question.publishTime}" pattern="yyyy-MM-dd HH:mm:ss" />"  />
			<input type="hidden" name="questionType" value="${question.questionType}">
			<input type="hidden" name="publisher" value="${question.publisher}">
			<input type="hidden" name="questionStatus" value="${question.questionStatus}">
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			<input type="hidden" name="id" value="${question.id }"/>
			<input type="hidden" name="questionContent" value="${question.questionContent }"/>
			<input type="hidden" name="responseTime" value="${question.responseTime }"/>
			<input type="hidden" name="responser" value="${question.responser }"/>
		</div>
		
</div>
</form>