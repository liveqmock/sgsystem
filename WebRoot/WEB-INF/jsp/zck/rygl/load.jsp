<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理
--%>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return dialogSearch(this);" action="rygl/load.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 150px">
					<tr >
						<td>
							姓名：<input type="text" name="xm" value="${requestScope.rkjb.xm }" />
						</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
			<th width="40">序号</th>
			<th width="80">姓名</th>
			<th width="50px">姓名缩写</th>
			<th width="50px">身份证号</th>
			<th width="50px">性别</th>
			<th width="50px">出生日期</th>
			<th width="50px">民族</th>
			<th width="80px">联系方式</th>
			<th width="80px">工作单位</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${requestScope.pensions }"  varStatus="status">
				
				<tr target="id" rel="${r.rkjbguid }" onclick="fun('${r.rkjbguid }','${r.xm}','${requestScope.rkjb.bz}')" >
				
					<td>${status.count }</td>
					<td title=""><c:out value="${r.xm}" /></td>
					
					<td title="${r.xmpy}"><c:out value="${r.xmpy}" /></td>
					<td title="${r.sfzh}"><c:out value="${r.sfzh}" /></td>
					<td title="${r.xb}"><c:if test="${r.xb=='1'} ">男</c:if><c:if test="${r.xb=='0' }">女</c:if></td>
					<td title="${r.csrq}"><c:out value="${r.csrq}" /></td>
					<td title="${r.mz}"><c:out value="${r.mz}" /></td>
					<td title="${r.lxdh}"><c:out value="${r.lxdh}" /></td>
					<td title="${r.gzdw}"><c:out value="${r.gzdw}" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>



<script type="text/javascript">
function fun(guid,xm,bz){
	if(bz=="add"){
		window.parent.parent.setloadadd(guid,xm);
		 $.pdialog.closeCurrent(); 
	}else if(bz=="load"){
		window.parent.parent.setFun(guid,xm);
		 $.pdialog.closeCurrent(); 
	}else{
		window.parent.parent.setloadupdate(guid,xm);
		 $.pdialog.closeCurrent(); 
	}
   
}
</script>	

