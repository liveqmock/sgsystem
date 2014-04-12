<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--会议管理 -- 更新
--%>

<div class="pageContent" >

	<form method="post" action="meeting/update.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone)">

		<div class="pageFormContent nowrap"
			
			layoutH="56">
			<dl style="margin-top: 3px;">
				<dt>
					类型：
				</dt>
				<dd>
				<select class="combox"   name="MType" sValue="${requestScope.meeting.MType }">
						<my:outOptions type="2"/>	
			    </select>

				</dd>
			</dl>
			<dl>
				<dt>
					标题：
				</dt>
				<dd>
					<input type="text" name="MName" class="required" maxlength="50"
						size="50" value="<c:out value="${requestScope.meeting.MName }"/>" />

				</dd>
			</dl>
			<dl>
				<dt>
					主持人：
				</dt>
				<dd>
					<input type="text" name="MHost" class="required" maxlength="50"
						size="50" value="<c:out value="${requestScope.meeting.MHost}"/>" />

				</dd>
			</dl>
			<dl>
				<dt>
					会议日期：
				</dt>
				<dd>
					<input type="text"  readonly="readonly" onFocus="WdatePicker()"  name="MDate" value="<fmt:formatDate  value="${requestScope.meeting.MDate}" pattern="yyyy-MM-dd" />"  />
					
				</dd>
			</dl>
			<dl>
				<dt>
					开始时间：
				</dt>
				<dd>
				    <input type="text"  readonly="readonly" onFocus="WdatePicker({dateFmt:'HH:mm',alwaysUseStartDate:true})"  name="MStatime"  value="${requestScope.meeting.MStatime }" />

				</dd>
			</dl>
			<dl>
				<dt>

					结束时间：
				</dt>
				<dd>
					<input type="text"  readonly="readonly" onFocus="WdatePicker({dateFmt:'HH:mm',alwaysUseStartDate:true})"  name="MEndtime" value="${requestScope.meeting.MEndtime }"  />

				</dd>
			</dl>
			<dl>
				<dt>
					会议室：
				</dt>
				<dd>

					<select class="combox" name="room.id" sValue="${requestScope.meeting.room.id }">

						<c:forEach var="l" items="${requestScope.list}">
								<option value="${l.id }">${l.mrName }</option>
						</c:forEach>
					</select>

				</dd>
			</dl>
			<dl>
				<dt>
					参与部门：
				</dt>
				<dd>

					<a href="dept/lookUpPage.do?type=2" lookupGroup="dept" title="部门查询">
						<textarea class="notice_dept" readonly="readonly"
							toName="dept.name" cols="70" rows="2"  >${requestScope.deptNames}</textarea> </a>
					<input type="hidden" name="deptid" class="notice_dept"  readonly="readonly" 
						size="50" toName="dept.id"  value="${requestScope.deptIds}">
				
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="notice_dept"  title="清空">清空</a>
					
				</dd>
			</dl>
			
			<dl>
				<dt>
					参与人：
				</dt>
				<dd>

					<a href="user/lookUpPage.do?type=2" lookupGroup="user" title="用户查询">

						<textarea class="notice_user" readonly="readonly"
							toName="user.name" cols="70" rows="2" ><my:outTrueName id="${requestScope.userIds}"/></textarea></a>
					<input type="hidden" name="userid" class="notice_user" readonly="readonly"
						size="50" toName="user.id"  value="${requestScope.userIds}">
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="notice_user"  title="清空">清空</a>
				</dd>
			</dl>
			<dl>
				<dt>
					简介：
				</dt>
				<dd>

					<textarea name="MSummary" cols="110" rows="5" maxlength="5000"> <c:out value="${requestScope.meeting.MSummary}"/></textarea>
				</dd>
			</dl>
			<dl>
				<dt>
					备注：
				</dt>
				<dd>
					<textarea class="editor" name="MRemark" rows="6" cols="100"><c:out value="${requestScope.meeting.MRemark}"/></textarea>
				</dd>
			</dl>

			<input type="hidden" name="id" value="${requestScope.meeting.id }"/>
			<input type="hidden" name="navTabId" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />


		</div>
		<div class="formBar">
			<ul style="float: left; margin-left: 30%;">
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">
								更新
							</button>
						</div>
					</div>
				</li>
				
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">
								取消
							</button>
						</div>
					</div>
				</li>
			</ul>
		</div>





	</form>
</div>







