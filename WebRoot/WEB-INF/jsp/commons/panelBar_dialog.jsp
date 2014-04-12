<%@ page pageEncoding="UTF-8"%>

<%--
	底部分页  dialog 分页 
	
--%>

<div class="panelBar">
	<div class="pages">
		<span>显示&nbsp;</span>
		<select class="combox"   name="numPerPage"  onchange="dialogPageBreak({numPerPage:this.value})"  sValue="${requestScope.fromParam.numPerPage}" >
			<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
		</select>
		<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
	</div>
	
	<div class="pagination" targetType="dialog"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>

</div>