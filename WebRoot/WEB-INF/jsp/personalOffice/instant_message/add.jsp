<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--即时消息--发送消息
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>发送消息</span></a></li>
					<li><a href="instantMessage/selectHistoryMessage.do?userId=${param.userId }&rel=${param.rel}" target="ajax" rel="${param.rel }_history_message"><span>历史记录</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" >
		
			<div id="instantMessage_addform" class="pageContent" style="border:1px #B8D0D6 solid;display:block; overflow:auto;">
			
				<form method="post" action="instantMessage/add.do"  class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
					<div class="pageFormContent nowrap"   layoutH="100">
						<dl>
							<dt>接收人：</dt>
							<dd>
								<a href="user/lookUpPage.do?type=2" lookupGroup="user" title="用户查询" >
									<input type="text"  readonly="readonly" class="clear_user required" toName="user.name" size="70" value="<my:outTrueName id="${param.userId}"/>"/>
								</a>
								<input type="hidden"  name="userIds" toName="user.id" class="clear_user" value="${param.userId }"/>
								<a class="btnDel" href="javascript:;" style="margin-left: 5px;"  resetClass="clear_user"  title="清空">清空</a>
							</dd>
						</dl>
						<dl>
							<dt>内容：</dt>
							<dd>
								<textarea  name="messageContent" cols="100" rows="15" class="editor required" minlength="1" maxlength="65530"></textarea>
							</dd>
						</dl>
						<input type="hidden" name="navTabId" value="${param.rel}"/>
						
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
		
			<div id="${param.rel }_history_message">
					
					<%@ include file="/WEB-INF/jsp/personalOffice/instant_message/history_message.jsp" %>
										
						
			</div>
				
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>