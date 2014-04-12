<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：协同办公--通知管理 --添加
--%>

<div class="pageContent" >
			
<form method="post" action="notice/add.do" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="56">
			<dl>
				<dt>标题：</dt>
				<dd >
					<input type="text" name="noticeTitle" class="required" maxlength="100"   size="45" />
					<label >&nbsp;&nbsp;&nbsp;发送提醒<input style="vertical-align:middle;" type="checkbox" name="isSendMsg" value="1" checked="checked"/></label>
				</dd>
			</dl>
			<dl>
				<dt>通知类型：</dt>
				<dd>
					<select class="combox required"   name="noticeType" >
						<option value="">--选择通知类型--</option>
						<my:outOptions type="1"/>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>接收部门：</dt>
				<dd>
					<a href="dept/lookUpPage.do?type=2" lookupGroup="dept" title="部门查询" >
						<textarea class="clear_dept" readonly="readonly"  toName="dept.name" cols="65" rows="2"/>
					</a>
					<input type="hidden" class="clear_dept" name="deptIds" toName="dept.id" maxlength="65530"/>
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_dept"  title="清空">清空</a>
				</dd>
			</dl>
			
			<dl>
				<dt>接收人员：</dt>
				<dd>
					<a href="user/lookUpPage.do?type=2" lookupGroup="user" title="用户查询" >
						<textarea  readonly="readonly" class="clear_user" toName="user.name" cols="65" rows="2"/>
					</a>
					<input type="hidden"  name="userIds" toName="user.id" class="clear_user" maxlength="65530"/>
					<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
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
					<textarea  name="noticeContent" cols="100" rows="15" class="editor" maxlength="65530" minlength="1"></textarea>
				</dd>
			</dl>

			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		
	</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">发布</button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>
										
						
					
		

	

