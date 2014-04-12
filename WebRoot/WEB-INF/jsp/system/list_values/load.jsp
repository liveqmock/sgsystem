<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--字典值管理
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>数据字典</span></a></li>
					
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<!-- 字典值类型 -->
			<div fillSpace="sidebar" >
				<!-- 左侧部门选项 -->
				<div layoutH="44" style="float:left; display:block; overflow:auto; width:200px; border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
				  	
				  	<ul id="list_values_type_tree" class="ztree"></ul>
				  
				    
				</div>
				<!-- 右侧 -->
				<div id="${param.rel }_box" class="unitBox" >
						
						<img src="resource/images/big/arrow_left_48.png" style="vertical-align: middle;"/>
						<span style="font-weight: bold;">请先点击左侧选择类型</span>
					
					
				</div>
	
			</div>
			
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>

<script type="text/javascript">
	
	
	$.ajax({
		url:"dept/load/all.do",
		cache: false,
		dataType:"json",
		success:function(json){
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
			var zNodes = [
				{id:1,name:"通知类型",href:"list/query.do?listType=1"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:2,name:"会议类型",href:"list/query.do?listType=2"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:3,name:"新闻类型",href:"list/query.do?listType=3"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:4,name:"通讯录分组",href:"list/query.do?listType=4"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:5,name:"日志类型",href:"list/query.do?listType=5"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:6,name:"日程类型",href:"list/query.do?listType=6"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:7,name:"公告类型",href:"list/query.do?listType=7"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:11,name:"员工类型",href:"list/query.do?listType=11"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:12,name:"职位",href:"list/query.do?listType=12"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:13,name:"学历",href:"list/query.do?listType=13"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:14,name:"离职原因",href:"list/query.do?listType=14"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:15,name:"退休原因",href:"list/query.do?listType=15"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:16,name:"办公用品类型",href:"list/query.do?listType=16"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:17,name:"工作流程类型",href:"list/query.do?listType=17"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
				,{id:17,name:"所属社区",href:"list/query.do?listType=21"+"&rel="+rel+"_box",dwzTarget:"ajax",rel:rel+"_box"}
			
			];
			$.fn.zTree.init($("#list_values_type_tree"), setting, zNodes);
			
			
		}
	});

</script>	
	

