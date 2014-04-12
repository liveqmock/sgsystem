<%@ page import="java.text.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>济南市市中区舜耕街道办事处</title>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/style.css" />

</head>
<body>
	<div class="al_page">
		<!--这是头部页面-->
		<div class="he_al_page"></div>
		<div class="content_main">
			<!--左边页面-->
			<iframe src="web/left.do" class="let_pages" frameborder=0
				scrolling=no></iframe>
			<!--右边页面-->
			<div class="rgt_page">
				<!--导航-->
				<div class="rg_page_css"></div>
				<div class="rg_page_css_t">
					<ul class="ul_page_css">
						<a href="/sgsystem/web/web.jsp"><li class="li_page_css">首页</li>
						</a>
						<a href="#"><li class="li_page_css">信息公开</li> </a>
						<a href="#"><li class="li_page_css">办事大厅</li> </a>
						<a href="#">
							<li class="li_page_css">政策法规</li> </a>
						<a href="#"><li class="li_page_css">便民服务</li> </a>
						<a href="#"><li class="li_page_css">资料下载</li> </a>
						<a href="jlhd/jlhd.do"><li class="li_page_css">交流互动</li> </a>
						<a href="#"><li class="li_page_css">投诉举报</li> </a>
					</ul>
				</div>
				<div class="he_page_c">
					<div class="date_css">
						<%
							String datetime = new SimpleDateFormat("yyyy-MM-dd")
									.format(Calendar.getInstance().getTime()); //获取系统时间
							out.println(datetime);
						%>
						<script language="javascript">
							var week1 = "";
							if (new Date().getDay() == 0)
								week = "星期日"
							if (new Date().getDay() == 1)
								week = "星期一"
							if (new Date().getDay() == 2)
								week = "星期二"
							if (new Date().getDay() == 3)
								week = "星期三"
							if (new Date().getDay() == 4)
								week = "星期四"
							if (new Date().getDay() == 5)
								week = "星期五"
							if (new Date().getDay() == 6)
								week = "星期六"
							document.write(week);
						</script>
					</div>
				</div>
				<!--导航-->
				<!--动态-->
				<div class="dt_page_cs"></div>
				<div class="lab_page_cs">工作动态</div>
				<div class="move_div"></div>
				<a href="web/dwzp.do?bz=news" target="_blank"><div class="more_page_cs">更多</div> </a>

				<iframe src="web/right.do" class="tu_name" style="margin: 0px;"
					width="890" height="1000" frameborder=0 scrolling=no
					id="rightframe"></iframe>
			</div>
		</div>
		<!--动态-->
		<!--底部页面-->
		<div class="bottom_div">
			<div class="bottom_div_con">
				<div class="friends_div">友情链接</div>
				<div class="bottom_img">
					<a href="http://bj.58.com/" target="_blank"> <img
						src="<%=request.getContextPath()%>/images/a.png" /> </a>
				</div>
				<div class="bottom_img">
					<a href="http://www.sina.com/" target="_blank"> <img
						src="<%=request.getContextPath()%>/images/aa.png" /> </a>
				</div>
				<div class="bottom_img">
					<a href="http://www.hao123.com/" target="_blank"> <img
						src="<%=request.getContextPath()%>/images/aaa.png" /> </a>
				</div>
				<div class="bottom_img">
					<a href="http://www.baidu.com/" target="_blank"><img
						src="<%=request.getContextPath()%>/images/sqlt_53.png" /> </a>
				</div>
				<div class="bottom_img">
					<a href="http://www.2345.com/" target="_blank"> <img
						src="<%=request.getContextPath()%>/images/sqlt_49.png" /> </a>
				</div>
				<div class="bottom_img">
					<a href="http://www.google.com/" target="_blank"> <img
						src="<%=request.getContextPath()%>/images/sqlt_51.png" /> </a>
				</div>
				<div class="bottom_img">
					<a href="http://www.163.com/" target="_blank"> <img
						src="<%=request.getContextPath()%>/images/b.png" /> </a>
				</div>
				<div class="bottom_img">
					<a href="http://www.autohome.com.cn/jinan/" target="_blank"> <img
						src="<%=request.getContextPath()%>/images/bb.png" /> </a>
				</div>
				<div class="bottom_img">
					<a href="http://www.taobao.com/" target="_blank"> <img
						src="<%=request.getContextPath()%>/images/bbb.png" /> </a>
				</div>
			</div>
		</div>
		<div class="botton_div_xian"></div>
		<div class="bottom_div_content">
			<div style="text-align:center;">
				<p>地址：济南市太平庄北首48号 电话：0531-82596650 邮箱：www.zyidjc@163.com</p>
				<p>
					版权所有：济南市市中区舜耕街道办事处 技术支持：<a href="http://www.sd-hrdz.com"
						target="_blank">山东慧若电子商务有限公司</a>
				</p>
				<p>鲁 icp 2359898653号</p>
			</div>
		</div>
	</div>
</body>
</html>
