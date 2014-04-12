<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	模块：公各平台---劳动保障--修改救业援助
--%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<form method="post" action="jyyz/editjyyz.do"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,navTabAjaxDone)">
	<div class="pageContent">
		<div class="pageFormContent nowrap" style="padding-left:10px;"
			layoutH="56">
			<dl>
				<dt>姓名:</dt>
				<dd>
					<a class="edit" href="rygl/load.do?bz=add" target="dialog"
						width="650" style="cursor:hand;color: ff0000"> <input value="${jyyz.jz.rkjbguid }"
						type="hidden" name="rkjbguid" id="rkjbguid_jyyz" /> <input
						type="text" name="xms" id="xm_jyyz" class="required combox"  value='<c:out value="${jyyz.xms }"></c:out>' /> </a>
				</dd>
			</dl>
			<dl>
				<dt>社保补贴:</dt>
				<dd>
					<input type="text" name="sbbt" class="required" maxlength="100"
						value='<c:out value="${jyyz.jz.sbbt }"></c:out>' size="50" />
				</dd>
			</dl>
			<dl>
				<dt>备注:</dt>
				<dd>
					<textarea name="jyyzbz" cols="100" rows="10">${jyyz.jz.jyyzbz }</textarea>
				</dd>
			</dl>
			<input type="hidden" name="jyyzguid"
				value='<c:out value="${jyyz.jz.jyyzguid }"></c:out>'> <input
				type="hidden" name="navTabId" value="${param.rel}" /> <input
				type="hidden" name="callbackType" value="closeCurrent" />
		</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">修改</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="reset">清空</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
</form>