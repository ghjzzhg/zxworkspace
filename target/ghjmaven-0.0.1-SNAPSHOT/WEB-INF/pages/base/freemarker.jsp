<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-11-24
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工管理</title>
    <!-- 导入jquery核心类库 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <!-- 导入easyui类库 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/default.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:80px;padding:0px;background:url('./images/header_new.png') no-repeat right;">
    <div id="sessionInfoDiv" style="position: absolute;right: 5px;top:10px;">
        <font color="red">[<strong>超级管理员</strong>]，欢迎${sessionScope.existsUser.username}！您使用[<strong>${pageContext.request.remoteAddr }</strong>]IP登录！</font>
    </div>
    <div style="position: absolute; right: 5px; bottom: 10px;">
        <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'icon-ok'"  color="white">更换皮肤</a>
        <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_kzmbMenu',iconCls:'icon-help'">控制面板</a>
    </div>
    <div style="position: absolute; right: 800px; bottom: 10px;">
        <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_first'">客户管理</a>
    </div>
    <div id="layout_north_pfMenu" style="width: 120px; display: none;">
        <div onclick="changeTheme('default');"  color="white">default</div>
        <div onclick="changeTheme('gray');"  color="white">gray</div>
        <div onclick="changeTheme('black');"  color="white">black</div>
        <div onclick="changeTheme('bootstrap');"  color="white">bootstrap</div>
        <div onclick="changeTheme('metro');"  color="white">metro</div>
    </div>
    <div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
        <div onclick="editPassword();"  color="white">修改密码</div>
        <div onclick="showAbout();"  color="white">联系管理员</div>
        <div class="menu-sep"  color="white"></div>
        <div onclick="logoutFun();"  color="white">退出系统</div>
    </div>

</div>
<div id="layout_north_first" data-options="region:'north',border:false" style="left:0px;height:200px;width:500px;background:url('./images/body_two.png');">
    <div  id="sessionInfov" style="position: absolute;right: 5px;top:10px;">
        <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_first_new'">新增客户</a>
        <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_first_information'">客户信息</a>
        <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_first_statistics'">客户统计</a>
    </div>
</div>
</body>
</html>
