<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：人事管理--人员管理--在职员工
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel }_work');;" action="staff/work.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<input type="hidden" name="puGrouping" value="${param.peGrouping }"/>
			<div class="searchBar">
				<table class="searchContent" style="margin-left:20px">
					<tr >
						
						<td>
							姓名：<input type="text" name="psName" style="width: 90px" value="<c:out value="${param.psName }" />" />
						</td>
						
						<td>
							性别：</td><td>
							<select name="psSex" class="combox" sValue="${param.psSex }">
									<option value="">--请选择--</option>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
						</td>
						
						<td>
							籍贯：<input type="text" name="psHomeTown" style="width: 90px" value="<c:out value="${param.psHomeTown }" />" />
						</td>
						
						<td>入职日期：
								<input type="text"  readonly="readonly" style="width: 90px" onFocus="WdatePicker()"  name="staDate" value="${param.staDate }" />
								<span class="limit">-</span>
								<input type="text"  readonly="readonly" style="width: 90px" onFocus="WdatePicker()" name="endDate" value="${param.endDate }" />
						</td>
						
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><a class="button" href="staff/searchTag.do?search=work" width="800" height="400" target="dialog" mask="true" rel="${param.rel }" title="查询框"><span>高级检索</span></a></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
		<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
			<div class="panelBar">
				<ul class="toolBar">
					<li>
						<a class="add"
							href="staff/staffAdd.do?rel=${param.rel }" target="navTab" width="1000" height="500"
							rel="${param.rel}_add" ><span>添加员工</span>
						</a>
					</li>
					<li class="line">
						|
					</li>
					<li>
						<a class="edit" href="staff/updatePage.do?id={id}&rel=${param.rel}"  target="navTab"
							rel="${param.rel}_update" warn="请选择一条信息"><span>修改员工</span>
						</a>
					</li>
					<li class="line">
						|
					</li>
					<li>
						<a class="delete" href="staff/del.do?rel=${param.rel}_work" target="selectedTodo"
							rel="ids" title="确定要删除吗?" warn="至少选择一条信息"><span>批量删除</span>
						</a>
					</li>
					<li class="line">
						|
					</li>
					<li>
						<a class="edit" href="staff/updateStatusPage.do?id={id}&status=在职&rel=${param.rel}_work"  width="800" height="450"  target="dialog"
							rel="${param.rel}_work" warn="请选择一条信息"><span>更新状态</span>
						</a>
					</li>
				</ul>
			</div>
			<table class="table" width="1100" layoutH="154" rel="${param.rel }_work">
				<thead>
					<tr>
						<th width="27" align="center">
							<input type="checkbox" group="ids" class="checkboxCtrl">
						</th>
						<th  width="100" align="center" orderField="psStaffId"  class="${fromParam.orderDirection}">员工编号</th>
						<th  width="140" align="center">姓名</th>
						<th  width="70" align="center">性别</th>
						<th  width="70" align="center">年龄</th>
						<th  width="140" align="center" orderField="psEntryDate"  class="${fromParam.orderDirection}">入职时间</th>
						<th  width="342"  align="center">籍贯</th>
						<th  width="70"  align="center">状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="v" items="${values }">

						<tr target="id" rel="${v.id }">
							<td title="id：${v.id }">
								<input name="ids" value="${v.id }" type="checkbox">
							</td>
							<td title="${v.psStaffId}">
								<c:out
										value="${v.psStaffId}" />
							</td>
							<td title="${v.psName}">
							<a href="staff/find.do?id=${v.id }" target="navTab" rel="${param.rel}_find">
								<c:out value="${v.psName}" />
								</a>
							</td>

							<td title="${v.psSex}"><c:out value="${v.psSex}" /></td>
							<td title="${v.psAge}"><c:out value="${v.psAge}" /></td>
							<td
								title="<fmt:formatDate value="${v.psEntryDate}" pattern="yyyy-MM-dd" />">
								<fmt:formatDate value="${v.psEntryDate}"
									pattern="yyyy-MM-dd" />
							</td>

							
							<td title="${v.psHomeTown }"><c:out value="${v.psHomeTown}" /></td>
							<td title="${v.psStatus}"><c:out value="${v.psStatus}" /></td>

						</tr>

					</c:forEach>

				</tbody>
			</table>

			<div class="panelBar">
				<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, '${param.rel }_work')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination" rel="${param.rel }_work"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>


			</div>

		</div>




