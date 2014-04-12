<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	模块：公各平台---劳动保障--劳动监察
--%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<form method="post" action="ldjc/editldjc.do"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,navTabAjaxDone)">
	<div class="pageContent">
		<div class="pageFormContent nowrap" style="padding-left:10px;"
			layoutH="56">
			<dl>
				<dt>单位名称：</dt>
				<dd>
					<input type="text" name="dwmc" class="required" maxlength="100"
						value="${ldjc.dwmc}" size="50" />
				</dd>
			</dl>
			<dl>
				<dt>单位地址:</dt>
				<dd>
					<input type="text" name="dwdz" class="required" maxlength="100"
						value="${ldjc.dwdz}" size="50" />
				</dd>
			</dl>
			<dl>
				<dt>授联系人:</dt>
				<dd>
					<input type="text" name="lxr" class="required" maxlength="100"
						value="${ldjc.lxr}" size="50" />
				</dd>
			</dl>
			<dl>
				<dt>联系电话:</dt>
				<dd>
					<input type="text" name="lxrdh" value="${ldjc.lxrdh}">
				</dd>
			</dl>
			<dl>
				<dt>监察员:</dt>
				<dd>
					<input type="text" name="jcr" value="${ldjc.jcr}">
				</dd>
			</dl>
			<dl>
				<dt>所属社区:</dt>
				<dd>
					<select class="combox required" name="sssq"
						sValue="${requestScope.ldjc.sssq }">
						<option value="">--请选择社区--</option>
						<my:outOptions type="21" />
					</select>
				</dd>
			</dl>
			<dl>
				<dt>是否合格:</dt>
				<dd>
					<c:choose>
						<c:when test="${ldjc.sfhg==1 }">
				是:<input type="radio" name="sfhg" value="1" checked="checked">
				 否:<input type="radio" name="sfhg" value="0">
						</c:when>
						<c:otherwise>
						是:<input type="radio" name="sfhg" value="1">
				 否:<input type="radio" name="sfhg" value="0" checked="checked">
						</c:otherwise>
					</c:choose>
				</dd>
			</dl>
			<dl>
				<dt>备注:</dt>
				<dd>
					<textarea name="ldjcbz" cols="100" rows="10">${ldjc.ldjcbz}</textarea>
				</dd>
			</dl>
			<input  type="hidden" name="ldjcguid" value="${ldjc.ldjcguid}">  
			<input type="hidden" name="navTabId" value="${param.rel}" /> <input
				type="hidden" name="callbackType" value="closeCurrent" />
		</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">修改</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="reset">清空</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
</form>