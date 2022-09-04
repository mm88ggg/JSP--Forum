<%@page import="java.util.ArrayList"%>
<%@page import="JDBC.Topic"%>
<%@page import="JDBC.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SDUWHJAVABBS</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<%
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date curr = new java.util.Date();
		String time = sdf.format(curr).toString();
		final double MaxNum = 5;
	%>
	<br>
	<center>
		<h1>欢迎登录<br>山东大学威海JAVA大作业论坛</h1>
		<a href="post.jsp"><input id="btn-color"class="btn u-btn" type="button" value="发表帖子"></a>
		<br><br>
		<table id="customers" width=1000 border=1 cellspacing=5 cellpadding=5 height=8>
			<tr>
				<td>
					用户：<a href=""><%=session.getAttribute("username") %></a>
					<a href="login.jsp"><input type="button" value="退出登录"></a>
				</td> <td>
					登录地址：<%=session.getAttribute("userip") %>
				</td> <td>
					登录时间：<%=time %>
				</td>
			</tr>
		</table>
		<br><br>
			<%
				ArrayList<Topic> topics = DbUtil.getAllTopic();
				int pageNum = (int)Math.ceil(topics.size() / MaxNum);
				int firstPage = 1, lastPage = pageNum, nowPage = 1, nextPage = nowPage + 1;
				if (request.getParameter("pageNum") != null 
						&& Integer.parseInt(request.getParameter("pageNum")) >= firstPage 
						&& Integer.parseInt(request.getParameter("pageNum")) <= lastPage) {
					nowPage = Integer.parseInt(request.getParameter("pageNum"));
					nextPage = nowPage + 1;
				}
				for (int i = (nowPage - 1) * 5; i < nowPage * MaxNum && i < topics.size(); ++i) {
					out.print("<table id=\"customers\" width=1000 border=1 cellspacing=5 cellpadding=5><tr><td><a href=topic.jsp?tid="
						+ topics.get(i).getId() + "><font size=5>" 
						+ topics.get(i).getTopic() + "</font></a></td><td width=300>用户：<a href=main.jsp>"
				    	+ topics.get(i).getUsername() + "</a></td><td width=300>发布时间：" + topics.get(i).getDate() 
				    	+ "</td></tr></table><table id=\"customers1\" class=\"td1\" width=1000 border=1 cellspacing=5 cellpadding=5 height=100><tr><td>" + 
						(topics.get(i).getContent().length() > 50 ? topics.get(i).getContent().substring(0, 50) + "..." : topics.get(i).getContent()) 
						+ "</td></tr></table><br>");
				}
			%>
		<br>
		<table width=1000 border="0" cellspacing="5" cellpadding="5">
			<tr>
				<td>
					目前页数: <%=nowPage %>
					总页数: <%=pageNum %>
				</td> <td>
					<a href=main.jsp?pageNum=<%=firstPage %>>【第一页】</a>
				</td> <td>
					<%
						if (nowPage == 1) {
							out.print("【上一页】");
						} else {
							out.print("<a href=main.jsp?pageNum=" + Integer.toString(nowPage - 1) + ">【上一页】</a>");
						}
					%>
				</td> <td>
					<%
						if (nowPage == lastPage) {
							out.print("【下一页】");
						} else {
							out.print("<a href=main.jsp?pageNum=" + Integer.toString(nowPage + 1) + ">【下一页】</a>");
						}
					%>
				</td> <td>
					<a href=main.jsp?pageNum=<%=lastPage %>>【最后一页】</a>
				</td> <td>
					<form action="main.jsp">
						<input type=text size=10 name=pageNum value=<%=nowPage %>>
						<input type=submit name=sent value="转到">
					</form>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>