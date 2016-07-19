
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
		<script type="text/javascript" src="js/popup.js"></script>
		<script type="text/javascript">
	   
	</script>
	</head>

	<script language="javascript">
		function check()
		{
			if(document.form1.reply.value==""){
				alert("请输入回复内容");
				document.form1.reply.focus();
				return false;
			}
		}
	</script>
	
	<%
		String id2 = (String)request.getSession().getAttribute("id");
		String name = (String)request.getSession().getAttribute("name");
		String parentname = new String(request.getParameter("parentname").getBytes("8859_1"));
		String msg = new String(request.getParameter("msg").getBytes("8859_1"));
		String id = request.getParameter("id");
	%>
	
	<body>
		<form name="form1" id="form1" method="post"
			action="teacher/message_reply_post.jsp?id=<%=id%>">
			回复留言:
			<br>
			<br>
			<table width="100%" border="1" align="center" cellpadding="3"
				cellspacing="1" bordercolor="#00FFFF"
				style="border-collapse: collapse">
				<tr>
					<td align="right" width="20%">
						留言家长：
					</td>
					<td>
						<%=parentname %>
					</td>
				</tr>
				<tr>
					<td align="right">
						留言内容：
					</td>
					<td>
						<%=msg %>
					</td>
				</tr>
				<tr>
					<td align="right">
						回复人：
					</td>
					<td>
						<%=name %>
						<input type="hidden" name="replyid" id="replyid" value="<%=id2 %>">
						<input type="hidden" name="replyname" id="replyname" value="<%=name %>">
					</td>
				</tr>
				<tr>
					<td align="right">
						回复内容：
					</td>
					<td>
						<textarea rows="10" cols="50" id="reply" name="reply"></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						<input type="submit" name="Submit" value="提交" onclick="return check();" />
						<input type="reset" name="Submit2" value="重置" />
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>

