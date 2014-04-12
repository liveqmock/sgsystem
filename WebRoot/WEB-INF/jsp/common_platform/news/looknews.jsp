<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：新闻管理--新闻内容极评论-详情
--%>
	
<div class="pageContent" layoutH="2">
			
	<div class="div_titlebold" ><c:out value="${requestScope.n.newstitle}" /></div>
	<div class="div_sendUser">发布人：<my:outTrueName id="${requestScope.n.promulgator}"/>&nbsp;&nbsp;<fmt:formatDate value="${n.createdtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>	
	<div class="divider"></div>
	<div style="margin:10px;background:#fff"><my:scriptEscape value="${n.newsplot}"/></div>
	<div class="divider"></div>
    
	<div id="xwpl" class="unitBox" > 
	
             <%@ include file="/WEB-INF/jsp/common_platform/news/contents.jsp" %> 
          
    </div>
	     
			
 </div>