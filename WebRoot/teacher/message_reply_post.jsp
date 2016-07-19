<%@ page language="java" pageEncoding="gb2312" import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("gb2312");
	response.setCharacterEncoding("gb2312");
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'adminyanzheng.jsp' starting page</title>


	</head>

	<body>
		<%
			String id = request.getParameter("id");
			String replyid = request.getParameter("replyid");
			String replyname = request.getParameter("replyname");
			String reply = request.getParameter("reply");
			
			String sql = "update message set reply='" + reply
										+ "',replyid='" + replyid 
										+ "',replyname='" + replyname 
										+ "' where id= " + id;

			connDbBean.executeUpdate(sql);
			out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='message_list.jsp';</script>");
		%>
	</body>
</html>

