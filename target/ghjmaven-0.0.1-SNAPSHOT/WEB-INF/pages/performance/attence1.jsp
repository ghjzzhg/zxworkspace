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
	var count = 1;
	function doAdd(){
		var tbl = document.all.xin;  
		var rows = tbl.rows.length;  
		var tr = tbl.insertRow(rows); 
// 		 var del = tr.insertCell(4);  
// 		  del.innerHTML = '<input type="button" onclick="del(this)" value="Delete">';   
		var name = tr.insertCell(0);  
		name.innerHTML = '<input type="hidden" name="aid"/><input name="name" class="easyui-checkbox" data-options="valueField:'+name+',textField:'+name+',url:'+"${pageContext.request.contextPath}/bc/employeeAction_ajaxList+"+'">';
		var atype = tr.insertCell(1);  
		atype.innerHTML = '<input type="radio" name="atype" checked="checked" value="0">所里<input type="radio" name="atype" value="1">事假<input type="radio" name="atype" value="2">病假<input type="radio" name="atype" value="3">国假<input type="radio" name="atype" value="4">年假<input type="radio" name="atype" value="5">旷工<input type="radio" name="atype" value="6">迟到<input type="radio" name="atype" value="7">早退';
		var atime = tr.insertCell(2);  
		atime.innerHTML = 'type="text" name="atime" class="easyui-combobox" required="true"';  
		var atravel = tr.insertCell(3);  
		atravel.innerHTML = '<input type="radio" name="atravel" checked="checked" value="0">未出差<input type="radio" name="atravel" value="1">市内出差<input type="radio" name="atravel" value="2">外地出差';  
		count++;  
	};
</script>
</head>
<body class="easyui-layout">
	<input type="button" onclick="doAdd()" value="新增"/>
	<table id="xin" name="xin" class="table-edit" width="80%" align="center">
		<caption>customer information</caption>  
		<thead>  
			<tr>  
			<th>name</th>  
			<th>atype</th>  
			<th>atime</th>  
			<th>atravel</th>  
			<th> </th>  
			</tr>  
		</thead> 
		
		<tbody>
			<tr>
				<td>
					<input type="hidden" id="aid" name="aid"/>
					<input id="name" name="name" class="easyui-checkbox" data-options="valueField:'name',textField:'name',url:'${pageContext.request.contextPath}/bc/employeeAction_ajaxList'"/>
				</td>	
				<td>
					<input id="atype" type="radio" name="atype" checked="checked" value="0">所里
					<input id="atype" type="radio" name="atype" value="1">事假
					<input id="atype" type="radio" name="atype" value="2">病假
					<input id="atype" type="radio" name="atype" value="3">国假
					<input id="atype" type="radio" name="atype" value="4">年假
					<input id="atype" type="radio" name="atype" value="5">旷工
					<input id="atype" type="radio" name="atype" value="6">迟到
					<input id="atype" type="radio" name="atype" value="7">早退
				</td>	
				<td>
					<input id="atime" type="text" name="atime" class="easyui-combobox" required="true"/>
				</td>
				<td>
					<input id="atravel" type="radio" name="atravel" checked="checked" value="0">未出差
					<input id="atravel" type="radio" name="atravel" value="1">市内出差
					<input id="atravel" type="radio" name="atravel" value="2">外地出差
				</td>
			</tr>
		</tbody> 
	</table>
</body>
</html>