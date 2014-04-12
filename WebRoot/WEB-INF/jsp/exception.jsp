<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" session="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>舜耕便民服务信息管理</title>
	<meta http-equiv=content-type content="text/html; charset=utf-8">
	<meta http-equiv="refresh" content="2;url=<%=basePath%>main.do">
	<style type=text/css>
		td{
			font-size: 12px;
			font-family: tahoma,sans-serif
		}
	</style>
</head>
<body style="font-size: 12px;font-family: tahoma,sans-serif;background-color: #cccccc">
	<table height="95%" cellspacing=0 cellpadding=0 width="100%" align=center border=0>
		<tbody>
			<tr valign=center align=middle>
				<td>
					<table cellspacing=0 cellpadding=0 width=468 bgcolor=#ffffff
						border=0>
						<tbody>
							<tr>
								<td width=20 background="resource/images/error/rbox_1.gif" height=20></td>
								<td width=108 background="resource/images/error/rbox_2.gif" height=20></td>
								<td width=56><img height=20 src="resource/images/error/rbox_ring.gif" width=56></td>
								<td width=100 background="resource/images/error/rbox_2.gif"></td>
								<td width=56><img height=20 src="resource/images/error/rbox_ring.gif" width=56></td>
								<td width=108 background="resource/images/error/rbox_2.gif"></td>
								<td width=20 background="resource/images/error/rbox_3.gif" height=20></td>
							</tr>
							<tr>
								<td align=left background="resource/images/error/rbox_4.gif" rowspan=2></td>
								<td align=middle bgcolor=#eeeeee colspan=5 height=50>
									<p>
										<strong>抱歉，服务器出错...&#8230;&#8230;<br><br></strong>
									</p>
								</td>
								<td align=left background="resource/images/error/rbox_6.gif" rowspan=2></td>
							</tr>
							<tr>
								<td align=left colspan=5 height=80>
									<p align=center>
										<br>
									<p id=lid2>请选择您要进行的下一步操作：</p>
									<ul>
										<li id=list1>等待，约2秒钟后跳转到首页。<br>
										<li id=list2>自己动手转到 <a href="main.do">系统</a> 主页。
										<li id=list3>单击<a href="javascript:history.back(1)">后退</a>按钮。
										</li>
									</ul>
									<div align=right>
										<br/>舜耕便民服务信息管理
									</div>
								</td>
							</tr>
							<tr>
								<td align=left background="resource/images/error/rbox_7.gif" height=20></td>
								<td align=left background="resource/images/error/rbox_8.gif" colspan=5 height=20></td>
								<td align=left background="resource/images/error/rbox_9.gif" height=20></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
