<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--会议管理 -- 查看会议详情
--%>

<div class="pageContent" >
		<div class="pageFormContent nowrap" layoutH="1">
			<dl style="margin-top: 10px;">
				<dt>
					类型：
				</dt>
				<dd>
					<my:outSelectValue id="${requestScope.meeting.MType }"/>
					
				</dd>
			</dl>
			<dl>
				<dt>
					标题：
				</dt>
				<dd>
				<c:out value="${requestScope.meeting.MName}" />
				</dd>
			</dl>
			<dl>
				<dt>
					主持人：
				</dt>
				<dd>
					<c:out value="${requestScope.meeting.MHost}" />

				</dd>
			</dl>
			<dl>
				<dt>
					会议日期：
				</dt>
				<dd>
					<fmt:formatDate value="${requestScope.meeting.MDate}" pattern="yyyy-MM-dd" />
				</dd>
			</dl>
			<dl>
				<dt>
					开始时间：
				</dt>
				<dd>
					<c:out value="${requestScope.meeting.MStatime}" />
				</dd>
			</dl>
			<dl>
				<dt>

					结束时间：
				</dt>
				<dd>
				<c:out value="${requestScope.meeting.MEndtime}" />
				</dd>
			</dl>
			<dl>
				<dt>
					会议室：
				</dt>
				<dd>
						<c:forEach var="l" items="${requestScope.list}">
								<c:if test="${l.id==requestScope.meeting.room.id }">
									<c:out value="${l.mrName }" />
								</c:if>
						</c:forEach>

				</dd>
			</dl>
			<dl>
				<dt>
					参与部门：
				</dt>
				<dd>
					<c:out value="${requestScope.deptNames }" />
				</dd>
			</dl>
			
			<dl>
				<dt>
					参与人：
				</dt>
				<dd>
					<c:out value="${requestScope.userNames }" />
				</dd>
			</dl>
			<dl>
				<dt>
					简介：
				</dt>
				<dd>
					<c:out value="${requestScope.meeting.MSummary }" />
				</dd>
			</dl>
			<dl>
				<dt>
					备注：
				</dt>
				<dd>
					<my:scriptEscape value="${requestScope.meeting.MRemark }"/>
				</dd>
			</dl>


		</div>

</div>







