<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：公各平台--劳动保障---小额贷款发放情况管理首页面
--%>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this)"
		action="xedkffqk/xedkffqkList.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr>
						<td>姓名： <a class="edit" href="rygl/load.do?bz=load"
							target="dialog" width="650" style="cursor:hand;"><input
								type="hidden" name="rkjbguid" id="rkjbguid"
								value="${requestScope.pension.rkjbguid }" /> <input type="text"
								name="xm" id="xm" value="<c:out value="${param.xm }"></c:out>" />
						</a></td>
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
							<td><span><div class="button"><div class="buttonContent"><button type="button" onclick="tbxedk()">同步数据</button></div></div></span></li></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="xedkffqk/jumpaddxedkffqk.do">
				<li><a class="add"
					href="xedkffqk/jumpaddxedkffqk.do?rel=${param.rel }"
					target="navTab" rel="${param.rel}_add"><span>新增小额贷款发放情况</span>
				</a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="xedkffqk/findxedkffqk.do">
				<li><a class="edit"
					href="xedkffqk/findxedkffqk.do?id={id}&rel=${param.rel}"
					target="navTab" rel="${param.rel}_update"><span>修改小额贷款发放情况</span>
				</a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="xedkffqk/delxedkffqk.do">
				<li><a class="delete" href="xedkffqk/delxedkffqk.do"
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
				<th width="200" align="center">发放时间</th>
				<th width="140" align="center">贷款金额</th>
				<th width="140" align="center">还款时间</th>
				<th width="140" align="center">信用度</th>
				<th width="140" align="center">经营项目</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="x" items="${xe }" varStatus="status">
				<tr target="id" rel="${x.xk.xedkffqkguid }">
					<td><input name="ids" value="${x.xk.xedkffqkguid }"
						type="checkbox"></td>
					<td>${status.count }</td>
					<td><c:out value="${x.xms }"></c:out></td>
					<td title=""><c:out value="${x.xk.ffsj }"></c:out>
					</td>
					<td title=""><c:out value="${x.xk.dkje }"></c:out>
					</td>
					<td title=""><c:out value="${x.xk.hksj }"></c:out>
					</td>
					<td title=""><c:out value="${x.xk.xyd }"></c:out>
					</td>
					<td title="<c:out value="${x.xk.jyxm}"></c:out>"><c:out
							value="${x.xk.jyxm}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp"%>

</div>
<script type="text/javascript">
function setFun(guid,xm){
	document.getElementById("rkjbguid").value=guid;
	document.getElementById("xm").value=xm;
}
function cz(){
	document.getElementById("rkjbguid").value="";
	document.getElementById("xm").value="";
}
function tbxedk(){
	$.post("tb/tbxedk.do",function(date){
	if(date=="0"){
		alertMsg.info("同步数据成功！");
	}else if(date!="" && date!=null){
		alertMsg.info("同步数据失败！");
	}
	}
	);
}
</script>