
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：个人办公--人员评分
--%>
<div class="pageContent" style="padding: 1px">
	<style>
		<!--
			/* 流程表单样式   */
			table.flowtable{
				border-collapse:collapse;
				border: 1px solid #B8D0D6;
				height: auto;
				margin-top: 5px;
				margin-bottom: 2px;
			}
			table.flowtable caption{
				font-size: 15px;
				font-weight: bold;
				padding: 5px;
			}
			table.flowtable th{
				border: 1px solid #B8D0D6;
				padding: 10px;
				font-weight: bold;
				text-align:center;
			}
			table.flowtable td{
				border: 1px solid #B8D0D6;
				padding: 10px;
			}
			
			table.flowtable textarea{
				width: 300px;
				height: 50px;
			}
			table.flowtable span.error { display:inline; overflow:hidden; width:auto; height:21px;  line-height:21px; background:#F00; color:#FFF; position:relative;top:-1px;;left:2px;z-index: 99999}
			
		-->
		</style>
	
			
			
				<!-- 左侧 -->
			<div 	style="float: left; display: block; overflow: auto; width: 480px;  line-height: 25;  margin-right: 2px;">
				<form method="post" action="scoringMonth/add.do"	class="pageForm required-validate"	onsubmit="return validateCallback(this,navTabAjaxDone)">
				
					<div  layoutH="38">
						
						<table class="flowtable" style="width: 100%" >
							
							<tr>
								<th>
									销售分组：
								</th>
								<td>
									<input class="required" type="text" readonly="readonly"
										size="45" name="deSort" value="${deptName}">


								</td>
							</tr>
							
							<tr>
								<th>
									员工姓名：
								</th>
								<td >
									<a href="detail/lookup.do" lookupGroup="user" title="用户查询">
										<input type="text" class="clear_user required"
											toName="user.name" size="45" /> </a>
									<input type="hidden" readonly="readonly" id="uid"
										name="deStaff" toName="user.id" class="clear_user"
										onchange="minute(this)" />
								
								
									<a class="btnDel" href="javascript:;" style="float:right;"
										resetClass="clear_user" title="清空">清空</a>

								</td>	
								
							</tr>
							
							<tr>
								<th>
									当前积分：
								</th>
								<td >
									<input type="text" class="clear_user" toName="user.minute" size="25" />
									<span class="info">格式：月积分/年积分</span>
								</td>
							</tr>
							
							<tr>
								<th>
									考核项分组：
								</th>
								<td >
									<select id="inputOrg1" class="combox"  name="deGroup" onchange="assess(this)">
										<option value="">
											---请选择分组--
										</option>
										<option value="1">
											销售人员考核项
										</option>
										<option value="2">
											大区经理考核项
										</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td colspan="2">
									<table  class="flowtable"  style="width: 100%" >
										<caption>评分项目列表</caption>
										<thead>
											<tr>
												<th >
													考核名称
												</th>
												<th  style="width: 60px;">
													参考分值
												</th>
												<th  style="width: 60px;"> 
													实际分值
												</th>
											</tr>
										</thead>
										<tbody id="tbodyDfx">
											
										</tbody>
										<tfoot>
											<tr>
												<td align="center" colspan="2">
													<span style="font-weight: bold;">实际总积分:</span>
												</td>
												<td align="center">
													<span id="span_khxzf">0</span>
												</td>
											</tr>
										
										</tfoot>
										
									</table>
								
								
								</td>
							</tr>
							
							
							
							
							<tr>
								<th>
									打分说明：
								</th>
								<td >
									<textarea name="deRemark" ></textarea>
								</td>
							</tr>
							<input type="hidden" name="navTabId" value="${param.rel}"/>
						</table>
						
					</div>
						<input type="hidden" name="minute" />
						<input type="hidden" name="deName" />
						<div class="formBar">
							<ul style="float: left; margin-left: 30%;">
								<li>
									<div class="buttonActive">
										<div class="buttonContent">
											<button type="submit " onclick="tjRydf(this)">
												保存
											</button>
										</div>
									</div>
								</li>
								<li>
									<div class="button" >
										<div class="buttonContent">
											<button type="reset">
												清空
											</button>
										</div>
									</div>
								</li>
								
							</ul>
						</div>
					</form>


				</div>
				<!-- 右侧 -->
				
				<div id="dfx" class="unitBox" >
				
				</div>
		

	

</div>

<script type="text/javascript">
	function  assess(bt){
		
		var $form=$(bt).closest("form");
		
		var $tbodyDfx=$("#tbodyDfx",$form);
		
		$tbodyDfx.text("");//清空打分项
		
		$("#span_khxzf",$form).text("0");//总分清零
		
		var ss= $("#inputOrg1",$form).val();
		
		var $div_dfx=$("#dfx",$(bt).closest(".pageContent"));
		
		$div_dfx.loadUrl("assess/lookUpPage.do?asGroup="+ss, {}, function(){
			$div_dfx.find("[layoutH]").layoutH();
			
			var $tbody=$(".pageContent tbody",$div_dfx);
			//右侧点击选择考核项
			$("input[type='checkbox']",$tbody).click(function(){
				
				var json=eval("("+$(this).val()+")");
				var num_oldzf=Number($("#span_khxzf",$form).text());
				
				if($(this).attr("checked")=="checked"){
					var newtr="<tr id='df_"+json.id+"'><td class='dfxname' >"+json.name+"</td><td align='center' >"+json.minute+"</td><td ><input class='required ' type='text' style='width:30px;' value='"+json.minute+"' oldValue='"+json.minute+"'  onChange='inputChange(this)' /></td> ";
					$tbodyDfx.append(newtr+"</tr>");
					//增加总分值
					$("#span_khxzf",$form).text(num_oldzf+Number(json.minute));
				}else{
					var $oldtr=$("tr[id='df_"+json.id+"']",$tbodyDfx);
					//减少总分
					$("#span_khxzf",$form).text(num_oldzf-Number($("input",$oldtr).val()));
					$oldtr.remove();
				}
				
			});
			
		});
		
	}
	//实际分值修改,重新计算总分数
	function inputChange(input){
		var $input=$(input);
		var $table=$input.closest("table");
		var oldValue=$input.attr("oldValue");
		var nowValue=Number($input.val());
		if(!nowValue){
			//如果用户输入的不是数字，重新恢复原先的值
			$input.val(oldValue);
			return ;
		}
		
		var zdfs=Number($("#span_khxzf",$table).text());
		$("#span_khxzf",$table).text(zdfs+(nowValue-Number(oldValue)));
		$input.attr("oldValue",nowValue);
	}
	//保存
	function tjRydf(bt){
		var $form=$(bt).closest("form");
		var $tbodyDfx=$("#tbodyDfx",$form);
		var dfxName=new Array();
		var dfxfz=new Array();
		
		$("tr",$tbodyDfx).each(function(){
			dfxName.push($(".dfxname",$(this)).text());
			dfxfz.push($("input",$(this)).val());
		});
		
		$("input[name='deName']",$form).val(dfxName.join(","));
		$("input[name='minute']",$form).val(dfxfz.join(","));
	}
	
</script>


