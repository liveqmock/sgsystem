<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-通讯录-公司通讯录
--%>

<div class="pageContent" >

	<form method="post" action="personal/update.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone)">

		<div class="pageFormContent"
			style="border-bottom: 1px #B8D0D6 solid; padding-left: 200px;"
			layoutH="56">
			<dl style="margin-top: 50px;">
				<dt>
					姓名：
				</dt>
				<dd>
					${requestScope.per.puName }

				</dd>
			</dl>
			<dl style="margin-top: 50px;">
				<dt>
					 性别：
				</dt>
				<dd>
					${requestScope.per.puSex}
				</dd>
			</dl>
			<dl>
				<dt>
					电子邮箱：
				</dt>
				<dd>
					${requestScope.per.puEmail }
				</dd>
			</dl>
			<dl>
				<dt>
					手机：
				</dt>
				<dd>
					${requestScope.per.puPhone }
			</dl>
			<dl>
				<dt>
					其他联系：
				</dt>
				<dd>
					${requestScope.per.puOther }

				</dd>
			</dl>
			<dl>
				<dt>
					分组：
				</dt>
				<dd>
						<c:forEach var="g" items="${group}">
							<c:if test="${g.id==requestScope.per.puGrouping}">${g.gaName }</c:if>
						</c:forEach>


					
				</dd>
			</dl>
			<dl>
				<dt>
					公司名称：
				</dt>
				<dd>
						${requestScope.per.puCompany }

				</dd>
			</dl>
			
			<dl>
				<dt>
					办公电话：
				</dt>
				<dd>
						${requestScope.per.puOfficPhone }

				</dd>
			</dl>
			
			<dl>
				<dt>
					办公传真：
				</dt>
				<dd>
						${requestScope.per.puOfficFax }

				</dd>
			</dl>
			<dl>
					<dt>
					公司地址：
				</dt>
				<dd>
					${requestScope.per.puCompanyAddress }

				</dd>
			</dl>
			<dl>
					<dt>
					邮政编码：
				</dt>
				<dd>
					${requestScope.per.puZip }

				</dd>
			</dl>
			<dl>
					<dt>
					职位：
				</dt>
				<dd>
					${requestScope.per.puPost }

				</dd>
			</dl>
			<dl>
					<dt>
					家庭地址：
				</dt>
				<dd>
					${requestScope.per.puHomeAddress }

				</dd>
			</dl>
			<dl>
					<dt>
					家庭电话：
				</dt>
				<dd>
				   ${requestScope.per.puHomePhone }

				</dd>
			</dl>
			<dl >
				<dt>
					备注：
				</dt>
				<dd>
					${requestScope.per.puRemark }
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.per.id }">
			<input type="hidden" name="navTabId" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />


		</div>
	</form>
</div>

