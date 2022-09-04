<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SDUWHJAVABBS</title>
<link rel="stylesheet" type="text/css" href="css/post.css">
</head>
<body>
	<center>
		<h1>欢迎登录<br><a href="main.jsp">山东大学威海JAVA大作业论坛</a></h1>
		<form id="form3" action="TopicAdd">
			<table id="customers" width="1000" height="400" border="5" cellspacing="5" cellpadding="5">
				<tr>
					<td>
						姓名
					</td> <td>
						<%=session.getAttribute("username") %>
					</td>
				</tr> <tr>
					<td>主题 </td><td><input type="text" title="主题" size="60" name="topic"></td>
				</tr>
					<tr valign=top >
					<td><p><p>内<p><p>容 </td><td> <textarea rows="10" title="内容" cols="120" name="content"></textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input id="btn-color" class="btn" type="button" value="发表" name="send" onclick="check()">
					</td>
				</tr>
				</tr>
			</table>
		</form>
	</center>
	
	<script type="text/javascript">
		function check() {
			var form = document.getElementById("form3");
			for (var i = 0; i < form.length; i++) {
				//alert(form.elements[i].value);
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