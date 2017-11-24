<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		//alert("增加...");
		$('#addCustomerWindow').window("open");
	}
	
	function doView(){
		alert("查看...");
	}
	
	function doDelete(){
		alert("删除...");
	}
	
	function doRestore(){
		alert("将客户还原...");
	}

	function doMap(){
		$.messager.confirm('系统提示','您确定要查看地图吗?',function(isConfirm) {
			if (isConfirm) {
				location.href = '${pageContext.request.contextPath}/baidumap.jsp';
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
		text : '作废',
		iconCls : 'icon-cancel',
		handler : doDelete
	},{
		id : 'button-save',
		text : '还原',
		iconCls : 'icon-save',
		handler : doRestore
	},{
		id : 'button-map',
		text : '地图',
		iconCls : 'icon-map',
		handler : doMap
	}];
	// 定义列
	var columns = [ [ {
		field : 'cid',
		checkbox : true,
	},{
		field : 'cname',
		title : '公司',
		width : 220,
		align : 'center'
	}, {
		field : 'caddress',
		title : '公司地址',
		width : 330,
		align : 'center'
	}, {
		field : 'clinkman',
		title : '客户联系人',
		width : 120,
		align : 'center'
	}, {
		field : 'ctelephone',
		title : '联系电话',
		width : 120,
		align : 'center'
	}, {
		field : 'citem',
		title : '客户项目',
		width : 200,
		align : 'center'
	} ]];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		// 客户信息表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [10,20,30],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/bc/customerAction_pageQuery",
// 			url : "json/customer.json",
			idField : 'cid',
			columns : columns,
			onDblClickRow : function onDblClickRow(rowIndex,rowData){
				//双击弹窗
				$("#addCustomerWindow").window("open");
				//回显数据
				$("#addCustomerForm").form("load",rowData);
			}
		});
		
		// 添加客户窗口
		$('#addCustomerWindow').window({
	        title: '添加客户',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
	    $("#save").click(function(){
			var flag = $("#addCustomerForm").form("validate");
			if (flag) {
				//校验后有数据提交
				$("#addCustomerForm").submit();
				//提交表单后关闭弹窗
				$("#addCustomerWindow").window("close");
			}
		});
		
	});

</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="对客户进行添加或者修改" id="addCustomerWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addCustomerForm" action="${pageContext.request.contextPath}/bc/customerAction_save" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">客户信息</td>
					</tr>
					<!-- TODO 这里完善收派员添加 table -->
					<tr>
						<td>公司名</td>
						<input type="hidden" name="cid" id="cid"/>
						<td><input type="text" name="cname" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>公司地址</td>
						<td><input type="text" name="caddress" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>联系人</td>
						<td><input type="text" name="clinkman" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td><input type="text" name="ctelephone" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>项目名称</td>
						<td><input type="text" name="citem" class="easyui-validatebox" required="true"/></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
</body>
</html>	