<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：个人办公-通讯录-个人通讯录-分组设置添加
	--%>

<div class="pageContent" >

	<form method="post" action="group/add.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">

		<div class="pageFormContent nowrap"
			style="border-bottom: 1px #B8D0D6 solid; padding-left: 50px;"
			layoutH="25">
			<dl style="margin-top: 30px;">
				
				<dt>
					编号：
				</dt>
				<dd>
					<input type="text" name="grNo" class="required" maxlength="50"
						size="50" />

				</dd>
			</dl>
			<dl>
				<dt>
					分组名称：
				</dt>
				<dd>
					<input type="text" name="grName" class="required" maxlength="50"
						size="50" />

				</dd>
			</dl>
			<dl>
				<dt>
					说明：
				</dt>
				<dd>
					<textarea class="" name="grRemark" rows="6" cols="50" ></textarea>
				</dd>
			</dl>
			


			<input type="hidden" name="navTabId" value="${param.rel}" />
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







