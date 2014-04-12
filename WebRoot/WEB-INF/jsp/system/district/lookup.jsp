
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：系统管理--地区管理--查找带回
--%>

<div class="pageContent">
	<div class="pageFormContent" layoutH="58" style="padding-left: 20px;">
		
		<ul id="district_gllookup_tree" class="ztree"></ul>
	
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
		</ul>
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
				onClick: chooseDistrict
			}
	};
	var dis=eval("("+'<%= request.getAttribute("dis") %>'+")");
	var zNodes = new Array();
	$.each(dis, function(i,d) {
		if(d.superId)
		zNodes.push({id : d.id,name : d.disName,pId : d.superId,open:false});
	
	});

	$.fn.zTree.init($("#district_gllookup_tree"), setting, zNodes);
	
	function chooseDistrict(event,treeId, treeNodeJSON){
		var names = new Array();
		names.push(treeNodeJSON.name);
		dgParentNodeName(treeNodeJSON,names);
		names.reverse();
		$.bringBack({name:names.join("-")});
		
	}
	function dgParentNodeName(treeNodeJSON,names){
		var node = treeNodeJSON.getParentNode();
		if(node!=null){
			//去除中国
			if(node.id!="402881ea3f5b1d14013f5b1fdc080006"){
				names.push(node.name);
			}
			dgParentNodeName(node,names);
		}
	}
	
</script>								
						
					
		

	

