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
			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String sex = request.getParameter("sex");
			String course = request.getParameter("course");
			String tel = request.getParameter("tel");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			
			ResultSet RS_result=connDbBean.executeQuery("select * from teacher where username='"+username+"'");

			if(RS_result.next())
			{
				out.print("<script>alert('该用户名已经存在,请更换其他用户名!');window.history.go(-1);</script>");
			}
			else{
				String sql = "insert into teacher(name,age,sex,course,tel,username,password) values('"
						+ name
						+ "','"
						+ age
						+ "','"
						+ sex
						+ "','"
						+ course 
						+ "','" 
						+ tel 
						+ "','" 
						+ username 
						+ "','" 
						+ password + "') ";
	
				connDbBean.executeUpdate(sql);
				out
						.print("<script>alert('添加成功!!');location.href='teacher_list.jsp';</script>");
	
				}
			RS_result.close();
		%>
	</body>
</html>

