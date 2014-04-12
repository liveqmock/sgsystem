<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-内部邮件-回复邮件
--%>

<div class="pageContent" >
			
<form method="post" action="email/addIn.do" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="56">
			<dl>
				<dt>收件人：</dt>
				<dd>
					<a href="user/lookUpPage.do?type=2" lookupGroup="user" title="用户查询" >
						<input type="text" readonly="readonly" class="clear_user required"  toName="user.name"  size="80" value=""/>
					</a>
					<input type="hidden" readonly="readonly"  name="userIds" toName="user.id" value="" class="clear_user" />
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
				</dd>
			</dl>
			
			<dl>
				<dt>标题：</dt>
				<dd >
					<input type="text" name="eoName" class="required"  maxlength="50" value="转发：<c:out value="${email.emInbox.eiName }"/>"  size="80" />
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
							<tbody>
								<c:forEach  var="ef"  items="${requestScope.emFile }" >
									<tr class="unitBox">	
										
											<td><c:out value="${ef.efName }"/></td>
											<td>
												<a class="btnDel" href="email/delFile?id=${ef.id }" target="ajaxTodo" title="请谨慎操作!!此操作为动态删除,会立即执行删除附件操作,您确认删除吗?">删除</a>
											</td>
											
									</tr>
								</c:forEach>
						</tbody>
							
						</table>
						
						<span class="info">为节省服务器空间，建议将文件压缩之后再上传！</span>
					
					</div>
				</dd>
				
			</dl>
		
			<dl>
				<dt>内容：</dt>
				<dd>
				<textarea  name="eoDetail" cols="100" rows="15" class="editor" >${email.emInbox.eiDetail }</textarea>
				</dd>
			</dl>
			<input type="hidden" name="type" value="in"/>
			<input type="hidden" name="id" value="${email.emInbox.id}"/>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		
	</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">发送</button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>
										
						
					
		

	

