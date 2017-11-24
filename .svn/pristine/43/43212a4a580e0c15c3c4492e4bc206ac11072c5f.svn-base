<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>绩效考核</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function doAdd(){
		$("#addAttenceWindow").window("open");
	}
	
	function doEdit(){
		alert("修改...");
	}
	
	function doDelete(){
		alert("删除...");
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doExport(){
		alert("导出");
	}
	
	function doImport(){
		alert("导入");
	}

	//工具栏
	var toolbar = [ {
		id : 'button-search',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doSearch
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit',
		handler : doEdit
	},{
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	},{
		id : 'button-import',
		text : '导入',
		iconCls : 'icon-redo',
		handler : doImport
	},{
		id : 'button-export',
		text : '导出',
		iconCls : 'icon-undo',
		handler : doExport
	}];

	var columns = [ [ {
		field : 'aid',
		checkbox :true
	}, {
		field : 'aname',
		title : '姓名',
		width : 100,
		align : 'center'
	}, {
		field : 'atype',
		title : '状态',
		width : 100,
		align : 'center',
		formatter : function(data){
			if(data=="0"){
				return "所里";
			}else if (data == "1"){
				return "事假";
			}else if (data == "2") {
				return "病假";
			}else if (data == "3") {
				return "国假";
			}else if (data == "4") {
				return "年假";
			}else if (data == "5") {
				return "旷工";
			}else if (data == "6") {
				return "迟到";
			}else if (data == "7") {
				return "早退";
			}else if (data == "8") {
				return "出差";
			}
		}
	}, {
		field : 'atime',
		title : '时间(单位:H)',
		width : 100,
		align : 'center'
	}, {
		field : 'atravel',
		title : '是否出差',
		width : 100,
		align : 'center',
		formatter : function(data){
			if(data == "0"){
				return "未出差";
			}else if(data == "1"){
				return "市内出差";
			}else{
				return "外地出差";
			}
		}
	}, {
		field : 'iname',
		title : '项目',
		width : 100,
		align : 'center'
	}, {
		field : 'iid',
		title : '项目id',
		width : 100,
		align : 'center'
	}, {
		field : 'cid',
		title : '客户id',
		width : 100,
		align : 'center'
	}]];
	$(function() {
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		$("#grid").datagrid({
				iconCls : 'icon-forward',
				idField : 'aid',
				striped : true,
				border : false,
				rownumbers : true,
				pagination : true,
				pageList: [5,10,20],
				fit : true,
				toolbar : toolbar,
				columns : columns,
				url : "${pageContext.request.contextPath}/bc/attenceAction_pageQuery",
				onDblClickRow : function onDblClickRow(rowIndex,rowData){
					//双击弹窗
					$("#addAttenceWindow").window("open");
					//回显数据
					$("#addAttenceForm").form("load",rowData);
				}
		});
		$('#addAttenceWindow').window({
			title:"绩效考核",
			modal:true,
			shadow:true,
			height:400,
			width:400,
			closed:true,
			resizable:false,
			onBeforeClose : function(){
				//将弹窗置空
				$("#addAttenceForm")[0].reset();
				//并将id置空
				$("#aid").val("");
			}
		});

		$("#atravel").click(function(data){
			var ghj = $("#atravel").val();
			if (ghj = 1){
				alert(">>>>>>>>>>>>>>>>>");
			} else if(ghj == '2'){
				alert("98888777665");
			}
		});
		// 点击保存按钮
		$("#save").click(function() {
			var flag = $("#addAttenceForm").form("validate");
			if(flag){
				//将表单提交
				$("#addAttenceForm").submit();
				//弹窗关闭
				$("#addAttenceWindow").window("close");
			}
		});
	});
	
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false">
		<table id="grid"></table>
	</div>
	<div class="easyui-window" title="绩效考核" id="addAttenceWindow" closed="true"collapsible="false" 
	     minimizable="false" maximizable="false" style="top:100px;left:100px;width: 300px; height: 30px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false">
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
			</div>
		</div>
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addAttenceForm" action="${pageContext.request.contextPath}/bc/attenceAction_save" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr>
						<td>姓名</td>
						<td>
							<input type="hidden" id="aid" name="aid"/>
							<input type="hidden" id="id" name="id"/>
							<input id="aname" name="aname" class="easyui-combobox" data-options="valueField:'name',textField:'name',url:'${pageContext.request.contextPath}/bc/employeeAction_ajaxList'"/>
						</td>	
					</tr>
					<tr>
						<td>状态</td>
						<td>
							<input id="atype" type="radio" name="atype" checked="checked" value="0">所里
							<input id="atype" type="radio" name="atype" value="1">事假
							<input id="atype" type="radio" name="atype" value="2">病假
							<input id="atype" type="radio" name="atype" value="3">国假
							<input id="atype" type="radio" name="atype" value="4">年假
							<input id="atype" type="radio" name="atype" value="5">旷工
							<input id="atype" type="radio" name="atype" value="6">迟到
							<input id="atype" type="radio" name="atype" value="7">早退
							<input id="atype" type="radio" name="atype" value="8">出差
						</td>	
					</tr>
					<tr>
						<td>时间</td>
						<td>
							<input id="atime" type="text" name="atime" class="easyui-validatebox" required="true"/>
						</td>
					</tr>
					<tr>
						<td>是否出差</td>
						<td>
							<input id="atravel" type="radio" name="atravel" value="0">未出差
							<input id="atravel" type="radio" name="atravel" value="1" onclick="showMsg()">市内出差
							<input id="atravel" type="radio" name="atravel" value="2" onclick="showMsg()">外地出差
						</td>
					</tr>
					<tr>
						<td>项目</td>
						<td>
							<input type="hidden" id="iid" name="iid"/>
<!-- 							<input type="hidden" id="id" name="id"/> -->
<!-- 							<input type="hidden" id="cid" name="cid"/> -->
							<input id="iname" name="iname" class="easyui-combobox" data-options="valueField:'iname',textField:'iname',url:'${pageContext.request.contextPath}/bc/itemerAction_ajaxList'"/>
<%-- 							<input id="iname" name="iname" class="easyui-combobox" data-options="valueField:'name',textField:'name',url:'${pageContext.request.contextPath}/bc/itemerAction_ajaxList'"/> --%>
						</td>
					</tr>
					<tr>
						<td>项目id</td>
						<td>
							<input id="iid" type="text" name="iid" class="easyui-validatebox" required="true"/>
						</td>
					</tr>
					<tr>
						<td>客户id</td>
						<td>
							<input id="cid" type="text" name="cid" class="easyui-validatebox" required="true"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>