<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：人事管理--人员管理-人员添加
--%>

<div class="pageContent">

	<form method="post" action="staff/add.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone)">

		<div class="pageFormContent"
			style="border-bottom: 1px #B8D0D6 solid; padding-left: 20px;"
			layoutH="56">
			<dl style="margin-top: 1px;">
				<dt>
					姓名：
				</dt>
				<dd>
					<input type="text" name="psName" class="required" maxlength="50"
						size="35"/>

				</dd>
			</dl>
			<dl style="margin-top: 1px;">
				<dt>
					性别：
				</dt>
				<dd>
				
   						<input type="radio" name="psSex" checked="checked" value="男" />
					男
   					
						<input type="radio" name="psSex" value="女" />
					女
  				 
				</dd>
			</dl>
			<dl>
				<dt>
					出生日期：
				</dt>
				<dd>
					<input type="text"  readonly="readonly" onfocus="WdatePicker({startDate:'1980-01-01'})" size="30" name="psBirthday"   />
					<a class="inputDateButton" href="javascript:;">选择</a>

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
					<input type="text" name="psAccountAddress" maxlength="50" size="35"  />

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


					<a href="user/lookUpPage.do?type=1" lookupGroup="user">
					 <input type="text" class="notice_user" toName="user.name" maxlength="50"
							size="29"  /> </a>
					<input type="hidden"  class="notice_user" name="psUserId"
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
					<input type="text" name="psStaffId" class="" maxlength="50"
						size="35"/>

				</dd>
			</dl>
			<dl>
				<dt>
					工资卡号：
				</dt>
				<dd>
					<input type="text" name="psWage" class="" maxlength="50"
						size="35"/>

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
					<select class="combox" name="psEdu"  >
					<option value="">--请选择--</option>
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
					<input type="text" name="psSpecialty" maxlength="50" size="35"  />

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
					毕业时间：
				</dt>
				<dd>
					<input type="text" readonly="readonly" onFocus="WdatePicker()"
						size="30" name="psGraduation"  />
					<a class="inputDateButton" href="javascript:;">选择</a>

				</dd>
			</dl>


			<dl>
				<dt>
					员工类型：
				</dt>
				<dd>
					<select class="combox" name="psType"  >
					<option value="">--请选择--</option>
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
					<select class="combox" name="psPost" >
					<option value="">--请选择--</option>
						<c:forEach var="listValues"
							items="${applicationScope.type2ListValues.type_12}">
							<option value="${listValues.value }">
								${listValues.name }
							</option>
						</c:forEach>
					</select>

				</dd>
			</dl>
			<dl>
				<dt>
					入职时间：
				</dt>
				<dd>
					<input type="text" readonly="readonly" onFocus="WdatePicker()"
						size="30" name="psEntryDate"  />
					<a class="inputDateButton" href="javascript:;">选择</a>
				</dd>
			</dl>
			<div class="pageContent" style="width: 800px; padding-left: 40px">
				<div class="tabs" currentIndex="0" eventType="click">
					<div class="tabsHeader">
						<div class="tabsHeaderContent">
							<ul>
								<li>
									<a href="javascript:;" onclick="value(this,'在职')"><span>在职</span>
									</a>
								</li>
								<li>
									<a href="javascript:;" onclick="value(this,'离职')"><span>离职</span>
									</a>
								</li>
								<li>
									<a href="javascript:;" onclick="value(this,'退休')"><span>退休</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="tabsContent" style="height: 200px;">
						<div align="center">
							<h2>
								暂不用填写
							</h2>
						</div>
						<div>
							<dl>
								<dt>
									离职原因：
								</dt>
								<dd>
									<select class="combox" name="psResReason" >
										<option value="">--请选择--</option>
										<c:forEach var="listValues"
											items="${applicationScope.type2ListValues.type_14}">
											<option value="${listValues.value }">
												${listValues.name }
											</option>
										</c:forEach>
									</select>
								</dd>
							</dl>
							<dl>
								<dt>
									离职时间：
								</dt>
								<dd>
									<input type="text" readonly="readonly" onFocus="WdatePicker()"
										name="psResDate"  />
									<a class="inputDateButton" href="javascript:;">选择</a>
								</dd>
							</dl>
							<dl class="nowrap">
								<dt>
									备注：
								</dt>
								<dd>
									<textarea class="edit" name="psResRemark" rows="6" cols="100"></textarea>
								</dd>
							</dl>
						</div>
						<div>
							<dl>
								<dt>
									退休原因：
								</dt>
								<dd>
									<select class="combox" name="psRetReason" >
									<option value="">--请选择--</option>
										<c:forEach var="listValues"
											items="${applicationScope.type2ListValues.type_15}">
											<option value="${listValues.value }">
												${listValues.name }
											</option>
										</c:forEach>
									</select>
								</dd>
							</dl>
							<dl>
								<dt>
									退休时间：
								</dt>
								<dd>
									<input type="text" readonly="readonly" onFocus="WdatePicker()"
										name="psRetDate" />
									<a class="inputDateButton" href="javascript:;">选择</a>
								</dd>
							</dl>
							<dl class="nowrap">
								<dt>
									备注：
								</dt>
								<dd>
									<textarea class="edit" name="psRetRemark" rows="6" cols="100"></textarea>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="psStatus" id="status" value="在职">
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

<script type="text/javascript">
	function value(from, bt) {
		var $form = $(from).closest("form");
		if (bt == '在职') {
			document.getElementById("status").value = bt;
		} else if (bt == '离职') {
			//$("input[toName='user.name']",$form).addClass("required");
			document.getElementById("status").value = bt;
		} else if (bt == '退休') {
			//	$("input[toName='user.name']",$form).removeClass("required"); 
			document.getElementById("status").value = bt;
		}
	}
	//$("input[toName='user.name']", $form).removeClass("required");
</script>




