
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
			if(document.form1.record.value==""){
				alert("���������Ѽ�¼");
				document.form1.record.focus();
				return false;
			}
		}
	</script>

	<body>
		<form name="form1" id="form1" method="post"
			action="teacher/card_add_post.jsp">
			���һ��ͨ��Ϣ:
			<br>
			<br>
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
						ʱ�䣺
					</td>
					<td>
						<input name='time' type='text' id='time' value='' />
					</td>
				</tr>
				
				<tr>
					<td align="right">
						���ţ�
					</td>
					<td>
						<input name='cardno' type='text' id='cardno' value='' />
					</td>
				</tr>
				<tr>
					<td align="right">
						���Ѽ�¼��
					</td>
					<td>
						<textarea rows="10" cols="50" id="record" name="record"></textarea>
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

