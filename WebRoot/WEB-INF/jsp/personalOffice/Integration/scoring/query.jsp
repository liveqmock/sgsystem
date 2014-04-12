<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：排名--显示
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return divSearch(this,'${param.rel}');" action="scoringMonth/query.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 5px">
					<tr >
						<td><input type="hidden" name="type" value="${type}">
							员工姓名：
							<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询" >
								<input type="text"  class="clear_user " value="<my:outTrueName id="${param.smStaff }"/>" toName="user.name"  size="15" />
							</a>
							<input type="hidden" readonly="readonly" name="smStaff" value="${param.smStaff }" toName="user.id"  class="clear_user" />
						</td>
						
						<td>
							分值：<input type="text" name="smMinute" size="5" value="${param.smMinute }">
							<span class="limit">-</span>
							<input type="text" name="smMinute2" size="5" value="${param.smMinute2 }">
						</td>
						<td>
							打分月份：<input type="text"  readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy年MM月'})" size="13"  name="date" value="${param.date }" />
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
	
	<table class="table" width="880" layoutH="168" rel="${param.rel}">
		<thead>
			<tr>
				
				<th width="28" align="center">排名</th>
				<th width="100" align="center" >员工姓名</th>
				<th width="100" align="center">总积分</th>
				<th width="50"  align="center">打分月份</th>
			
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${values }" varStatus="status">
				
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
					
					<td title="<my:outTrueName id="${v.smStaff }"/>">
					<a href="scoringMonth/detail.do?id=${v.id }&year=${v.smYear}&month=${v.smDate}" target="navTab"  rel="${param.rel}_detail">
					<my:outTrueName id="${v.smStaff }"/>
					
					</a>
					</td>
					
					<td title="<c:out value="${v.smMinute }" />"><c:out value="${v.smMinute }" /></td>
					
					<td title="<c:out value="${v.smYear }年${v.smDate}月" />"><c:out value="${v.smYear }年${v.smDate}月" /></td>
					
					
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



	

