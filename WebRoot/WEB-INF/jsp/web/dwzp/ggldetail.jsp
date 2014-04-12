<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>


<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/DialogBySHF.min.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/stylegd.css" />
	<script src="<%=request.getContextPath()%>/resource/js/page.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/jquery-1.7.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/DialogBySHF.min.js"></script>
</head>

<style>
a:link{text-decoration:none;}
a:visited{text-decoration:none;}
a:hover{text-decoration:underline;} 
</style>
<body>
	<table id="table1" border="0" width="100%">
	<c:if test="${notices==null }">
	暂无公告
	</c:if>
	<c:forEach var="j" items="${notices }" varStatus="status">
		<thead>
			<tr >
				<th class="td_style_div1" width="100%"  style="text-align:center;"><c:out value="${j.jz.noticeTitle }" /></th>
			</tr>
				<tr >
				<td class="td_style_div" width="100%"  style="text-align:center;font-size:11px;">发送人：<my:outTrueName id="${j.jz.noticeSendId}"/>&nbsp;&nbsp;<fmt:formatDate value="${j.jz.noticeCreateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
		</thead>
		<tbody id="group_one">
				<tr target="id" rel="${j.jz.id }">
					<td class="td_style_div1">
					
					<div style="overflow-x: auto; overflow-y: auto; height: 580px; width:100%;">
							<table id="table1" border="0" width="100%">
								<tr>
									<td class="td_style_div1" title="${j.content }" >
									<my:scriptEscape value="${j.content }"/>
									</td>
								</tr>
							</table>
							</div>
					
					
					</td>
					
					
				</tr>
			
		</tbody>
		</c:forEach>
	</table>
	<div style="text-align:right;">文档下载：
		<c:forEach var="file" items="${filelist }" varStatus="files">
			<a onclick="down('${file.id }')" >${file.fileName }</a>&nbsp;&nbsp;
		</c:forEach>
	</div>
</body>
</html>
<script type="text/javascript">
	window.parent.document.getElementById("gzdt").innerHTML="公告";
	window.parent.document.getElementById("gd").innerHTML="<span onclick='first()' style='cursor:hand;'>首页</span><span onclick='sec(1)' style='cursor:hand;'>>>通知公告</span>>><font style='cursor:Default;'>详情</font>";
	function down(id){
		$.post("downfile.do?id="+id,function(date){
			if(date==0){
			}else if(date==2){
				//alertMsg.info(date);
				//alert("此文件已经删除，不能下载！！");
				$.DialogBySHF.Alert({ Width: 300, Height: 150, Title: "提示信息", Content: "<font size='2'>此文件已经删除，不能下载!</font>" });
			}else{
				//alert("下载文件异常，请联系管理员！！");
				$.DialogBySHF.Alert({ Width: 300, Height: 150, Title: "提示信息", Content: "<font size='2'>下载文件异常，请联系管理员！</font>" });
			}
		 }
		);
	}
</script>
