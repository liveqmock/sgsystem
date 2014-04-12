/**
 * dwz zTree 
 */
//zTree 节点点击事件   打开标签，或者弹出窗口
//event 对象标准的 js event 对象
//treeId(String) 对应 zTree 的 treeId 
//treeNodeJSON   被点击的节点 JSON 数据对象
function zTreeClick(event,treeId, treeNodeJSON){
	//点击打开
	if(treeNodeJSON.clickOpen){
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		zTree.expandNode(treeNodeJSON);
	}
	
	if(!treeNodeJSON.href)return ;
	
	if(treeNodeJSON.dwzTarget=="navTab"){
		
		var title = treeNodeJSON.title||treeNodeJSON.name;
		var tabid = treeNodeJSON.rel || "_blank";
		var fresh = eval(treeNodeJSON.fresh || "true");
		var external = eval(treeNodeJSON.external || "false");
		var url = unescape(treeNodeJSON.href).replaceTmById($(event.target).parents(".unitBox:first"));
		if (!url.isFinishedTm()) {
			alertMsg.error(treeNodeJSON.warn || DWZ.msg("alertSelectMsg"));
			return false;
		}
		navTab.openTab(tabid, url,{title:title, fresh:fresh, external:external});

		//event.preventDefault();
		
		
		return false;
		
	}else if(treeNodeJSON.dwzTarget=="dialog"){
		
		var title = treeNodeJSON.title||treeNodeJSON.name;
		var rel = treeNodeJSON.rel || "_blank";
		var options = {};
		var w = treeNodeJSON.width;
		var h = treeNodeJSON.height;
		if (w) options.width = w;
		if (h) options.height = h;
		options.max = eval(treeNodeJSON.max || "false");
		options.mask = eval(treeNodeJSON.mask || "false");
		options.maxable = eval(treeNodeJSON.maxable || "true");
		options.minable = eval(treeNodeJSON.minable || "true");
		options.fresh = eval(treeNodeJSON.fresh || "true");
		options.resizable = eval(treeNodeJSON.resizable || "true");
		options.drawable = eval(treeNodeJSON.drawable || "true");
		options.close = eval(treeNodeJSON.close || "");
		options.param = treeNodeJSON.param || "";
		var url = unescape(treeNodeJSON.href).replaceTmById($(event.target).parents(".unitBox:first"));
		if (!url.isFinishedTm()) {
			alertMsg.error(treeNodeJSON.warn || DWZ.msg("alertSelectMsg"));
			return false;
		}
		$.pdialog.open(url, rel, title, options);
		
		return false;
	}else if(treeNodeJSON.dwzTarget=="ajax"){
		var rel = treeNodeJSON.rel;
		if (rel) {
			var $rel = $("#"+rel);
			$rel.loadUrl(treeNodeJSON.href, {}, function(){
				$rel.find("[layoutH]").layoutH();
			});
		}
		event.preventDefault();
		return false;
		
		
	}
	
}
//展开,合并,全部节点
function zTreeExpandAllNodes(id,expand){
	$.fn.zTree.getZTreeObj(id).expandAll(expand);
}
//全选，全部取消按钮
function zTreeCheckAllNodes(id,expand) {
	$.fn.zTree.getZTreeObj(id).checkAllNodes(expand)
}

