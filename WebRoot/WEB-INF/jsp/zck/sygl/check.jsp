<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：失业管理查看详情
--%>
					
<div class="pageContent" >	
				
<form method="post" action="pension/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
				
	<input type="hidden" id="shylguid" name="shylguid" value="${requestScope.r.syryglguid }"/>		
	<div class="pageFormContent nowrap"   layoutH="58">
		<dl style="margin-top: 10px;">
				<dt>姓名：</dt>
				<dd>
					<input type="text" name="xm" id="xm" value="${requestScope.r.xm }" disabled/>
				</dd>
			</dl>
			<dl>
				<dt>性别：</dt>
				<dd>
					男：<input type="checkbox"  id="nan" name="nan" disabled  <c:if test="${requestScope.r.xb=='1' }">checked</c:if>  />女：<input type="checkbox" disabled   id="nv" name="xb"  <c:if test="${requestScope.r.xb=='0' }">checked</c:if> />
				</dd>
			</dl>
			<dl>
				<dt>籍贯：</dt>
				<dd>
					<input type="text" name="jg" id="jg" value="${requestScope.r.jg }" disabled/>
				</dd>
			</dl>
			<dl>
				<dt>身份证号：</dt>
				<dd>
					<input type="text" name="sfzh" id="sfzh" value="${requestScope.r.sfzh }" disabled/>
				</dd>
			</dl>
			<dl>
				<dt>联系电话：</dt>
				<dd>
					<input type="text" name="lxdh" id="lxdh" value="${requestScope.r.lxdh }" disabled/>
				</dd>
			</dl>
			<dl>
				<dt>失业时间：</dt>
				<dd>
					<input type="text"  disabled
						size="30" name="psGraduation"  value="${requestScope.r.sysj }" />
				</dd>
			</dl>
			<dl>
				<dt>失业前单位：</dt>
				<dd>
					<input type="text" id="syqdw" name="syqdw" value="${requestScope.r.syqdw }" disabled/>
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="syrybz" cols="70" rows="2" maxlength="255" disabled>${requestScope.r.syrybz }</textarea>
				</dd>
			</dl>
		</div>
		<div class="formBar">
		
	</div>
	
</form>
</div>	
					
		

	

