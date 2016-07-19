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
	%>
	<body>
		<p>
			已有公告信息列表：
		</p>

		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td width="30" align="center" bgcolor="CCFFFF">
					序号
				</td>
				<td align="center" bgcolor="CCFFFF">
					标题
				</td>
			</tr>
			<%
				int curpage = 1;//当前页
				int page_record = 10;//每页显示的记录数
				int zgs = 0;
				int zys = 0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage = request.getParameter("page");
				String fysql = "select count(id) as ss from notice";
				ResultSet RS_resultfy = connDbBean.executeQuery(fysql);
				while (RS_resultfy.next()) {
					zgs = Integer.parseInt(RS_resultfy.getString("ss"));
					zys = zgs / page_record + 1;
				}
				if (hsgnpage != null) {
					curpage = Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
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
						+ " * from notice where id not in (select top "
						+ ((curpage - 1) * page_record)
						+ " id from notice order by id desc) ";

				sql = sql + " order by id desc";
				RS_result = connDbBean.executeQuery(sql);

				String id = "";
				String title = "";
				String content = "";

				int i = 0;
				while (RS_result.next()) {
					i = i + 1;
					id = RS_result.getString("id");
					title = RS_result.getString("title");
					content = RS_result.getString("content");
			%>
			<tr>
				<td width="30" align="center"><%=i%></td>
				<td>
					<a href="student/notice_info.jsp?id=<%=id%>&title=<%=title %>&content=<%=content %>"><%=title%></a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
		以上数据共<%=i%>条,
		<a style="cursor: hand" onClick="javascript:window.print();">打印本页</a>
		<p align="center">
			&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record%>条/页
			<a href="notice_list.jsp?page=1">首页</a>
			<a href="notice_list.jsp?page=<%=curpage - 1%>">上一页</a>
			<A href="notice_list.jsp?page=<%=curpage + 1%>">下一页</A>
			<a href="notice_list.jsp?page=<%=zys%>">尾页</A> 当前第
			<FONT color=red><%=curpage%></FONT>页/共
			<FONT color=red><%=zys%></FONT>页
		</p>
	</body>
</html>
