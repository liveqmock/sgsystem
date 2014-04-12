
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-通讯录-公共通讯录
--%>
<div class="pageContent" style="padding:1px" >

	<div class="tabs" >
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>公共通讯录</span></a></li>
					
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<!-- 公共通讯录管理 -->
			<div fillSpace="sidebar" >
				<!-- 左侧分组选项 -->
					<div layoutH="44"  style="float:left; display:block; overflow:auto; width:150px; border:solid 1px #CCC;line-height:21px; background:#fff;margin-right: 5px;">
				  		
				  	<ul id="public_addressBook_true" class="ztree"></ul>
				  
				    
				</div>
				<!-- 右侧 -->
				<div id="${param.rel }_box" class="unitBox" >
						
						<%@ include file="/WEB-INF/jsp/personalOffice/addressBook/public/query.jsp" %>
					
					
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
	var depts=eval("("+'<%= request.getAttribute("depts").toString() %>'+")");
	var zNodes = new Array();
	zNodes.push({id : 0,name : "全部分组",open:true,href:"public/queryGroup.do?id="+"&rel="+rel,dwzTarget:"ajax",rel:rel+"_box",open:true});
	$.each(depts, function(i, d) {
		
		zNodes.push({id : d.id,name : d.gaName,href:"public/queryGroup.do?peGrouping="+d.id+"&rel="+rel,dwzTarget:"ajax",
			rel:rel+"_box",open:true});
		
	});
	
	$.fn.zTree.init($("#public_addressBook_true"), setting, zNodes);
	
</script>	
	

