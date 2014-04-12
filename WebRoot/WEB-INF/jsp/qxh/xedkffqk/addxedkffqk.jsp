<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	模块：公各平台---劳动保障--小额贷款发放情况增加
--%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<form method="post" action="xedkffqk/addxedkffqk.do"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,navTabAjaxDone)">
	<div class="pageContent">
		<div class="pageFormContent nowrap" style="padding-left:10px;"
			layoutH="56">
			<dl>
				<dt>姓名:</dt>
				<dd>

					<a class="edit" href="rygl/load.do?bz=add" target="dialog"
						width="650" style="cursor:hand;color: ff0000"> <input
						type="hidden" name="rkjbguid" id="rkjbguid_xeda" /> <input
						type="text" name="xms" id="xm_xeda" class="required combox" /> </a>
				</dd>
			</dl>
			<dl>
				<dt>发放时间:</dt>
				<dd>
					<input type="text" name="ffsj" readonly="readonly" id="statime"
						class="required"
						onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" />
				</dd>
			</dl>
			<dl>
				<dt>贷款金额:</dt>
				<dd>
					<input type="text" name="dkje" class="required number" maxlength="100" />
				</dd>
			</dl>
			<dl>
				<dt>还款时间:</dt>
				<dd>
					<input type="text" name="hksj" class="required" readonly="readonly"
						id="statime" class="required"
						onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" />
				</dd>
			</dl>
			<dl>
				<dt>信用度:</dt>
				<dd>
					<input type="text" name="xyd" class="required" maxlength="100"
						size="50" />
				</dd>
			</dl>
			<dl>
				<dt>经营项目:</dt>
				<dd>
					<textarea name="jyxm" cols="100" rows="10"></textarea>
				</dd>
			</dl>
			<input type="hidden" name="navTabId" value="${param.rel}" /> <input
				type="hidden" name="callbackType" value="closeCurrent" />
		</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">新增</button>
						</div>
					</div>
				</li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="reset">清空</button>
						</div>
					</div>
				</li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>
<script type="text/javascript">
	function setloadadd(guid, xm) {
		document.getElementById("rkjbguid_xeda").value = guid;
		document.getElementById("xm_xeda").value = xm;
	}
</script>