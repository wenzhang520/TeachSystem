
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
			if(document.form1.name.value==""){
				alert("请输入姓名");
				document.form1.name.focus();
				return false;
			}
			if(document.form1.username.value==""){
				alert("请输入用户名");
				document.form1.username.focus();
				return false;
			}
			if(document.form1.password.value==""){
				alert("请输入密码");
				document.form1.password.focus();
				return false;
			}
		}
	</script>
	
	<body>
		<%
			String id = request.getParameter("id");
		%>
		<form name="form1" id="form1" method="post"
			action="teacher/teacher_updt_post.jsp?id=<%=id%>">
			修改教师信息:
			<br>
			<br>
			<%
				String sql = "select * from teacher where id=" + id;
				String name = "";
				String age = "";
				String sex = "";
				String course = "";
				String tel = "";
				String username = "";
				String password = "";
				
				ResultSet RS_result = connDbBean.executeQuery(sql);
				while (RS_result.next()) {
					name = RS_result.getString("name");
					age = RS_result.getString("age");
					sex = RS_result.getString("sex");
					course = RS_result.getString("course");
					tel = RS_result.getString("tel");
					username = RS_result.getString("username");
					password = RS_result.getString("password");
				}
			%>
			<table width="100%" border="1" align="center" cellpadding="3"
				cellspacing="1" bordercolor="#00FFFF"
				style="border-collapse: collapse">
				<tr>
					<td align="right" width="20%">
						姓名：
					</td>
					<td>
						<input name='name' type='text' id='name' value='<%=name %>' />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						年龄：
					</td>
					<td>
						<input name='age' type='text' id='age' value='<%=age %>' />
					</td>
				</tr>
				<tr>
					<td align="right">
						性别：
					</td>
					<td>
						<select id="sex" name="sex">
							<option value="男"
								<% if("男".equals(sex)){%>
									selected
								<%} %>
							>
								男
							</option>
							<option value="女"
								<% if("女".equals(sex)){%>
									selected
								<%} %>
							>
								女
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						担任课程：
					</td>
					<td>
						<select name='course' id='course'>
							<option value="语文"
								<% if("语文".equals(course)){%>
									selected
								<%} %>	
							>
								语文
							</option>
							<option value="数学"
								<% if("数学".equals(course)){%>
									selected
								<%} %>	
							>
								数学
							</option>
							<option value="英语"
								<% if("英语".equals(course)){%>
									selected
								<%} %>	
							>
								英语
							</option>
							<option value="化学"
								<% if("化学".equals(course)){%>
									selected
								<%} %>	
							>
								化学
							</option>
							<option value="物理"
								<% if("物理".equals(course)){%>
									selected
								<%} %>	
							>
								物理
							</option>
							<option value="生物"
								<% if("生物".equals(course)){%>
									selected
								<%} %>	
							>
								生物
							</option>
							<option value="历史"
								<% if("历史".equals(course)){%>
									selected
								<%} %>	
							>
								历史
							</option>
							<option value="地理"
								<% if("地理".equals(course)){%>
									selected
								<%} %>	
							>
								地理
							</option>
							<option value="政治"
								<% if("政治".equals(course)){%>
									selected
								<%} %>	
							>
								政治
							</option>
							<option value="体育"
								<% if("体育".equals(course)){%>
									selected
								<%} %>	
							>
								体育
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						联系电话：
					</td>
					<td>
						<input name='tel' type='text' id='tel' value='<%=tel %>' />
					</td>
				</tr>
				<tr>
					<td align="right">
						用户名：
					</td>
					<td>
						<input name='username' type='text' id='username' value='<%=username %>' />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						密码：
					</td>
					<td>
						<input name='password' type='password' id='password' value='<%=password %>' />
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


