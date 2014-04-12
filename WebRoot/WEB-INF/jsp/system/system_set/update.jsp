<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：系统管理--菜单管理 -- 添加菜单
--%>

					
<form method="post" action="systemSet/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap" layoutH="56" >
	
		<div style="margin-left: 100px;">
			<dl>
				<dt>系统开关：</dt>
				<dd>
					<select class="combox"  name="appStart" sValue="${requestScope.c.appStart }">
							<option value="1" >开启</option>
							<option value="0">关闭</option>
					</select>
					<span class="info">关闭系统之后除系统 超级管理员 以外，任何人无法登录系统！</span>
				</dd>
			</dl>
			<dl>
				<dt>时间限制：</dt>
				<dd >
					
					<input type="text" name="loginStartTime" class="required" id="systemset_startTime"  value="<c:out value="${requestScope.c.loginStartTime }"/>" onFocus="WdatePicker({dateFmt:'HH:mm:ss',alwaysUseStartDate:true})" size="10"  readonly="readonly"/>
					
					<span  style="margin-left:5px;margin-right:5px;float: left;line-height: 20px; ">--</span>
					
					<input type="text" name="loginEndTime" class="required" value="<c:out value="${requestScope.c.loginEndTime }"/>" onFocus="WdatePicker({dateFmt:'HH:mm:ss',alwaysUseStartDate:true,minDate:'#F{$dp.$D(\'systemset_startTime\');}'})"  size="10" readonly="readonly"/>
					
					<span class="info">只有在此时间范围内才可以使用系统</span>
				</dd>
				
			</dl>
			<dl>
				<dt>IP限制：</dt>
				<dd>
					<textarea cols="60" rows="2" name="limitIps" ><c:out value="${requestScope.c.limitIps }"/></textarea>
					<span class="info">设置限制登录的ip地址多个ip以,隔开。可以用*做匹配，例：192.168.1.*</span>
				</dd>
			</dl>
			<dl>
				<dt>IP允许：</dt>
				<dd>
					<textarea cols="60" rows="2" name="allowIps"><c:out value="${requestScope.c.allowIps }"/></textarea>
					<span class="info">设置允许登录的ip地址多个ip以,隔开,注：如果设置了IP允许，则IP限制失效。可以用*做匹配，例：192.168.1.*</span>
				</dd>
			</dl>
			<dl>
				<dt>消息提醒刷新时间：</dt>
				<dd>
					<input  type="text" name="msgwarnTime"  value="<c:out value="${requestScope.c.msgwarnTime }"/>" size="10" class="required digits"/>&nbsp;分钟
					
				</dd>
			</dl>
			<dl>
				<dt>允许密码错误次数：</dt>
				<dd>
					<input type="text" name="pwdErrorNum" value="<c:out value="${requestScope.c.pwdErrorNum }"/>" class="digits"  size="10" />
					<span class="info">允许用户登录时输入的错误次数，不输入则不限制密码错误次数。当达到最大输入错误次数时会限制用户登录，过了限制登录冷却时间之后才能再次登录</span>
				</dd>
			</dl>
			
			<dl>
				<dt>限制登录冷却时间：</dt>
				<dd>
					<input type="text" name="pwdErrorTime" value="<c:out value="${requestScope.c.pwdErrorTime }"/>" size="10" class="required digits" />&nbsp;分钟
					<br/><span class="info">此参数和允许密码错误次数搭配使用</span>
				</dd>
			</dl>
			
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		</div>
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<my:validationAuthority url="systemSet/update.do">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
			</my:validationAuthority>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
										
						
					
		

	

