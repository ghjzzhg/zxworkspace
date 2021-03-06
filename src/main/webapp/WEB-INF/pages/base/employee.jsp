<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工管理</title>
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
	function doView(){
		$("#searchWindow").window("open");
	}
	function doAdd(){
		//添加员工
		$('#addEmployeeWindow').window("open");
	}
	function doExport(){
		$("#searchForm").submit();
	}
	function doDelete(){
		//用户要至少选择一行
		var arr = $("#grid").datagrid("getSelections");
		if (arr == null || arr.length == 0) {
			$.messager.alert("警告", "请至少选择一行", "warning");
			return;
		}
		alert("确认要离职吗---");
		//创建数组，将所有选择的行数遍历
		var idsArr = new Array();
		for (var i = 0; i < arr.length; i++) {
			//获取所有行id
			idsArr.push(arr[i].id);
		}
		var ids = idsArr.join(",");
		$.post("${pageContext.request.contextPath}/bc/employeeAction_batchDelete",{"ids":ids},function(data){
			if (data) {
				$.messager.alert("恭喜", "已离职", "info");
				//刷新表格
				$("#grid").datagrid("reload");
				
			} else {
				$.messager.alert("警告", "离职失败", "error");
			}
		});
	}
	//自定义标签按钮
	var toolbar = [{
		id : 'button-view',
		text : '查询',
		iconCls : 'icon-search',
		handler : doView
	},{
		id : 'button-add',
		text : '添加',
		iconCls : 'icon-add',
		handler : doAdd
	},{
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	},{
		id : 'button-export',
		text : '导出',
		iconCls : 'icon-undo',
		handler : doExport
	}];
	
	//自定义显示的列
	var columns = [[{
		field : 'id',
		checkbox : true
	},{
		field : 'name',
		title : '姓名',
		width : 50,
		align : 'center'
	},{
		field : 'sex',
		title : '性别',
		width : 30,
		align : 'center',
		formatter : function(data){
			if(data=="1"){
				return "男";
			}else{
				return "女";
			}
		}
	},{
		field : 'entryday',
		title : '入职日期',
		width : 120,
		align : 'center',
		formatter : function(date){
			var t = Date.parse(date);
			if (!isNaN(t)) {
				var d1 = new Date(Date.parse(date.replace(/[T]/g+"00:00:00", "")));
				var y = d1.getFullYear();
				var m = d1.getMonth();
				var d = d1.getDate();
				if(m < 10){
					if(d < 10){
						return y + "-0" + m + "-0" + d;
					}
					return y + "-0" + m + "-" + d;
				}else if (d < 10){
					return y + "-" + m + "-0" + d;
				}
				return y + "-" + m + "-" + d;
			} else {  
				return new Date();  
			}  
		}
	},{
		field : 'birthday',
		title : '出生年月',
		width : 120,
		align : 'center',
		formatter : function(date){
			var t = Date.parse(date);
			if (!isNaN(t)) {
				var d1 = new Date(Date.parse(date.replace(/[T]/g+"00:00:00", "")));
				var y = d1.getFullYear();
				var m = d1.getMonth();
				var d = d1.getDate();
				if(m < 10){
					if(d < 10){
						return y + "-0" + m + "-0" + d;
					}
					return y + "-0" + m + "-" + d;
				}else if (d < 10){
					return y + "-" + m + "-0" + d;
				}
				return y + "-" + m + "-" + d;
			} else {  
				return new Date();  
			}  
		}
	},{
		field : 'register',
		title : '户籍所在地',
		width : 200,
		align : 'center'
	},{
		field : 'school',
		title : '毕业院校',
		width : 150,
		align : 'center'
	},{
		field : 'position',
		title : '职务',
		width : 100,
		align : 'center'
	},{
		field : 'socialsecurity',
		title : '社保账号',
		width : 100,
		align : 'center'
	},{
		field : 'publicfund',
		title : '公积金账号',
		width : 100,
		align : 'center'
	},{
		field : 'telephone',
		title : '电话号码',
		width : 100,
		align : 'center'
	},{
		field : 'deltag',
		title : '是否离职',
		width : 80,
		align : 'center',
		formatter : function(data){
			if(data=="1"){
				return "在职";
			}else{
				return "离职";
			}
		}
	}]];
	
	//调用添加员工页面
	$(function(){
		//先将body的添加隐藏
		$("body").css({visibility:"visible"});
		
		$('#grid').datagrid({
			iconCls:'icon-forward',
			fit:true,
			border:false,
			striped : true,
			rownumbers:true,
			pageList:[5,10,20],
			pagination:true,
			toolbar:toolbar,
			url:"${pageContext.request.contextPath}/bc/employeeAction_pageQuery",
// 			url:"json/employee.json",
			idField:'id',
			columns:columns,
			onDblClickRow : function onDblClickRow(rowIndex, rowData){
				//双击弹窗
				$('#addEmployeeWindow').window("open");
				//数据回显出来
				$('#addEmployeeForm').form("load",rowData);
			}
		});
		$('#addEmployeeWindow').window({
			title:"添加员工",
			modal:true,
			shadow:true,
			height:450,
			width:400,
			closed:true,
			resizable:false,
			onBeforeClose : function(){
				//将弹窗置空
				$("#addEmployeeForm")[0].reset();
				//并将id置空
				$("#id").val("");
			}
		});
		$('#searchWindow').window({
			title:"查询",
			modal:true,
			shadow:true,
			height:450,
			width:400,
			closed:true,
			resizable:false
		});
		$('#btn').click(function(){
			//将目标表单序列化
			var jsonObject = $("#searchForm").serializeJson();
			//调用datagrid方法
			$("#grid").datagrid("load",jsonObject);
			//关闭弹窗
			$("#searchWindow").window("close");
			
		});
		$("#save").click(function(){
			var flag = $("#addEmployeeForm").form("validate");
			if (flag) {
				//提交表单
				$("#addEmployeeForm").submit();
				//关闭弹窗
				$("#addEmployeeWindow").window("close");
			}
		});
	});
	//ajax校验手机号
	$.extend($.fn.validatebox.defaults.rules,{
		telephone : {
			validator :function(value, param){
				//正则表达式验证
				var reg = /^1[3|5|7|8]\d{9}$/;
				return reg.test(value);
			},
			message:'手机号码必须是以13、15、17、18开发的11位数字'
		}
	});

	$.fn.serializeJson = function(){
		var serializeObj = {};
		var array = this.serializeArray();
		var str = this.serialize();
		$(array).each(function(){
			if(serializeObj[this.name]){
				if($.isArray(serializeObj[this.name])){
					serializeObj[this.name].push[this.value];
				}else{
					serializeObj[this.name] = [serializeObj[this.name],this.value];
				}
			}else{
				serializeObj[this.name] = this.value;
			}
		});
		return serializeObj;
	};
	
	
</script>

</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
		<table id="grid"></table>
	</div>
	<div class="easyui-window" id="addEmployeeWindow" title="添加或修改员工" collapsible="false"
			minimizable="false" maximizable="false" style="top:20px;left:200px">
		<!-- 这里是外框 -->
		<div region="north" style="height:30px;overflow:hidden;" split="false" border="false">
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
			</div>
		</div>
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addEmployeeForm" action="${pageContext.request.contextPath}/bc/employeeAction_save"  method="post">
				<table class="table-edit" width="80%" align="center">
					<tr>
						<td>姓名</td>
						<td>
						<input type="hidden" name="id" id="id"/>
						<input type="text" name="name" class="easyui-validatebox" required="true">
						</td>
					</tr>
					<tr>
						<td>性别</td>
						<td>
						<input type="radio" name="sex" value="1">男
						<input type="radio" name="sex" checked="checked" value="0">女
						</td>
					</tr>
					<tr>
						<td>入职时间</td>
						<td><input id="dd" type="date" name="entryday" class="easyui-datebox" data-options="required:true,format:'yy:MM:dd'"></td>
					</tr>
					<tr>
						<td>出生年月</td>
						<td><input id="gg" type="date" name="birthday" class="easyui-datebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>户籍所在地</td>
						<td><input type="text" name="register" class="easyui-validatebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>毕业院校</td>
						<td><input type="text" name="school" class="easyui-validatebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>职务</td>
						<td>
							<select id="position" name="position" class="easyui-combobox" data-options="required:true" style="width:143.5px;">
								<option>所长</option> 
								<option>项目经理</option>
								<option>项目专员</option>
								<option>行政经理</option>
								<option>财务经理</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>社保账号</td>
						<td><input type="text" name="socialsecurity" class="easyui-validatebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>公积金账号</td>
						<td><input type="text" name="publicfund" class="easyui-validatebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td><input type="text" name="telephone" class="easyui-validatebox" data-options="required:'true',validType:'telephone'"></td>
					</tr>
					<tr>
						<td>是否在职</td>
						<td>
						<input type="radio" name="deltag" checked="checked" value="1">在职
						<input type="radio" name="deltag" value="0">离职
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="easyui-window" id="searchWindow" title="查询窗口" collapsible="false" minimizable="false" maximizable="false" style="top:50px;left:200px">
		<div style="background-color: green;overflow:auto;padding:5px" border="false">
			<form id="searchForm" action="${pageContext.request.contextPath}/bc/employeeAction_download" method="post">
				<table class="table-edit" width="80%" align="center">
 					<tr>
						<td>姓名</td>
						<td>
						<input type="hidden" name="id" id="id"/>
						<input type="text" name="name" class="easyui-validatebox" required="true">
						</td>
					</tr>
					<tr>
						<td>性别</td>
						<td>
						<input type="radio" name="sex" value="1">男
						<input type="radio" name="sex" checked="checked" value="0">女
						</td>
					</tr>
					<tr>
						<td>入职时间</td>
						<td><input id="dd" type="date" name="entryday" class="easyui-datebox" data-options="required:true,format:'yy:MM:dd'"></td>
					</tr>
					<tr>
						<td>出生年月</td>
						<td><input id="gg" type="date" name="birthday" class="easyui-datebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>户籍所在地</td>
						<td><input type="text" name="register" class="easyui-validatebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>毕业院校</td>
						<td><input type="text" name="school" class="easyui-validatebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>职务</td>
						<td>
							<select id="position" name="position" class="easyui-combobox" data-options="required:true" style="width:162.5px;">
								<option width="200px">所长</option> 
								<option>项目经理</option>
								<option>项目专员</option>
								<option>行政经理</option>
								<option>财务经理</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>社保账号</td>
						<td><input type="text" name="socialsecurity" class="easyui-validatebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>公积金账号</td>
						<td><input type="text" name="publicfund" class="easyui-validatebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td><input type="text" name="telephone" class="easyui-validatebox" data-options="required:'true',validType:'telephone'"></td>
					</tr>
					<tr>
						<td>是否在职</td>
						<td>
						<input type="radio" name="deltag" checked="checked" value="1">在职
						<input type="radio" name="deltag" value="0">离职
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>