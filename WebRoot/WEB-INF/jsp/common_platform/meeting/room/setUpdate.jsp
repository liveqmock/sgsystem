<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--
	模块：公共平台--会议设置 -- 新增会议室
	--%>

<div class="pageContent" align="center">

	<form method="post" action="room/update.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">

		<div class="pageFormContent nowrap"
			style="border-bottom: 1px #B8D0D6 solid; padding-left: 50px;"
			layoutH="25">
			<dl style="margin-top: 50px;">
				
				<dt>
					编号：
				</dt>
				<dd>
					<input type="text" name="mrNo" class="required" maxlength="50"
						size="50" value="${requestScope.room.mrNo }" />

				</dd>
			</dl>
			<dl>
				<dt>
					名称：
				</dt>
				<dd>
					<input type="text" name="mrName" class="required" maxlength="50"
						size="50" value="${requestScope.room.mrName }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					容纳人数：
				</dt>
				<dd>
					<input type="text" name="mrNum"  maxlength="50"
						size="50" value="${requestScope.room.mrNum }"/>
				</dd>
			</dl>
			<dl>
				<dt>
					备注：
				</dt>
				<dd>
					<textarea  name="mrRemark"  rows="6" cols="80">${requestScope.room.mrRemark }</textarea>
					
				</dd>
			</dl>

			<input type="hidden" name="id" value="${requestScope.room.id}" />
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







