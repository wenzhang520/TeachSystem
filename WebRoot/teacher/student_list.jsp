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
	</head>
	<%
		String sql;
		ResultSet RS_result;
	%>
	<body>
		<p>
			����ѧ����Ϣ�б�
		</p>
		
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td width="30" align="center" bgcolor="CCFFFF">
					���
				</td>
				<td align="center" bgcolor="CCFFFF">
					����
				</td>
				<td bgcolor='#CCFFFF'>
					����
				</td>
				<td bgcolor='#CCFFFF'>
					�Ա�
				</td>
				<td bgcolor='#CCFFFF'>
					�༶
				</td>
				<td bgcolor='#CCFFFF'>
					�û���
				</td>
				<td bgcolor='#CCFFFF'>
					����
				</td>
				<td width="60" align="center" bgcolor="CCFFFF">
					����
				</td>
			</tr>
			<%
				int curpage = 1;//��ǰҳ
				int page_record = 10;//ÿҳ��ʾ�ļ�¼��
				int zgs = 0;
				int zys = 0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage = request.getParameter("page");
				String fysql = "select count(id) as ss from student";
				ResultSet RS_resultfy = connDbBean.executeQuery(fysql);
				while (RS_resultfy.next()) {
					zgs = Integer.parseInt(RS_resultfy.getString("ss"));
					zys = zgs / page_record + 1;
				}
				if (hsgnpage != null) {
					curpage = Integer.parseInt(request.getParameter("page"));//��ȡ���ݵ�ֵ����Ҫ��ʾ��ҳ
				} else {
					curpage = 1;
				}
				if (curpage == 0) {
					curpage = 1;
				}
				if (curpage > zys) {
					curpage = zys;
				}
				sql = "";
				sql = "select top " + page_record
						+ " * from student where id not in (select top "
						+ ((curpage - 1) * page_record)
						+ " id from student order by id desc) ";

				sql = sql + " order by id desc";
				RS_result = connDbBean.executeQuery(sql);
				
				String id = "";
				String name = "";
				String age = "";
				String sex = "";
				String classes = "";
				String username = "";
				String password = "";
				
				int i = 0;
				while (RS_result.next()) {
					i = i + 1;
					id = RS_result.getString("id");
					name = RS_result.getString("name");
					age = RS_result.getString("age");
					sex = RS_result.getString("sex");
					classes = RS_result.getString("classes");
					username = RS_result.getString("username");
					password = RS_result.getString("password");
			%>
			<tr>
				<td width="30" align="center"><%=i%></td>
				<td><%=name%></td>
				<td><%=age%></td>
				<td><%=sex%></td>
				<td><%=classes%></td>
				<td><%=username%></td>
				<td><%=password%></td>
				
				<td width="90" align="center">
					<a href="teacher/student_updt.jsp?id=<%=id%>">�޸�</a>
					<a href="del.jsp?id=<%=id%>&tablename=student"
						onClick="return confirm('���Ҫɾ����')">ɾ��</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
		�������ݹ�<%=i%>��,
		<a style="cursor: hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
		<p align="center">
			&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record%>��/ҳ
			<a href="student_list.jsp?page=1">��ҳ</a>
			<a href="student_list.jsp?page=<%=curpage - 1%>">��һҳ</a>
			<A href="student_list.jsp?page=<%=curpage + 1%>">��һҳ</A>
			<a href="student_list.jsp?page=<%=zys%>">βҳ</A> ��ǰ��
			<FONT color=red><%=curpage%></FONT>ҳ/��
			<FONT color=red><%=zys%></FONT>ҳ
		</p>
	</body>
</html>
