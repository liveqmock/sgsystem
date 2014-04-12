<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：公各平台--劳动保障---劳动监察管理首页面
--%>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this)"
		action="ldjc/ldjcList.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 10px">
					<tr>
						<td>单位名称： <input type="text" name="dwmc" id="dwmc"
							value="<c:out value="${param.dwmc }"></c:out>" /> </a></td>
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
							<td><span><div class="button"><div class="buttonContent"><button type="button" onclick="tbldjc()">同步数据</button></div></div></span></li></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="ldjc/jumpaddldjc.do">
				<li><a class="add" href="ldjc/jumpaddldjc.do?rel=${param.rel }"
					target="navTab" rel="${param.rel}_add"><span>新增劳动监察</span> </a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="ldjc/jumpeditldjc.do">
				<li><a class="edit"
					href="ldjc/jumpeditldjc.do?id={id}&rel=${param.rel}"
					target="navTab" rel="${param.rel}_update"><span>修改劳动监察</span> </a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="ldjc/delldjc.do">
				<li><a class="delete" href="ldjc/delldjc.do"
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
				<th width="100" align="center">单位名称</th>
				<th width="200" align="center">单位地址</th>
				<th width="140" align="center">联系人</th>
				<th width="40" align="center">联系人电话</th>
				<th width="60" align="center">监察员</th>
				<th width="60" align="center">所属社区</th>
				<th width="60" align="center">是否合格</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="l" items="${ldjc }" varStatus="status">
				<tr target="id" rel="${l.ldjcguid }">
					<td><input name="ids" value="${l.ldjcguid }" type="checkbox">
					</td>
					<td>${status.count }</td>
					<td><c:out value="${l.dwmc }"></c:out></td>
					<td title=""><c:out value="${l.dwdz }"></c:out>
					</td>
					<td><c:out value="${l.lxr}"></c:out></td>
					<td><c:out value="${l.lxrdh }"></c:out></td>
					<td title=""><c:out value="${l.jcr}"></c:out></td>
					<td title=""><my:outSelectValue id="${l.sssq }" /></td>
					<td title=""><c:choose>
							<c:when test="${l.sfhg==0}">
					  否
					  </c:when>
							<c:otherwise>
					  是
					  </c:otherwise>
						</c:choose>
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
function tbldjc(){
	$.post("tb/tbldjc.do",function(date){
	if(date=="0"){
		alertMsg.info("同步数据成功！");
	}else if(date!="" && date!=null){
		alertMsg.info("同步数据失败！");
	}
	}
	);
}
</script>