<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--用户管理 --单个用户详情
--%>
				
<div class="pageContent">					

						
	<div class="pageFormContent nowrap" style="border-bottom:1px #B8D0D6 solid;padding-left:50px;"  layoutH="25">
			<dl>
				<dt>账号：</dt>
				<dd><c:out value="${requestScope.u.userName }"/></dd>
			</dl>
			<dl>
				<dt>姓名：</dt>
				<dd><c:out value="${requestScope.u.trueName }"/></dd>
			</dl>
			<dl>
				<dt>性别：</dt>
				<dd>
					<c:choose><c:when test="${requestScope.u.userSex==1}">男</c:when><c:otherwise>女</c:otherwise></c:choose>
				</dd>
			</dl>
			<dl>
				<dt>学历：</dt>
				<dd>
				  <my:outSelectValue id="${requestScope.u.xltypeid}" />
	          	</dd>
			</dl>
			<dl>
				<dt>党员：</dt>
				<dd>
				  <my:outSelectValue id="${requestScope.u.dytypeid }"/>
				</dd>
			</dl>
			<dl>
				<dt>手机号：</dt>
				<dd>
					${requestScope.u.mobilePhoneNumber }
				</dd>
			</dl>
			<dl>
				<dt>入职时间：</dt>
				<dd>
				 <c:out value="${requestScope.u.joindate }"/>
 				</dd>
			</dl>
			<dl>
				<dt>职务：</dt>
				<dd>
					<my:outSelectValue id="${requestScope.u.zwtypeid }"/>
			    </dd>
			</dl>
			<dl>
				<dt>部门：</dt>
				<dd>
					<c:out value="${applicationScope.deptId2Name[requestScope.u.deptId]}"/>
				</dd>
			</dl>
			
			<dl>
				<dt>备注：</dt>
				<dd>
					<c:out value="${requestScope.u.userDesc }"/>
				</dd>
			</dl>
			<dl>
				<dt>允许登录系统：</dt>
				<dd>
					<c:choose><c:when test="${requestScope.u.userStatus==1}">正常</c:when><c:otherwise>禁用</c:otherwise></c:choose>
				</dd>
			</dl>
		
		
		
		</div>
	
	

</div>	
					
		

	

