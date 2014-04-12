<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
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

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/style.css" />
</head>

<body>
	<div class="tu_name">
		<div class="tu_img">
			<img src="images/tu.png" />
		</div>
		<div class="tab_div_city">
			<table>
				<tbody>
					<c:forEach var="xw" items="${news }">
						<tr>
							<td><img src="<%=request.getContextPath()%>/images/kong.png" />
							</td>
							<td class="td_style_div"><a href="web/dwzp.do?bz=newsdetail&id=${xw.id }"  target="_blank">${xw.newstitle}</a>
							</td>
							<td><fmt:formatDate value="${xw.createdtime}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="div_fa">

		<div class="div_fa_name">
			<div class="fa_name">法律法规</div>
			<div style="float: left;margin-left: 16px;margin-top: 10px;">
				<img src="images/sqlt_41.png">
			</div>
			<a href="#"><div class="fa_name_more">更多</div> </a>
		</div>
		<div class="tab_content">
			<table>
				<tbody>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="div_banshi">

		<div class="div_banshi_content">
			<div class="banshi_name">办事指南</div>
			<div style="float: left;margin-left: 16px;margin-top: 10px;">
				<img src="images/sqlt_41.png">
			</div>
			<a href="#"><div class="banshi_more">更多</div> </a>
		</div>
		<div class="tab_content">
			<table>
				<tbody>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
					<tr>
						<td><img src="images/kong.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民</td>
						<td>[04-10]</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="nianshen_div"></div>
	<div class="nianshen_div_content">

		<div class="nianshen_div_img">
			<div class="nianshen_name">单位招聘</div>
			<div class="nianshen_img">
				<img src="images/sqlt_41.png">
			</div>
			<a href="web/dwzp.do?bz=dwzps" target="_blank"><div class="nianshen_more" ><font style="cursor:hand;">更多</font></div> </a>
		</div>
		<div class="tab_content">
			<table>
				<tbody>
					<tr>

						<td colspan="2" class="td_style_div">职位名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="td_style_div">单位名称</td>
					</tr>
					<c:forEach items="${requestScope.pensions}" var="pe">
						<tr>
							<td><img src="images/sqlt_45.png" />
							</td>
							<td class="td_style_div"><a  href="web/dwzp.do?bz=dezpdetail&id=${pe.dwzpguid }" target="_blank" >${pe.xqgw }</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td class="td_style_div">${pe.dwmc }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="weiquan_div">

		<div class="weiquan_content">
			<div class="weiquan_name">个人求职</div>
			<div class="weiquan_img">
				<img src="images/sqlt_41.png">
			</div>
			<a href="web/dwzp.do?bz=grqz" target="_blank"><div class="weiquan_more"><font style="cursor:hand;">更多</font></div> </a>
		</div>
		<div class="tab_content">
			<table>
				<tbody>
				<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="td_style_div">求职岗位${gr.qzgws }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="td_style_div">发布时间${gr.djsjs }</td>
					</tr>
				<c:forEach items="${grqz }" var="gr">
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">${gr.rk.xm }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="td_style_div">${gr.qzgws }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="td_style_div">${gr.djsjs }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div class="case_div">

		<div class="case_content">
			<div class="case_name">案件分析</div>
			<div class="case_img">
				<img src="images/sqlt_41.png">
			</div>
			<a href="#"><div class="case_more">更多</div> </a>
		</div>
		<div class="tab_content">
			<table>
				<tbody>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="question_div">

		<div class="question_content">
			<div class="question_name">常见问题</div>
			<div class="question_img">
				<img src="images/sqlt_41.png">
			</div>
			<a href="#"><div class="question_more">更多</div> </a>
		</div>
		<div class="tab_content">
			<table>
				<tbody>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
					<tr>
						<td><img src="images/sqlt_45.png" />
						</td>
						<td class="td_style_div">全面开展城镇居民基本医疗保险工镇居民基本医疗保险工作</td>

					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	window.parent.document.getElementById("gzdt").innerHTML="工作动态";
	window.parent.document.getElementById("gd").innerHTML="更多";
function zp(){
	//window.parent.document.getElementById("rightframe").src="web/dwzp.do";
	window.open ("web/dwzp.do", "newwindow", "height=800, width=800, top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
}
</script>
