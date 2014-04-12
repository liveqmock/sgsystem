<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	模块：公各平台--劳动保障--退休人员增加
--%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<form method="post" action="txry/addtxry.do"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,navTabAjaxDone)">
	<div class="pageContent">
		<div class="pageFormContent nowrap" style="padding-left:10px;"
			layoutH="56">
			<dl style="margin-top: 10px;">
				<dt>姓名：</dt>
				<dd>
					<a class="edit" href="rygl/load.do?bz=add" target="dialog" width="650"
						style="cursor:hand;color: ff0000"> <input type="hidden"
						name="rkjbguid" id="rkjbguid1" /><input type="text" name="xm1"
						id="xm1" class="required combox" /> </a>
				</dd>
				<dd></dd>
			</dl>
			<dl>
				<dt>退休时间:</dt>
				<dd>
					<input type="text" readonly="readonly" id="statime"
						class="required"
						onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})"
						name="txsj" />
				</dd>
			</dl>
			<dl>
				<dt>退休单位:</dt>
				<dd>
					<input type="input" name="txqdw" size="50" maxlength="50">
				</dd>
			</dl>
			<dl>
				<dt>单位电话:</dt>
				<dd>
					<input type="input" name="dwdh" size="50" maxlength="50">
				</dd>
			</dl>
			<dl>
				<dt>家庭电话:</dt>
				<dd>
					<input type="input" name="jtdh" size="50" maxlength="50"
						class="required">
				</dd>
			</dl>
			<dl>
				<dt>签收日:</dt>
				<dd>

					<input type="text" readonly="readonly" id="statime"
						onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})"
						name="qsr" />
				</dd>
			</dl>
			<dl>
				<dt>备注:</dt>
				<dd>
					<textarea name="txrybz" cols="100" rows="10"></textarea>
				</dd>
			</dl>
			<input type="hidden" name="navTabId" value="${param.rel}" /> <input
				type="hidden" name="callbackType" value="closeCurrent" />
		</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">发布</button>
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
<script type="text/javascript">
	function setloadadd(guid, xm) {
		document.getElementById("rkjbguid1").value = guid;
		document.getElementById("xm1").value = xm;
	}
</script>
