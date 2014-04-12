<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/stylegd.css" />
</head>
<body>
	<div>
		<div class="let_page">
			<!--头部-->
			<div class="h_let_page"></div>
			<!--登录-->
			<div class="l_let_page">
				<div class="login_div">
					<img src="images/sqlt_41.png" />
				</div>
				<div class="lbl_login">网上办公登陆</div>
			</div>
			<div class="tb_let_page">
				<table>
					<tbody>
						<tr>
							<td id="login">用&nbsp;户&nbsp;名：</td>
							<td><input type="text" style="width:150px;">
							</td>
						</tr>
						<tr>
							<td id="login">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
							<td><input type="password" style="width:150px;" />
							</td>
						</tr>
						<tr>
							<td id="login">类&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
							<td><select><option>客户</option>
							</select>
							</td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit" value=""
								style="background-image:url(images/login.png);width: 85px;height: 26px;border: 0;background-repeat: no-repeat;cursor:pointer;margin-left:34px; ">&nbsp;&nbsp;
								 <input type="button" onclick="fun()" value="" style="background-image:url(images/regist.png);width: 85px;height: 26px;border: 0;background-repeat: no-repeat;cursor:pointer;">
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="gonggao">
				<label class="mes_lab">公 告 栏</label> <label class="mes_lab_more"><a href="web/dwzp.do?bz=ggl" target="_blank" >更多</a></label>
			</div>
			<div class="mess_div">
				<ul>
					<c:forEach items="${requestScope.notices }" var="nots">
						<li><a href="web/dwzp.do?bz=ggldetail&id=${nots.id }" target="_blank" ><c:out value="${nots.noticeTitle }"></c:out>
						</a>
						</li>
					</c:forEach>

				</ul>
			</div>
			<!--表格下载-->
			<div class="biaoge_div_css">
				<div>
					<div class="quxian_div">
						<div class="xian_div_name">便民服务</div>
						<div class="xian_div_more">更多</div>
					</div>
					<div class="xian_content">
						<div class="xian_img">
							<a href="http://www.longdingbaojie.com/" target="_blank"><img
								src="<%=request.getContextPath()%>/images/map_03.jpg" /> </a>
						</div>
						<div class="xian_img">
							<a href="http://www.jnhouse.com/fczj/" target="_blank"><img
								src="<%=request.getContextPath()%>/images/map_05.jpg" /> </a>
						</div>
						<div class="xian_img">
							<a href="http://www.jnqczz.com.cn/" target="_blank"><img
								src="<%=request.getContextPath()%>/images/map_09.jpg" /> </a>
						</div>
						<div class="xian_img">
							<a href="http://www.jhgl.cn/index.html" target="_blank"><img
								src="<%=request.getContextPath()%>/images/map_10.jpg" /> </a>
						</div>
						<div class="xian_img">
							<a
								href="http://theater.mtime.com/China_Shandong_Province_Jinan/cinema/"
								target="_blank"><img
								src="<%=request.getContextPath()%>/images/map_13.jpg" /> </a>
						</div>
						<div class="xian_img">
							<a href="http://www.jnslyy.com/" target="_blank"><img
								src="<%=request.getContextPath()%>/images/map_14.jpg" /> </a>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
function fun(){
	var ie = !-[1,]; 
if(ie){
window.open("dwzp.do?bz=rigistload");
}else{
	window.open("web/dwzp.do?bz=rigistload");
}
}
</script>
