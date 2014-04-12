<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：个人办公--积分考核--人员打分修改
	--%>

<div class="pageContent">

	<form method="post" action="detail/check.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">
		
		<div class="pageFormContent nowrap"
			style="border-bottom: 1px #B8D0D6 solid; padding-left: 50px;"
			layoutH="56">
			<dl style="margin-top: 30px;">

				<dt>
					销售分组：
				</dt>
				<dd>
					<c:out value="${de.deSort }" />
				</dd>
			</dl>
			<dl>
				<dt>
					员工姓名：
				</dt>
				<dd>
					<my:outTrueName id="${de.deStaff }" />

				</dd>
			</dl>
			<dl>
				<dt>
					考核项分组：
				</dt>
				<dd>
					<c:if test="${de.deGroup ==1}">
						<c:out value="销售人员考核项" />
					</c:if>
					<c:if test="${de.deGroup ==2}">
						<c:out value="大区经理考核项" />
					</c:if>
				</dd>
			</dl>
			<dl>
				<dt>
					选择打分项：
				</dt>
				<dd>
					<c:out value="${de.deName }" />
				</dd>
			</dl>
			<dl>
				<dt>
					分值：
				</dt>
				<dd>
					<c:out value="${de.deMinute }" />
				</dd>
			</dl>
			<dl>
				<dt>
					备注：
				</dt>
				<dd>
					<c:out value="${de.deRemark }" />
				</dd>
			</dl>
			
			<dl>
				<dt>
					审核说明：
				</dt>
				<dd >
					<textarea name="remark" cols="46" rows="4"></textarea>
				</dd>
			</dl>
			<input type="hidden" name="status" id="status" value="1">
			<input type="hidden" name="id" value="${de.id }">
			<input type="hidden" name="rel" value="${param.rel}" />
			<input type="hidden" name="callbackType" value="closeCurrent" />
		
		</div>
			
			<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" >
						通过
					</button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="submit"  onclick="check(this)">
						驳回
					</button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="button" class="close">
						关闭
					</button></div></div></li>
			</ul>
		</div>
		

	</form>
</div>
<script type="text/javascript">
		function check(bt){
			var $form=$(bt).closest("form");
			$("#status",$form).val(2);
		}

	</script>	






