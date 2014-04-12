<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：打印页面
--%>

<html>
<head>
<script language="javascript">
	function printdiv(printpage) {
		var headstr = "<html><head><title></title></head><body>";
		var footstr = "</body>";
		var newstr = document.all.item(printpage).innerHTML;
		var oldstr = document.body.innerHTML;
		document.body.innerHTML = headstr + newstr + footstr;
		window.print();
		document.body.innerHTML = oldstr;
		return false;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><c:out value="${requestScope.tableTitle }" />_打印</title>
<link href="favicon.ico" rel="SHORTCUT ICON" />
<style>
.print_table {
	width: 100%;
	font-size: 12px;
	line-height: 28px;
	font-family: "宋体", sans-serif;
	border-bottom: 1px solid #868686;
	border-right: 1px solid #868686;
	overflow-y: visible;
	overflow-x: scroll;
	text-align: center;
}

.print_title {
	font-size: 13px;
	font-weight: bold;
	line-height: 24px;
	font-family: "宋体";
	color: #000000;
	background-color: #b1b1b0;
	text-align: center;
	white-space: nowrap;
	border-top: 1px solid #868686;
	border-left: 1px solid #868686;
}

.print_result_td {
	color: #000000;
	line-height: 22px;
	white-space: nowrap;
	height: 10px;
	border-top: 1px solid #868686;
	border-left: 1px solid #868686;
}
</style>
</head>
<body>
	
	<div id="div_print">
	<input name="b_print" type="button" class="ipt"
		onClick="printdiv('div_print');" value="打印 ">
		<table class="print_table" style="margin-top: 10px" cellspacing="0">
			<caption>
				<h3>
					<c:out value="${requestScope.tableTitle }" />
				</h3>
			</caption>
			<thead>
				<tr>
					<c:forEach var="t" items="${requestScope.tc }">
						<th align="center" class="print_title"><c:choose>
								<c:when test="${empty t.fieldAnotherTitle}">
									<c:out value="${t.fieldTitle }" />
								</c:when>
								<c:otherwise>
									<c:out value="${t.fieldAnotherTitle}" />
								</c:otherwise>
							</c:choose></th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="d" items="${requestScope.data }" varStatus="status">
					<tr>
						<c:forEach var="t" items="${requestScope.tc }">
							<td align="center" class="print_result_td"><c:choose>
									<c:when test="${t.fieldType==3}">
										<%--日期(YYYY-MM-DD)--%>
										<fmt:formatDate value="${d[t.fieldName] }"
											pattern="yyyy-MM-dd" />

									</c:when>
									<c:when test="${t.fieldType==4}">
										<%--日期时间(YYYY-MM-DD HH:MM:SS)--%>
										<fmt:formatDate value="${d[t.fieldName] }"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</c:when>
									<c:when test="${t.fieldType==5}">
										<%--用户id(转换用户姓名)--%>
										<my:outTrueName id="${d[t.fieldName] }" />
									</c:when>
									<c:when test="${t.fieldType==6}">
										<%--部门id(转换部门名称)--%>
										<my:outDeptName id="${d[t.fieldName] }" />
									</c:when>
									<c:when test="${t.fieldType==7}">
										<%--用户id(转换用户登录名)--%>
										<my:outUserName id="${d[t.fieldName] }" />
									</c:when>
									<c:otherwise>
										<c:out value="${d[t.fieldName] }" />
									</c:otherwise>
								</c:choose></td>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>

