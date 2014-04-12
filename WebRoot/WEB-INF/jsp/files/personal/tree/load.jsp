<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人文档管理--树状模式
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>个人文档管理</span></a></li>
					
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			
			<div fillSpace="sidebar" >
				<!-- 左侧选项 -->
				<div layoutH="44" style="float:left; display:block; overflow:auto; width:270px; border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
				  	
				  	<ul id="personalFiles_tree" class="ztree"></ul>
				  
				    
				</div>
				<!-- 右侧 -->
				<div id="${param.rel }_box" class="unitBox" >
						
						<img src="resource/images/big/arrow_left_48.png" style="vertical-align: middle;"/>
						<span style="font-weight: bold;">请先点击左侧选择目录</span>
					
					
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
		url:"personalFiles/tree/allNode.do",
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
			var zNodes = new Array();
			zNodes.push({id : 0,name : "个人文档",href:"personalFiles/tree/query.do?wdSuperId=0&rel="+rel+"_box",dwzTarget:"ajax",
				rel:rel+"_box",open:true});
			$.each(json, function(i, d) {
				
				zNodes.push({id : d.id,name : d.name,pId : d.pId,href:"personalFiles/tree/query.do?wdSuperId="+d.id+"&rel="+rel+"_box",dwzTarget:"ajax",
					rel:rel+"_box",open:true});
				
			});
			
			$.fn.zTree.init($("#personalFiles_tree"), setting, zNodes);
			
			
		}
	});

</script>	
	

