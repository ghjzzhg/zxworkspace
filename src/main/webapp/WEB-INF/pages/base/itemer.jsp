<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.form.js"></script>
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
		$('#addItemerWindow').window("open");
	}
	
	function doView(){
		alert("查看...");
	}
	
	function doDelete(){
		//首先获取选中的行grid数据
		var arr = $("#grid").datagrid("getSelections");
		if (arr == null || arr.length == 0) {
			$.messager.alert("警告", "请至少选择一行数据", "warning");
			return;
		}
		//循环遍历所有选择的数据
		var idsArr = new Array();
		for ( var i = 0 ; i < arr.length; i++) {
			idsArr.push(arr[i].iid);
		}
		var ids = idsArr.join(",");
		$.post("${pageContext.request.contextPath}/bc/itemerAction_batchDelete",{"ids":ids},function(data){
			if (data) {
				alert(data+"  ++++++++++++++++++++++++");
				$.messager.alert("成功", "删除成功", "info");
				//刷新页面
				$("#grid").datagrid("reload");
			} else {
				alert(data+"   ————————————");
				$.messager.alert("警告", "删除失败", "warning");
			}
		});
	}
	
	//工具栏
	var toolbar = [ {
		id : 'button-view',
		text : '查询',
		iconCls : 'icon-search',
		handler : doView
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	}, {
		id : 'button-import',
		text : '导入',
		iconCls : 'icon-redo'
	}];
	// 定义列
	var columns = [ [ {
		field : 'iid',
		checkbox : true
	},{
		field : 'iname',
		title : '项目名称',
		width : 100,
		align : 'center'
	},{
		field : 'istartdate',
		title : '开始时间',
		width : 100,
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
		field : 'ienddate',
		title : '结束时间',
		width : 100,
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
	}, {
		field : 'imanager',
		title : '项目负责人',
		width : 80,
		align : 'center'
	}, {
		field : 'imember',
		title : '项目组员',
		width : 80,
		align : 'center'
	}, {
		field : 'status',
		title : '项目状态',
		width : 80,
		align : 'center',
		formatter : function(data){
			if(data=="1"){
				return "进行中";
			}else{
				return "结案";
			}
		}
	}, {
		field : 'file',
		title : '文件',
		width : 475,
		align : 'center'
	}, {
		field : 'id',
		title : '员工外键',
		width : 100,
		align : 'center'		
	}, {
		field : 'cid',
		title : '客户外键',
		width : 100,
		align : 'center'
	}] ];

	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 项目数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [5,10,20],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/bc/itemerAction_pageQuery",
			idField : 'iid',
			columns : columns,
			onDblClickRow : function onDblClickRow(rowIndex, rowData){
				//双击弹窗
				$("#addItemerWindow").window("open");
				//回显数据
				$("#addItemerForm").form("load",rowData);
			}
		});
		
		// 添加、修改区域窗口
		$('#addItemerWindow').window({
	        title: '添加修改区域',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false,
	        onBeforeClose : function(){
				//将弹窗清空
				$("#addItemerForm")[0].reset();
				//将id清空
				$("#id").val("");
		    }
	    });
		$("#save").click(function(){
			var flag = $("#addItemerForm").form("validate");
			if (flag) {
				//提交
				$("#addItemerForm").submit();
				//关闭窗口
				$("#addItemerWindow").window("close");
			}
		});
		//Just to remove error inside the console.
		//If error exists then onChange event is not fired.
		var fileHook = {
		    get: function (data) {
		        return this.value;
		    },
		    set: function (data, value) {
		        return this.value = value;
		    }
		}
		$.valHooks["file"] = fileHook;
	});

</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="项目添加修改" id="addItemerWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addItemerForm" action="${pageContext.request.contextPath}/bc/itemerAction_save" method="post" enctype="multipart/form-data">
				<table class="table-edit" width="80%" align="center">
					<tr>
						<td>项目名称</td>
						<td>
						<input type="hidden" name="iid" id="iid"/>
						<input type="text" name="iname" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>开始时间</td>
						<td><input type="text" id="istartdate" name="istartdate" class="easyui-datebox" required="true" format="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<td>结束时间</td>
						<td><input type="text" id="ienddate" name="ienddate" class="easyui-datebox" required="true"/></td>
					</tr>
					<tr>
						<td>项目负责人</td>
						<td><input name="imanager" class="easyui-combobox" data-options="valueField:'name',textField:'name',url:'${pageContext.request.contextPath}/bc/employeeAction_findManager'"/></td>
					</tr>
					<tr>
						<td>项目组员</td>
						<td><input name="imember" class="easyui-combobox" data-options="valueField:'name',textField:'name',url:'${pageContext.request.contextPath}/bc/employeeAction_findMember'"/></td>
					</tr>
					<tr>
						<td>是否结案</td>
						<td>
						<input type="radio" name="status" checked="checked" value="1">进行中
						<input type="radio" name="status" value="0">结案
						</td>
					</tr>
					<tr>
						<td>员工外键</td>
						<td><input type="text" name="id" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>客户外键</td>
						<td><input type="text" name="cid" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>上传文件</td>
						<td><input type="file" name="file" required="true"/></td>
					</tr>
					</table>
			</form>
			 
		</div>
	</div>
	<div class="easyui-window" title="上传文件" id="uploadWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<form action="${pageContext.request.contextPath }/uplodes.action" enctype="multipart/form-data" method="post">  
       		上传者:<input type="text" name="name"> <br> 
       		上文件:<input type="file" name="UplodeName" value="你好">  
               <div id="fileUplodeDiv"></div>  
               <br> <br> <input type="submit" value="提交文件"> <input type="button" value="添加文件" id="addFile" >   
   		</form>  
	</div>
</body>
</html>