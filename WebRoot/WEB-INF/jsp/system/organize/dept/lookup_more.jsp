<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 部门管理--查找带回(多选)
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
			
			<div style="background:#fff; border-left:solid 1px #CCC;border-right:solid 1px #CCC;">
				<div class="pageFormContent" layoutH="98">
				 <ul id="dept_lookup_tree" class="ztree"></ul>
				</div>
				<div class="formBar">
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeExpandAllNodes('dept_lookup_tree',true)">展开</button>
						</div>
					</div>
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeExpandAllNodes('dept_lookup_tree',false)">合并</button>
						</div>
					</div>
					
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeCheckAllNodes('dept_lookup_tree',true)">全选</button>
						</div>
					</div>
					<div class="button" style="margin-left: 5px;">
						<div class="buttonContent">
							<button type="button" onclick="zTreeCheckAllNodes('dept_lookup_tree',false)">全部取消 </button>
						</div>
					</div>
					
					<ul style="float:left;">
						<li >
							<div class="buttonActive" >
								<div class="buttonContent">
									<button type="button"  onclick="deptlookupCheck(1)">覆盖选择</button>							
								</div>
							</div>
						</li>
						<li >
							<div class="buttonActive" >
								<div class="buttonContent">	
									<button type="button"  onclick="deptlookupCheck(2)">追加选择</button>
								</div>
							</div>
						</li>
						<li>
							<div class="button" >
								<div class="buttonContent">
									<button type="button" class="close">取消</button>
								</div>
							</div>
						</li>
						
					</ul>
				</div>
				
				
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
					check: {
						enable: true,
						chkStyle: "checkbox",
						chkboxType: { "Y": "", "N": "" }
					},
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
			var zNodes = new Array();
			$.each(json, function(i, d) {
				zNodes.push({id : d.id,name : d.deptName,
					pId : d.superId,open:true});
			});
			$.fn.zTree.init($("#dept_lookup_tree"), setting, zNodes);

		}
	});
	
	function deptlookupCheck(type){
		var treeObj = $.fn.zTree.getZTreeObj("dept_lookup_tree");
		
		//获取所有改变的节点
		var nodes = treeObj.getChangeCheckedNodes();
		
		if(nodes.length==0){
			alertMsg.error("未更改，无需保存");
			return false;
		}
		args={};
		for ( var i = 0,k=nodes.length; i <k ; i++) {
			var node=nodes[i];
			var id = args["id"] ? args["id"]+"," : "";
			args["id"] =id+node.id;
			var name = args["name"] ? args["name"]+"," : "";
			args["name"] =name+node.name;
		}
		if(type==1){
			$.bringBack(args);
		}else{
			$.appendBringBackSuggest(args);
			$.pdialog.closeCurrent();
		}
		return true;
		
	};
	
	
</script>	
			
	

	

