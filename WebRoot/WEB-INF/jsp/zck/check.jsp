<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理--更新角色
--%>
<script type="text/javascript">
function fun(){
	
}
</script>
					
<div class="pageContent" >	
				
<form method="post" action="pension/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
				
	<input type="hidden" id="shylguid" name="shylguid" value="${requestScope.r.shylguid }"/>		
	<div class="pageFormContent nowrap"   layoutH="58">
		<dl>
				<label>人员选择：</label>
				<input type="hidden"  name="rkjbguid" id="rkjbguid" value="${requestScope.r.rkjbguid }"/>
				<input type="text" disabled name="xm" id="xm" value="${requestScope.r.xm }" readonly/>
			</dl>
			<dl>
				<label>身体状况：</label>
				<select name="stzk" id="stzk" disabled  style="width:250;">
					<option value="">请选择</option>
					<option value="良好" <c:if test="${requestScope.r.stzk=='良好' }">selected</c:if>>良好<option>
					<option value="一般" <c:if test="${requestScope.r.stzk=='一般' }">selected</c:if>>一般</option>
					<option value="较差" <c:if test="${requestScope.r.stzk=='较差' }">selected</c:if>>较差</option>
				</select>
			</dl>
			<dl>
				<label>护理类型：</label>
				<select name="hllx" disabled  style="width:250;">
					<option value="">请选择</option>
					<option value="自理" <c:if test="${requestScope.r.hllx=='自理' }">selected</c:if>>自理</option>
					<option value="半自理"  <c:if test="${requestScope.r.hllx=='半自理' }">selected</c:if>>半自理</option>
				</select>
			</dl>
			<dl>
				<label>是否空巢：</label>
				<select name="sfkc" disabled  style="width:250;">
					<option value="">请选择</option>
					<option value="是" <c:if test="${requestScope.r.sfkc=='是' }">selected</c:if>>是</option>
					<option value="否" <c:if test="${requestScope.r.sfkc=='否' }">selected</c:if>>否</option>
				</select>
			</dl>
			<dl>
				<label>是否贫困：</label>
				<select name="sfpk" disabled  style="width:250;">
					<option value="">请选择</option>
					<option value="是" <c:if test="${requestScope.r.sfpk=='是' }">selected</c:if>>是</option>
					<option value="否" <c:if test="${requestScope.r.sfpk=='否' }">selected</c:if>>否</option>
				</select>
			</dl>
			<dl>
				<label>机构养老：</label>
				机构养老</label><input type="checkbox" id="checkbox-1" value="是" name="jgyl" disabled <c:if test="${requestScope.r.jgyl=='是' }">checked</c:if>/>
				日托养老</label><input type="checkbox" id="checkbox-2" value="是" name="rtyl" disabled <c:if test="${requestScope.r.rtyl=='是' }">checked</c:if>/>
				上门服务</label><input type="checkbox" id="checkbox-3" value="是" name="smfw"  disabled <c:if test="${requestScope.r.smfw=='是' }">checked</c:if>/>
                        老年饭桌</label><input type="checkbox" id="checkbox-3" value="是" name="lnfz" disabled <c:if test="${requestScope.r.lnfz=='是' }">checked</c:if>/>
                	一键通</label><input type="checkbox" id="checkbox-3" value="是" name="yjt" disabled <c:if test="${requestScope.r.yjt=='是' }">checked</c:if>/>
			</dl>
			<dl>
				<label>备&nbsp;&nbsp;注：</label>
				<textarea  name="shylbz" disabled cols="70" rows="2" maxlength="255">${requestScope.r.shylbz }</textarea>
			</dl>
		</div>
		<div class="formBar">
		
	</div>
	
</form>
</div>	
					
		

	

