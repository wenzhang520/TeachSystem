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
			String stu = request.getParameter("stu");
			String time = request.getParameter("time");
			String book = request.getParameter("book");
			
			String sql = "insert into library(stu,time,book) values('"
					+ stu
					+ "','"
					+ time
					+ "','"
					+ book + "') ";

			connDbBean.executeUpdate(sql);
			out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='library_list.jsp';</script>");
		%>
	</body>
</html>

