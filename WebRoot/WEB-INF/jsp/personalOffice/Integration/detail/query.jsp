<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：人员评分--显示
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return divSearch(this,'${param.rel}_un');" action="detail/query.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 5px">
					<tr >
						<td>
							员工姓名：
							<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询" >
						<input type="text"  class="clear_user " value="<my:outTrueName id="${param.deStaff }"/>" toName="user.name"  size="15" />
					</a>
					<input type="hidden" readonly="readonly" name="deStaff" value="${param.deStaff }" toName="user.id"  class="clear_user" />
							
						</td>
						<td>
							考核项分组：
						</td>
						<td>
						<select name="deGroup" class="combox"  sValue="${param.deGroup}">
									<option value="">--请选择--</option>
									<option value="1">销售人员考核项分组</option>
									<option value="2">大区经理考核项分组</option>
							    </select>
						</td>
						<td>
							考核项：<input type="text" name="deName" size="15" value="${param.deName }">
						</td>
						<td>
							分值：<input type="text" name="deMinute" size="5" value="${param.deMinute }">
							<span class="limit">-</span>
							<input type="text" name="deMinute2" size="5" value="${param.deMinute2 }">
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
			<my:validationAuthority url="detail/addPage.do">
				<li><a class="add" href="detail/addPage.do?rel=jfkh_rypf" target="navTab" rel="jfkh_rypf"><span>人员评分</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="detail/updatePage.do">
				<li><a class="edit" href="detail/updatePage.do?id={id}&rel=${param.rel}_un" target="dialog" width="800" height="400" rel="${param.rel}_update" warn="请先选择一个考核项"><span>修改评分</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="detail/del.do">
				<li><a class="delete" href="detail/del.do?rel=${param.rel }_un" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一个考核项"><span>删除评分</span></a></li>
			</my:validationAuthority>
			
			<my:validationAuthority url="detail/detail.do">
				<li><a class="edit" href="detail/detail.do?id={id}&rel=${param.rel}_un" target="dialog" width="800" height="400" rel="${param.rel}_detail" warn="请先选择一个考核项"><span>评分详情</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			
			<my:validationAuthority url="detail/status.do">
				<li><a class="delete" href="detail/status.do?status=1&rel=${param.rel }_un" target="selectedTodo" rel="ids" title="确定要批量审核吗?" warn="至少选择一条记录"><span>批量审核</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="detail/status.do">
				<li><a class="delete" href="detail/status.do?status=2&rel=${param.rel }_un" target="selectedTodo" rel="ids" title="确定要批量驳回吗?" warn="至少选择一条记录"><span>批量驳回</span></a></li>
			</my:validationAuthority>
			
		</ul>
	</div>
	<table class="table" width="1145" layoutH="154"  rel="${param.rel }_un" >
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="100" align="center" orderField="deStaff"  class="${fromParam.orderDirection}">员工姓名</th>
				<th width="100" align="center" orderField="deGroup"  class="${fromParam.orderDirection}">考核项分组</th>
				<th width="100" align="center" orderField="deName"  class="${fromParam.orderDirection}">考核项名称</th>
				<th width="28"  align="center" orderField="deMinute"  class="${fromParam.orderDirection}">分值</th>
				<th width="50"  align="center" orderField="deStatus"  class="${fromParam.orderDirection}">审核状态</th>
				<th width="100"  align="center" orderField="deDate"  class="${fromParam.orderDirection}">打分日期</th>
				<th width="50"  align="center" orderField="deUid"  class="${fromParam.orderDirection}">打分人</th>
				<th width="200"  align="center">打分说明</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${values }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
				<td ><input name="ids" value="${v.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title="<my:outTrueName id="${v.deStaff }"/>" >
					<a href="detail/detail.do?id=${v.id }&rel=${param.rel}_un" target="dialog" width="800" height="400" rel="${param.rel}_detail">
					<my:outTrueName id="${v.deStaff }"/>
					</a>
					</td>
					<td>
					
						<c:choose>
							<c:when test="${ v.deGroup=='1' }">
								销售人员考核项分组
							</c:when>
							<c:otherwise>
								大区经理考核项分组
							</c:otherwise>
						</c:choose>
					
					</td>
					<td title="<c:out value="${v.deName }" />">
						
						<c:out value="${v.deName }" />
						
					</td>
					
					<td title="<c:out value="${v.deMinute }" />"><c:out value="${v.deMinute }" /></td>
					<td >
					<c:if test="${ v.deStatus=='0' }">未审核</c:if>
					<c:if test="${ v.deStatus=='1' }">已审核</c:if>
					<c:if test="${ v.deStatus=='2' }">已驳回</c:if>
					</td>
					<td title="<c:out value="${v.deDate }" />">
					<fmt:formatDate value="${v.deDate }" pattern="yyyy-MM-dd hh:mm:ss" />
					</td>
					<td title="<my:outTrueName id="${v.deUid }"/>"><my:outTrueName id="${v.deUid }"/></td>
					<td title="<c:out value="${v.deRemark }" />"><c:out value="${v.deRemark }" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
		<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value},'${param.rel }_un')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination"  rel="${param.rel }_un"   totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>
	
	</div>
	
</div>



	

