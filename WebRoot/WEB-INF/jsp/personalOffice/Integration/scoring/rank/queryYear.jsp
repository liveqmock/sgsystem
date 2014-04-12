<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：人员评分--显示
--%>
<div class="pageHeader">
	<form id="pagerForm"
		onsubmit="return divSearch(this,'${param.rel}_un');"
		action="scoringMonth/queryRankYear.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 100px">
					<tr >
						<td>
							大区名称：
							<a href="dept/lookUpPage.do?type=1" lookupGroup="user" title="用户查询" >
								<input type="text"  class="clear_user " value="<my:outDeptName id="${param.deptId }"/>" toName="user.name"  size="15" />
							</a>
							<input type="hidden" readonly="readonly" name="deptId" value="${param.deptId }" toName="user.id"  class="clear_user" />
						</td>
						
						<td>
							分值：<input type="text" name="minute" size="5" value="${param.minute }">
							<span class="limit">-</span>
							<input type="text" name="minute2" size="5" value="${param.minute2 }">
						</td>
						<td>
							打分年份：<input type="text"  readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy年'})" size="13"  name="date" value="${param.date }" />
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

			<my:validationAuthority url="detail/anti.do">
				<li>
<%--					<a class="delete" href="detail/anti.do?rel=${param.rel }_an"--%>
<%--						target="selectedTodo" rel="ids" title="确定要批量反审核吗?" warn="至少选择一条记录"><span>批量反审核</span>--%>
<%--					</a>--%>
				</li>
			</my:validationAuthority>

		</ul>
	</div>
	<table class="table" width="1105" layoutH="114" rel="${param.rel }_un">
		<thead>
			<tr>
				<th width="22" align="center">
					<input type="checkbox" group="ids" class="checkboxCtrl">
				</th>
				<th width="28" align="center" >
					排名
				</th>
				<th width="100" align="center" orderField="name"
					class="${fromParam.orderDirection}">
					大区名称
				</th>
				<th width="100" align="center" orderField="minute"
					class="${fromParam.orderDirection}">
					大区年度总分数
				</th>
				<th width="100" align="center" orderField="date"
					class="${fromParam.orderDirection}">
					打分年份
				</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${value }" varStatus="status">

				<tr>
					<td>
						<input name="ids" value="${v.deptId }" type="checkbox">
					</td>
					<td>
						${v.rank}
					</td>
					<td title="${v.name }">
						${v.name }
					</td>

					<td title="<c:out value="${v.minute }" />">
						<c:out value="${v.minute }" />
					</td>

					<td title="<c:out value="${v.date }" />">
						<c:out value="${v.date }" />
					</td>
				</tr>

			</c:forEach>

		</tbody>
	</table>


</div>





