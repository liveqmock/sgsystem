<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--导出打印自定义管理 --添加
--%>

<div class="pageContent" >					
<form method="post" action="tableCustom/dev/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:20px;"  layoutH="58">
			<dl>
				<dt>顺序号：</dt>
				<dd>
					<input type="text" name="fieldSort" maxlength="3" class="required digits" min="1" max="999" size="25"/>
					<span class="info">用于打印，导出的排序，值越小越靠前(数值范围：1-999 整数)</span>
				</dd>
			</dl>
			<dl>
				<dt>属性名称：</dt>
				<dd>
					<input type="text" name="fieldName"    maxlength="30" class="required"  size="25"/>
					<span class="info">表字段对应的javaBean属性名称</span>
				</dd>
			</dl>
			<dl>
				<dt>属性类型：</dt>
				<dd>
					<select class="combox"  name="fieldType" >
							<option value="1">文本</option>
							<option value="2">数字</option>
							<option value="3">日期(YYYY-MM-DD)</option>
							<option value="4">日期时间(YYYY-MM-DD HH:MM:SS)</option>
							<option value="5">用户id(转换用户姓名)</option>
							<option value="6">部门id(转换部门名称)</option>
							<option value="7">用户id(转换用户登录名)</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>显示名：</dt>
				<dd>
					<input type="text" name="fieldTitle" class="required"  maxlength="20" size="25"/>
					<span class="info">显示的默认名称</span>
				</dd>
			</dl>
			<dl>
				<dt>别名：</dt>
				<dd>
					<input type="text" name="fieldAnotherTitle"  maxlength="20" size="25"/>
					<span class="info">用户可以自定义的别名，当别名为空时使用默认名称</span>
				</dd>
			</dl>
			<dl>
				<dt>是否导出：</dt>
				<dd>
					<select class="combox"  name="isExport" >
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>是否打印：</dt>
				<dd>
					<select class="combox"  name="isPrint" >
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>是否显示：</dt>
				<dd>
					<select class="combox"  name="isShow" >
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
				</dd>
			</dl>
			
			<input type="hidden" name="tbType" value="${param.tbType }"/>
			<input type="hidden" name="rel" value="${param.rel}"/>
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
										
						
					
		

	

