<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：人事管理--人员管理--在职员工
	--%>

<div class="pageContent" align="center">

	<form method="post" action="staff/updateStatus.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">

		

			<div class="pageFormContent" style="width: 780px; padding-left: 0px">
				<div class="tabs" id="cur" currentIndex="0" eventType="click">
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
								<li >
									<a href="javascript:;" onclick="value(this,'退休')"><span>退休</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="tabsContent" style="height: 300px;">
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
									<select class="combox" name="psResReason" id="psResReason">
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
									<input type="text" readonly="readonly" id="psResDate" onFocus="WdatePicker()"
										name="psResDate" />
									<a class="inputDateButton" href="javascript:;">选择</a>
								</dd>
							</dl>
							<dl class="nowrap">
								<dt>
									备注：
								</dt>
								<dd>
									<textarea class="edit" id="psResRemark" name="psResRemark" rows="6" cols="100"></textarea>
								</dd>
							</dl>
						</div>
						<div>
							<dl>
								<dt>
									退休原因：
								</dt>
								<dd>
									<select class="combox" name="psRetReason" id="psRetReason">
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
									<input type="text" readonly="readonly" id="psRetDate" onFocus="WdatePicker()"
										name="psRetDate" />
									<a class="inputDateButton" href="javascript:;">选择</a>
								</dd>
							</dl>
							<dl class="nowrap">
								<dt>
									备注：
								</dt>
								<dd>
									<textarea class="edit" name="psRetRemark" id="psRetRemark" rows="6" cols="100"></textarea>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="id" value="${param.id}">
			<input type="hidden" name="psStatus" id="status" value="在职">
			<input type="hidden" name="rel" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />
			<div class="buttonActive" align="center"
				style="margin-left: 250px; margin-top: 10px">
				<div class="buttonContent">
					<button type="submit">
						保存
					</button>
				</div>
			</div>
			<div class="button" style="margin-left: 10px; margin-top: 10px">
				<div class="buttonContent">
					<button type="reset">
						清空
					</button>
				</div>
			</div>
			<div class="button" style="margin-left: 10px; margin-top: 10px">
				<div class="buttonContent">
					<button type="button" class="close">
						关闭
					</button>
				</div>
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
			document.getElementById("psRetReason").reset();
			document.getElementById("psRetDate").reset();
			document.getElementById("psRetRemark").reset();
			
		} else if (bt == '退休') {
			//	$("input[toName='user.name']",$form).removeClass("required"); 
			document.getElementById("status").value = bt;
			
		}
	}
	//$("input[toName='user.name']", $form).removeClass("required");
	
</script>






