<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	模块：个人办公-通讯录-公司通讯录
--%>

<div class="pageContent">

	<form method="post" action="public/excel.do"
		enctype="multipart/form-data" class="pageForm required-validate"
		onsubmit="return iframeCallback(this,dialogAjaxDone)">

		<div class="pageFormContent" style="padding-left: 15px;" layoutH="60">

			<dl>
				<dt>
					分组：
				</dt>
				<dd>

					<select class="combox required" name="group">
						<c:forEach var="g" items="${group}">
							<option value="${g.id }">
								${g.gaName }
							</option>
						</c:forEach>
					</select>

				</dd>
			</dl>
			<dl>
				<dt>
					Excel导入：
				</dt>
				<dd>
					<input type="file" fileupload="no" class="required" name="file"
						size="15" />
					&nbsp;&nbsp;
				</dd>
			</dl>
			<dl>
				<dt>
					&nbsp;&nbsp;
				</dt>
				<dd>
					<a target="_blank" href="templet/importStaff .xls">模板下载</a>
				</dd>
			</dl>
			<input type="hidden" name="rel" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />


		</div>
		<div class="formBar">
			<ul style="float: left; margin-left: 30%;">
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">
								导入
							</button>
						</div>
					</div>
				</li>

				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">
								取消
							</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>







