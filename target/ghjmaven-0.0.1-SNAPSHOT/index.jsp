<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>跳转到主页</title>
</head>
<body>
<!-- 这里的index.jsp并不是真正的主页， 系统的所有页面都放在 WEB-INF/pages下，这样用户就无法对这些页面直接访问
 访问WEB-INF下页面，必须通过Action转发后访问，详见 struts.xml配置，也方便后期通过struts2拦截器 进行权限控制 -->
<jsp:forward page="/page_common_index.action"></jsp:forward>
<!-- 	<h4 align="center">中喜添加员工</h4> -->
	
<!-- 	<center> -->
<%-- 		<s:form action="userAction_add" method="post" namespace="/user"> --%>
<%-- 			用户名：<s:textfield name="username"></s:textfield> --%>
<%-- 			年龄：<s:textfield name="age"></s:textfield> --%>
<%-- 			<s:submit value="添加"></s:submit> --%>
<%-- 		</s:form> --%>
<!-- 	</center> -->

<%-- 	<a href="${pageContext.request.contextPath}/userAction_list">查询员工</a>	 --%>
<!-- 	<h4 align="center">查询员工</h4> -->
	
<!-- 	<center> -->
<%-- 		<s:iterator var="u" value="users"> --%>
<%-- 			用户名:<s:property value="username"/><br/> --%>
<%-- 			年龄:<s:property value="age"/><br/> --%>
<%-- 		</s:iterator> --%>
<!-- 	</center> -->
</body>
</html>