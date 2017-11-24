<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传文件</title>
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
// 	$(document).ready(function() {
// 		$("#spaceused1").progressBar();
// 		$("#spaceused2").progressBar({ barImage: 'images/progressbg_yellow.gif'} );
// 		$("#spaceused3").progressBar({ barImage: 'images/progressbg_orange.gif', showText: false} );
// 		$("#spaceused4").progressBar(65, { showText: false, barImage: 'images/progressbg_red.gif'} );
// 		$("#uploadprogressbar").progressBar();
// 	});
	
	function uploadFile(){
// 		alert("??????????????");
// 		var id;
		$.post("${pageContext.request.contextPath}/bc/fileAction_bacthUpload", function(data) {
// 			debugger;
			if (!data)
				return;
			$("#uploadFileForm").submit();
// 			alert(data);
// 			var response;
// 			eval ("response = " + data);
// 			alert(eval ("response = " + data));
// 			if (!response)
// 				return;
		});
		setTimeout("uploadFile()", 750);
	
	}
</script>
</head>
<body>
	<form id="uploadFileForm" action="${pageContext.request.contextPath}/bc/fileAction_bacthUpload" method="post" enctype="multipart/form-data">
<%-- 	<form id="uploadfile" method="post" enctype="multipart/form-data> --%>
		  上传用户：<input type="text" name="username"><br/>
<!--                       上传文件1：<input type="file" id="fileName" name="fileName"><br/> -->
                     上传文件2：<input type="file" id="fileName" name="fileName"><br/>
<!--                      <input type="submit" value="快点我提交吧"> -->
				<input type="button" onclick="uploadFile()" value="快点我提交吧">
<!--                  <a id="start-upload" href="javascript:void(0);" onclick="uploadFile();">开始上传</a>  -->
	</form>
</body>
</html>