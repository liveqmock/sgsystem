<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：新闻管理--新闻回复评论
--%>
<form method="post" action="news/answernewscomment.do"  class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent" >
		
		<div class="pageFormContent nowrap" style="padding-left: 40px;" layoutH="58">
			<div style="margin-top: 20px;">
	                <textarea rows="10" cols="100" name="newscomments" class="editor" ></textarea>
	         </div>
                   <input type="hidden"  name="newsid" value=" ${param.id}">
                   <input type="hidden" name="bycommentnameId" value="${param.conmmentsname}">
               		<input type="hidden" name="rel" value="${param.rel}"/>
                      <input type="hidden" name="callbackType" value="closeCurrent"/>
           </div>			
		<div class="formBar">
                    <ul style="float: left;margin-left: 30%;">
	                <li><div class="buttonActive"><div class="buttonContent"><button type="submit">评论</button></div></div></li>
	                <li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
	                <li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
                    </ul>
        </div>
</form>