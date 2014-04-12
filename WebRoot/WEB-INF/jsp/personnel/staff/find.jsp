<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：人事管理--人员管理-查看
--%>

<div class="pageContent">

	<form method="post" action="staff/update.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone)">

		<div class="pageFormContent"
			style="border-bottom: 1px #B8D0D6 solid; padding-left: 20px;"
			layoutH="0">
			<dl style="margin-top: 1px;">
				<dt>
					姓名：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psName }"/>

				</dd>
			</dl>
			<dl style="margin-top: 1px;">
				<dt>
					性别：
				</dt>
				<dd>
				
				   <c:out value="${requestScope.ps.psSex}"/>
				
				
				</dd>
			</dl>
			<dl>
				<dt>
					出生日期：
				</dt>
				<dd>
				<fmt:formatDate  value="${requestScope.ps.psBirthday}" pattern="yyyy-MM-dd" />

				</dd>
			</dl>
			<dl>
				<dt>
					年龄：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psAge }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					现居住地：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psPresentAddress }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					住宅电话：
				</dt>
				<dd>
				<c:out value="${requestScope.ps.psHomePhone }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					手机号码：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psPhone }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					其他联系：
				</dt>
				<dd>
				<c:out value="${requestScope.ps.psOther }"/>

				</dd>
			</dl>

			<dl>
				<dt>
					户口所在地：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psAccountAddress }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					民族：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psEthnic }"/>

				</dd>
			</dl>


			<dl>
				<dt>
					身份证号：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psCard }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					籍贯：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psHomeTown }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					用户账号：
				</dt>
				<dd>

					<my:outTrueName id="${requestScope.ps.psUserId}"/>
					



				</dd>
			</dl>
			<dl>
				<dt>
					员工编号：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psStaffId }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					工资卡号：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psWage }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					社保号：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psSocial }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					最高学历：
				</dt>
				<dd>
					
						<c:forEach var="listValues"
							items="${applicationScope.type2ListValues.type_13}">
							<c:if test="${listValues.value==requestScope.ps.psEdu }">
								<c:out value="${listValues.name }"/>
							</c:if>
							
						</c:forEach>

				</dd>
			</dl>
			<dl>
				<dt>
					所学专业：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psSpecialty }"/>

				</dd>
			</dl>
			<dl>
				<dt>
					毕业院校：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psSchool}"/>

				</dd>
			</dl>
			<dl>
				<dt>
					毕业时间：
				</dt>
				<dd>
					<fmt:formatDate value="${requestScope.ps.psGraduation}" pattern="yyyy-MM-dd" />

				</dd>
			</dl>


			<dl>
				<dt>
					员工类型：
				</dt>
				<dd>
					
						<c:forEach var="listValues"
							items="${applicationScope.type2ListValues.type_11}">
							<c:if test="${listValues.value==requestScope.ps.psType }">
								<c:out value="${listValues.name }"/>
								</c:if>
						</c:forEach>
					

				</dd>
			</dl>
			<dl>
				<dt>
					员工职位：
				</dt>
				<dd>
						<c:forEach var="listValues"
							items="${applicationScope.type2ListValues.type_12}">
							<c:if test="${listValues.value==requestScope.ps.psPost }">
								<c:out value="${listValues.name }"/>
							</c:if>
						</c:forEach>

				</dd>
			</dl>
			<dl>
				<dt>
					入职时间：
				</dt>
				<dd>
					<fmt:formatDate value="${requestScope.ps.psEntryDate}" pattern="yyyy-MM-dd" />
				</dd>
			</dl>
			<dl>
				<dt>
					员工状态：
				</dt>
				<dd>
					<c:out value="${requestScope.ps.psStatus }"/>
				</dd>
			</dl>
			  <c:if test="${requestScope.ps.psStatus=='在职' }">
				
				</c:if>
				  <c:if test="${requestScope.ps.psStatus=='离职' }">
					<dl>
								<dt>
									离职原因：
								</dt>
								<dd>
										<c:forEach var="listValues"
											items="${applicationScope.type2ListValues.type_14}">
											<c:if test="${requestScope.ps.psResReason==listValues.value }">
												<c:out value="${listValues.name }"/>
												</c:if>
										</c:forEach>
								</dd>
							</dl>
							<dl>
								<dt>
									离职时间：
								</dt>
								<dd>
									<fmt:formatDate value="${requestScope.ps.psResDate}" pattern="yyyy-MM-dd" />
							
								</dd>
							</dl>
							<dl class="nowrap">
								<dt>
									备注：
								</dt>
								<dd>
									<c:out value="${requestScope.ps.psResRemark}"/>
								</dd>
							</dl>
				</c:if>
				 <c:if test="${requestScope.ps.psStatus=='退休' }">
					<dl>
								<dt>
									退休原因：
								</dt>
								<dd>
										<c:forEach var="listValues"
											items="${applicationScope.type2ListValues.type_15}">
											<c:if test="${listValues.value == requestScope.ps.psRetReason }">
												<c:out value="${listValues.name }"/>
												</c:if>
										</c:forEach>
								</dd>
							</dl>
							<dl>
								<dt>
									退休时间：
								</dt>
								<dd>
									<fmt:formatDate value="${requestScope.ps.psRetDate}" pattern="yyyy-MM-dd" />
								</dd>
							</dl>
							<dl class="nowrap">
								<dt>
									备注：
								</dt>
								<dd>
									<c:out value="${requestScope.ps.psRetRemark}"/>
								</dd>
							</dl>
				</c:if>
				
			<input type="hidden" name="rel" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />


		</div>




	</form>
</div>




