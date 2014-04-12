<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%--
	
	DWZ ajax 返回 消息格式  
	statusCode:消息状态码  300：操作失败，301：登录超时，200：操作成功
	message：消息提示。
	navTabId：把指定navTab页面标记为需要“重新载入”。注意navTabId不能是当前navTab页面的  
	rel：指定刷新的DIV, 不刷新当前标签页，而只刷新指定div，rel为DIV的id，
		navTabId和 rel两个值的优先级为navTabId > rel,只能采用一种刷新方式页可以两个都没有值
	callbackType：closeCurrent：关闭当前tab; forward: 请求结束之后再次发送请求，在当前tab加载，forwardUrl值需指定跳转的url,
				  forwardConfirm:提示 继续下一步 ,加载forwardUrl指定的请求
	forwardUrl：请求的url
--%>


{
	"statusCode":"${statusCode}", 
	"message":"${message}", 
	"navTabId":"${param.navTabId}", 
	"rel":"${param.rel}",
	"callbackType":"${param.callbackType}",
	"forwardUrl":"${param.forwardUrl}"
}