<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
<script src="${pageContext.request.contextPath }/js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="APPID" data-redirecturi="REDIRECTURI" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style_grey.css" />
<style>
input[type=text] {
	width: 80%;
	height: 25px;
	font-size: 12pt;
	font-weight: bold;
	margin-left: 45px;
	padding: 3px;
	border-width: 0;
}

input[type=password] {
	width: 80%;
	height: 25px;
	font-size: 12pt;
	font-weight: bold;
	margin-left: 45px;
	padding: 3px;
	border-width: 0;
}

#loginform\:codeInput {
	margin-left: 1px;
	margin-top: 1px;
}

#loginform\:vCode {
	margin: 0px 0 0 60px;
	height: 34px;
}
</style>
<script type="text/javascript">
	//表单验证提交
	var code_flag = false;
	if(window.self != window.top){
		window.top.location = window.location;
	}
	$(function(){
		//验证码离焦事件
		$("input[name='checkcode']").blur(function(){
			//ajax异步验证验证码
			$.post("${pageContext.request.contextPath}/user/userAction_validCheckCode",{"checkcode":this.value},function(data){
				//判断验证码是否正确
				if (data) {
					//验证码正确
					$("#sp_checkcode").html("<font color='green'>√√√√</font>");
					code_flag = true;
				}else {
					//验证码错误
					code_flag = false;
					$("#sp_checkcode").html("<font color='red'>xxxx</font>");
				}
			});
		});
	});
	
	//点击登录，触发点击事件
	function go(){
		if (code_flag) {
			$("#loginform").submit();
		}
	}
	//点击回车键登录
	function keyLogin(){  
	   if (event.keyCode==13){  //回车键的键值为13
	        $("#loginform").submit();
	        //document.getElementById("loginForm").click(); //调用登录按钮的登录事件  
	    }  
	}  
</script>
<script>
  function toLogin()
  {
    //以下为按钮点击事件的逻辑。注意这里要重新打开窗口
    //否则后面跳转到QQ登录，授权页面时会直接缩小当前浏览器的窗口，而不是打开新窗口 
    var A=window.open("/index.jsp","qqLoginBtn", "width=450,height=320,menubar=0,scrollbars=1,resizable=1,status=1,titlebar=0,toolbar=0,location=1");
  }
</script>
<span id="qqLoginBtn"></span>
<script type="text/javascript">
   //调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
   QC.Login({
       //btnId：插入按钮的节点id，必选
       btnId:"qqLoginBtn",    
       //用户需要确认的scope授权项，可选，默认all
       scope:"all",
       //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
       size: "A_XL"
   }, function(reqData, opts){//登录成功
       //根据返回数据，更换按钮显示状态方法
       var dom = document.getElementById(opts['btnId']),
       _logoutTemplate=[
            //头像
            '<span><img src="{figureurl}" class="{size_key}"/></span>',
            //昵称
            '<span>{nickname}</span>',
            //退出
            '<span><a href="javascript:QC.Login.signOut();">退出</a></span>'    
       ].join("");
       dom && (dom.innerHTML = QC.String.format(_logoutTemplate, {
           nickname : QC.String.escHTML(reqData.nickname), //做xss过滤
           figureurl : reqData.figureurl
       }));
   }, function(opts){//注销成功
         alert('QQ登录 注销成功');
   }
);
</script>
</head>
<body onkeydown="keyLogin();">
	<div style="width: 900px; height: 50px; position: absolute; text-align: left; left: 50%; top: 40%; margin-left: -450px; margin-top: -280px;">
		<img src="${pageContext.request.contextPath }/images/logo.png" style="border-width: 0; margin-left: 0;margin-top: 15px;" />
		<span style="float: right; margin-top: 10px; color: #488ED5;">新BOS系统以中喜开发的ERP系统为基础，致力于便捷、安全、稳定等方面的客户体验</span>
	</div>
	<div class="main-inner" id="mainCnt"
		style="width: 900px; height: 440px; overflow: hidden; position: absolute; left: 50%; top: 50%; margin-left: -450px; margin-top: -220px; background-image: url('${pageContext.request.contextPath }/images/bg_login.jpg')">
		<div id="loginBlock" class="login"
			style="margin-top: 80px; height: 300px;">
			<div class="loginFunc">
				<div id="lbNormal" class="loginFuncMobile">员工登录</div>
			</div>
			<div class="loginForm">
				<form id="loginform" name="loginform" method="post" class="niceform"
					action="${pageContext.request.contextPath}/user/userAction_login">
					<div id="idInputLine" class="loginFormIpt showPlaceholder" style="margin-top: 5px;">
						<input id="loginform:idInput" type="text" name="username"
							class="loginFormTdIpt" maxlength="50" />
						<label for="idInput" class="placeholder" id="idPlaceholder">帐号：</label>
					</div>
					<div class="forgetPwdLine"></div>
					<div id="pwdInputLine" class="loginFormIpt showPlaceholder">
						<input id="loginform:pwdInput" class="loginFormTdIpt" type="password"
							name="password" value="" />
						<label for="pwdInput" class="placeholder" id="pwdPlaceholder">密码：</label>
					</div>
					<div class="loginFormIpt loginFormIptWiotTh" style="margin-top:58px;">
						<div id="checkcode" class="loginFormIpt showPlaceholder"
							style="margin-left:0px;margin-top:-40px;width:50px;">
							<input id="loginform:codeInput" class="loginFormTdIpt" type="text" name="checkcode" title="请输入验证码" />
							<img id="loginform:vCode" src="${pageContext.request.contextPath }/validatecode.jsp"
								onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();" />
						</div>
						<a href="javascript:void(0)" id="loginform:j_id19" name="loginform:j_id19" onclick="go()">
						<span
							id="loginform:loginBtn" class="btn btn-login" style="margin-top:-36px;">登录</span>
						</a>
						<span id="sp_checkcode"></span>
						<font color="red">
						 <s:actionerror/>
						 <s:fielderror></s:fielderror>
						</font>
					</div>
					<div id="qqLoginBtn" style="margin-left:40px;margin-top:35px;width:300px;">
						 <a href="#" onclick='toLogin()'/>
						其他账户登录(一键登录):<br/><img src="${pageContext.request.contextPath }/images/Connect_logo_7.png" border="0" button="qqLoginBtn">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div style="width: 900px; height: 50px; position: absolute; text-align: left; left: 50%; top: 50%; margin-left: -450px;; margin-top: 220px;">
		<span style="color: #488ED5;">Powered By <a href="http://www.资秘网.com">www.资秘网.com</a></span>
		<span style="color: #488ED5;margin-left:10px;">推荐浏览器（右键链接-目标另存为）：
		<a href="http://download.firefox.com.cn/releases/full/23.0/zh-CN/Firefox-full-latest.exe">Firefox</a>
		</span><span style="float: right; color: #488ED5;">中喜BOS系统</span>
	</div>
</body>
</html>