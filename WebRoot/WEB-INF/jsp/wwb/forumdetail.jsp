<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>


<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/stylegd.css" />
	<script src="<%=request.getContextPath()%>/resource/js/page.js"></script>
</head>

<style>
a:link{text-decoration:none;}
a:visited{text-decoration:none;}
a:hover{text-decoration:underline;} 
</style>
<body>

	<table id="table1" border="0" width="100%">
		<thead>
			<tr >
				<th class="td_style_div1" width="100%"  style="text-align:center;"><c:out value="${requestScope.news.newstitle}" /></th>
			</tr>
				<tr >
				<td class="td_style_div" width="100%"  style="text-align:center;font-size:11px;">发布人：<my:outTrueName id="${requestScope.tbforum.username}"/>&nbsp;&nbsp;<fmt:formatDate value="${requestScope.tbforum.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
		</thead>
		<tbody id="group_one">
						<tr>
							<td class="td_style_div1" title="" >
							<div style="overflow-x: auto; overflow-y: auto; height: 540px; width:100%;">
							<table id="table1" border="0" width="100%">
								<tr>
									<td class="td_style_div1" title="${requestScope.tbforum.subject }" >
									<my:scriptEscape value="${requestScope.tbforum.content}"/>
									</td>
								</tr>
							</table>
							</div>
							</td>
							
						</tr>
		</tbody>
	</table>
	<br/><br/>
</body>
</html>
<script type="text/javascript">
	window.parent.document.getElementById("gzdt").innerHTML="居民论坛";
	window.parent.document.getElementById("gd").innerHTML="<span onclick='first()' style='cursor:hand;'>首页</span><span onclick='sec(2)'>>>论坛</span>>><font style='cursor:Default;'>详情</font>";

</script>
