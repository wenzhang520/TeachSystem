
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
			String id = (String)request.getSession().getAttribute("id");
		%>
		<form name="form1" id="form1" method="post"
			action="parent/parent_updt_post.jsp?id=<%=id%>">
			个人信息管理:
			<br>
			<br>
			<%
				String sql = "select * from parent where id=" + id;
				String name = "";
				String age = "";
				String sex = "";
				String address = "";
				String tel = "";
				String childname = "";
				String username = "";
				String password = "";
				
				ResultSet RS_result = connDbBean.executeQuery(sql);
				while (RS_result.next()) {
					name = RS_result.getString("name");
					age = RS_result.getString("age");
					sex = RS_result.getString("sex");
					address = RS_result.getString("address");
					tel = RS_result.getString("tel");
					childname = RS_result.getString("childname");
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
						地址：
					</td>
					<td>
						<input name='address' type='text' id='address' value='<%=address %>' />
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
						子女关系：
					</td>
					<td>
						<select id="childname" name="childname">
							<%
								String sql2 = "";
								sql2 = "select * from student where 1=1";
								ResultSet RS_result2 = connDbBean.executeQuery(sql2);
								String id2 = "";
								String name2 = "";
				
								while (RS_result2.next()) {
									id2 = RS_result2.getString("id");
									name2 = RS_result2.getString("name");
							%>
								<option value="<%=name2 %>"
									<% if(name2.equals(childname)){%>
										selected
									<%} %>
								>
									<%=name2 %>
								</option>
							<%
								}
							%>
						</select>
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


