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
	
	<script language="javascript">
		function readnotice(id,content)
		{
			window.open('notice_info.jsp?id=id&content=content','newwindow','height=300,width=600');
		}
	</script>
	
	<%
		String sql;
		ResultSet RS_result;
		String id = (String)request.getSession().getAttribute("id");
		String sql2 = "select * from parent where id=" + id;
		String childname = "";
		RS_result = connDbBean.executeQuery(sql2);
		while (RS_result.next()) {
			childname = RS_result.getString("childname");
		}
	%>
	<body>
		<p>
			���п��ñ�����Ϣ�б�
		</p>

		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td width="30" align="center" bgcolor="CCFFFF">
					���
				</td>
				<td width="10%" align="center" bgcolor="CCFFFF">
					ѧ��
				</td>
				<td width="15%" align="center" bgcolor="CCFFFF">
					ʱ��
				</td>
				<td width="15%" align="center" bgcolor="CCFFFF">
					�γ�
				</td>
				<td width="40%" align="center" bgcolor="CCFFFF">
					���ñ���
				</td>
			</tr>
			<%
				int curpage = 1;//��ǰҳ
				int page_record = 10;//ÿҳ��ʾ�ļ�¼��
				int zgs = 0;
				int zys = 0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage = request.getParameter("page");
				String fysql = "select count(id) as ss from record where stu='"+childname+"'";
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
						+ " * from record where stu='"+childname+"'"+"and id not in (select top "
						+ ((curpage - 1) * page_record)
						+ " id from record order by id desc) ";

				sql = sql + " order by id desc";
				RS_result = connDbBean.executeQuery(sql);

				String id2 = "";
				String stu = "";
				String time = "";
				String course = "";
				String record = "";

				int i = 0;
				while (RS_result.next()) {
					i = i + 1;
					id = RS_result.getString("id");
					stu = RS_result.getString("stu");
					time = RS_result.getString("time");
					course = RS_result.getString("course");
					record = RS_result.getString("record");
			%>
			<tr>
				<td width="30" align="center"><%=i%></td>
				<td><%=stu%></td>
				<td><%=time%></td>
				<td><%=course%></td>
				<td><%=record%></td>

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
			<a href="record_list.jsp?page=1">��ҳ</a>
			<a href="record_list.jsp?page=<%=curpage - 1%>">��һҳ</a>
			<A href="record_list.jsp?page=<%=curpage + 1%>">��һҳ</A>
			<a href="record_list.jsp?page=<%=zys%>">βҳ</A> ��ǰ��
			<FONT color=red><%=curpage%></FONT>ҳ/��
			<FONT color=red><%=zys%></FONT>ҳ
		</p>
	</body>
</html>
