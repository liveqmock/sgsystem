<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-通讯录-个人通讯录
--%>
<div class="pageHeader" style="border:1px #B8D0D6 solid;">
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}_box');" action="personal/queryGroup.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<input type="hidden" name="peGrouping" value="${param.peGrouping }"/>
			<div class="searchBar">
				<table class="searchContent" style="margin-left:1px">
					<tr >
						
						<td>
							姓名：<input type="text" name="peName" style="width: 90px" value="<c:out value="${param.peName }" />" />
						</td>
						<td>
							单位名称：<input type="text" name="peCompany" style="width: 90px" value="<c:out value="${param.peCompany }" />"/>
						</td>
						<td>
							移动电话：<input type="text" name="pePhone" style="width: 90px" value="<c:out value="${param.pePhone }" />"/>
						</td>
						<td>
							办公电话：<input type="text" name="peOfficPhone" style="width: 90px" value="<c:out value="${param.peOfficPhone }" />"/>
						</td>
						
						
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
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
			<my:validationAuthority url="personal/addPage.do">
				<li><a class="add" href="personal/addPage.do?rel=${param.rel }_box" target="dialog" width="1000" height="500" rel="${param.rel}_add"><span>新增人员</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="personal/updatePage.do">
				<li><a class="edit" href="personal/updatePage.do?id={id}&rel=${param.rel}_box" target="dialog"  width="1000" height="500" rel="${param.rel}_update" warn="请先选择一 条信息"><span>修改人员</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="personal/del.do">
				<li><a class="delete" href="personal/del.do?rel=${param.rel }_box" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一条信息"><span>批量删除</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="group/load.do">	
				<li><a class="edit" href="group/load.do?rel=${param.rel }_group" target="navTab" rel="${param.rel }_group" ><span>个人通讯录分组维护</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="950" layoutH="160" rel="${param.rel}_box" >
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="140" align="center">姓名</th>
				<th width="28"  align="center">性别</th>
				<th width="100" align="center">所属分组</th>
				<th  align="center">单位名称</th>
				<th width="80" align="center">职位</th>
				<th width="120" align="center">移动电话</th>
				<th width="120" align="center">办公电话</th>
				
				<th width="150" align="center">电子邮件</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${requestScope.values }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
				
					<td ><input name="ids" value="${v.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title="<c:out value="${v.peName }" />">
						<a href="personal/find.do?id=${v.id }" target="navTab" rel="${param.rel}_find">
						<c:out value="${v.peName }" />
						</a>
					</td>
					
					<td title="${v.peSex }"><c:out value="${v.peSex}" /></td>
					<td>
						<c:forEach var="g" items="${requestScope.group }" >
							<c:if test="${v.peGrouping==g.id }"><c:out value="${g.grName }" /></c:if>
						</c:forEach>
					</td>
					<td title="<c:out value="${v.peCompany }" />"><c:out value="${v.peCompany }" /></td>
					
					<td title="<c:out value="${v.pePost}" />"><c:out value="${v.pePost}" /></td>
					
					<td title="${v.pePhone }"><c:out value="${v.pePhone}" /></td>
					
					<td title="${v.peOfficPhone}"><c:out value="${v.peOfficPhone}" /></td>
					
					<td title="${v.peEmail}"><c:out value="${v.peEmail}" /></td>
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, '${param.rel}_box')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination" rel="${param.rel}_box"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>
	
	</div>
	
</div>



	

