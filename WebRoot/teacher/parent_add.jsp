
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
		<LINK href="CSS.css" type=text/css rel=stylesheet>
		<script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
		<script type="text/javascript">
	   
	</script>
	</head>

	<script language="javascript">
		function check()
		{
			if(document.form1.name.value==""){
				alert("����������");
				document.form1.name.focus();
				return false;
			}
			if(document.form1.username.value==""){
				alert("�������û���");
				document.form1.username.focus();
				return false;
			}
			if(document.form1.password.value==""){
				alert("����������");
				document.form1.password.focus();
				return false;
			}
		}
	</script>

	<body>
		<form name="form1" id="form1" method="post"
			action="teacher/parent_add_post.jsp">
			��Ӽҳ���Ϣ:
			<br>
			<br>
			<table width="100%" border="1" align="center" cellpadding="3"
				cellspacing="1" bordercolor="#00FFFF"
				style="border-collapse: collapse">
				<tr>
					<td align="right" width="20%">
						������
					</td>
					<td>
						<input name='name' type='text' id='name' value='' />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						���䣺
					</td>
					<td>
						<input name='age' type='text' id='age' value='' />
					</td>
				</tr>
				<tr>
					<td align="right">
						�Ա�
					</td>
					<td>
						<select name='sex' id='sex'>
							<option value="��">
								��
							</option>
							<option value="Ů">
								Ů
							</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						��ַ��
					</td>
					<td>
						<input name='address' type='text' id='address' value='' />
					</td>
				</tr>
				<tr>
					<td align="right">
						��ϵ�绰��
					</td>
					<td>
						<input name='tel' type='text' id='tel' value='' />
					</td>
				</tr>
				<tr>
					<td align="right">
						��Ů��ϵ��
					</td>
					<td>
						<select id="childname" name="childname">
							<%
								String sql = "";
								sql = "select * from student where 1=1";
								ResultSet RS_result = connDbBean.executeQuery(sql);
								String id = "";
								String name = "";
				
								while (RS_result.next()) {
									id = RS_result.getString("id");
									name = RS_result.getString("name");
							%>
								<option value="<%=name %>"><%=name %></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						�û�����
					</td>
					<td>
						<input name='username' type='text' id='username' value='' />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						���룺
					</td>
					<td>
						<input name='password' type='password' id='password' value='' />
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

