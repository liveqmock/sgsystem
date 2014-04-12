<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-通讯录-公司通讯录
--%>
<div class="pageHeader" style="border:1px #B8D0D6 solid;">
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}_box');" action="public/queryGroup.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<input type="hidden" name="puGrouping" value="${param.peGrouping }"/>
			<div class="searchBar">
				<table class="searchContent" style="margin-left:1px">
					<tr >
						
						<td><input type="hidden" name="peGrouping" value="${gro}" />
							姓名：<input type="text" name="puName" style="width: 90px" value="<c:out value="${param.puName }" />" />
						</td>
						<td>
							单位名称：<input type="text" name="puCompany" style="width: 90px" value="<c:out value="${param.puCompany }" />"/>
						</td>
						<td>
							移动电话：<input type="text" name="puPhone" style="width: 90px" value="<c:out value="${param.puPhone }" />"/>
						</td>
						<td>
							办公电话：<input type="text" name="puOfficPhone" style="width: 90px" value="<c:out value="${param.puOfficPhone }" />"/>
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
			<my:validationAuthority url="public/addPage.do">
				<li><a class="add" href="public/addPage.do?rel=${param.rel }_box" target="dialog" width="1000" height="500" rel="${param.rel}_add"><span>新增人员</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="public/updatePage.do">	
				<li><a class="edit" href="public/updatePage.do?id={id}&rel=${param.rel}_box" target="dialog"  width="1000" height="500" rel="${param.rel}_update" warn="请先选择一条信息"><span>修改人员</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="public/del.do">
				<li><a class="delete" href="public/del.do?rel=${param.rel }_box" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一条信息"><span>批量删除</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			
			<my:validationAuthority url="publicGroup/load.do">	
				<li><a class="edit" href="publicGroup/load.do?rel=${param.rel }_group" target="navTab" rel="${param.rel }_group" ><span>公共通讯录分组维护</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="public/excelPage.do">
				<li><a class="add" href="public/excelPage.do?rel=${param.rel }_box" target="dialog" width="500" height="300" rel="${param.rel}_imp"><span>Excel导入</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="950" layoutH="160" rel="${param.rel}_box">
		<thead>
			<tr>
				<th width="27" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="140" align="center">姓名</th>
				<th width="28" align="center">性别</th>
				<th width="100" align="center">所属分组</th>
				<th  align="center">单位名称</th>
				<th width="80" align="center">职位</th>
				<th width="120" align="center">移动电话</th>
				<th width="120" align="center">办公电话</th>
				
				<th width="150" align="center">电子邮件</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${values }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
				
					<td ><input name="ids" value="${v.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title="<c:out value="${v.puName }" />">
						<a href="public/find.do?id=${v.id }" target="navTab" rel="${param.rel}_find">
						<c:out value="${v.puName }" />
						</a>
					</td>
					
					<td title="${v.puSex }"><c:out value="${v.puSex}" /></td>
					<td>
						<c:forEach var="g" items="${requestScope.group }" >
							<c:if test="${v.puGrouping==g.id }"><c:out value="${g.gaName }" /></c:if>
						</c:forEach>
					</td>

					
					<td title="<c:out value="${v.puCompany }" />"><c:out value="${v.puCompany }" /></td>
					
					<td title="${v.puPost}"><c:out value="${v.puPost}" /></td>
					
					<td title="${v.puPhone }"><c:out value="${v.puPhone}" /></td>
					
					<td title="${v.puOfficPhone}"><c:out value="${v.puOfficPhone}" /></td>
					
					
					
					<td title="${v.puEmail}"><c:out value="${v.puEmail}" /></td>
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



	

