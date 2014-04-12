<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：公各平台--劳动保障---退员人员管理首页面
--%>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this)"
		action="txry/txryList.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr>
						<td>姓名：<a class="edit" href="rygl/load.do?bz=load" target="dialog"
							width="650" style="cursor:hand;"><input type="hidden"
								name="rkjbguid" id="rkjbguid_jyyzload"
								value="${requestScope.pension.rkjbguid }" /> <input type="text" 
								name="xm" id="xm_jyyzload" value="<c:out value="${param.xm }"></c:out>" />
						</a>
						</td>
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
							<td><span><div class="button"><div class="buttonContent"><button type="button" onclick="tbtxry()">同步数据</button></div></div></span></li></td>
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
			<my:validationAuthority url="txry/jumpaddtxry.do">
				<li><a class="add" href="txry/jumpaddtxry.do?rel=${param.rel }"
					target="navTab" rel="${param.rel}_add"><span>新增退休人员</span> </a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="txry/jumpedittxry.do">
				<li><a class="edit"
					href="txry/jumpedittxry.do?id={id}&rel=${param.rel}"
					target="navTab" rel="${param.rel}_update"><span>修改退休人员</span> </a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="txry/deltxry.do">
				<li><a class="delete" href="txry/deltxry.do"
					target="selectedTodo" rel="ids" title="确定要删除吗?"><span>批量删除</span>
				</a>
				</li>
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
				<th width="100" align="center">姓名</th>
				<th width="200" align="center">退休前工作单位</th>
				<th width="140" align="center">单位电话</th>
				<th width="40" align="center">家庭电话</th>
				<th width="60" align="center">签收日</th>
				<th width="60" align="center">退休时间</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="t" items="${txry }" varStatus="status">
				<tr target="id" rel="${t.ty.txryguid }">
					<td><input name="ids" value="${t.ty.txryguid }" type="checkbox">
					</td>
					<td>${status.count }</td>
					<td><c:out value="${t.xms }"></c:out>
					</td>
					<td title=""><c:out value="${t.ty.txqdw }"></c:out></td>
					<td><c:out value="${t.ty.dwdh }"></c:out>
					</td>
					<td><c:out value="${t.ty.jtdh }"></c:out>
					</td>
					<td title=""><c:out value="${t.ty.qsr}"></c:out>
					<td title=""><c:out value="${t.ty.txsj}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp"%>

</div>
<script type="text/javascript">
function setFun(guid,xm){
	document.getElementById("rkjbguid_jyyzload").value=guid;
	document.getElementById("xm_jyyzload").value=xm;
}
function cz(){
	document.getElementById("rkjbguid_jyyzload").value="";
	document.getElementById("xm_jyyzload").value="";
}
function tbtxry(){
	$.post("tb/tbtxry.do",function(date){
	if(date=="0"){
		alertMsg.info("同步数据成功！");
	}else if(date!="" && date!=null){
		alertMsg.info("同步数据失败！");
	}
	}
	);
	}
</script>