<%@ page language="java" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'adminyanzheng.jsp' starting page</title>


	</head>

	<body>
		<%
			if (request.getSession().getAttribute("cx").equals("��ʦ")) {
				response.sendRedirect("left1.jsp");
			}else if (request.getSession().getAttribute("cx").equals("ѧ��")) {
				response.sendRedirect("left2.jsp");
			}else if (request.getSession().getAttribute("cx").equals("�ҳ�")) {
				response.sendRedirect("left3.jsp");
			}
		%>
	</body>
</html>

