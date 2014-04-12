<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理--更新角色
--%>

					
<div class="pageContent" >	
				
<form method="post" action="grqz/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageFormContent"
			style=" padding-left: 20px;"
			layoutH="60">
	
			<dl style="margin-top: 3px;">
				<dt>人员选择：</dt>
				<dd>
			     	<input type="hidden" name="grqzguid" id="grqzguid" value="${requestScope.r.grqzguid }"/>
					<input type="hidden" name="rkjbguid2" id="rkjbguid_grqzupdate" value="${requestScope.r.rkjbguid }"/>
				<input type="text" name="xm2" id="xm_grqzupdate" value="${requestScope.r.xm }" readonly/>
				<a class="edit" href="rygl/load.do?bz=update" target="dialog" width="650" style="cursor:hand;" >选择人员</a></dd>
			</dl>
			<dl style="margin-top: 3px;">
			<dt width="10%">登记时间：</dt>
				<dd>
					<input type="text"  name="djsj" id ="djsj" value ="${requestScope.r.djsj }"  class="date" />
				</dd>
				</dl>
			<dl>
			<dt width="10%">求职次数：</dt>
				 <dd>
				<input type="text"  name="qzcs" id ="qzcs" value ="${requestScope.r.qzcs }"  class="digits" />
				 </dd>
				</dl>
				<dl>
				<dt width="10%">求职岗位：</dt>
				 <dd>
				 	<input type="text"  name="qzgw" id ="qzgw" value ="${requestScope.r.qzgw }"   />
				 </dd>
				 </dl>
			<dl>
				<dt >薪金待遇：</dt>
				 <dd>
				 	<input type="xjdy"  name="xjdy" id ="xjdy" value ="${requestScope.r.xjdy }"  class="number" />
				 </dd>
				 	 </dl>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
	</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>	
					
		
<script type="text/javascript">
function setloadupdate(guid,xm){
	document.getElementById("rkjbguid_grqzupdate").value=guid;
	document.getElementById("xm_grqzupdate").value=xm;
}
</script>
	

