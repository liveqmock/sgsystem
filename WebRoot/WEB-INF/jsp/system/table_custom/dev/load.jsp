
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--导出打印自定义管理
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>自定义设置管理</span></a></li>
					
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<div fillSpace="sidebar" >
				<!-- 左侧 -->
				<div layoutH="44" style="float:left; display:block; overflow:auto; width:150px; border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
				  	
				  	<ul id="table_custom_type" class="ztree"></ul>
				  
				    
				</div>
				<!-- 右侧 -->
				<div id="${param.rel }_box" class="unitBox" >
						<img src="resource/images/big/arrow_left_48.png" style="vertical-align: middle;"/>
						<span style="font-weight: bold;">请先点击左侧选择模块</span>
				</div>
	
			</div>
			
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>

<script type="text/javascript">
	var setting = {
			view: {
				dblClickExpand: false,
				showIcon: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: zTreeClick
			}
	};
	var rel='<%= request.getParameter("rel") %>';
	var zNodes =[
			  {id : 0,name : "登陆日志",href:"tableCustom/dev/query.do?tbType=1&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
			  ,{id : 1,name : "任务分配",href:"tableCustom/dev/query.do?tbType=2&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
			  ,{id : 1,name : "各区月任务总量",href:"tableCustom/dev/query.do?tbType=3&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
			  ,{id : 1,name : "各区每个员工月任务",href:"tableCustom/dev/query.do?tbType=4&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
			  ,{id : 1,name : "任务审核",href:"tableCustom/dev/query.do?tbType=5&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
			  ,{id : 1,name : "个人年终报表",href:"tableCustom/dev/query.do?tbType=6&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
			  ,{id : 7,name : "个人积分详情",href:"tableCustom/dev/query.do?tbType=7&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
			  ];
	
	
	
	$.fn.zTree.init($("#table_custom_type"), setting, zNodes);
	
</script>	
	

