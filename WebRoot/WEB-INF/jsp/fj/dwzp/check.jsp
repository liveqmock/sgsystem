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
				
<form method="post" action="dwzp/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
				
	<div class="pageFormContent"
			style=" padding-left: 20px;"
			layoutH="60">
				<dl style="margin-top: 3px;">
			<dt width="10%">单位名称：</dt>
				<dd>
					<input type="text"  name="dwmc" id ="dwmc" value ="${requestScope.r.dwmc }"   disabled/>
					<input type="hidden"  name="dwzpguid" id ="dwzpguid"  value ="${requestScope.r.dwzpguid }"   />
				</dd>
				</dl>
			<dl>
			<dt width="10%">单位地址：</dt>
				 <dd>
				<input type="text"  name="dwdz" id ="dwdz" value ="${requestScope.r.dwdz }"  disabled/>
				 </dd>
				</dl>
				<dl>
				<dt width="10%">需求岗位：</dt>
				 <dd>
				 	<input type="text"  name="xqgw" id ="xqgw" value ="${requestScope.r.xqgw }"  disabled />
				 </dd>
				 </dl>
			<dl>
				<dt >需求人数：</dt>
				 <dd>
				 	<input type="text"  name="xqrs" id ="xqrs" value ="${requestScope.r.xqrs }"  class="number" disabled />
				 </dd>
		  </dl>
		  <dl>
			<dt >性别要求：</dt>
				 <dd>
				 	<select name="xbyq" id="xbyq"  disabled>
				 	<option value="无" <c:if test="${requestScope.r.xbyq=='无' }">selected</c:if>>无</option>
					<option value="男" <c:if test="${requestScope.r.xbyq=='男' }">selected</c:if>>男</option>
					<option value="女" <c:if test="${requestScope.r.xbyq=='女' }">selected</c:if>>女</option>
				 	</select>
				 </dd>
				</dl>
				<dl>
				<dt >薪金待遇：</dt>
				 <dd>
				 	<input type="text"  name="xzdy" id ="xzdy" value ="${requestScope.r.xzdy }"  class="number" disabled/>
				 </dd>
		  </dl>
				  	<dl>
				<dt >联系人：</dt>
				 <dd>
				 	<input type="text"  name="lxr" id ="lxr" value ="${requestScope.r.lxr }"   disabled/>
				 </dd>
		  </dl>
		  	  	<dl>
				<dt >联系人电话：</dt>
				 <dd>
				 	<input type="text"  name="lxrdh" id ="lxrdh" value ="${requestScope.r.lxrdh }"   disabled/>
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
					
		

	

