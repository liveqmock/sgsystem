<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	模块：人事管理--人员管理-人员添加
--%>

<div class="pageContent">

	<form id="pagerForm" onsubmit="return divSearch(this, '${search }');;" action="staff/work.do" method="get">
		<div class="pageFormContent"
			style="border-bottom: 1px #B8D0D6 solid; padding-left: 20px;"
			layoutH="56">
			<dl style="margin-top: 1px;">
				<dt>
					姓名：
				</dt>
				<dd>
					<input type="text" name="psName" class="" maxlength="50"
						size="35" />

				</dd>
			</dl>
			<dl style="margin-top: 1px;">
				<dt>
					性别：
				</dt>
				<dd>
					<input type="radio" name="psSex"  value="男" />
					男
					<input type="radio" name="psSex" value="女" />
					女
				</dd>
			</dl>

			<dl>
				<dt>
					年龄：
				</dt>
				<dd>
					<input type="text" name="psAge" class="digits" maxlength="50"
						size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					现居住地：
				</dt>
				<dd>
					<input type="text" name="psPresentAddress" maxlength="50" size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					住宅电话：
				</dt>
				<dd>
					<input type="text" name="psHomePhone" maxlength="50" size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					手机号码：
				</dt>
				<dd>
					<input type="text" name="psPhone" class="phone" maxlength="50"
						size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					其他联系：
				</dt>
				<dd>
					<input type="text" name="psOther" maxlength="50" size="35" />

				</dd>
			</dl>

			<dl>
				<dt>
					户口所在地：
				</dt>
				<dd>
					<input type="text" name="psAccountAddress" maxlength="50" size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					民族：
				</dt>
				<dd>
					<input type="text" name="psEthnic" maxlength="50" size="35" />

				</dd>
			</dl>


			<dl>
				<dt>
					身份证号：
				</dt>
				<dd>
					<input type="text" name="psCard" class="" maxlength="50" size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					籍贯：
				</dt>
				<dd>
					<input type="text" name="psHomeTown" maxlength="50" size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					用户账号：
				</dt>
				<dd>


					<a href="user/lookUpPage.do?type=1" lookupGroup="user"> <input
							type="text" class="notice_user" toName="user.name" maxlength="50"
							size="29" /> </a>
					<input type="hidden" value="" class="notice_user" name="psUserId"
						readonly="readonly" size="50" toName="user.id">
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"
						resetClass="notice_user" title="清空">清空</a>



				</dd>
			</dl>
			<dl>
				<dt>
					员工编号：
				</dt>
				<dd>
					<input type="text" name="psStaffId" class="digits" maxlength="50"
						size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					工资卡号：
				</dt>
				<dd>
					<input type="text" name="psWage" class="digits" maxlength="50"
						size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					社保号：
				</dt>
				<dd>
					<input type="text" name="psSocial" class="digits" maxlength="50"
						size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					最高学历：
				</dt>
				<dd>
					<select class="combox" name="psEdu">
						<option value="">
							--请选择--
						</option>
						<c:forEach var="listValues"
							items="${applicationScope.type2ListValues.type_13}">
							<option value="${listValues.value }">
								${listValues.name }
							</option>
						</c:forEach>
					</select>

				</dd>
			</dl>
			<dl>
				<dt>
					所学专业：
				</dt>
				<dd>
					<input type="text" name="psSpecialty" maxlength="50" size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					毕业院校：
				</dt>
				<dd>
					<input type="text" name="psSchool" maxlength="50" size="35" />

				</dd>
			</dl>
			<dl>
				<dt>
					员工类型：
				</dt>
				<dd>
					<select class="combox" name="psType">
						<option value="">
							--请选择--
						</option>
						<c:forEach var="listValues"
							items="${applicationScope.type2ListValues.type_11}">
							<option value="${listValues.value }">
								${listValues.name }
							</option>
						</c:forEach>
					</select>

				</dd>
			</dl>
			<dl>
				<dt>
					员工职位：
				</dt>
				<dd>
					<select class="combox" name="psPost">
						<option value="">
							--请选择--
						</option>
						<c:forEach var="listValues"
							items="${applicationScope.type2ListValues.type_12}">
							<option value="${listValues.value }">
								${listValues.name }
							</option>
						</c:forEach>
					</select>

				</dd>
			</dl>
			<input type="hidden" name="psStatus" id="status" value="${search }">
			<input type="hidden" name="rel" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />


		</div>
		<div class="formBar">
			<ul style="float: left; margin-left: 40%;">
				<li>
					<div class="buttonActive">
						<div class="buttonContent">

							<button type="submit" onclick="mailboxaddcaogao(this)">
								查询
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

<script type="text/javascript">
	function mailboxaddcaogao(bt) {
		var $form = $(bt).closest("form");
		var status=document.getElementById("status").value;
		if(status=='work'){
			$form.attr("action", "staff/work.do");
		}else if(status=='res'){
			$form.attr("action", "staff/res.do");
		}else if(status=='ret'){
			$form.attr("action", "staff/ret.do");
		}
		
	}
</script>



