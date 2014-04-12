<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-内部邮件-新建邮件
--%>

<div class="pageContent" >
			
<form method="post" action="email/add.do" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="56">
			<dl>
				<dt>收件人：</dt>
				<dd>
					<a href="user/lookUpPage.do?type=2" lookupGroup="user" title="用户查询" >
						<input type="text" readonly="readonly" class="clear_user required"  toName="user.name"  size="80" />
					</a>
					<input type="hidden"   name="userIds" toName="user.id" class="clear_user" />
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
				</dd>
			</dl>
			
			<dl>
				<dt>标题：</dt>
				<dd >
					<input type="text" name="eoName" class="required"  maxlength="50"   size="80" />
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
				<dt>内容：</dt>
				<dd>
					<textarea  name="eoDetail" cols="100" rows="15" class="editor" ></textarea>
				</dd>
			</dl>
			<input type="hidden" name="type" value="new"/>
			<input type="hidden" name="id" value=""/>
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
					
		

	

