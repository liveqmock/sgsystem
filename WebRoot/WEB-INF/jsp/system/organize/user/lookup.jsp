<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 用户管理--查找带回
--%>
<div class="pageContent" style="padding:1px" >

	
	<!-- 左侧部门选项 -->
	<div layoutH="3" style="float:left; display:block; overflow:auto; width:270px;border:solid 1px #CCC;border-left: none;margin-right: 2px;">
	  	
	  	<ul id="lookup_deptLb_tree" class="ztree"></ul>
	  
	    
	</div>
	<!-- 右侧 -->
	<div id="user_lookup_box" class="unitBox" >
			<img src="resource/images/big/arrow_left_48.png" style="vertical-align: middle;"/>
			<span style="font-weight: bold;">请先点击左侧选择部门</span>
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
			var type='<%= request.getParameter("type") %>';
			var zNodes = new Array();
			zNodes.push({id : 0,name : "全部部门",open:true,href:"user/lookUp.do?deptId="+"&type="+type,dwzTarget:"ajax",rel:"user_lookup_box",open:true});
			$.each(json, function(i, d) {
				
				zNodes.push({id : d.id,name : d.deptName,pId : d.superId,href:"user/lookUp.do?deptId="+d.id+"&type="+type,dwzTarget:"ajax",
					rel:"user_lookup_box",open:true});
				
			});
			
			$.fn.zTree.init($("#lookup_deptLb_tree"), setting, zNodes);

		}
	});
	
	

	
</script>					
	

	

