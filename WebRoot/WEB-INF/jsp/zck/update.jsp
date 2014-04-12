<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理--更新角色
--%>

					
<div class="pageContent" >	
				
<form method="post" action="pension/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="58">
			
			<dl style="margin-top: 10px;">
				<dt>人员选择：</dt>
				<dd>
					<input type="hidden" name="rkjbguid2" id="rkjbguid2" value="${requestScope.r.rkjbguid }"/>
				<input type="text" name="xm2" id="xm2" value="${requestScope.r.xm }" readonly/>
				<a class="edit" href="rygl/load.do?bz=update" target="dialog" width="650" style="cursor:hand;" disabled >选择人员</a></dd>
			</dl>
			<dl>
				<dt>身体状况：</dt>
				<dd>
					<select name="stzk"  style="width:250;">
					<option value="">请选择</option>
					<option value="良好" <c:if test="${requestScope.r.stzk=='良好' }">selected</c:if>>良好<option>
					<option value="一般" <c:if test="${requestScope.r.stzk=='一般' }">selected</c:if>>一般</option>
					<option value="较差" <c:if test="${requestScope.r.stzk=='较差' }">selected</c:if>>较差</option>
				</select>
				</dd>
			</dl>
			<dl>
				<dt>护理类型：</dt>
				<dd>
					<select name="hllx" style="width:250;">
					<option value="">请选择</option>
					<option value="自理" <c:if test="${requestScope.r.hllx=='自理' }">selected</c:if>>自理</option>
					<option value="半自理"  <c:if test="${requestScope.r.hllx=='半自理' }">selected</c:if>>半自理</option>
				</select>
				</dd>
			</dl>
			<dl>
				<dt>是否空巢：</dt>
				<dd>
					<select name="sfkc" style="width:250;">
					<option value="">请选择</option>
					<option value="是" <c:if test="${requestScope.r.sfkc=='是' }">selected</c:if>>是</option>
					<option value="否" <c:if test="${requestScope.r.sfkc=='否' }">selected</c:if>>否</option>
				</select>
				</dd>
			</dl>
			<dl>
				<dt>是否贫困：</dt>
				<dd>
					<select name="sfpk" style="width:250;">
					<option value="">请选择</option>
					<option value="是" <c:if test="${requestScope.r.sfpk=='是' }">selected</c:if>>是</option>
					<option value="否" <c:if test="${requestScope.r.sfpk=='否' }">selected</c:if>>否</option>
				</select>
				</dd>
			</dl>
			<dl>
				<dt>机构养老：</dt>
				<dd>
					机构养老</label><input type="checkbox" id="checkbox-1" value="是" name="jgyl" <c:if test="${requestScope.r.jgyl=='是' }">checked</c:if>/>
				日托养老</label><input type="checkbox" id="checkbox-2" value="是" name="rtyl" <c:if test="${requestScope.r.rtyl=='是' }">checked</c:if>/>
				上门服务</label><input type="checkbox" id="checkbox-3" value="是" name="smfw" <c:if test="${requestScope.r.smfw=='是' }">checked</c:if>/>
                        老年饭桌</label><input type="checkbox" id="checkbox-3" value="是" name="lnfz"  <c:if test="${requestScope.r.lnfz=='是' }">checked</c:if>/>
                	一键通</label><input type="checkbox" id="checkbox-3" value="是" name="yjt" <c:if test="${requestScope.r.yjt=='是' }">checked</c:if>/>
			
				</dd>
			</dl>
			<dl>
				<dt>备&nbsp;&nbsp;注：</dt>
				<dd>
						<textarea  name="shylbz" cols="70" rows="2" maxlength="255">${requestScope.r.shylbz }</textarea>
				</dd>
			</dl>
			
			<input type="hidden" name="shylguid" value="${requestScope.r.shylguid }"/>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>	
					
		
<script type="text/javascript">
function setloadupdate(guid,xm){
	document.getElementById("rkjbguid2").value=guid;
	document.getElementById("xm2").value=xm;
}
</script>
	

