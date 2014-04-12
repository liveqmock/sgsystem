<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	模块：个人办公-通讯录-公司通讯录
--%>

<div class="pageContent" >

	<form method="post" action="public/add.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">

		<div class="pageFormContent"
			style=" padding-left: 20px;"
			layoutH="60">
			<dl style="margin-top: 3px;">
				<dt>
					姓名：
				</dt>
				<dd>
					<input type="text" name="puName" class="required" maxlength="50"
						size="50" />

				</dd>
			</dl>
			<dl style="margin-top: 3px;">
				<dt>
					 性别：
				</dt>
				<dd>
					<input type="radio" name="puSex" checked="checked" value="男"/>男
					<input type="radio" name="puSex" value="女"/>女
				</dd>
			</dl>
			<dl>
				<dt>
					电子邮箱：
				</dt>
				<dd>
					<input type="text" class=" email"  name="puEmail"  maxlength="50"
						size="50" />

				</dd>
			</dl>
			<dl>
				<dt>
					手机：
				</dt>
				<dd>
					<input type="text" class="phone"   name="puPhone" maxlength="11" size="50"/>
			</dl>
			<dl>
				<dt>
					其他联系：
				</dt>
				<dd>
				<input type="text" name="puOther" maxlength="11" size="50" />

				</dd>
			</dl>
			<dl>
				<dt>
					分组：
				</dt>
				<dd>

					<select class="combox required" name="puGrouping">
					<c:forEach var="g" items="${group}">
						<option value="${g.id }">${g.gaName }</option>
					</c:forEach>
				</select>

				</dd>
			</dl>
			<dl>
				<dt>
					公司名称：
				</dt>
				<dd>
				<input type="text" name="puCompany" size="50" />

				</dd>
			</dl>
			
			<dl>
				<dt>
					办公电话：
				</dt>
				<dd>
				<input type="text" name="puOfficPhone"  size="50" />

				</dd>
			</dl>
			
			<dl>
				<dt>
					办公传真：
				</dt>
				<dd>
				<input type="text" name="puOfficFax"  size="50" />

				</dd>
			</dl>
			<dl>
					<dt>
					公司地址：
				</dt>
				<dd>
				<input type="text" name="puCompanyAddress"  size="50" />

				</dd>
			</dl>
			<dl>
					<dt>
					邮政编码：
				</dt>
				<dd>
				<input type="text" name="puZip"  size="50" />

				</dd>
			</dl>
			<dl>
					<dt>
					职位：
				</dt>
				<dd>
				<input type="text" name="puPost"  size="50" />

				</dd>
			</dl>
			<dl>
					<dt>
					家庭地址：
				</dt>
				<dd>
				<input type="text" name="puHomeAddress"  size="50" />

				</dd>
			</dl>
			<dl>
					<dt>
					家庭电话：
				</dt>
				<dd>
				<input type="text" name="puHomePhone"  size="50" />

				</dd>
			</dl>
			<dl class="nowrap">
				<dt>
					备注：
				</dt>
				<dd>
					<textarea  name="puRemark" rows="6" cols="100" ></textarea>
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
								发布
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







