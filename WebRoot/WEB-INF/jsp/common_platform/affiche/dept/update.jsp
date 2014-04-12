<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--公告管理--部门公告修改
--%>

<div class="pageContent" >
			
<form method="post" action="affiche/dept/update.do"  class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="56">
			<dl>
				<dt>标题：</dt>
				<dd >
					<input type="text" name="afficheTitle" class="required"  maxlength="50"   size="45" value="<c:out value="${requestScope.xa.afficheTitle }" />"/>
					<label >&nbsp;&nbsp;&nbsp;置顶<input <c:if test="${requestScope.xa.isTop==1 }">checked="checked"</c:if> style="vertical-align:middle;" type="checkbox" name="isTop" value="1" /></label>
				
					
				</dd>
			</dl>
			<dl>
				<dt>公告类型：</dt>
				<dd>
					<select class="combox required"   name="afficheType"  sValue="<c:out value="${requestScope.xa.afficheType }" />">
						<my:outOptions type="7"/>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>部门：</dt>
				<dd>
					<a href="dept/lookUpPage.do?type=1" lookupGroup="dept" title="部门查询" >
						<input class="clear_dept required" type="text" size="45"   readonly="readonly"  toName="dept.name" value="<c:out value="${applicationScope.deptId2Name[requestScope.xa.deptId]}" />"/>
					</a>
					<input type="hidden" class="clear_dept" name="deptId" toName="dept.id" value="${requestScope.xa.deptId }"/>
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_dept"  title="清空">清空</a>
				</dd>
			</dl>
			<dl>
				<dt>内容：</dt>
				<dd>
					<textarea  name="afficheContent" cols="100" rows="15" class="editor" minlength="1" maxlength="65530"><c:out value="${requestScope.xa.afficheContent }" /></textarea>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.xa.id }"/>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		
	</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">发布</button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>
										
						
					