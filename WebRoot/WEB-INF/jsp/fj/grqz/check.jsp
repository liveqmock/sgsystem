<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理--更新角色
--%>
<script type="text/javascript">
function fun(){
	
}
</script>
					
<div class="pageContent" >	
				
<form method="post" action="grqz/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
				
	<div class="pageFormContent"
			style=" padding-left: 20px;"
			layoutH="60">
	
			<dl style="margin-top: 3px;">
				<dt>人员选择：</dt>
				<dd>
				<input type="hidden"  name="rkjbguid" id="rkjbguid" value="${requestScope.r.rkjbguid }"/>
				<input type="text" disabled name="xm" id="xm" value="${requestScope.r.xm }" readonly/>
				</dd>
				
			</dl>
			<dl style="margin-top: 3px;">
			<dt width="10%">登记时间：</dt>
				<dd>
					<input type="text"  name="fnbh" id ="fnbh" value ="${requestScope.r.djsj }" disabled />
				</dd>
				</dl>
			<dl>
			<dt width="10%">求职次数：</dt>
				 <dd>
				 	<input type="text"  name="fnbh" id ="fnbh" value ="${requestScope.r.qzcs }" disabled />
				 </dd>
				</dl>
				<dl>
				<dt width="10%">求职岗位：</dt>
				 <dd>
				 	<input type="text"  name="fnbh" id ="fnbh" value ="${requestScope.r.qzgw }" disabled />
				 </dd>
				 </dl>
			<dl>
				<dt >薪金待遇：</dt>
				 <dd>
				 	<input type="text"  name="fnbh" id ="fnbh" value ="${requestScope.r.xjdy }" disabled />
				 </dd>
				 	 </dl>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
		<div class="formBar">
		
	</div>
	
</form>
</div>	
					
		

	

