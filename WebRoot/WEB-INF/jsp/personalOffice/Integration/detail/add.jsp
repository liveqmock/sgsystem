<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--积分考核--人员打分
	--%>

<div class="pageContent" >

	<form method="post" action="scoringMonth/add.do"
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
				<input class="required" type="text" readonly="readonly"  size="45" name="deSort" value="${deptName}">
				
				
				</dd>
			</dl>
			<dl>
				<dt>
					员工姓名：
				</dt>
				<dd>
					<a href="detail/lookup.do" lookupGroup="user" title="用户查询" >
						<input type="text"  class="clear_user required"  toName="user.name"  size="45" />
					</a>
					<input type="hidden" readonly="readonly" id="uid" name="deStaff" toName="user.id"  class="clear_user"  onchange="minute(this)"/>
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
				

				</dd>
			</dl>
			<dl>
			<dt>
			当前积分：
			</dt>
			<dd>
					<input type="text"  toName="user.minute"  size="25" />
					<span class="info">格式：月积分/年积分</span>
					</dd>
			</dl>
				<dl>
				<dt>
					考核项分组：
				</dt>
				<dd>
					<select id="inputOrg1" class="combox" name="deGroup" >
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
<%--						<input type="text" name="deName"  class="clear_user required"  toName="as.name"  size="45"  />--%>
						<textarea class="clear_user required" readonly="readonly"
						name="deName" 	toName="as.name" cols="33" rows="2" />
					</a>
<%--					<input type="hidden" readonly="readonly" name="smStaff" toName="as.id"  class="clear_user" />--%>
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
				
				</dd>
			</dl>
			<dl>
				<dt>
					分值：
				</dt>
				<dd>
					<input type="text" class="readonly" name="minute" toName="as.minute" size="45"/> 
				
				</dd>
			</dl>
			<dl>
				<dt>
					打分说明：
				</dt>
				<dd>
					<textarea name="deRemark" rows="6" cols="50"></textarea>
				</dd>
			</dl>


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




