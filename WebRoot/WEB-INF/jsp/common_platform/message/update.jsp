<%@ page language="java" import="java.util.*,com.jxoa.commons.model.Member" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公各平台--新闻管理更新页面
--%>
<form method="post" action="message/update.do"  class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
<div class="pageContent" >
	<div class="pageFormContent nowrap" style="padding-left:10px;"  layoutH="56">
	        <dl>
				<dt>
					标题：
				</dt>
				<dd>
					<c:out value="${message.mestitle}" />
				</dd>
			</dl>
			<dl>
		       <dt>
		                               类型：
		       </dt>
		       <dd>
		         <my:outSelectValue id="${message.typeid }" />
		      </dd>
			</dl>
			<dl>
				<dt>
                                                发布时间：
				</dt>
				<dd>
					<c:out value="${message.createdtime}" />
				</dd>
			</dl>
			<dl>
				<dt>
                                                发布人：
				</dt>
				<dd>
					<my:outUserName id="${message.promulgator }" />
				</dd>
			</dl>
			<dl>
				<dt>
                                               状态：
				</dt>
				<dd>
					<c:choose>
							<c:when test="${message.status==1}">
								<span style="line-height: 20px;color:green">已回复</span>
							</c:when>
							<c:otherwise>
								<span style="line-height: 20px;color:red">未回复</span>
							</c:otherwise>
						</c:choose>
				</dd>
			</dl>
			<dl>
				<dt>
                                              留言内容：
				</dt>
				<dd><c:out value="${message.mesplot}" />
				</dd>
			</dl>
			<br/><br/>
			<dl>
				<dt>
                                              回复人：
				</dt>
				<dd> <my:outUserName id="${message.replypep }" />
				</dd>
			</dl>
			<dl>
				<dt>
                                              回复时间：
				</dt>
				<dd><c:out value="${message.replydatetime}" />
				</dd>
			</dl>
			<dl>
			<dl>
			<dt>
                                               回复内容：
				</dt>
				<dd>
					<textarea  name="replycontent" class="required combox" cols="70" rows="5" maxlength="255" <c:if test="${message.status=='1'}">disabled</c:if> >${message.replycontent}</textarea>
				</dd>
			</dl>
			<input type="hidden" name="mestitle" value="${message.mestitle }">
			<input type="hidden"  name="createdtime" value="<fmt:formatDate  value="${message.createdtime}" pattern="yyyy-MM-dd HH:mm:ss" />"  />
			<input type="hidden" name="typeid" value="${message.typeid}">
			<input type="hidden" name="promulgator" value="${message.promulgator}">
			<input type="hidden" name="status" value="${message.status}">
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			<input type="hidden" name="id" value="${message.id }"/>
			<input type="hidden" name="mesplot" value="${message.mesplot }"/>
			<input type="hidden" name="replydatetime" value="${message.replydatetime }"/>
			<input type="hidden" name="replypep" value="${message.replypep }"/>
		</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" <c:if test="${message.status=='1'}">disabled</c:if> >提交 </button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
</div>
</form>