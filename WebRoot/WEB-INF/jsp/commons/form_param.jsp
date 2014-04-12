<%@ page pageEncoding="UTF-8"%>

<%--
	表单查询公共参数
--%>
<input type="hidden" name="pageNum" value="${requestScope.formParam.pageNum }" />
<input type="hidden" name="numPerPage" value="${requestScope.fromParam.numPerPage}" />
<input type="hidden" name="orderField" value="${requestScope.fromParam.orderField}" />
<input type="hidden" name="orderDirection" value="${requestScope.fromParam.orderDirection}" />
<input type="hidden" name="pageNumShown" value="${requestScope.fromParam.pageNumShown}" />

<input type="hidden" name="rel" value="${param.rel }" />