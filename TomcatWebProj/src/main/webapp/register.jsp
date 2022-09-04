<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SDUWHJAVABBS</title>
<link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body background="image/qq2.jpg" style="background-size:cover">
	<br><center>
	<h1><a href=login.jsp class=a1color>山东大学威海JAVA大作业论坛</a></h1>
	<h2>请填写以下资料</h2>
	<div class="example"> </div>
	<br><br><br><br><br><br><br><br><br><br><br>
	<div class="modal modalBg">
		<form id="form2" method="post" action="RegisterCheck">
			<br><br>
			<input class="inputOuter" type="text" name="username" title="账号" placeholder="请输入账号" size="25" maxlength="25"><br>
			<input class="inputOuter" type="password" title="密码" name="password" placeholder="请输入密码" size="25" maxlength="25"><br>
			<input class="inputOuter" type="password" title="再次输入密码" name="passwordagain" placeholder="请再次输入密码" size="25" maxlength="25"><br>
			<input class="inputOuter" type="telephone" title="手机号" name="telephone" placeholder="请输入您的手机号" size="25" maxlength="25"><br>
			<input class="inputOuter" type="email" name="email" title="电子邮箱" placeholder="请输入您的邮箱地址" size="25" maxlength="100"><br>
			<strong>生日</strong>
			<input id="i1" type="date" name="birthday" size="25"><br>
			<br>
			<input id="btn-color"class="btn u-btn" type="button" value="注册" onclick="check2()">
		</form>
	</div>
	</center>
	
	<script type="text/javascript">
		function check2() {
			var form = document.getElementById("form2");
			for (var i = 0; i < form.length; i++) {
				//alert(form.elements[i].value);
				if (form.elements[i].value == "") {
					alert(form.elements[i].title + "不能为空");
					form.elements[i].focus();
					return;
				}
			}
			if (form.elements[1].value != form.elements[2].value) {
				alert("两次密码输入不一致!");
				form.elements[1].focus();
				return;
			}
			form.submit();
		}
	</script>
</body>
</html>