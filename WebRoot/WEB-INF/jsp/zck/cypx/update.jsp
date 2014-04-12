<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：失业管理
--%>

					
<div class="pageContent" >	
				
<form method="post" action="cypx/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="58">
			
			<dl style="margin-top: 10px;">
				<dt>人员选择：</dt>
				<dd>
					<input type="hidden" name="rkjbguid2" id="rkjbguidpx_cypxload" value="${requestScope.r.rkjbguid2 }"/>
				<input type="text" name="xm2" id="xm2_cypxload" value="${requestScope.r.xm2 }" class="required combox" readonly/>
				&nbsp;&nbsp;<a class="edit" href="rygl/load.do?bz=update" target="dialog" width="650" style="cursor:hand;" <c:if test="${requestScope.r.bz=='1' }">disabled</c:if> >选择人员</a></dd>
			</dl>
			<dl>
				<dt>培训次数：</dt>
				<dd>
					<input type="text" id="pxcs" name="pxcs" value="${requestScope.r.pxcs} "/>
				</dd>
			</dl>
			<dl>
				<dt>培训时间：</dt>
				<dd>
					<input type="text" id="pxsj" name="pxsj" readonly="readonly" onFocus="WdatePicker()" value="${requestScope.r.pxsj} "/>
				</dd>
			</dl>
				<dl>
				<dt>培训类型：</dt>
				<dd>
					<input type="text" id="pxlx" name="pxlx" value="${requestScope.r.pxlx} "/>
				</dd>
			</dl>
			<dl>
				<dt>项目内容：</dt>
				<dd>
					<textarea  name="xmnr" cols="70" rows="5" maxlength="255">${requestScope.r.xmnr} </textarea>
				</dd>
			</dl>
			
			
			<input type="hidden" name="jncypxguid" value="${requestScope.r.jncypxguid }"/>
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
	document.getElementById("rkjbguidpx_cypxload").value=guid;
	document.getElementById("xm2_cypxload").value=xm;
}
</script>
	

