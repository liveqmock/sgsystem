<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>


<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/style.css" />
	<script src="<%=request.getContextPath()%>/resource/js/page.js"></script>
</head>
<script type="text/javascript" language="javascript">
	window.onload = function() {
		page = new Page(15, 'table1', 'group_one');
	};
</script>
<style>
a:link{text-decoration:none;}
a:visited{text-decoration:none;}
a:hover{text-decoration:underline;} 
</style>
<body>
	<table id="table1" border="0" width="100%">
		<thead>
			<tr >
				<th class="td_style_div" width="50%"  style="text-align:left;">标题</th>
				<th class="td_style_div" width="15%" style="text-align:left;">类型</th>
				<th class="td_style_div" width="15%"  style="text-align:left;">发布人</th>
				<th class="td_style_div" width="20%"  style="text-align:left;">创建时间</th>
			</tr>
		</thead>
		<tbody id="group_one">
				
			<c:forEach items="${requestScope.news}" var="pe">
						<tr>
							<td class="td_style_div" title="${pe.newstitle }" ><a href="dwzp.do?bz=newsdetail&id=${pe.id }"  target="_blank">
							${pe.newstitle }
							</a>&nbsp;</td>
							<td class="td_style_div"><my:outSelectValue id="${pe.typeid }" />&nbsp;</td>
							<td class="td_style_div"><my:outUserName id="${pe.promulgator }" />&nbsp;</td>
							<td class="td_style_div"><fmt:formatDate value="${pe.createdtime}"
							pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;</td>
						</tr>
					</c:forEach>
		</tbody>
	</table>
	<input type="hidden" id="iis" name="iis" value=""/>
	<table style="text-align: right;" width="100%" >
		<tr style="text-align:right;font-size:13px;">
			<td class="pagefny"><a href="#" onclick="page.firstPage();">首页</a>&nbsp;
			<a href="#" onclick="page.prePage();">上一页</a>&nbsp;
			第<span id="pageindex">1</span>页&nbsp;
			<a href="#" onclick="page.nextPage();">下一页</a>&nbsp;
			<a href="#" onclick="page.lastPage();">尾页</a>&nbsp;
			第<select id="pageselect" onchange="page.changePage();"></select>页</td>
		</tr>
	</table>
</body>
</html>
<script type="text/javascript">
	window.parent.document.getElementById("gzdt").innerHTML="新闻";
	window.parent.document.getElementById("gd").innerHTML="<span onclick='first()' style='cursor:hand;'>首页</span>>><font style='cursor:Default;'>新闻</font>";
function zp(){
	window.parent.document.getElementById("rightframe").src="web/dwzp.do";
}
</script>
