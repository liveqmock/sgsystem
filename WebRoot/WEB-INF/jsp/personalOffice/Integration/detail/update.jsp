<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--积分考核--人员打分修改
	--%>

<div class="pageContent" >

	<form method="post" action="detail/update.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">

		<div class="pageFormContent nowrap"
			style="border-bottom: 1px #B8D0D6 solid; padding-left: 50px;"
			layoutH="25">
			<dl style="margin-top: 30px;">
				
				<dt>
					销售分组：
				</dt>
				<dd>
				<input class="required" type="text" readonly="readonly"  size="45" name="deSort" value="${de.deSort }">
				</dd>
			</dl>
			<dl>
				<dt>
					员工姓名：
				</dt>
				<dd>
					<a href="detail/lookup.do" lookupGroup="user" title="用户查询" >
						<input type="text"  class="clear_user required"  toName="user.name" value="<my:outTrueName id="${de.deStaff }"/>" size="45" />
					</a>
					<input type="hidden" readonly="readonly" name="deStaff" toName="user.id" value="${de.deStaff }"  class="clear_user" />
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
				

				</dd>
			</dl>
				<dl>
				<dt>
					考核项分组：
				</dt>
				<dd>
					<select id="inputOrg1" class="combox" name="deGroup"  sValue="${de.deGroup }">
						<option value="">-----------------请选择分组----------------</option>
						<option value="1">销售人员考核项</option>
						<option value="2">大区经理考核项</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>
					选择打分项：
				</dt>
				<dd>
				
					<a  href="assess/lookUpPage.do?asGroup={inputOrg1}" warn="请选择考核项分组" lookupGroup="as" title="考核项查询" >
						<input type="text" name="deName"  class="clear_user required"  toName="as.name"  value="${de.deName }" size="45"  />
					</a>
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
				
				</dd>
			</dl>
			<dl>
				<dt>
					分值：
				</dt>
				<dd>
					<input type="text" class="readonly" name="deMinute" value="${de.deMinute }" toName="as.minute" size="50"/>
				</dd>
			</dl>
			<dl>
				<dt>
					备注：
				</dt>
				<dd>
					<textarea name="deRemark" rows="6" cols="50"><c:out value="${de.deRemark }" /></textarea>
				</dd>
			</dl>

			<input type="hidden" name="id" value="${de.id }">
			<input type="hidden" name="rel" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />
			<div class="buttonActive"
				style="margin-left: 150px; margin-top: 20px">
				<div class="buttonContent">
					<button type="submit">
						保存
					</button>
				</div>
			</div>
			<div class="button" style="margin-left: 10px; margin-top: 20px">
				<div class="buttonContent">
					<button type="reset">
						清空
					</button>
				</div>
			</div>
			<div class="button" style="margin-left: 10px; margin-top: 20px">
				<div class="buttonContent">
					<button type="button" class="close">
						关闭
					</button>
				</div>
			</div>

		</div>


	</form>
</div>







