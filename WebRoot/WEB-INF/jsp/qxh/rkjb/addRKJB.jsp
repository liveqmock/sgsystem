<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	模块：公各平台--人员管理加页面
--%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<form method="post" action="news/add.do"  class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
<div class="pageContent" >
	<div class="pageFormContent nowrap" style="padding-left:10px;"  layoutH="56">
	        <dl>
				<dt>
					姓名：
				</dt>
				<dd>
					<input type="text" name="newstitle" class="required" maxlength="100"
						size="50" />
				</dd>
			</dl>
			<dl>
		     <dt>
			新闻类型:
			</dt>
			 <dd>
	          <select class="combox required"   name="typeid">
	          		<option value="">--请选择新闻类型--</option>
	          		<my:outOptions type="3"/>
	          </select>
			 </dd>
			</dl>
			<dl>
				<dt>
                                                评论:
			</dt>
			<dd>
			<select class="combox"   name="allowcomment">
			<option value="0">允许评论</option>
			<option value="1">禁止评论</option>
			</select>
			</dd>
			</dl>
			<dl>
			<dt>
			置顶:
			</dt>
			<dd>
			<input type="checkbox" name="Stick" value="1">使新闻置顶，显示为重要
			 </dd>
			</dl>
			<dl>
			<dt>
			新闻简介:
			</dt>
			<dd>
			<textarea rows="3" cols="50" name="plotsummary" maxlength="200"></textarea>
			</dd>
			</dl>
			<dl>
			<dt>
			新闻内容:
			</dt>
			<dd>
			<textarea  name="newsplot" cols="100" rows="10" class="editor" ></textarea>
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
</div>
</form>