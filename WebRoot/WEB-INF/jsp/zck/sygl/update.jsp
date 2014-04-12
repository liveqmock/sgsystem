<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：失业管理
--%>

					
<div class="pageContent" >	
				
<form method="post" action="sygl/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="58">
			
			<dl style="margin-top: 10px;">
				<dt>人员选择：</dt>
				<dd>
					<input type="hidden" name="rkjbguid2" id="rkjbguid_syglupdate" value="${requestScope.r.rkjbguid2 }"/>
				<input type="text" name="xm2" id="xm2_syglupdate" value="${requestScope.r.xm2 }" class="required combox" readonly/>
				&nbsp;&nbsp;<a class="edit" href="rygl/load.do?bz=update" target="dialog" width="650" style="cursor:hand;" <c:if test="${requestScope.r.bz=='1' }">disabled</c:if> >选择人员</a></dd>
			</dl>
			<dl>
				<dt>失业时间：</dt>
				<dd>
					<input type="text"  class="required" readonly="readonly" onFocus="WdatePicker()"
						name="sysj"  value="${requestScope.r.sysj }" />
				</dd>
			</dl>
			<dl>
				<dt>失业前单位：</dt>
				<dd>
					<input type="text" id="syqdw" name="syqdw" value="${requestScope.r.syqdw} "/>
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="syrybz" cols="70" rows="5" maxlength="255">${requestScope.r.syrybz} </textarea>
				</dd>
			</dl>
			
			
			<input type="hidden" name="syryglguid" value="${requestScope.r.syryglguid }"/>
			<input type="hidden" name="bz" value="${requestScope.r.bz }"/>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>	
					
		
<script type="text/javascript">
function setloadupdate(guid,xm){
	document.getElementById("rkjbguid_syglupdate").value=guid;
	document.getElementById("xm2_syglupdate").value=xm;
}
</script>
	

