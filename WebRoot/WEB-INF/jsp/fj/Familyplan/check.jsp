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
				
<form method="post" action="Familyplan/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
				
	<input type="hidden" id="rkjsguid" name="rkjsguid" value="${requestScope.r.rkjsguid }"/>		
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
			<dt width="10%">妇女编号：</dt>
				<dd>
					<input type="text"  name="fnbh" id ="fnbh" value ="${requestScope.r.fnbh }" disabled />
				</dd>
				</dl>
			<dl>
			<dt width="10%">是否自管育龄妇女：</dt>
				 <dd>
				 	<select name="sfzgylfn" id="sfzgylfn" disabled>
				 	<option value="">请选择</option>
					<option value="是" <c:if test="${requestScope.r.sfzgylfn=='是' }">selected</c:if>>是</option>
					<option value="否" <c:if test="${requestScope.r.sfzgylfn=='否' }">selected</c:if>>否</option>
				 	</select>
				 </dd>
				</dl>
				<dl>
				<dt width="10%">是否计生协会志愿者：</dt>
				 <dd>
				 	<select name="sfxhzyz" id="sfxhzyz" disabled>
				 	<option value="">请选择</option>
					<option value="是" <c:if test="${requestScope.r.sfxhzyz=='是' }">selected</c:if>>是</option>
					<option value="否" <c:if test="${requestScope.r.sfxhzyz=='否' }">selected</c:if>>否</option>
				 	</select>
				 </dd>
				 </dl>
			<dl>
				<dt >是否计生协会会员：</dt>
				 <dd>
				 	<select name="sfxhhy" id="sfxhhy" disabled>
				 		<option value="">请选择</option>
					<option value="是" <c:if test="${requestScope.r.sfxhhy=='是' }">selected</c:if>>是</option>
					<option value="否" <c:if test="${requestScope.r.sfxhhy=='否' }">selected</c:if>>否</option>
				 	</select>
				 </dd>
				 	 </dl>
				 <dl>
				 <dt width="10%">流入流出：</dt>
				 <dd>
				 	<select name="lrlc" id="lrlc" disabled>
				 		<option value="">请选择</option>
					<option value="流入" <c:if test="${requestScope.r.lrlc=='流入' }">selected</c:if>>流入</option>
					<option value="流出" <c:if test="${requestScope.r.lrlc=='流出' }">selected</c:if>>流出</option>
				 	</select>
				 </dd>
				 </dl>
			<dl>
				<dt >何处流入：</dt>
				<dd>
					<input type="text"  name="hclr" id="hclr"  value ="${requestScope.r.hclr }" disabled/>
				</dd>
			</dl>
			<dl>
				<dt width="10%">何时流入：</dt>
				 <dd>
				 	<input type="text"  name="hslr" id="hslr" class="date" value ="${requestScope.r.hslr }" disabled/>
				 </dd>
				 </dl>
			<dl>
				 <dt width="10%">何处流出：</dt>
				 <dd>
				 	<input type="text" name="hclc" id="hclc" value ="${requestScope.r.hclc }" disabled/>
				 </dd>
			</dl>
			<dl>
				<dt width="10%">何时流出：</dt>
				 <dd>
				 	<input type="text" name="hslc" id="hslc" class="date" value ="${requestScope.r.hslc }" disabled/>
				 </dd>
				 </dl>
			<dl>
				<dt width="10%">迁入迁出：</dt>
				<dd>
					<select name="qrqc" id="qrqc" disabled>
				 		<option value="">请选择</option>
				 		<option value="迁入" <c:if test="${requestScope.r.qrqc=='迁入' }">selected</c:if>>迁入</option>
					<option value="迁出" <c:if test="${requestScope.r.qrqc=='迁出' }">selected</c:if>>迁出</option>
				 		
				 	</select>
				</dd>
			</dl>
			<dl>
				<dt width="10%">何处迁入：</dt>
				 <dd>
				 	<input type="text"  name="hcqr" id="hcqr"  value ="${requestScope.r.hsqc }" disabled/>
				 </dd>
				 </dl>
			<dl>
				 <dt width="10%">何时迁入：</dt>
				 <dd>
				 	<input type="text" name="hsqr" id="hsqr" class="date"  value ="${requestScope.r.hsqr }" disabled/>
				 </dd>
			</dl>
			<dl>
				<dt width="10%">何处迁出：</dt>
				 <dd>
				 	<input type="text" name="hcqc" id="hcqc" value ="${requestScope.r.hcqc }" disabled />
				 </dd>
				 </dl>
			<dl>
				 <dt width="10%">何时迁出：</dt>
				 <dd>
				 	<input type="text" name="hsqc" id="hsqc" class="date" value ="${requestScope.r.hsqc }" disabled/>
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
					
		

	

