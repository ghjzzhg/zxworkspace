<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-11-24
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>静态页面管理--鼠标放上显示页面</title>
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
    <style type="text/css">
        .link{
            position: relative;
        }
        #box{
            display: none;
            width: 315px;
            height: 300px;
            border: 1px solid #333;
            padding: 12px;
            text-align: left;
            line-height: 175%;
            text-indent: 2em;
            position: absolute;
        }
    </style>
    <script type="text/javascript" language="javascript" >
        function display(){
            document.getElementById("box").style.display="block";
        }
        function disappear(){
            document.getElementById("box").style.display="none";
        }
    </script>
    <style type="text/css">
        .link{
            position: relative;
        }
        #bo{
            display: none;
            width: 315px;
            height: 300px;
            border: 1px solid #333;
            padding: 12px;
            text-align: left;
            line-height: 150%;
            text-indent: 2em;
            position: absolute;
        }
    </style>
    <script type="text/javascript" language="javascript" >
        function disjj(){
            document.getElementById("bo").style.display="block";
        }
        function dispp(){
            document.getElementById("bo").style.display="none";
        }
    </script>
    <style type="text/css">
        .link{
            position: relative;
        }
        #weathe{
            display: none;
            width: 315px;
            height: 300px;
            border: 1px solid #333;
            padding: 12px;
            text-align: left;
            line-height: 150%;
            text-indent: 2em;
            position: absolute;
        }
    </style>
    <script type="text/javascript" language="javascript" >
        function diswea(){
            document.getElementById("weathe").style.display="block";
        }
        function diswee(){
            document.getElementById("weathe").style.display="none";
        }
    </script>
</head>
<body>
    <div class="link"  data-options="border:false" style="height:120px;padding:0px;background:url('./images/header_new.png') no-repeat right;">
        </br></br></br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onmouseover="display()" onmouseout="disappear()" style="color:white;margin-top: 30px;">客户管理</a>
        <div id="box" onmouseover="display()" onmouseout="disappear()" style="height:400px;width:1500px;cursor:pointer;background-color: #00ee00;background: url('./images/body_six.png') no-repeat right;">
            <table id="grid">
                <tr>
                   <td style="width:0px;color:blue;">
                        <div>
                            <a href="http://www.globalfisheries.com/"><img src="/js/easyui/themes/icons/huanqiu.png">环球渔场</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="http://www.links-e.com/"><img src="/js/easyui/themes/icons/lingmai.png">凌脉网络</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="http://www.shjysoft.com/"><img src="/js/easyui/themes/icons/jianye.png">建业信息</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="http://www.jinpacs.com/"><img src="/js/easyui/themes/icons/jinma.png">金马扬名</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="http://skowashsh.ce.c-c.com/"><img src="/js/easyui/themes/icons/guanghe.png">光和光学</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="http://lapis258.cn.b2b168.com/"><img src="/js/easyui/themes/icons/lanbisheng.png">蓝必胜</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="http://www.jshaite.com/"><img src="/js/easyui/themes/icons/haite.png">海特服饰</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="http://www.teeyoung.cn/"><img src="/js/easyui/themes/icons/tianyong.png">天涌影视</a></br>
                        </div>
                   </td>
                </tr>
            </table>
        </div>
        &nbsp;&nbsp;&nbsp;
        <a href="#" onmouseover="disjj()" onmouseout="dispp()" style="color:white;">供应商管理</a>
        <div id="bo" onmouseover="disjj()" onmouseout="dispp()" style="height:400px;width:1500px;cursor:pointer;background-color: #00ee00;background: url('./images/body_four.png') no-repeat right;">
            <table>
                <tr>
                    <td style="width:0px;color:white;">
                        <div>
                            <a href="http://www.jd.com"><img src="/js/easyui/themes/icons/jingdong.png">京东</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="https://www.aliyun.com/"><img src="/js/easyui/themes/icons/aliyun.png">阿里云</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="http://www.163.com"><img src="/js/easyui/themes/icons/163.png">163邮箱</a></br>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        &nbsp;&nbsp;&nbsp;
        <a href="#" onmouseover="diswea()" onmouseout="diswee()" style="color:white;">天气预报</a>
        <div id="weathe" onmouseover="diswea()" onmouseout="diswee()" style="height:400px;width:1500px;cursor:pointer;background-color: #00ee00;background: url('./images/body_five.png') no-repeat right;">
            <table>
                <tr>
                    <td style="width:0px;color:white;">
                        <div>
                            <a href="http://www.jd.com"><img src="/js/easyui/themes/icons/jingdong.png">京东</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="https://www.aliyun.com/"><img src="/js/easyui/themes/icons/aliyun.png">阿里云</a></br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="http://www.163.com"><img src="/js/easyui/themes/icons/163.png">163邮箱</a></br>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
