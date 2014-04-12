<%@ page pageEncoding="UTF-8"%>
	
		<link href="resource/css/font-size-12/font-size.css" rel="stylesheet" type="text/css" media="screen"/>
		<link href="resource/js/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
		<link href="resource/js/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
		<link href="resource/js/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
		<link href="resource/js/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
		
		<%--其他--%>
		<link href="resource/css/main.css" rel="stylesheet" type="text/css" />
		
		<!--[if IE]>
		<link href="resource/js/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
		<![endif]-->
		
		<!--[if lte IE 9]>
		<script src="resource/js/dwz/js/speedup.js" type="text/javascript"></script>
		<![endif]-->
		
		<%-- 优先加载百度CDN  jquery --%>
		<script src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
		<%-- 若失败，再加载本地  jquery --%>
		<script type="text/javascript">
			<!--
				window.jQuery || document.write('<script src="resource/js/jquery-1.8.3.min.js" type="text/javascript"></script>');
			 //-->
	 	</script>
	
		<script src="resource/js/dwz/js/jquery.cookie.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/jquery.validate.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
		<script src="resource/js/xheditor/xheditor-1.1.14-zh-cn.min.js" type="text/javascript"></script>
		<script src="resource/js/uploadify/scripts/jquery.uploadify.min.js" type="text/javascript"></script>
		
		<%-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+
		<script type="text/javascript" src="resource/js/dwz/chart/raphael.js"></script>
		<script type="text/javascript" src="resource/js/dwz/chart/g.raphael.js"></script>
		<script type="text/javascript" src="resource/js/dwz/chart/g.bar.js"></script>
		<script type="text/javascript" src="resource/js/dwz/chart/g.line.js"></script>
		<script type="text/javascript" src="resource/js/dwz/chart/g.pie.js"></script>
		<script type="text/javascript" src="resource/js/dwz/chart/g.dot.js"></script>
		
		--%>
		<%--加载dwz --%>
		<script src="resource/js/dwz/js/dwz.core.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.util.date.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.validate.method.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.drag.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.tree.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.accordion.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.ui.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.theme.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.contextmenu.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.navTab.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.tab.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.resize.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.dialog.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.stable.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.ajax.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.pagination.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.database.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.effects.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.panel.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.history.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.combox.js" type="text/javascript"></script>
		<script src="resource/js/dwz/js/dwz.print.js" type="text/javascript"></script>
		<!--
		<script src="bin/dwz.min.js" type="text/javascript"></script>
		-->
		<script src="resource/js/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
		
		<%-- 其他 JS --%>
		<!-- 自定义标签校验方法 -->
		<!-- <script src="resource/js/add.validate.method.js" type="text/javascript"></script> -->
		
		<!-- 可改动元素宽高 -->
		<script src="resource/js/reSize.js" type="text/javascript"></script>
		
		<script src="resource/js/zTree/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="resource/js/zTree/zTreeStyle/zTreeStyle.css" type="text/css"/>
		<script src="resource/js/dwz_zTree.js" type="text/javascript"></script>
		
		<%-- 弹出框 --%>
		<script src="resource/js/artDialog/jquery.artDialog.js?skin=default" type="text/javascript"></script>
		<%-- 上传input 浏览选择按钮美化 --%>
		<script src="resource/js/jquery.filestyle.js" type="text/javascript"></script>
		
		
		<!-- 百度编辑器 -->
		
		<script type="text/javascript" src="resource/js/ueditor/ueditor.config.js" charset="utf-8"></script>
		<script type="text/javascript" src="resource/js/ueditor/ueditor.all.js" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="resource/js/ueditor/themes/default/css/ueditor.css"/>
		
		<!-- My97DatePicke -->
		<script type="text/javascript" src="resource/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
		
		<!-- 清空表单 -->
		<script type="text/javascript" src="resource/js/form_reset.js" charset="utf-8"></script>
		
		<!-- select列表查询 -->
		<script type="text/javascript" src="resource/js/dwz_utils.js" charset="utf-8"></script>
		
		<!-- js工具  -->
		<script src="resource/js/util.js" type="text/javascript"></script>
		<%--加密 --%>
		<script src="resource/js/security/security.js"></script>
		
		<!-- 最后加载初始化js -->
		<script src="resource/js/init.js" type="text/javascript"></script>
	
		