
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
				alert("请输入消费记录");
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
			action="teacher/card_updt_post.jsp?id=<%=id%>">
			修改一卡通信息:
			<br>
			<br>
			<%
				String sql = "select * from card where id=" + id;
				String stu = "";
				String time = "";
				String cardno = "";
				String record = "";
				
				ResultSet RS_result = connDbBean.executeQuery(sql);
				while (RS_result.next()) {
					stu = RS_result.getString("stu");
					time = RS_result.getString("time");
					cardno = RS_result.getString("cardno");
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
						卡号：
					</td>
					<td>
						<input name='cardno' type='text' id='cardno' value='<%=cardno %>' />
					</td>
				</tr>
				<tr>
					<td align="right">
						消费记录：
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


