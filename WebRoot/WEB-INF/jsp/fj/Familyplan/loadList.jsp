<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--人口计生
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="Familyplan/load.do" method="post">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr >
					<td><label>人员选择：</label>
				<input type="hidden" name="rkjbguid" id="rkjbguid_famload" value="${requestScope.pension.rkjbguid }"/>
				<input type="text" name="xm" id="xm_famload" readonly value="<c:out value="${param.xm }" />"/>
				<a class="edit" href="rygl/load.do?bz=load" target="dialog" width="650" style="cursor:hand;" >选择人员</a>
			</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" onclick="cz()">重置</button></div></div></td>
									<td><span><div class="button"><div class="buttonContent"><button type="button" onclick="tbjsgl()">同步数据</button></div></div></span></li></td>
				
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="Familyplan/addPage.do">
				<li>
				<a class="add" href="Familyplan/addPage.do?rel=${param.rel }" target="dialog" width="800" height="500"  rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			 
			<my:validationAuthority url="Familyplan/updatePage.do">
				<li><a class="edit" href="Familyplan/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="800" height="500" rel="${param.rel}_update" warn="请先选择一条记录"><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="Familyplan/del.do">
				<li><a class="delete" href="Familyplan/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="请选择记录"><span>批量删除</span></a></li>
			</my:validationAuthority>
				<my:validationAuthority url="Familyplan/queryjs.do">
				<li><a class="edit" href="Familyplan/queryjs.do?id={id}&rel=${param.rel}&bz=0" target="dialog" width="800" height="500" rel="${param.rel}_update" warn="请先选择一条记录"><span>查看详情</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
			<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
		   <th width="25">序号</th>
			<th width="80">姓名</th>
			<th width="30px">性别</th>
			<th width="30px">民族</th>
			<th width="80px">籍贯</th>
			<th width="100px">身份证号</th>
			<th width="150px">家庭住址</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${requestScope.pensions }"  varStatus="status">
				
				<tr target="id" rel="${r.rkjsguids }" >
					<td ><input name="ids" value="${r.rkjsguids }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title=""><c:out value="${r.rk.xm}" /></td>
					<td title="${r.rk.xb}"><c:out value="${r.rk.xb}" /></td>
					<td title="${r.rk.mz}"><c:out value="${r.rk.mz}" /></td>
					<td title="${r.rk.jg}"><c:out value="${r.rk.jg}" /></td>
					<td title="${r.rk.sfzh}"><c:out value="${r.rk.sfzh}" /></td>
					<td title="${r.rk.jtzz}"><c:out value="${r.rk.jtzz}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>


<script type="text/javascript">
function setFun(guid,xm){
	document.getElementById("rkjbguid_famload").value=guid;
	document.getElementById("xm_famload").value=xm;
}
function cz(){
	document.getElementById("rkjbguid_famload").value="";
	document.getElementById("xm_famload").value="";
}
function tbjsgl(){
	$.post("tb/tbjsgl.do",function(date){
	if(date=="0"){
		alertMsg.info("同步数据成功！");
	}else if(date!="" && date!=null){
		alertMsg.info("同步数据失败！");
	}
	}
	);
}
</script>
	

