<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>山东大学威海JAVA大作业论坛</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body background="image/qq2.jpg" style="background-size:cover">
	<br><br><br><br><br><br>
	<center>
	<h1>欢迎来到山东大学威海JAVA大作业论坛</h1>
	<div class="example"> </div>
	<br><br><br><br><br><br>
	<div class="modal modalBg">
	<form method="post" action="LoginCheck" id="form1">
		<br><br><br>
		<input class="inputOuter" type="text" title="账号" placeholder="请输入账号" name="username" size="25" maxlength="25">
		<br>
		<input class="inputOuter" type="password" title="密码" placeholder="请输入密码" name="password" size="25" maxlength="25">
		<br><br>
		<input id="btn-color"class="btn u-btn" type="button" value="登录" onclick="check()">
		<a href="register.jsp"><input id="btn-color"class="btn u-btn" type="button" value="注册"></a>
	</form>
	<br><br><br><br>
	<a href=pofang.html style="color:#ffffff">考试倒计时</a>
	</center>
	
	<script type="text/javascript">
		function check() {
			var form = document.getElementById("form1");
			for (var i = 0; i < form.length; i++) {
				if (form.elements[i].value == "") {
					alert(form.elements[i].title + "不能为空");
					form.elements[i].focus();
					return;
				}
			}
			form.submit();
		}
	</script>
</body>
</html>