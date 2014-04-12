<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：新闻管理--新闻内容极评论显示的条数
--%>
<c:set var="allowcomment"  value="${param.allowcomment }"></c:set>
<c:set var="id"  value="${param.id }"></c:set>
<c:if test="${!empty  n.allowcomment}">
	<c:set var="allowcomment"  value="${n.allowcomment}"></c:set>
	<c:set var="id"  value="${n.id }"></c:set>
</c:if>
<c:choose>

<c:when test="${allowcomment==0}">
&nbsp;&nbsp;<a href="news/answer.do?id=${id}&rel=xwpl"   target="dialog" width="1000" height="500" rel="${param.rel}_anser" title="${applicationScope.userId2Name[pageScope.n.conmmentsnameId]}评论" ><span style="text-align:center">评论</span></a>(${requestScope.fromParam.allCount })  
 </c:when>
<c:otherwise>
 &nbsp;&nbsp;评论(${requestScope.fromParam.allCount })
</c:otherwise>
</c:choose>
       <form id="pagerForm"  onsubmit="return divSearch(this, 'xwpl');" action="news/contents.do" method="post">
   	    <%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
              <input type="hidden" name="id" value="${id}" >   
               <input type="hidden" name="allowcomment" value="${allowcomment}" > 
      </form>	
      
	    <table width="100%"  style="border:1px solid #EEF4F5;margin-top: 10px;" >
			 <c:forEach var="n" items="${news}">
		            <tr style="background:#FAFAFA;height:50px;">
		               <td style="border:1px solid #EEF4F5;line-height: 20px;">
		               &nbsp; &nbsp;&nbsp;&nbsp;
		               <c:choose>
		                 <c:when test="${!empty n.bycommentnameId}">
		                
		                  <span style="color:#1D53BF"><my:outTrueName id="${n.conmmentsnameId }"/></span> 回复   <span style="font-size:16px;"><my:outTrueName id="${n.bycommentnameId }"/></span>: <my:scriptEscape value="${n.newscomments}" />
		                 </c:when>
		                 <c:otherwise>
		                     <span style="color:#1D53BF"><my:outTrueName id="${n.conmmentsnameId }"/></span>: <my:scriptEscape value="${n.newscomments}" />
		                 </c:otherwise>
		               </c:choose>
		                <span style="color:#A8B6B6;margin-left: 10px;"><fmt:formatDate value="${n.conmmentsdate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
		                </td> 
		                <td style="border:1px solid #EEF4F5;width: 50px;">
		                 	<input type="hidden" name="navTabId" value="${param.rel}"/>
	                        <input type="hidden" name="callbackType" value="closeCurrent"/>	
	                        <a style="margin-left: 10px;color: #1D53BF" href="news/answer.do?id=${param.id}&conmmentsname=${n.conmmentsnameId}&rel=xwpl"   target="dialog" width="1000" height="500" rel="对${param.rel}_anser" title="回复：<my:outTrueName id="${n.conmmentsnameId }"/>" >回复</a>	               
		                   
		                </td>
		             </tr> 
		      </c:forEach>
	   </table>
        
	     <div class="panelBar">
					<div class="pages">
						<span>显示&nbsp;</span>
						<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, 'xwpl')"  sValue="${requestScope.fromParam.numPerPage}" >
							<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
						</select>
						<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
					</div>
					<div class="pagination" rel="xwpl"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>
				</div>  