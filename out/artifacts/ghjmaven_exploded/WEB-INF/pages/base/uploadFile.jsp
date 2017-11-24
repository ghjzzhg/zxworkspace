<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件管理</title>
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
	function doUpload(){
		$('#uploadWindow').window("open");
	}
	function doView(){
		alert("6666");
	}
	//工具栏
	var toolbar = [{
		id : 'button-view',
		text : '查询',
		iconCls : 'icon-search',
		handler : doView
	},{
		id : 'button-import',
		text : '导入',
		iconCls : 'icon-redo',
		handler : doUpload
	}];
	
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true
	},{
		field : 'uploadFile',
		title : '文件',
		width : 100,
		align : 'center'
	},{
		field : 'uploadContentType',
		title : '文件类型',
		width : 120,
		align : 'center'
	},{
		field : 'uploadFileName',
		title : '文件名称',
		width : 100,
		align : 'center'
	},{
		field : 'uploadPath',
		title : '文件路径',
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
			idField : 'id',
			columns : columns,
			onDblClickRow : function onDblClickRow(rowIndex, rowData){
				//双击弹窗
				$("#uploadWindow").window("open");
				//回显数据
				$("#uploadForm").form("load",rowData);
			}
		});

		/* 注册添加按钮的点击事件 */  
        $("#addFile").click(addFile); 

        var addFile = function() {  
	        var $file = $("<input type='file' name='UplodeName'/>");  
	        $("#fileUplodeDiv").append($file).append($("<br>"));  
		};  
		
		// 添加、修改区域窗口
	 	$('#uploadWindow').window({
			title:"上传文件",
			modal:true,
			shadow:true,
			height:450,
			width:400,
			closed:true,
			resizable:false,
			onBeforeClose : function(){
				//将弹窗置空
				$("#uploadForm")[0].reset();
				//并将id置空
				$("#id").val("");
			}
		});
		$("#uploadFiles").click(function(){
			alert("9999");
			var flag = $("#uploadForm").form("validate");
			if (flag) {
				//提交
				$("#uploadForm").submit();
				//关闭窗口
				$("#uploadWindow").window("close");
			}
		});
	
	});

</script>
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="上传文件" id="uploadWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="upload" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		<form id="uploadForm" action="${pageContext.request.contextPath }/bc/uploadAction_batchUpload" enctype="multipart/form-data" method="post">  
       		上传者: <input type="text" name="name"> <br> <br>
       		上文件: <input type="file" name="uploadFiles" value="files">
               <div id="fileUplodeDiv"></div>
               <br> <br> <input type="submit" value="提交文件"> <input type="button" value="添加文件" id="addFile" />   
   		</form>
	</div>
</body>
</html>