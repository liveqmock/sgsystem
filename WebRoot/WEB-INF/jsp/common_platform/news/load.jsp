<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：公各平台--新闻管理首页面
--%>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this)"
		action="news/loadnews.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 100px">
					<tr>
						<td>标题：<input type="text" name="newstitle"
							value="<c:out value="${param.newstitle }" />" /></td>
						<td><select class="combox" name="typeid"
							sValue="${param.typeid}">
								<option value="">
									全部类型
									</o ption>
						</select></td>
						<td><select class="combox" name="status"
							sValue="${param.status }">
								<option value="">全部状态</option>
								<option value="1">生成</option>
								<option value="0">终止</option>
						</select></td>
						<td>发布时间： <input type="text" readonly="readonly"
							onFocus="WdatePicker()" size="13" name="startDate"
							value="${param.startDate }" /> <span class="limit">-</span> <input
							type="text" readonly="readonly" onFocus="WdatePicker()" size="13"
							name="endDate" value="${param.endDate }" /></td>
						<td><div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">查询</button>
								</div>
							</div>
						</td>
						<td><div class="button">
								<div class="buttonContent">
									<button type="button" formreset="reset_notice_loadme">重置</button>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="news/addPage.do">
				<li><a class="add" href="news/addPage.do?rel=${param.rel }"
					target="navTab" rel="${param.rel}_add"><span>新增新闻</span>
				</a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="news/updatePage.do">
				<li><a class="edit"
					href="news/updatePage.do?id={id}&rel=${param.rel}" target="navTab"
					rel="${param.rel}_update"><span>修改新闻</span>
				</a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="news/delete.do">
				<li><a class="delete" href="news/delete.do"
					target="selectedTodo" rel="ids" title="确定要删除吗?"><span>批量删除</span>
				</a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="news/stop.do">
				<li><a class="edit" href="news/stop.do" target="selectedTodo"
					rel="ids" title="确定要终止吗?"><span>终止</span>
				</a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="news/generate.do">
				<li><a class="edit" href="news/generate.do"
					target="selectedTodo" rel="ids" title="确定要生成吗?"><span>生成</span>
				</a>
				</li>
			</my:validationAuthority>
			<my:validationAuthority url="news/extpor.do">
				<li><a class="add" href="news/extpor.do?rel=${param.rel }_box"
					target="dialog" width="500" height="300" rel="${param.rel}_imp"><span>Excel导入</span>
				</a>
				</li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1167" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox"
					group="ids" class="checkboxCtrl">
				</th>
				<th width="28" align="center">行号</th>
				<th width="100" align="center">新闻类型</th>
				<th width="200" align="center">标题</th>
				<th width="140" align="center">发布人</th>
				<th width="40" align="center">状态</th>
				<th width="60" align="center" orderField="hits"
					class="${fromParam.orderDirection}">点击数</th>
				<th width="60" align="center" orderField="contents"
					class="${fromParam.orderDirection}">评论(条)</th>
				<th width="150" align="center" orderField="createdtime"
					class="${fromParam.orderDirection}">发布时间</th>
				<my:validationAuthority url="news/managementcontent.do">
					<th width="70" align="center">操作</th>
				</my:validationAuthority>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="n" items="${news }" varStatus="status">
				<tr target="id" rel="${n.id }">
					<td><input name="ids" value="${n.id }" type="checkbox">
					</td>
					<td>${status.count }</td>
					<td><my:outSelectValue id="${n.typeid }" />
					</td>
					<td title="<c:out value="${n.newstitle}"></c:out>"><a
						href="news/look.do?id=${n.id}&rel=${param.rel}_look"
						target="navTab" rel="${param.rel}_look"> <c:choose>
								<c:when test="${n.stick==1 }">
									<img style="margin-top: 3px;"
										src="resource/images/arrow_up.gif">
									<c:out value="${n.newstitle}"></c:out>
								</c:when>
								<c:otherwise>
									<c:out value="${n.newstitle}"></c:out>
								</c:otherwise>
							</c:choose> </a></td>
					<td><my:outUserName id="${n.promulgator }" />
					</td>
					<td><c:choose>
							<c:when test="${n.status==1}">
								<span style="line-height: 20px;color:green">生成</span>
							</c:when>
							<c:otherwise>
								<span style="line-height: 20px;color:red">终止</span>
							</c:otherwise>
						</c:choose></td>
					<td title="${n.hits}"><c:out value="${n.hits}"></c:out></td>
					<td title="${n.contents}"><c:out value="${n.contents}"></c:out>
					</td>
					<td><fmt:formatDate value="${n.createdtime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<my:validationAuthority url="news/managementcontent.do">
						<td><a
							href="news/managementcontent.do?id=${n.id}&rel=${param.rel}_managementcontent"
							target="navTab" rel="${param.rel}_managementcontent">管理评论</a>
						</td>
					</my:validationAuthority>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp"%>

</div>