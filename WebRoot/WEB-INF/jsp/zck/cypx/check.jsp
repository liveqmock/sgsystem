<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：失业管理查看详情
--%>
					
<div class="pageContent" >	
				
<form method="post" action="pension/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
				
	<input type="hidden" id="jncypxguid" name="jncypxguid" value="${requestScope.r.jncypxguid }"/>		
	<div class="pageFormContent nowrap"   layoutH="58">
		<dl style="margin-top: 10px;">
				<dt>姓名：</dt>
				<dd>
					<input type="text" name="xm" id="xm" value="${requestScope.r.xm }" disabled/>
				</dd>
			</dl>
			<dl>
				<dt>性别：</dt>
				<dd>
					男：<input type="checkbox"  id="nan" name="nan" disabled  <c:if test="${requestScope.r.xb=='1' }">checked</c:if>  />女：<input type="checkbox" disabled   id="nv" name="xb"  <c:if test="${requestScope.r.xb=='0' }">checked</c:if> />
				</dd>
			</dl>
			<dl>
				<dt>联系电话：</dt>
				<dd>
					<input type="text" name="lxdh" id="lxdh" value="${requestScope.r.lxdh }" disabled/>
				</dd>
			</dl>
			<dl>
				<dt>培训次数：</dt>
				<dd>
					<input type="text" id="pxcs" name="pxcs" value="${requestScope.r.pxcs} disabled "/>
				</dd>
			</dl>
			<dl>
				<dt>培训时间：</dt>
				<dd>
					<input type="text" id="pxsj" name="pxsj" value="${requestScope.r.pxsj} disabled "/>
				</dd>
			</dl>
				<dl>
				<dt>培训类型：</dt>
				<dd>
					<input type="text" id="pxlx" name="pxlx" value="${requestScope.r.pxlx} disabled "/>
				</dd>
			</dl>
			<dl>
				<dt>项目内容：</dt>
				<dd>
					<textarea  name="xmnr" cols="70" rows="5" maxlength="255" disabled>${requestScope.r.xmnr} </textarea>
				</dd>
			</dl>
		</div>
		<div class="formBar">
		
	</div>
	
</form>
</div>	
					
		

	

