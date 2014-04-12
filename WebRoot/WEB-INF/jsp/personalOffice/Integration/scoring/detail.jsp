<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：积分详情
--%>

<div class="pageContent">
		<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="scoringMonth/export.do">
				<li><a class="icon" href="scoringMonth/export.do?id=${id }&year=${year}&month=${month}" target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
<%--			<my:validationAuthority url="scoringMonth/sms.do">--%>
<%--				<li><a class="icon" href="scoringMonth/sms.do?id=${id }&year=${year}&month=${month}" target="dwzExport" targetType="navTab" title="确实要发送短信吗?"><span>短信发送</span></a></li>--%>
<%--			</my:validationAuthority>--%>
		</ul>
	</div>
	<table class="table" width="1165" layoutH="52"   >
		<thead>
			<tr>
				<th width="28" align="center">行号</th>
				<th width="100" align="center">员工姓名</th>
				<th width="100" align="center">考核项分组</th>
				<th width="100" align="center">打分项名称</th>
				<th width="28"  align="center">分值</th>
				<th width="50"  align="center" >审核状态</th>
				<th width="100"  align="center">打分日期</th>
				<th width="50"  align="center" >打分人</th>
				<th width="50"  align="center" >审核人</th>
				<th width="100"  align="center" >审核日期</th>
				<th width="200"  align="center">打分说明</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${value }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
				
					<td>${status.count }</td>
					<td title="<my:outTrueName id="${v.deStaff }"/>" ><my:outTrueName id="${v.deStaff }"/></td>
					<td>
					
						<c:choose>
							<c:when test="${ v.deGroup=='1' }">
<%--								 <img src="resource/images/email_close.gif" alt="未读"  style="margin-top: 3px;"/>--%>
								销售人员考核项分组
							</c:when>
							<c:otherwise>
<%--								<img src="resource/images/email_open.gif" alt="已读" style="margin-top: 3px;"/>--%>
								大区经理考核项分组
							</c:otherwise>
						</c:choose>
					
					</td>
					<td title="<c:out value="${v.deName }" />"><c:out value="${v.deName }" /></td>
					
					<td title="<c:out value="${v.deMinute }" />"><c:out value="${v.deMinute }" /></td>
					<td >
					<c:if test="${ v.deStatus=='0' }">未审核</c:if>
					<c:if test="${ v.deStatus=='1' }">已审核</c:if>
					<c:if test="${ v.deStatus=='2' }">已驳回</c:if>
					</td>
					<td title="<c:out value="${v.deDate }" />"><c:out value="${v.deDate }" /></td>
					<td title="<my:outTrueName id="${v.deUid }"/>"><my:outTrueName id="${v.deUid }"/></td>
					<td title="<my:outTrueName id="${v.deCheck }"/>"><my:outTrueName id="${v.deCheck }"/></td>
					<td title="<c:out value="${v.deChdate}" />"><c:out value="${v.deChdate}" /></td>
					<td title="<c:out value="${v.deRemark }" />"><c:out value="${v.deRemark }" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
		<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value})"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>
	
	</div>
	
</div>



	

