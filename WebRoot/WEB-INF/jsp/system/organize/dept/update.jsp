<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：系统管理--部门管理  部门更新
--%>	
<form method="post" action="dept/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
						
<div class="pageFormContent nowrap" layoutH="97" >
		<div class="unit" style="margin-left: 120px;">
			<my:validationAuthority url="dept/addPage.do">
				<a class="button" href="dept/addPage.do?rel=${param.rel}" rel="${param.rel }_box" target="ajax" ><span>添加部门</span>&nbsp;</a>
		
				<c:url var="url_addxjdept" value="dept/addPage.do" >
					<c:param name="rel" value="${param.rel}" />
					<c:param name="superId" value="${dept.id }" />
					
				</c:url><%--
				
				<a class="button" href="${url_addxjdept }" rel="${param.rel }_box" target="ajax" ><span>添加下级部门</span>&nbsp;</a>
			--%></my:validationAuthority><%--
			<my:validationAuthority url="dept/del.do">
				<a class="button" target="ajaxTodo"  href="dept/del.do?id=${dept.id }&navTabId=${param.rel}" title="您确定删除部门<font color='red'>[${requestScope.dept.deptName }]</font>吗？如果此部门有下级部门，或者此部门有用户，将无法删除！"><span>删除</span></a>
			</my:validationAuthority>
		
		--%></div>
		<div class="divider"></div>
		<div style="margin-left: 100px;">
			
			<dl>
				<dt>部门序号：</dt>
				<dd>
					<input type="text" name="deptSort" maxlength="3" class="required digits" min="1" max="999" size="25" value="${requestScope.dept.deptSort}" />
					<span class="info">用于同级部门排序，值越小越靠前(数值范围：1-999 整数)</span>
				</dd>
			</dl>
			<dl>
				<dt>部门名称：</dt>
				<dd>
					<input type="text" name="deptName" class="required" maxlength="50" size="25" value="<c:out value="${requestScope.dept.deptName}"/>" />
				</dd>
			</dl>
			<dl>
				<dt>电话：</dt>
				<dd>
					<input type="text" name="deptPhone"  maxlength="20" size="25" value="<c:out value="${requestScope.dept.deptPhone}"/>"/>
					
				</dd>
			</dl>
			<dl>
				<dt>传真：</dt>
				<dd>
					<input  type="text" name="deptFax"   maxlength="20" size="25" value="<c:out value="${requestScope.dept.deptFax}"/>"/>
					
				</dd>
			</dl>
			<dl>
				<dt>地址：</dt>
				<dd>
					<textarea   name="deptAddress" cols="80" rows="3" maxlength="100"><c:out value="${requestScope.dept.deptAddress}"/></textarea>
				</dd>
			</dl>
			
			<dl>
				<dt>部门经理：</dt>
				<dd>
					<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询"><input type="text"  readonly="readonly" size="25" toName="user.name" value="<my:outTrueName id="${requestScope.dept.leadUid}"/>"/></a><a class="btnLook" href="user/lookUpPage.do?type=1" lookupGroup="user" >查找带回</a>
					<input type="hidden" name="leadUid" toName="user.id" value="${requestScope.dept.leadUid}"/>
				</dd>
			</dl>
			<dl>
				<dt>上级部门：</dt>
				<dd>
					<c:choose>
						<c:when test="${requestScope.dept.superId=='0'}">
							<a href="dept/lookUpPage.do" lookupGroup="dept" title="上级部门查询"><input class="required" type="text" readonly="readonly" size="25" toName="dept.name" value="无上级" /></a><a class="btnLook" href="dept/lookUpPage.do" lookupGroup="dept" >查找带回</a>
							<input type="hidden" name="superId" size="25" toName="dept.id" value="0"/>
								
						</c:when>
						<c:otherwise>
							<a href="dept/lookUpPage.do" lookupGroup="dept" title="上级部门查询"><input type="text" readonly="readonly" size="25" toName="dept.name" value="<my:outDeptName id="${requestScope.dept.superId}"/>" /></a><a class="btnLook" href="dept/lookUpPage.do" lookupGroup="dept" >查找带回</a>
							<input type="hidden" name="superId" size="25" toName="dept.id" value="${requestScope.dept.superId}"/>
						</c:otherwise>
					</c:choose>
					<span class="info">[无上级]，则为顶级部门</span>
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="deptDesc" cols="80" rows="2" maxlength="200"><c:out value="${requestScope.dept.deptDesc}"/></textarea>
				</dd>
			</dl>
			<input type="hidden" name="navTabId" value="${param.rel }"/>
			<input type="hidden" name="id" value="${requestScope.dept.id}"/>
			
			<my:validationAuthority url="dept/update.do">
				<div class="buttonActive" style="margin-left: 150px;margin-top: 20px"><div class="buttonContent"><button type="submit">修改</button></div></div>
			</my:validationAuthority>
		</div>
</div>
	
</form>
										
						
					
		

	

