<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：系统管理--组织机构 -- 社会养老
--%>

<div class="pageContent" >
				
<form method="post" action="dwzp/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent"
			style=" padding-left: 20px;"
			layoutH="60">
			<dl style="margin-top: 3px;">
			<dt width="10%">单位名称：</dt>
				<dd>
						<input type="text" name="dwmc" id="dwmc" />
				</dd>
				</dl>
			<dl>
			<dt width="10%">单位地址：</dt>
				 <dd>
				<input type="text" name="dwdz" id="dwdz"  />
				 </dd>
				</dl>
				<dl>
				<dt width="10%">需求岗位：</dt>
				 <dd>
				<input type="text" name="xqgw" id="xqgw"  />
				 </dd>
				 </dl>
			<dl>
				<dt >需求人数：</dt>
				 <dd>
				 	<input type="text" name="xqrs" id="xqrs"  class="number" />
				 </dd>
	    	</dl>
	    		<dl>
				<dt >性别要求：</dt>
				 <dd>
				 		<select name="xbyq" id="">
				 		<option value="无">无</option>
				 		<option value="男">男</option>
				 		<option value="女">女</option>
				 	</select>
				 </dd>
	    	</dl>
	    		<dl>
				<dt >薪金待遇：</dt>
				 <dd>
				 	<input type="text" name="xzdy" id="xzdy"  class="number" />
				 </dd>
	    	</dl>
	    			<dl>
				<dt >联系人：</dt>
				 <dd>
				 	<input type="text" name="lxr" id="lxr"   />
				 </dd>
	    	</dl>
	    			<dl>
				<dt >联系人电话：</dt>
				 <dd>
				 	<input type="text" name="lxrdh" id="lxrdh"   />
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
</script>					
					
		

	

