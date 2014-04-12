<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--个人求职
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="dwzp/load.do" method="post">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr >
					<td><label>单位名称：</label>
				     <input type="text" name="dwmc" id="dwmc" />
			       </td>
			       <td><label>需求岗位：</label>
				     <input type="text" name="xqgw" id=""xqgw"" />
			       </td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" onclick="cz()">重置</button></div></div></td>
					<td><span><div class="button"><div class="buttonContent"><button type="button" onclick="tbdwzp()">同步数据</button></div></div></span></li></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="dwzp/addPage.do">
				<li>
				<a class="add" href="dwzp/addPage.do?rel=${param.rel }" target="dialog" width="700" height="400"  rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			 
			<my:validationAuthority url="dwzp/updatePage.do">
				<li><a class="edit" href="dwzp/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="700" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="dwzp/del.do">
				<li><a class="delete" href="dwzp/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="请选择记录"><span>批量删除</span></a></li>
			</my:validationAuthority>
				<my:validationAuthority url="dwzp/queryjs.do">
				<li><a class="edit" href="dwzp/queryjs.do?id={id}&rel=${param.rel}&bz=0" target="dialog" width="700" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>查看详情</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
			<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
		   <th width="25">序号</th>
			<th width="150">单位名称</th>
			<th width="150px">单位地址</th>
			<th width="100px">联系人</th>
			<th width="150px">联系人电话</th>
			<th width="150px">需求岗位</th>
			<th width="100px">需求人数</th>
			<th width="100px">薪金待遇</th>
			<th width="100px">性别要求</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${requestScope.pensions }"  varStatus="status">
				
				<tr target="id" rel="${r.dwzpguid }" >
					<td ><input name="ids" value="${r.dwzpguid }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title=""><c:out value="${r.dwmc}" /></td>
					<td title="${r.dwdz}"><c:out value="${r.dwdz}" /></td>
					<td title="${r.lxr}"><c:out value="${r.lxr}" /></td>
					<td title="${r.lxrdh}"><c:out value="${r.lxr}" /></td>
					<td title="${r.xqgw}"><c:out value="${r.xqgw}" /></td>
					<td title="${r.xqrs}"><c:out value="${r.xqrs}" /></td>
					<td title="${r.xzdy}"><c:out value="${r.xzdy}" /></td>
					<td title="${r.xbyq}"><c:out value="${r.xbyq}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>


<script type="text/javascript">

function cz(){
	document.getElementById("xqgw").value="";
	document.getElementById("dwmc").value="";
}
function tbdwzp(){
	$.post("tb/tbdwzp.do",function(date){
	if(date=="0"){
		alertMsg.info("同步数据成功！");
	}else if(date!="" && date!=null){
		alertMsg.info("同步数据失败！");
	}
	}
	);
}
</script>
	

