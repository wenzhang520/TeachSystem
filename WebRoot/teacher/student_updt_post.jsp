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
			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String sex = request.getParameter("sex");
			String classes = request.getParameter("classes");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			String sql = "update student set name='" + name
										+ "',age='" + age 
										+ "',sex='" + sex
										+ "',classes='" + classes 
										+ "',username='" + username 
										+ "',password='" + password 
										+ "' where id= " + id;
			connDbBean.executeUpdate(sql);
			out.print("<script>alert('�޸ĳɹ�!!');location.href='student_list.jsp';</script>");
		%>
	</body>
</html>


