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
		
		function readreply(reply, replyname)
		{
			alert('�ظ���ʦ��'+replyname);
			alert('�ظ����ݣ�'+reply);
		}
	</script>
	
	<%
		String sql;
		ResultSet RS_result;
		String id2 = (String)request.getSession().getAttribute("id");
	%>
	<body>
		<p>
			�ҵ����ԣ�
		</p>

		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td width="30" align="center" bgcolor="CCFFFF">
					���
				</td>
				<td align="center" bgcolor="CCFFFF">
					������Ϣ
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
				String fysql = "select count(id) as ss from message where parentid='"+id2+"'";
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
						<a href="javascript:readreply('<%=reply %>','<%=replyname %>');">�鿴�ظ�</a>
						<%
						}else{
						%>
						δ�ظ�
						<%
						}
					 %>
					<a href="del.jsp?id=<%=id%>&tablename=message"
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
			<a href="message_list.jsp?page=1">��ҳ</a>
			<a href="message_list.jsp?page=<%=curpage - 1%>">��һҳ</a>
			<A href="message_list.jsp?page=<%=curpage + 1%>">��һҳ</A>
			<a href="message_list.jsp?page=<%=zys%>">βҳ</A> ��ǰ��
			<FONT color=red><%=curpage%></FONT>ҳ/��
			<FONT color=red><%=zys%></FONT>ҳ
		</p>
	</body>
</html>
