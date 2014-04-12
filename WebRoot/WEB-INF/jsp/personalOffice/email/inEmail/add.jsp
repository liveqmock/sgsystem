<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-内部邮件-回复邮件
--%>

<div class="pageContent" >
			
<form method="post" action="email/addIn.do" enctype="multipart/form-data"  onsubmit="return iframeCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap"  layoutH="56">
			<dl>
				<dt>收件人：</dt>
				<dd>
					<a href="user/lookUpPage.do?type=2" lookupGroup="user" title="用户查询" >
						<input type="text"  class="clear_user required"  toName="user.name"  size="80" value="<my:outTrueName id="${email.emInbox.eiUid}"/>" />
					</a>
					<input type="hidden" readonly="readonly" name="userIds" toName="user.id" value="${email.emInbox.eiUid }" class="clear_user" />
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
				</dd>
			</dl>
			<dl>
				<dt>标题：</dt>
				<dd >
					<input type="text" name="eoName"  class="required"  maxlength="50" value="回复：<c:out value="${email.emInbox.eiName }"/>"  size="80" />
				</dd>
			</dl>
			<dl>
				<dt>附件：</dt>
				<dd>
					<div>
						<table class="list nowrap itemDetail" addButton="添加" width="500">
							<thead>
								<tr>
									<th type="file" name="file[#index#]"   fileupload="no"  fieldAttrs="{width:250}">批量上传</th>
									<th type="del" width="60">删除</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
						<span class="info">为节省服务器空间，建议将文件压缩之后再上传！</span>
					
					</div>
				</dd>
				
			</dl>
			<dl>
				<dt>回复：</dt>
				<dd>
				<textarea  name="eoDetail" cols="100" rows="15" class="editor" >
					<br/><br/><br/>--------------原始邮件-------------<br/><br/>
							<table  width="90%"  style="background-color: #EFF5FB;" height="80px">
								<tr>
									<td>发件人：<my:outTrueName id="${uid }"/></td>
								</tr>
								<tr>
									<td>发送时间：
										<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
								</tr>
								<tr>
									<td>收件人：<my:outTrueName id="${sessionScope.minfo.id }"/></td>
								</tr>
								<tr>
									<td>主&nbsp;&nbsp;&nbsp;&nbsp;题：
										<span style="font-weight: bold;"><c:out value="${name }" /></span>
									</td>
								</tr>
								</table>
								<div style="margin-top:10px;"><c:out value="${detail }" /></div>
					</textarea>
				</dd>
			</dl>
			<input type="hidden" name="type" value="out"/>
			<input type="hidden" name="id" value="${email.emInbox.id}" />
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		
	</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">发送</button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="submit" onclick="mailboxaddcaogao(this)">保存草稿箱</button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>
										
		<script type="text/javascript">
		function mailboxaddcaogao(bt){
			var $form=$(bt).closest("form");
			$form.attr("action","email/save.do");
			$("input[toName='user.name']",$form).removeClass("required"); 
		}

	</script>					
									
					
		

	

