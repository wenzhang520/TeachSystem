
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
			if(document.form1.book.value==""){
				alert("�������鼮����");
				document.form1.book.focus();
				return false;
			}
		}
	</script>
	
	<body>
		<%
			String id = request.getParameter("id");
		%>
		<form name="form1" id="form1" method="post"
			action="teacher/library_updt_post.jsp?id=<%=id%>">
			�޸�ͼ�������Ϣ:
			<br>
			<br>
			<%
				String sql = "select * from library where id=" + id;
				String stu = "";
				String time = "";
				String book = "";
				
				ResultSet RS_result = connDbBean.executeQuery(sql);
				while (RS_result.next()) {
					stu = RS_result.getString("stu");
					time = RS_result.getString("time");
					book = RS_result.getString("book");
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
						�鼮���ƣ�
					</td>
					<td>
						<input name='book' type='text' id='book' value='<%=book %>' />
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


