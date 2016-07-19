
<%@ page language="java" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<html>
	<head>
		<base href="<%=basePath%>">

		<title>教学沟通管理系统</title>
		<LINK href="CSS.css" type=text/css rel=stylesheet>
		<script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
		<script type="text/javascript">
	   
	</script>
	</head>

	<%
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
	%>

	<body>
		<table width="100%" border="0" align="center" cellpadding="3"/>
			<tr>
				<td align="center">
					<b>公告信息</b>
				</td>
			</tr>
		</table>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td align="right" width="20%">
					标题：
				</td>
				<td>
					<%=title %>
				</td>
			</tr>
			<tr>
				<td align="right">
					内容：
				</td>
				<td>
					<%=title %>
				</td>
			</tr>
		</table>

	</body>
</html>

