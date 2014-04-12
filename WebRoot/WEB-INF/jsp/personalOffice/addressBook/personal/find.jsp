<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-通讯录-个人通讯录
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
					${requestScope.per.peName }

				</dd>
			</dl>
			<dl style="margin-top: 50px;">
				<dt>
					 性别：
				</dt>
				<dd>
					${requestScope.per.peSex}
				</dd>
			</dl>
			<dl>
				<dt>
					电子邮箱：
				</dt>
				<dd>
					${requestScope.per.peEmail }
				</dd>
			</dl>
			<dl>
				<dt>
					手机：
				</dt>
				<dd>
					${requestScope.per.pePhone }
			</dl>
			<dl>
				<dt>
					其他联系：
				</dt>
				<dd>
					${requestScope.per.peOther }

				</dd>
			</dl>
			<dl>
				<dt>
					分组：
				</dt>
				<dd>
					<c:forEach var="g" items="${group}">
						<c:if test="${g.id ==requestScope.per.peGrouping}">${g.grName }</c:if>
					</c:forEach>

				</dd>
			</dl>
			<dl>
				<dt>
					公司名称：
				</dt>
				<dd>
						${requestScope.per.peCompany }

				</dd>
			</dl>
			
			<dl>
				<dt>
					办公电话：
				</dt>
				<dd>
						${requestScope.per.peOfficPhone }

				</dd>
			</dl>
			
			<dl>
				<dt>
					办公传真：
				</dt>
				<dd>
						${requestScope.per.peOfficFax }

				</dd>
			</dl>
			<dl>
					<dt>
					公司地址：
				</dt>
				<dd>
					${requestScope.per.peCompanyAddress }

				</dd>
			</dl>
			<dl>
					<dt>
					邮政编码：
				</dt>
				<dd>
					${requestScope.per.peZip }

				</dd>
			</dl>
			<dl>
					<dt>
					职位：
				</dt>
				<dd>
					${requestScope.per.pePost }

				</dd>
			</dl>
			<dl>
					<dt>
					家庭地址：
				</dt>
				<dd>
					${requestScope.per.peHomeAddress }

				</dd>
			</dl>
			<dl>
					<dt>
					家庭电话：
				</dt>
				<dd>
				   ${requestScope.per.peHomePhone }

				</dd>
			</dl>
			<dl >
				<dt>
					备注：
				</dt>
				<dd>
					${requestScope.per.peRemark }
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.per.id }">
			<input type="hidden" name="navTabId" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />


		</div>
	</form>
</div>

