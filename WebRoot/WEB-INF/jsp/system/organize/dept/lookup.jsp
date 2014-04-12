<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 部门管理--查找带回(单选)
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>树状结构</span></a></li>
					<li><a href="dept/lookUp.do" target="ajax" rel="dept_lookup_box"><span>列表查询</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			
			
				
			<div layoutH="45" style="display:block; overflow:auto;  border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
				  	
				 <ul id="dept_lookup_tree" class="ztree"></ul>
			
			</div>
			<div id="dept_lookup_box" class="unitBox">
				
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
					}
			};
			var type='<%= request.getParameter("type") %>';
			
			var zNodes = new Array();
			if(type==3){
				zNodes.push({id : 0,name : "根部门",open:true,click:"$.bringBack({id:'0',name:'无上级'})"});
			}
			$.each(json, function(i, d) {
				
				zNodes.push({id : d.id,name : d.deptName,
					pId : d.superId,open:true,click:"$.bringBack({id:'"+d.id+"',name:'"+d.deptName+"'})"});
				
			});
			
			$.fn.zTree.init($("#dept_lookup_tree"), setting, zNodes);

		}
	});
	
</script>	

	

