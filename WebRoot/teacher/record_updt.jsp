
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

		<title>��ѧ��ͨ����ϵͳ</title>
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
				alert("��������ñ���");
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
			�޸Ŀ��ñ�����Ϣ:
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
						ѧ����
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
						ʱ�䣺
					</td>
					<td>
						<input name='time' type='text' id='time' value='<%=time %>' />
					</td>
				</tr>
				<tr>
					<td align="right">
						�γ̣�
					</td>
					<td>
						<select name='course' id='course'>
							<option value="����"
								<% if("����".equals(course)){%>
									selected
								<%} %>	
							>
								����
							</option>
							<option value="��ѧ"
								<% if("��ѧ".equals(course)){%>
									selected
								<%} %>	
							>
								��ѧ
							</option>
							<option value="Ӣ��"
								<% if("Ӣ��".equals(course)){%>
									selected
								<%} %>	
							>
								Ӣ��
							</option>
							<option value="��ѧ"
								<% if("��ѧ".equals(course)){%>
									selected
								<%} %>	
							>
								��ѧ
							</option>
							<option value="����"
								<% if("����".equals(course)){%>
									selected
								<%} %>	
							>
								����
							</option>
							<option value="����"
								<% if("����".equals(course)){%>
									selected
								<%} %>	
							>
								����
							</option>
							<option value="��ʷ"
								<% if("��ʷ".equals(course)){%>
									selected
								<%} %>	
							>
								��ʷ
							</option>
							<option value="����"
								<% if("����".equals(course)){%>
									selected
								<%} %>	
							>
								����
							</option>
							<option value="����"
								<% if("����".equals(course)){%>
									selected
								<%} %>	
							>
								����
							</option>
							<option value="����"
								<% if("����".equals(course)){%>
									selected
								<%} %>	
							>
								����
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						���ñ��֣�
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
						<input type="submit" name="Submit" value="�ύ"
							onclick="return check();" />
						<input type="reset" name="Submit2" value="����" />
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>


