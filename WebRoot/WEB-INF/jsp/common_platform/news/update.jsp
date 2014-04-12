<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公各平台--新闻管理更新页面
--%>
<form method="post" action="news/update.do"  class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
<div class="pageContent" >
	<div class="pageFormContent nowrap" style="padding-left:10px;"  layoutH="56">
	        <dl>
				<dt>
					标题：
				</dt>
				<dd>
					<input type="text" name="newstitle" class="required" maxlength="100" value="<c:out value="${news.newstitle}" />"  size="50" />
				</dd>
			</dl>
			<dl>
		       <dt>
		                               新闻类型:
		       </dt>
		       <dd>
		          <select class="combox required"   name="typeid" sValue="${requestScope.news.typeid }">>
		          	<option>全部类型</option>
		          	<my:outOptions type="3"/>
		          </select>
		      </dd>
			</dl>
			<dl>
				<dt>
                                                评论:
			</dt>
			<dd>
			<select class="combox"   name="allowcomment" sValue="${news.allowcomment}">
				<option value="0" >允许评论</option>
				<option value="1" >禁止评论</option>
			</select>
			</dd>
			</dl>
			<dl>
			<dt>
			置顶:
			</dt>
			<dd>
			<c:choose>
			<c:when test="${news.stick==1}">
			<input type="checkbox" name="Stick" checked="checked" value="1">使新闻置顶，显示为重要
			</c:when>
			<c:otherwise>
			<input type="checkbox"  name="Stick" value="1">使新闻置顶，显示为重要
			</c:otherwise>
			</c:choose>
			 </dd>
			</dl>
			<dl>
			<dt>
			新闻简介:
			</dt>
			<dd>
			<textarea rows="3" cols="50" name="plotsummary" ><c:out value="${news.plotsummary}" /></textarea>
			</dd>
			</dl>
			<dl>
			<dt>
			新闻内容:
			</dt>
			<dd>
			<textarea  name="newsplot" cols="100" rows="15" class="editor" value="" ><c:out value="${news.newsplot}" /></textarea>
			</dd>
			</dl>
			<input type="hidden" name="status" value="${news.status }">
			<input type="hidden"  name="createdtime" value="<fmt:formatDate  value="${requestScope.news.createdtime}" pattern="yyyy-MM-dd HH:mm:ss" />"  />
			<input type="hidden" name="hits" value="${news.hits}">
			<input type="hidden" name="contents" value="${news.contents}">
			<input type="hidden" name="promulgator" value="${news.promulgator}">
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			<input type="hidden" name="id" value="${requestScope.news.id }"/>
		</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改 </button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
</div>
</form>