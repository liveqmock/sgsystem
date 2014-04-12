<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--会议管理 -- 新增
--%>

<div class="pageContent" >

	<form method="post" action="meeting/add.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone)">

		<div class="pageFormContent nowrap"
			
			layoutH="56">
			<dl style="margin-top: 3px;">
				<dt>
					类型：
				</dt>
				<dd>
					<select class="combox required"   name="MType" >
						<option value="">--请选择会议类型--</option>
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
						size="50" />

				</dd>
			</dl>
			<dl>
				<dt>
					主持人：
				</dt>
				<dd>
					<input type="text" name="MHost" class="required" maxlength="50"
						size="50" />

				</dd>
			</dl>
			<dl>
				<dt>
					会议日期：
				</dt>
				<dd>
					<input type="text"  readonly="readonly" onFocus="WdatePicker()"  name="MDate" />	
					

				</dd>
			</dl>
			<dl>
				<dt>
					开始时间：
				</dt>
				<dd>
				<input type="text"  readonly="readonly" id="statime" onFocus="WdatePicker({dateFmt:'HH:mm:ss',alwaysUseStartDate:true})"  name="MStatime"  />
					

				</dd>
			</dl>
			<dl>
				<dt>

					结束时间：
				</dt>
				<dd>
				<input type="text"  readonly="readonly" onFocus="WdatePicker({dateFmt:'HH:mm:ss',alwaysUseStartDate:true,minDate:'#F{$dp.$D(\'statime\');}'})"  name="MEndtime"  />
					

				</dd>
			</dl>
			<dl>
				<dt>
					会议室：
				</dt>
				<dd>

					<select class="combox required" name="room.id" >
						<option value="">--请选择会议室--</option>
						<c:forEach var="l" items="${list}">
							<option value="${l.id }">
								${l.mrName }
							</option>
						</c:forEach>
					</select>

				</dd>
			</dl>
			<dl>
				<dt>
					参与部门：
				</dt>
				<dd>

					<a href="dept/lookUpPage.do?type=2" lookupGroup="dept" title="上级部门查询" >
						<textarea class="notice_dept" readonly="readonly"
							toName="dept.name" cols="70" rows="2" /> </a>
					<input type="hidden" value="" class="notice_dept" name="deptid" readonly="readonly"
						size="50" toName="dept.id" >
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="notice_dept"  title="清空">清空</a>

				</dd>
			</dl>
			
			<dl>
				<dt>
					参与人：
				</dt>
				<dd>

					<a href="user/lookUpPage.do?type=2" lookupGroup="user" title="上级部门查询" width="1000" height="550">

						<textarea class="notice_user" readonly="readonly"
							toName="user.name" cols="70" rows="2" /> </a>
					<input type="hidden" value=""  class="notice_user" name="userid" readonly="readonly"
						size="50" toName="user.id" >
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="notice_user"  title="清空">清空</a>
				</dd>
			</dl>
			<dl>
				<dt>
					简介：
				</dt>
				<dd>

					<textarea name="MSummary" cols="110" rows="3" maxlength="5000"></textarea>
				</dd>
			</dl>
			<dl>
				<dt>
					备注：
				</dt>
				<dd>
					<textarea class="editor" name="MRemark" rows="6" cols="100"></textarea>
				</dd>
			</dl>


			<input type="hidden" name="navTabId" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />


		</div>
		<div class="formBar">
			<ul style="float: left; margin-left: 30%;">
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">
								发布
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







