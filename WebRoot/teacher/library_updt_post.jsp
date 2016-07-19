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
			String stu = request.getParameter("stu");
			String time = request.getParameter("time");
			String book = request.getParameter("book");
			
			String sql = "update library set stu='" + stu
										+ "',time='" + time 
										+ "',book='" + book 
										+ "' where id= " + id;
			connDbBean.executeUpdate(sql);
			out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='library_list.jsp';</script>");
		%>
	</body>
</html>


