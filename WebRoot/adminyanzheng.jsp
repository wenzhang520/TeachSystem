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
			String uid = request.getParameter("username");
			String pwd = request.getParameter("pwd");
			String cx = new String(request.getParameter("cx")
					.getBytes("8859_1"));
			String sql = "";
			if (cx.equals("��ʦ")) {
				sql = "select * from teacher where username='" + uid + "' and password='" + pwd + "'";
			} else if(cx.equals("ѧ��")){
				sql = "select * from student where username='" + uid + "' and password='" + pwd + "'";
			} else {
				sql = "select * from parent where username='" + uid + "' and password='" + pwd + "'";
			}
			ResultSet RS_result = connDbBean.executeQuery(sql);
			if (!RS_result.next()) {
				out.print("<script>alert('��������û������ڻ��������,�����µ�¼!');window.history.go(-1);</script>");
			} else {

				session.setAttribute("username", uid);
				session.setAttribute("name", RS_result.getString("name"));
				session.setAttribute("id", RS_result.getString("id"));
				if (cx.equals("��ʦ")) {
					session.setAttribute("cx", "��ʦ");
				} else if(cx.equals("ѧ��")){
					session.setAttribute("cx", "ѧ��");
				} else {
					session.setAttribute("cx", "�ҳ�");
				}
				response.sendRedirect("main.jsp");
			}
			RS_result.close();
		%>
	</body>
</html>

