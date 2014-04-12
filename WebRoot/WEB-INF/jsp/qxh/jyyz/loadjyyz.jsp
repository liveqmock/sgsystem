<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：公各平台--劳动保障---就业援助管理首页面
--%>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this)"
		action="jyyz/jyyzList.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="jyyz/jumpaddjyyz.do">
				<li><a class="add" href="jyyz/jumpaddjyyz.do?rel=${param.rel }"
					target="navTab" rel="${param.rel}_add"><span>新增就业援助</span> </a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="jyyz/jumpeditjyyz.do">
				<li><a class="edit"
					href="jyyz/jumpeditjyyz.do?id={id}&rel=${param.rel}"
					target="navTab" rel="${param.rel}_update"><span>修改就业援助</span> </a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="jyyz/deljyyz.do">
				<li><a class="delete" href="jyyz/deljyyz.do"
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
				<th width="200" align="center">补助金额</th>
				<th width="140" align="center">备注</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="j" items="${jyyz }" varStatus="status">
				<tr target="id" rel="${j.jz.jyyzguid }">
					<td><input name="ids" value="${j.jz.jyyzguid }" type="checkbox">
					</td>
					<td>${status.count }</td>
					<td><c:out value="${j.xms }"></c:out>
					</td>
					<td title=""><c:out value="${j.jz.sbbt }"></c:out></td>
					<td><c:out value="${j.jz.jyyzbz}"></c:out>
					</td>
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
function tbjy(){
	$.post("tb/tbjyyz.do",function(date){
	if(date=="0"){
		alertMsg.info("同步数据成功！");
	}else if(date!="" && date!=null){
		alertMsg.info("同步数据失败！");
	}
	}
	);
}
</script>