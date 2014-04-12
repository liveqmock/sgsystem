<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：社区服务--居民答疑--加载问题列表
--%>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this)"
		action="jmdy/load.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 100px">
					<tr>
						<td>标题：<input type="text" name="questionTitle"
							value="<c:out value="${param.questionTitle }" />" /></td>
						<td><select class="combox" name="questionType"
							sValue="${param.questionType}">
								<option value="">
									全部类型
									</o ption>
						</select></td>
						<td><select class="combox" name="questionStatus"
							sValue="${param.questionStatus }">
								<option value="">全部状态</option>
								<option value="1">已回复</option>
								<option value="0">未回复</option>
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
		<my:validationAuthority url="jmdy/toAsk.do">
				<li><a class="add" href="jmdy/toAsk.do?rel=${param.rel }" target="navTab" rel="${param.rel}_add"><span>提问</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="jmdy/answer.do">
				<li><a class="edit" href="jmdy/answer.do?id={id}&rel=${param.rel}&bz=0" target="dialog" width="750" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>回复</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="jmdy/del.do">
				<li><a class="delete" href="jmdy/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="请选择记录"><span>批量删除</span></a></li>
			</my:validationAuthority>
			<my:validationAuthority url="jmdy/detail.do">
				<li><a class="edit" href="jmdy/detail.do?id={id}&rel=${param.rel}&bz=0" target="dialog" width="750" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>查看详情</span></a></li>
				<li class="line">|</li>
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
				<th width="100" align="center">问题类型</th>
				<th width="200" align="center">标题</th>
				<th width="140" align="center">发布人</th>
				<th width="40" align="center">状态</th>
				<th width="150" align="center" >发布时间</th>
				<th width="40" align="center">回复人</th>
				<th width="40" align="center">回复时间</th>
				<th width="50" align="center">服务满意度</th>
					
			</tr>
		</thead>

		<tbody>
			<c:forEach var="question" items="${questions }" varStatus="status">
				<tr target="id" rel="${question.id }">
					<td><input name="ids" value="${question.id }" type="checkbox">
					</td>
					<td>${status.count }</td>
					<td>${question.questionType }
					</td>
					<td title="<c:out value="${question.questionTitle}"></c:out>"><c:out value="${question.questionTitle}"></c:out></td>
					<td><my:outUserName id="${question.publisher }" />
					</td>
					<td><c:choose>
							<c:when test="${question.questionStatus==1}">
								<span style="line-height: 20px;color:green">已回复</span>
							</c:when>
							<c:otherwise>
								<span style="line-height: 20px;color:red">未回复</span>
							</c:otherwise>
						</c:choose></td>
					
					</td>
					<td><fmt:formatDate value="${question.publishTime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td><my:outUserName id="${question.responser }" />
					</td>
					<td><fmt:formatDate value="${question.responseTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td title="<c:out value="${n.fwmyd}"></c:out>"><c:out value="${n.fwmyd}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp"%>

</div>