
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
		<script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
		<script type="text/javascript">
	   
	</script>
		<LINK href="CSS.css" type=text/css rel=stylesheet>

	</head>
	
	<script language="javascript">
		function check()
		{
			if(document.form1.title.value==""){
				alert("请输入标题");
				document.form1.title.focus();
				return false;
			}
			if(document.form1.content.value==""){
				alert("请输入内容");
				document.form1.content.focus();
				return false;
			}
		}
	</script>
	
	<body>
		<%
			String id = request.getParameter("id");
		%>
		<form name="form1" id="form1" method="post"
			action="teacher/notice_updt_post.jsp?id=<%=id%>">
			修改公告信息:
			<br>
			<br>
			<%
				String sql = "select * from notice where id=" + id;
				String title = "";
				String content = "";
				
				ResultSet RS_result = connDbBean.executeQuery(sql);
				while (RS_result.next()) {
					title = RS_result.getString("title");
					content = RS_result.getString("content");
				}
			%>
			<table width="100%" border="1" align="center" cellpadding="3"
				cellspacing="1" bordercolor="#00FFFF"
				style="border-collapse: collapse">
				<tr>
					<td align="right" width="20%">
						标题：
					</td>
					<td>
						<input name='title' type='text' id='title' value='<%=title %>' size='50' />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						内容：
					</td>
					<td>
						<textarea rows="10" cols="50" id="content" name="content"><%=content %></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						<input type="submit" name="Submit" value="提交"
							onclick="return check();" />
						<input type="reset" name="Submit2" value="重置" />
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>


