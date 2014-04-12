<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：系统管理--部门管理
--%>

<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>部门管理</span></a></li>
					
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<!-- 部门管理 -->
			<div>
				<!-- 左侧部门选项   reStyleSize='w' 设置此元素可以改变宽度,鼠标拉动改变  -->
				<div  layoutH="44"  style="float:left; display:block; overflow:auto; width:270px; border:solid 1px #CCC; line-height:21px; background:#fff">
				  
				  	<ul id="dept_gl_tree" class="ztree"></ul>
				  
					
				</div>
				<!-- 右侧 -->
				<div id="${param.rel }_box" class="unitBox" >
					<my:validationAuthority url="dept/addPage.do">
						<%@ include file="/WEB-INF/jsp/system/organize/dept/add.jsp"%>
					</my:validationAuthority>					
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
			var zNodes = new Array();
			$.each(json, function(i, d){
				zNodes.push({id : d.id,name : d.deptName,
					pId : d.superId,href:"dept/updatePage.do?id="+d.id+"&rel="+rel,dwzTarget:"ajax",
					rel:rel+"_box",open:true});
			});
			$.fn.zTree.init($("#dept_gl_tree"), setting, zNodes);
		}
	});
	
</script>	

	

