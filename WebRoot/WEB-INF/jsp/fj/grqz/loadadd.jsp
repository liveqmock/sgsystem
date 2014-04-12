<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：系统管理--组织机构 -- 社会养老
--%>

<div class="pageContent" >
				
<form method="post" action="grqz/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent"
			style=" padding-left: 20px;"
			layoutH="60">
	
			<dl style="margin-top: 3px;">
				<dt>人员选择：</dt>
				<dd>
					<input type="hidden" name="rkjbguid1" id="rkjbguid_grqz"/><input type="text" name="xm1" id="xm_grqz" class="required combox" readonly/>
				&nbsp;&nbsp;<a class="edit" href="rygl/load.do?bz=add" target="dialog" width="650" style="cursor:hand;color: ff0000" >选择人员</a>
				</dd>
				
			</dl>
			<dl style="margin-top: 3px;">
			<dt width="10%">登记时间：</dt>
				<dd>
						<input type="text" name="djsj" id="djsj" class="date"/>
				</dd>
				</dl>
			<dl>
			<dt width="10%">求职次数：</dt>
				 <dd>
				<input type="text" name="qzcs" id="qzcs" class="digits" />
				 </dd>
				</dl>
				<dl>
				<dt width="10%">求职岗位：</dt>
				 <dd>
				<input type="text" name="qzgw" id="qzgw"  />
				 </dd>
				 </dl>
			<dl>
				<dt >薪金待遇：</dt>
				 <dd>
				 	<input type="text" name="xjdy" id="xjdy"  class="number" />
				 </dd>
				
				 	 </dl>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
	
</form>
</div>
										
	<script type="text/javascript">
function setloadadd(guid,xm){
	Math.random();
	document.getElementById("rkjbguid_grqz").value=guid;
	document.getElementById("xm_grqz").value=xm;
}
</script>					
					
		

	

