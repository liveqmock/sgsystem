<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：系统管理--菜单管理 -- 添加菜单
--%>

					
<form method="post" action="menu/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap" layoutH="98" >
		<c:if test="${sessionScope.dev }">
			<div class="unit" style="margin-left: 120px;">
				<c:choose>
					<c:when test="${param.superId==null}">
						<span>添加顶级菜单</span>
					</c:when>
					<c:otherwise>
						<span>添加菜单：上级菜单为：<font color='red'>[ <my:coded str='${param.superName }' /> ]</font></span>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="divider"></div>
		</c:if>
		<div style="margin-left: 100px;">
			<dl>
				<dt>菜单序号：</dt>
				<dd>
					<input type="text" name="menuSort" maxlength="3" class="required digits" min="1" max="999" size="25"/>
					<span class="info">用于同级菜单排序，值越小越靠前(数值范围：1-999 整数)</span>
				</dd>
			</dl>
			<dl>
				<dt>菜单名称：</dt>
				<dd>
					<input type="text" name="menuName" class="required" maxlength="20" size="25"/>
				</dd>
			</dl>
			<dl>
				<dt>菜单图片：</dt>
				<dd>
					<a href="menu/icons.do" lookupGroup="icon" title="菜单图标查询">
						<input type="text" maxlength="100" name="menuIcon" readonly="readonly" size="25" toName="icon.url"  />
					</a><a class="btnLook" href="menu/icons.do" lookupGroup="icon" >查找带回</a>
				</dd>
			</dl>
			<dl>
				<dt>url：</dt>
				<dd>
					<input  type="text" name="menuUrl"   maxlength="255" size="55"/>
					
				</dd>
			</dl>
			<dl>
				<dt>target：</dt>
				<dd>
					<input type="text" name="menuTarget"  maxlength="10" size="25" value="navTab"/>
					<span class="info">页面打开区域，dwz参数：navTab(在标签中),dialog(弹出窗口);_blank(在浏览器新窗口)</span>
				</dd>
			</dl>
			
			<dl>
				<dt>rel：</dt>
				<dd>
					<input type="text" name="menuRel" size="25" maxlength="20"/>
					<span class="info">dwz参数,rel为打开页面所在标签或弹出窗口的id，如果重复，将在同一标签打开</span>
				</dd>
			</dl>
			<dl>
				<dt>external：</dt>
				<dd>
					<select class="combox"  name="menuExternal" >
							<option value="false" >false</option>
							<option value="true">true</option>
					</select>
					<span class="info">dwz参数,为external="true"或者href是外网连接时，以iframe方式打开navTab页面</span>
				</dd>
			</dl>
			<dl>
				<dt>fresh：</dt>
				<dd>
					<select class="combox"  name="menuFresh" >
							<option value="true">true</option>
							<option value="false">false</option>
					</select>
					<span class="info">dwz参数,表示重复打开navTab时是否重新加载数据</span>
				</dd>
			</dl>
			<dl>
				<dt>上级菜单：</dt>
				<dd>
					<a href="menu/lookUpPage.do" lookupGroup="menu" title="上级菜单查询"><input value="<my:coded str='${param.superName }' defaultValue=""/>" type="text" readonly="readonly" size="25" toName="menu.name" class="required"/></a><a class="btnLook" href="menu/lookUpPage.do" lookupGroup="menu" >查找带回</a>
					
					<input type="hidden" name="menuSuperId" size="25" toName="menu.id"  value="${param.superId }" />
				</dd>
			</dl>
			<dl>
				<dt>默认是否打开：</dt>
				<dd>
					<select class="combox"  name="menuOpen" >
							<option value="false">关闭</option>
							<option value="true">打开</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>是否可用：</dt>
				<dd>
					<select class="combox"  name="menuStatus" >
							<option value="1">可用</option>
							<option value="0">禁用</option>
					</select>
				</dd>
			</dl>
			<input type="hidden" name="navTabId" value="${param.rel }"/>
		</div>
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
	</div>
</form>
										
						
					
		

	

