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
			����ͼ������б���
		</p>

		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td width="30" align="center" bgcolor="CCFFFF">
					���
				</td>
				<td width="20%" align="center" bgcolor="CCFFFF">
					ѧ��
				</td>
				<td width="35%" align="center" bgcolor="CCFFFF">
					ʱ��
				</td>
				<td width="35%" align="center" bgcolor="CCFFFF">
					�鼮����
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
				String fysql = "select count(id) as ss from library";
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
						+ " * from library where id not in (select top "
						+ ((curpage - 1) * page_record)
						+ " id from library order by id desc) ";

				sql = sql + " order by id desc";
				RS_result = connDbBean.executeQuery(sql);

				String id = "";
				String stu = "";
				String time = "";
				String book = "";

				int i = 0;
				while (RS_result.next()) {
					i = i + 1;
					id = RS_result.getString("id");
					stu = RS_result.getString("stu");
					time = RS_result.getString("time");
					book = RS_result.getString("book");
			%>
			<tr>
				<td width="30" align="center"><%=i%></td>
				<td><%=stu%></td>
				<td><%=time%></td>
				<td><%=book%></td>

				<td width="90" align="center">
					<a href="teacher/library_updt.jsp?id=<%=id%>">�޸�</a>
					<a href="del.jsp?id=<%=id%>&tablename=library"
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
			<a href="library_list.jsp?page=1">��ҳ</a>
			<a href="library_list.jsp?page=<%=curpage - 1%>">��һҳ</a>
			<A href="library_list.jsp?page=<%=curpage + 1%>">��һҳ</A>
			<a href="library_list.jsp?page=<%=zys%>">βҳ</A> ��ǰ��
			<FONT color=red><%=curpage%></FONT>ҳ/��
			<FONT color=red><%=zys%></FONT>ҳ
		</p>
	</body>
</html>