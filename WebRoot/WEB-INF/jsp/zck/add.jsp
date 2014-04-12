<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：系统管理--组织机构 -- 社会养老
--%>

<div class="pageContent" >
				
<form method="post" action="pension/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="58">
	
			<dl style="margin-top: 10px;">
				<dt>人员选择：</dt>
				<dd>
					<input type="hidden" name="rkjbguid1" id="rkjbguid1"/><input type="text" name="xm1" id="xm1" class="required combox"/>
				&nbsp;&nbsp;<a class="edit" href="rygl/load.do?bz=add" target="dialog" width="650" style="cursor:hand;color: ff0000" >选择人员</a>
				</dd>
				<dd></dd>
			</dl>
			<dl>
				<dt>身体状况：</dt>
				<dd>
					<select name="stzk" style="width:250;">
					<option value="">请选择</option>
					<option value="良好">良好</option>
					<option value="一般" >一般</option>
					<option value="较差" >较差</option>
				</select>
				</dd>
			</dl>
			<dl>
				<dt>护理类型：</dt>
				<dd>
					<select name="hllx" style="width:250;">
					<option value="">请选择</option>
					<option value="自理">自理</option>
					<option value="半自理" >半自理</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>是否空巢：</dt>
				<dd>
					<select name="sfkc" style="width:250;">
					<option value="">请选择</option>
					<option value="是">是</option>
					<option value="否" >否</option>
				</select>
				</dd>
			</dl>
			<dl>
				<dt>是否贫困：</dt>
				<dd>
					<select name="sfpk" style="width:250;">
					<option value="">请选择</option>
					<option value="是">是</option>
					<option value="否" >否</option>
				</select>
				</dd>
			</dl>
			<dl>
				<dt>机构养老：</dt>
				<dd>
					机构养老</label><input type="checkbox" id="checkbox-1" value="是" name="jgyl"/>
				日托养老</label><input type="checkbox" id="checkbox-2" value="是" name="rtyl"/>
				上门服务</label><input type="checkbox" id="checkbox-3" value="是" name="smfw"/>
                        老年饭桌</label><input type="checkbox" id="checkbox-3" value="是" name="lnfz" />
                	一键通</label><input type="checkbox" id="checkbox-3" value="是" name="yjt"/>
				</dd>
			</dl>
			<dl>
				<dt>备&nbsp;&nbsp;注：</dt>
				<dd>
					<textarea  name="shylbz" cols="70" rows="2" maxlength="255"></textarea>
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
	document.getElementById("rkjbguid1").value=guid;
	document.getElementById("xm1").value=xm;
}
</script>					
					
		

	

