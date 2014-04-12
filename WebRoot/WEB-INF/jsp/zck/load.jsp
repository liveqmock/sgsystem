<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="pension/load.do" method="post">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr >
					<td><label>人员选择：</label>
				<input type="hidden" name="rkjbguid" id="rkjbguid4" value="${requestScope.pension.rkjbguid }"/>
				<input type="text" name="xm" id="xm4" readonly value="${requestScope.pension.xm }"/>
				<a class="edit" href="rygl/load.do?bz=load" target="dialog" width="650" style="cursor:hand;" >选择人员</a>
			</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" onclick="cz()">重置</button></div></div></td>
					<td><span><div class="button"><div class="buttonContent"><button type="button" onclick="tbylgl()">同步数据</button></div></div></span></li></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="pension/addPage.do">
			
				<li>
				<!-- 
				<a class="add" href="user/rigistload.do" target="dialog" width="750" height="400"  rel="${param.rel}_add"><span>注册</span></a></li>
				 -->
				 <a class="add" href="user/rigistload.do" target="navTab" width="750" height="400"  rel="${param.rel}_add"><span>注册</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="pension/addPage.do">
			
				<li>
				<a class="add" href="pension/addPage.do?rel=${param.rel }" target="dialog" width="750" height="400"  rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			 
			<my:validationAuthority url="pension/updatePage.do">
				<li><a class="edit" href="pension/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="750" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="pension/del.do">
				<li><a class="delete" href="pension/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="请选择记录"><span>批量删除</span></a></li>
			</my:validationAuthority>
				<my:validationAuthority url="pension/querybypk.do">
				<li><a class="edit" href="pension/querybypk.do?id={id}&rel=${param.rel}&bz=0" target="dialog" width="750" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>查看详情</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
			<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
			<th width="40">序号</th>
			<th width="80">姓名</th>
			<th width="50px">身体状况</th>
			<th width="50px">护理类型</th>
			<th width="50px">是否低保</th>
			<th width="50px">是否贫困</th>
			<th width="50px">是否空巢</th>
			<th width="80px">是否机构养老</th>
			<th width="80px">是否日托养老</th>
			<th width="80px">是否上门服务</th>
			<th width="80px">是否老年饭桌</th>
			<th width="30px">一键通</th>
			
			
		</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${requestScope.pensions }"  varStatus="status">
				
				<tr target="id" rel="${r.shylguid }" >
				
					<td ><input name="ids" value="${r.shylguid }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title=""><c:out value="${r.xm}" /></td>
					
					<td title="${r.stzk}"><c:out value="${r.stzk}" /></td>
					<td title="${r.hllx}"><c:out value="${r.hllx}" /></td>
					<td title="${r.sfdb}"><c:out value="${r.sfdb}" /></td>
					<td title="${r.sfpk}"><c:out value="${r.sfpk}" /></td>
					<td title="${r.sfkc}"><c:out value="${r.sfkc}" /></td>
					<td title="${r.jgyl}"><c:out value="${r.jgyl}" /></td>
					<td title="${r.rtyl}"><c:out value="${r.rtyl}" /></td>
					<td title="${r.smfw}"><c:out value="${r.smfw}" /></td>
					<td title="${r.lnfz}"><c:out value="${r.lnfz}" /></td>
					<td title="${r.yjt}"><c:out value="${r.yjt}" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>


<script type="text/javascript">
function setFun(guid,xm){
	Math.random();
	document.getElementById("rkjbguid4").value=guid;
	document.getElementById("xm4").value=xm;
}
function cz(){
	document.getElementById("rkjbguid4").value="";
	document.getElementById("xm4").value="";
}
function tbylgl(){
	$.post("tb/tbylgl.do",function(date){
	if(date=="0"){
		alertMsg.info("同步数据成功！");
	}else if(date!="" && date!=null){
		alertMsg.info("同步数据失败！");
	}
	}
	);
}
</script>
	

