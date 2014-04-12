<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：公各平台--人员管理首页面
--%>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this)"
		action="person/RKJBList.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr>
						<td>姓名：<input type="text" name="xm"
							value="<c:out value="${param.xm }" />" />
						</td>
						<td><div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">查询</button>
								</div>
							</div></td>
						<td><div class="button">
								<div class="buttonContent">
									<button type="button" formreset="reset_notice_loadme">重置</button>
								</div>
							</div></td>
							<td><div class="button">
								<div class="">
									<a class="delete" href="tb/tbrygl.do" target="ajaxToDo" ><span>同步数据</span> </a>
								</div>
							</div></td>
							
							
							
		
					
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="person/delRKJB.do">
				<li><a class="delete" href="person/delRKJB.do"
					target="selectedTodo" rel="ids" title="确定要删除吗?"><span>批量删除</span>
				</a></li>
				<li class="line">|</li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1167" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox"
					group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="100" align="center">姓名</th>
				<th width="200" align="center">性别</th>
				<th width="140" align="center">民族</th>
				<th width="40" align="center">籍贯</th>
				<th width="60" align="center">身份证号</th>
				<th width="60" align="center">工作单位</th>
				<th width="150" align="center">家庭住址</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="r" items="${rkjb }" varStatus="status">
				<tr target="id" rel="${r.rkjbguid }">
					<td><input name="ids" value="${r.rkjbguid }" type="checkbox">
					</td>
					<td>${status.count }</td>
					<td><c:out value="${r.xm }"></c:out></td>
					<td title=""><c:out value="${r.xb }"></c:out>
					</td>
					<td><c:out value="${r.mz }"></c:out></td>
					<td><c:out value="${r.jg }"></c:out></td>
					<td title=""><c:out value="${r.sfzh}"></c:out>
					</td>
					<td title=""><c:out value="${r.gzdw}"></c:out></td>
					<td><c:out value="${r.jtzz }"></c:out>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp"%>

</div>
<script type="text/javascript">
function tbrygl(){
	$.post("tb/tbrygl.do",function(date){
		if(date=="0"){
			alertMsg.info("同步数据成功！");
			return dialogSearch(this);
			alert("SSS");
		}else if(date!="" && date!=null){
			alertMsg.info("同步数据失败！"+date);
			return null;
		}
	}
	
	);
}
</script>