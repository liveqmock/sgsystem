<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：排名--显示
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return divSearch(this,'${param.rel}');" action="scoringYear/query.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 5px">
					<tr >
						<td><input type="hidden" name="type" value="${type}">
							员工姓名：
							<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询" >
								<input type="text"  class="clear_user " value="<my:outTrueName id="${param.syStaff }"/>" toName="user.name"  size="15" />
							</a>
							<input type="hidden" readonly="readonly" name="syStaff" value="${param.syStaff }" toName="user.id"  class="clear_user" />
						</td>
						
						<td>
							分值：<input type="text" name="syMinute" size="5" value="${param.syMinute }">
							<span class="limit">-</span>
							<input type="text" name="syMinute2" size="5" value="${param.syMinute2 }">
						</td>
						<td>
							打分年份：<input type="text"  readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy'})" size="13"  name="syYear" value="${param.syYear }" />
						</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">	
  	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="detail/addYear.do">
				<li><a class="delete" href="detail/addYear.do" target="selectedTodo" rel="ids" title="确定要执行年度积分自动考核相吗?" ><span>执行年度积分自动考核</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="880" layoutH="194" rel="${param.rel}">
		<thead>
			<tr>
				<th width="28" align="center">年度排名</th>
				<th width="100" align="center" >员工姓名</th>
				<th width="100" align="center">年度总积分</th>
				<th width="50"  align="center">年度</th>
			
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${value }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
					<td>
					<c:choose>
							<c:when test="${ v.rank!=null }">
								${v.rank }
							</c:when>
							<c:otherwise>
								${status.count }
							</c:otherwise>
						</c:choose>
					
					</td>
					
					<td title="<my:outTrueName id="${v.syStaff }"/>">
					<a href="scoringYear/detail.do?id=${v.syStaff }&year=${v.syYear}" target="navTab" rel="${param.rel}">
					<my:outTrueName id="${v.syStaff }"/>
					</a>
					</td>
					
					<td title="<c:out value="${v.syMinute }" />"><c:out value="${v.syMinute }" /></td>
					
					<td title="<c:out value="${v.syYear}" />"><c:out value="${v.syYear}" /></td>
					
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
		<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, '${param.rel}')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination" rel="${param.rel}"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>
	
	</div>
	
</div>



	

