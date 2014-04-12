<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-通讯录-个人通讯录-分组设置添加
	--%>

<div class="pageContent" >

	<form method="post" action="assess/assessAdd.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">

		<div class="pageFormContent nowrap"
			style="border-bottom: 1px #B8D0D6 solid; padding-left: 50px;"
			layoutH="25">
			<dl style="margin-top: 30px;">
				
				<dt>
					考核项分组：
				</dt>
				<dd>
				<input type="hidden" name="asGroup" value="${group }">
				<c:if test="${group=='1' }">
					<input type="text" readonly="readonly" class="required" maxlength="50"
						size="50" value="销售人员考核项"/>
				</c:if>
				<c:if test="${group=='2' }">
					<input type="text" readonly="readonly" class="required" maxlength="50"
						size="50" value="大区经理考核项"/>
				</c:if>
				<c:if test="${group=='3' }">
					<input type="text" readonly="readonly" class="required" maxlength="50"
						size="50" value="年度积分自动考核项"/>
				</c:if>

				</dd>
			</dl>
			<dl>
				<dt>
					考核项名称：
				</dt>
				<dd>
					<input type="text" name="asName" class="required" maxlength="50"
						size="50" />

				</dd>
			</dl>
			<dl>
				<dt>
					分值：
				</dt>
				<dd>
					<input type="text" name="asMinute" class="required" maxlength="50"
						size="35" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="asStatus" checked="checked" value="1" />启用
				</dd>
			</dl>
			<dl>
				<dt>
					说明：
				</dt>
				<dd>
					<textarea class="" name="asRemark" rows="6" cols="50" ></textarea>
				</dd>
			</dl>
			


			<input type="hidden" name="rel" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />
			<div class="buttonActive"
				style="margin-left: 150px; margin-top: 20px">
				<div class="buttonContent">
					<button type="submit">
						保存
					</button>
				</div>
			</div>
			<div class="button" style="margin-left: 10px; margin-top: 20px">
				<div class="buttonContent">
					<button type="reset">
						清空
					</button>
				</div>
			</div>
			<div class="button" style="margin-left: 10px; margin-top: 20px">
				<div class="buttonContent">
					<button type="button" class="close">
						关闭
					</button>
				</div>
			</div>

		</div>


	</form>
</div>







