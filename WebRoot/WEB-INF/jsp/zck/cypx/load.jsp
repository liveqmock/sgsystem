<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：失业人员
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="cypx/load.do" method="post">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr >
					<td><label>人员选择：</label>
				<input type="hidden" name="rkjbguid" id="rkjbguids" value="${requestScope.cypx.rkjbguid }"/>
				<input type="text" name="xm" id="xms" readonly value="${requestScope.cypx.xm }"/>
				<a class="edit" href="rygl/load.do?bz=load" target="dialog" width="650" style="cursor:hand;" >选择人员</a>
			</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" onclick="cz()">重置</button></div></div></td>
					<td><span><div class="button"><div class="buttonContent"><button type="button" onclick="tbcy()">同步数据</button></div></div></span></li></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="cypx/updatePage.do">
				<li>
				<a class="add" href="cypx/updatePage.do?rel=${param.rel }&bz=0" target="dialog" width="750" height="400"  rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			 
			<my:validationAuthority url="cypx/updatePage.do">
				<li><a class="edit" href="cypx/updatePage.do?id={id}&rel=${param.rel}&bz=1" target="dialog" width="750" height="400" rel="${param.rel}_update" warn="请先选择一条记录"><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="cypx/del.do">
				<li><a class="delete" href="cypx/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="请选择记录"><span>批量删除</span></a></li>
			</my:validationAuthority>
				<my:validationAuthority url="cypx/check.do">
				<li><a class="edit" href="cypx/check.do?id={id}&rel=${param.rel}" target="dialog" width="750" height="400" rel="${param.rel}_check" warn="请先选择一条记录"><span>查看详情</span></a></li>
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
			<th width="50px">性别</th>
			<th width="50px">联系方式</th>
			<th width="50px">培训次数</th>
			<th width="50px">培训时间</th>
			<th width="80px">培训类型</th>
			<th width="80px">项目内容</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${requestScope.jncypx }"  varStatus="status">
				
				<tr target="id" rel="${r.jncypxguid }" >
				
					<td ><input name="ids" value="${r.jncypxguid }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title=""><c:out value="${r.xm}" /></td>
					
					<td title="${r.xb}">
					<c:if test="${r.xb=='1' }">男</c:if>
					<c:if test="${r.xb=='0' }">女</c:if>
					</td>
					<td title="${r.lxdh}"><c:out value="${r.lxdh}" /></td>
					<td title="${r.pxcs}"><c:out value="${r.pxcs}" /></td>
					<td title="${r.pxsj}"><c:out value="${r.pxsj}" /></td>
					<td title="${r.pxlx}"><c:out value="${r.pxlx}" /></td>
					<td title="${r.xmnr}"><c:out value="${r.xmnr}" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>


<script type="text/javascript">
function setFun(guid,xm){
	Math.random(); 
	document.getElementById("rkjbguids").value=guid;
	document.getElementById("xms").value=xm;
}
function cz(){
	document.getElementById("rkjbguids").value="";
	document.getElementById("xms").value="";
}
function tbcy(){
	$.post("tb/tbcy.do",function(date){
	if(date=="0"){
		alertMsg.info("同步数据成功！");
	}else if(date!="" && date!=null){
		alertMsg.info("同步数据失败！");
	}
	}
	);
}
</script>
	

