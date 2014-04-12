<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：系统管理--组织机构 -- 社会养老
--%>

<div class="pageContent" >
				
<form method="post" action="Familyplan/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent"
			style=" padding-left: 20px;"
			layoutH="60">
	
			<dl style="margin-top: 3px;">
				<dt>人员选择：</dt>
				<dd>
					<input type="hidden" name="rkjbguid1" id="rkjbguid_fam"/><input type="text" name="xm1" id="xm_fam" class="required combox" readonly/>
				&nbsp;&nbsp;<a class="edit" href="rygl/load.do?bz=add" target="dialog" width="650" style="cursor:hand;color: ff0000" >选择人员</a>
				</dd>
				
			</dl>
			<dl style="margin-top: 3px;">
			<dt width="10%">妇女编号：</dt>
				<dd>
					<input type="text"  name="fnbh" id="" />
				</dd>
				</dl>
			<dl>
			<dt width="10%">是否自管育龄妇女：</dt>
				 <dd>
				 	<select name="sfzgylfn" id="">
				 		<option value="">请选择</option>
				 		<option value="是">是</option>
				 		<option value="否">否</option>
				 	</select>
				 </dd>
				</dl>
				<dl>
				<dt width="10%">是否计生协会志愿者：</dt>
				 <dd>
				 	<select name="sfxhzyz" id="">
				 		<option value="">请选择</option>
				 		<option value="是">是</option>
				 		<option value="否">否</option>
				 	</select>
				 </dd>
				 </dl>
			<dl>
				<dt >是否计生协会会员：</dt>
				 <dd>
				 	<select name="sfxhhy" id="">
				 		<option value="">请选择</option>
				 		<option value="是">是</option>
				 		<option value="否">否</option>
				 	</select>
				 </dd>
				
				 	 </dl>
				 <dl>
				 <dt width="10%">流入流出：</dt>
				 <dd>
				 	<select name="lrlc" id="">
				 		<option value="">请选择</option>
				 		<option value="流入">流入</option>
				 		<option value="流出">流出</option>
				 	</select>
				 </dd>
				 </dl>
			<dl>
				<dt >何处流入：</dt>
				<dd>
					<input type="text"  name="hclr" id="" />
				</dd>
			</dl>
			<dl>
				<dt width="10%">何时流入：</dt>
				 <dd>
				 	<input type="text"  name="hslr" id="" class="date"/>
				 </dd>
				 </dl>
			<dl>
				 <dt width="10%">何处流出：</dt>
				 <dd>
				 	<input type="text" name="hclc" id="clgj"/>
				 </dd>
			</dl>
			<dl>
				<dt width="10%">何时流出：</dt>
				 <dd>
				 	<input type="text" name="hslc" id="clgj" class="date"/>
				 </dd>
				 </dl>
			<dl>
				<dt width="10%">迁入迁出：</dt>
				<dd>
					<select name="qrqc" id="">
				 		<option value="">请选择</option>
				 		<option value="迁入">迁入</option>
				 		<option value="迁出">迁出</option>
				 	</select>
				</dd>
			</dl>
			<dl>
				<dt width="10%">何处迁入：</dt>
				 <dd>
				 	<input type="text"  name="hcqr" id="" />
				 </dd>
				 </dl>
			<dl>
				 <dt width="10%">何时迁入：</dt>
				 <dd>
				 	<input type="text" name="hsqr" id="clgj" class="date"/>
				 </dd>
			</dl>
			<dl>
				<dt width="10%">何处迁出：</dt>
				 <dd>
				 	<input type="text" name="hcqc" id="clgj"/>
				 </dd>
				 </dl>
			<dl>
				 <dt width="10%">何时迁出：</dt>
				 <dd>
				 	<input type="text" name="hsqc" id="clgj" class="date"/>
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
	document.getElementById("rkjbguid_fam").value=guid;
	document.getElementById("xm_fam").value=xm;
}
</script>					
					
		

	

