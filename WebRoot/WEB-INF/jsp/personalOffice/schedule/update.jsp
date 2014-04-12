<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--日程安排--修改日程
--%>

<div class="pageContent" >					
	
	<form method="post" action="schedule/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="57">
			<dl>
				<dt>主题：</dt>
				<dd>
					<input type="text" name="schTitle"   maxlength="50" class="required"  size="50"  value="<c:out value="${requestScope.s.schTitle }"/>"/>
					<span class="info">修改之后，如果需要启用日程提醒，需刷新页面，或按F5刷新页面。</span>
				</dd>
			</dl>
			<dl>
				<dt>日程类型：</dt>
				<dd>
					<select class="combox required"   name="schType"  sValue=" ${requestScope.s.schType}">
						<my:outOptions type="6"/>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>开始时间：</dt>
				<dd>
					<input type="text" class="required" readonly="readonly" id="schedule_updatetime_start" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})" name="startTime" value="<fmt:formatDate value="${requestScope.s.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />"/>
				</dd>
			</dl>
			
			<dl>
				<dt>结束时间：</dt>
				<dd>
					<input type="text" class="required" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'schedule_updatetime_start\');}'})" name="endTime"  value="<fmt:formatDate value="${requestScope.s.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />"/>
				</dd>
			</dl>
			<dl>
				<dt>提醒时间：</dt>
				<dd>
					<input type="text"  readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s',maxDate:'#F{$dp.$D(\'schedule_updatetime_start\');}'})" name="warnTime"  value="<fmt:formatDate value="${requestScope.s.warnTime }" pattern="yyyy-MM-dd HH:mm:ss" />"/>
				</dd>
			</dl>
			<dl>
				<dt>内容：</dt>
				<dd>
					<textarea  name="schContent" class="editor" cols="100" rows="10" minlength="1" maxlength="65530" width="700" height="150">${requestScope.s.schContent }</textarea>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.s.id }"/>
			<input type="hidden" name="rel" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">更新</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
	</div>
	
</form>
</div>		
					