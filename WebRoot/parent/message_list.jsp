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
		
		function readreply(reply, replyname)
		{
			alert('回复教师：'+replyname);
			alert('回复内容：'+reply);
		}
	</script>
	
	<%
		String sql;
		ResultSet RS_result;
		String id2 = (String)request.getSession().getAttribute("id");
	%>
	<body>
		<p>
			我的留言：
		</p>

		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td width="30" align="center" bgcolor="CCFFFF">
					序号
				</td>
				<td align="center" bgcolor="CCFFFF">
					留言信息
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
				String fysql = "select count(id) as ss from message where parentid='"+id2+"'";
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
						+ " * from message where parentid='"+id2+"' and id not in (select top "
						+ ((curpage - 1) * page_record)
						+ " id from message order by id desc) ";

				sql = sql + " order by id desc";
				RS_result = connDbBean.executeQuery(sql);

				String id = "";
				String msg = "";
				String reply = "";
				String replyname = "";
				int i = 0;
				while (RS_result.next()) {
					i = i + 1;
					id = RS_result.getString("id");
					msg = RS_result.getString("msg");
					reply = RS_result.getString("reply");
					replyname = RS_result.getString("replyname");
			%>
			<tr>
				<td width="30" align="center"><%=i%></td>
				<td>
					<%=msg%>
				</td>

				<td width="90" align="center">
					<%
						if(reply!=null&&!"".equals(reply)&&reply!="null"){
						%>
						<a href="javascript:readreply('<%=reply %>','<%=replyname %>');">查看回复</a>
						<%
						}else{
						%>
						未回复
						<%
						}
					 %>
					<a href="del.jsp?id=<%=id%>&tablename=message"
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
			<a href="message_list.jsp?page=1">首页</a>
			<a href="message_list.jsp?page=<%=curpage - 1%>">上一页</a>
			<A href="message_list.jsp?page=<%=curpage + 1%>">下一页</A>
			<a href="message_list.jsp?page=<%=zys%>">尾页</A> 当前第
			<FONT color=red><%=curpage%></FONT>页/共
			<FONT color=red><%=zys%></FONT>页
		</p>
	</body>
</html>
