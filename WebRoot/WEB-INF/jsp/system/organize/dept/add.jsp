<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：系统管理--部门管理 -- 新增部门
--%>

					
<form method="post" action="dept/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap" layoutH="97" >
	
		<div class="unit" style="margin-left: 120px;">
			<c:choose>
				<c:when test="${param.superId==null}">
					<span>添加顶级部门</span>
				</c:when>
				<c:otherwise>
					<span>添加部门：上级部门为：<font color='red'>[ <my:outDeptName id="${param.superId }"/> ]</font></span>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="divider"></div>
		<div style="margin-left: 100px;">
			<dl>
				<dt>部门序号：</dt>
				<dd>
					<input type="text" name="deptSort" maxlength="3" class="required digits" min="1" max="999" size="25"/>
					<span class="info">用于同级部门排序，值越小越靠前(数值范围：1-999 整数)</span>
				</dd>
			</dl>
			<dl>
				<dt>部门名称：</dt>
				<dd>
					<input type="text" name="deptName" class="required"  maxlength="50" size="25"/>
				</dd>
			</dl>
			<dl>
				<dt>电话：</dt>
				<dd>
					<input type="text" name="deptPhone" maxlength="20" size="25"/>
					
				</dd>
			</dl>
			<dl>
				<dt>传真：</dt>
				<dd>
					<input  type="text" name="deptFax"  maxlength="20" size="25"/>
					
				</dd>
			</dl>
			<dl>
				<dt>地址：</dt>
				<dd>
					<textarea  name="deptAddress" cols="80" rows="2" maxlength="100"></textarea>
				</dd>
			</dl>
			
			<dl>
				<dt>部门经理：</dt>
				<dd>
					<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询"><input type="text"  readonly="readonly" size="25" toName="user.name" /></a><a class="btnLook" href="user/lookUpPage.do?type=1" lookupGroup="user" >查找带回</a>
					<input type="hidden" name="leadUid" toName="user.id"/>
				</dd>
			</dl>
			<dl>
				<dt>上级部门：</dt>
				<dd>
					<a href="dept/lookUpPage.do?type=3" lookupGroup="dept" title="上级部门查询" ><input class="required" type="text" value="<my:outDeptName id="${param.superId }"/>"  readonly="readonly" size="25" toName="dept.name" /></a><a class="btnLook" href="dept/lookUpPage.do?type=3" lookupGroup="dept" >查找带回</a>
						
				    <input type="hidden" name="superId" size="25" toName="dept.id"  value="<c:out value="${param.superId }" default="0"/>" />
						
					<span class="info">[无上级]，则为顶级部门</span>
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="deptDesc" cols="80" rows="2" maxlength="200"></textarea>
				</dd>
			</dl>
			<input type="hidden" name="navTabId" value="${param.rel }"/>
			

			
		</div>
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
	
</form>
										
						
					
		

	

