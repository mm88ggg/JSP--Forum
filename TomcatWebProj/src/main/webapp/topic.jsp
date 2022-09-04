<%@page import="JDBC.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JDBC.DbUtil"%>
<%@page import="JDBC.Topic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>山东大学威海JAVA大作业论坛</title>
<link rel="stylesheet" type="text/css" href="css/topic.css">
</head>
<body>
	<a href="main.jsp" align=center><h1>山东大学威海JAVA大作业论坛</h1></a>
	<br>
	<%
		String tidS = request.getParameter("tid");
		if (tidS == null) {
			tidS = (String)session.getAttribute("tid");
		}
		int tid = Integer.parseInt(tidS);
		Topic topic = DbUtil.getTopic(tid);
		session.setAttribute("tid", tidS);
		ArrayList<Reply> replies = DbUtil.getAllReply(tid);
	
		int MaxNum = 5, nowPage = 1, pageNum = (int)Math.ceil(replies.size() / MaxNum) + 1, firstPage = 1, lastPage = pageNum, nextPage = nowPage + 1;
		if (request.getParameter("pageNum") != null 
				&& Integer.parseInt(request.getParameter("pageNum")) >= firstPage 
				&& Integer.parseInt(request.getParameter("pageNum")) <= lastPage) {
			nowPage = Integer.parseInt(request.getParameter("pageNum"));
			nextPage = nowPage + 1;
		}
		
		out.print("<table id=customers style=background-color:#EAF2D3 align=center width=1000 border=5 cellspacing=5 cellpadding=5><tr><td width=200><font size=5>主题</font></td><td><font size=5>" + topic.getTopic() 
				+ "</font></td></tr><table id=customers style=background-color:#EAF2D3 align=center width=1000 border=1 cellspacing=5 cellpadding=5><tr><td width=100>用户</td><td width=300><a href=main.jsp>"
		    	+ topic.getUsername() + "</a></td><td>发布时间：</td><td>" + topic.getDate() 
		    	+ "</td></tr></table><table id=customers style=background-color:#EAF2D3 align=center width=1000 height=400 border=5 cellspacing=5 cellpadding=5><tr><td style=\"word-break: break-all;\">" + 
				topic.getContent() 
				+ "</td></tr></table><br>");
		
		for (int i = (nowPage - 1) * 5; i < nowPage * MaxNum && i < replies.size(); ++i) {
			//out.print("<p>hello</p>");
			out.print("<table id=customers style=background-color:#fafad2 align=center width=1000 border=1 cellspacing=5 cellpadding=5><tr><td width=300>用户"
		    	+ replies.get(i).getUsername() + "的回复</td><td width=700 rowspan=2>" + replies.get(i).getContent()
		    	+ "</td></tr><tr><td width=300>" + replies.get(i).getTime()
				+ "</td></tr></table><br>");
		}
	%>
	<table align=center width=1000 border="0" cellspacing="5" cellpadding="5">
		<tr>
			<td>
				目前页数: <%=nowPage %>
				总页数: <%=pageNum %>
			</td> <td>
				<a href=topic.jsp?pageNum=<%=firstPage %>>【第一页】</a>
			</td> <td>
				<%
					if (nowPage == 1) {
						out.print("【上一页】");
					} else {
						out.print("<a href=topic.jsp?pageNum=" + Integer.toString(nowPage - 1) + ">【上一页】</a>");
					}
				%>
			</td> <td>
				<%
					if (nowPage == lastPage) {
						out.print("【下一页】");
					} else {
						out.print("<a href=topic.jsp?pageNum=" + Integer.toString(nowPage + 1) + ">【下一页】</a>");
					}
				%>
			</td> <td>
				<a href=topic.jsp?pageNum=<%=lastPage %>>【最后一页】</a>
			</td> <td>
				<form action="topic.jsp">
					<input type=text size=10 name=pageNum value=<%=nowPage %>>
					<input type=submit name=sent value="转到">
				</form>
			</td>
		</tr>
	</table>
	<table id=customers1 align=center width=1000 height=300 border=1 cellspacing=5 cellpadding=5>
		<tr>
			<td>
				<form id=form4 action="ReplyAdd">
					<textarea rows="20" cols="120" title="回复内容" name=content></textarea>
					<input type=button value="回复" name=send onclick="check()">
				</form>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
		function check() {
			var form = document.getElementById("form4");
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