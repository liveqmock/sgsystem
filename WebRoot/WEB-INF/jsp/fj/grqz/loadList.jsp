<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--个人求职
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="grqz/load.do" method="post">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr >
					<td><label>人员选择：</label>
				<input type="hidden" name="rkjbguid" id="rkjbguid_grqzload" value="${requestScope.pension.rkjbguid }"/>
				<input type="text" name="xm" id="xm_grqzload" readonly value="${requestScope.pension.xm }"/>
				<a class="edit" href="rygl/load.do?bz=load" target="dialog" width="650" style="cursor:hand;" >选择人员</a>
			</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" onclick="cz()">重置</button></div></div></td>
					<td><span><div class="button"><div class="buttonContent"><button type="button" onclick="tbgrqz()">同步数据</button></div></div></span></li></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="grqz/addPage.do">
				<li>
				<a class="add" href="grqz/addPage.do?rel=${param.rel }" target="dialog" width="700" height="400"  rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			 
			<my:validationAuthority url="grqz/updatePage.do">
				<li><a class="edit" href="grqz/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="700" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="grqz/del.do">
				<li><a class="delete" href="grqz/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="请选择记录"><span>批量删除</span></a></li>
			</my:validationAuthority>
				<my:validationAuthority url="grqz/queryjs.do">
				<li><a class="edit" href="grqz/queryjs.do?id={id}&rel=${param.rel}&bz=0" target="dialog" width="700" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>查看详情</span></a></li>
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
			<th width="100px">身份证号</th>
			<th width="150px">家庭住址</th>
			<th width="150px">登记时间</th>
			<th width="150px">求职次数</th>
			<th width="150px">求职岗位</th>
			<th width="150px">薪资待遇</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${requestScope.pensions }"  varStatus="status">
				
				<tr target="id" rel="${r.grqzguids }" >
					<td ><input name="ids" value="${r.grqzguids }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title=""><c:out value="${r.rk.xm}" /></td>
					<td title="${r.rk.xb}"><c:out value="${r.rk.xb}" /></td>
					<td title="${r.rk.sfzh}"><c:out value="${r.rk.sfzh}" /></td>
					<td title="${r.rk.jtzz}"><c:out value="${r.rk.jtzz}" /></td>
					<td title="${r.djsjs}"><c:out value="${r.djsjs}" /></td>
					<td title="${r.qzcss}"><c:out value="${r.qzcss}" /></td>
					<td title="${r.qzgws}"><c:out value="${r.qzgws}" /></td>
					<td title="${r.xjdys}"><c:out value="${r.xjdys}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>


<script type="text/javascript">
function setFun(guid,xm){
	document.getElementById("rkjbguid_grqzload").value=guid;
	document.getElementById("xm_grqzload").value=xm;
}
function cz(){
	document.getElementById("rkjbguid_grqzload").value="";
	document.getElementById("xm_grqzload").value="";
}
function tbgrqz(){
	$.post("tb/tbjgrqz.do",function(date){
	if(date=="0"){
		alertMsg.info("同步数据成功！");
	}else if(date!="" && date!=null){
		alertMsg.info("同步数据失败！");
	}
	}
	);
}
</script>
	

