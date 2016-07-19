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
	<%
		String sql;
		ResultSet RS_result;
	%>
	<body>
		<p>
			已有家长信息列表：
		</p>
		
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td width="30" align="center" bgcolor="CCFFFF">
					序号
				</td>
				<td align="center" bgcolor="CCFFFF">
					姓名
				</td>
				<td bgcolor='#CCFFFF'>
					年龄
				</td>
				<td bgcolor='#CCFFFF'>
					性别
				</td>
				<td bgcolor='#CCFFFF'>
					地址
				</td>
				<td bgcolor='#CCFFFF'>
					联系电话
				</td>
				<td bgcolor='#CCFFFF'>
					子女关系
				</td>
				<td bgcolor='#CCFFFF'>
					用户名
				</td>
				<td bgcolor='#CCFFFF'>
					密码
				</td>
				<td width="60" align="center" bgcolor="CCFFFF">
					操作
				</td>
			</tr>
			<%
				int curpage = 1;//当前页
				int page_record = 10;//每页显示的记录数
				int zgs = 0;
				int zys = 0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage = request.getParameter("page");
				String fysql = "select count(id) as ss from parent";
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
						+ " * from parent where id not in (select top "
						+ ((curpage - 1) * page_record)
						+ " id from parent order by id desc) ";

				sql = sql + " order by id desc";
				RS_result = connDbBean.executeQuery(sql);
				
				String id = "";
				String name = "";
				String age = "";
				String sex = "";
				String address = "";
				String tel = "";
				String childname = "";
				String username = "";
				String password = "";
				
				int i = 0;
				while (RS_result.next()) {
					i = i + 1;
					id = RS_result.getString("id");
					name = RS_result.getString("name");
					age = RS_result.getString("age");
					sex = RS_result.getString("sex");
					address = RS_result.getString("address");
					tel = RS_result.getString("tel");
					childname = RS_result.getString("childname");
					username = RS_result.getString("username");
					password = RS_result.getString("password");
			%>
			<tr>
				<td width="30" align="center"><%=i%></td>
				<td><%=name%></td>
				<td><%=age%></td>
				<td><%=sex%></td>
				<td><%=address%></td>
				<td><%=tel%></td>
				<td><%=childname%></td>
				<td><%=username%></td>
				<td><%=password%></td>
				
				<td width="90" align="center">
					<a href="teacher/parent_updt.jsp?id=<%=id%>">修改</a>
					<a href="del.jsp?id=<%=id%>&tablename=parent"
						onClick="return confirm('真的要删除？')">删除</a>
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
			<a href="parent_list.jsp?page=1">首页</a>
			<a href="parent_list.jsp?page=<%=curpage - 1%>">上一页</a>
			<A href="parent_list.jsp?page=<%=curpage + 1%>">下一页</A>
			<a href="parent_list.jsp?page=<%=zys%>">尾页</A> 当前第
			<FONT color=red><%=curpage%></FONT>页/共
			<FONT color=red><%=zys%></FONT>页
		</p>
	</body>
</html>
