
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
			if(document.form1.record.value==""){
				alert("请输入课堂表现");
				document.form1.record.focus();
				return false;
			}
		}
	</script>
	
	<body>
		<%
			String id = request.getParameter("id");
		%>
		<form name="form1" id="form1" method="post"
			action="teacher/record_updt_post.jsp?id=<%=id%>">
			修改课堂表现信息:
			<br>
			<br>
			<%
				String sql = "select * from record where id=" + id;
				String stu = "";
				String time = "";
				String course = "";
				String record = "";
				
				ResultSet RS_result = connDbBean.executeQuery(sql);
				while (RS_result.next()) {
					stu = RS_result.getString("stu");
					time = RS_result.getString("time");
					course = RS_result.getString("course");
					record = RS_result.getString("record");
				}
			%>
			<table width="100%" border="1" align="center" cellpadding="3"
				cellspacing="1" bordercolor="#00FFFF"
				style="border-collapse: collapse">
				<tr>
					<td align="right" width="20%">
						学生：
					</td>
					<td>
						<select id="stu" name="stu">
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
									<% if(name2.equals(stu)){%>
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
						时间：
					</td>
					<td>
						<input name='time' type='text' id='time' value='<%=time %>' />
					</td>
				</tr>
				<tr>
					<td align="right">
						课程：
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
						课堂表现：
					</td>
					<td>
						<textarea rows="10" cols="50" id="record" name="record"><%=record %></textarea>
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


