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

		<title>�û���¼</title>
		<style type="text/css">
<!--
a {
	color: #008EE3
}

a:link {
	text-decoration: none;
	color: #008EE3
}

A:visited {
	text-decoration: none;
	color: #666666
}

A:active {
	text-decoration: underline
}

A:hover {
	text-decoration: underline;
	color: #0066CC
}

A.b:link {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,΢���ź�,����";
	color: #FFFFFF;
}

A.b:visited {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,΢���ź�,����";
	color: #FFFFFF;
}

A.b:active {
	text-decoration: underline;
	color: #FF0000;
}

A.b:hover {
	text-decoration: underline;
	color: #ffffff
}

.table1 {
	border: 1px solid #CCCCCC;
}

.font {
	font-size: 12px;
	text-decoration: none;
	color: #999999;
	line-height: 20px;
}

.input {
	font-size: 12px;
	color: #999999;
	text-decoration: none;
	border: 0px none #999999;
}

td {
	font-size: 12px;
	color: #007AB5;
}

form {
	margin: 1px;
	padding: 1px;
}

input {
	border: 0px;
	height: 26px;
	color: #007AB5;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

.unnamed1 {
	border: thin none #FFFFFF;
}

select {
	border: 1px solid #cccccc;
	height: 18px;
	color: #666666;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

body {
	background-repeat: no-repeat;
	background-color: #9CDCF9;
	background-position: 0px 0px;
}

.tablelinenotop {
	border-top: 0px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 0px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
}

.tablelinenotopdown {
	border-top: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
}

.style6 {
	FONT-SIZE: 9pt;
	color: #7b8ac3;
}

.STYLE7 {
	color: #6DCEF5
}
-->
</style>

		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	</head>
	<script language="javascript">
function check()
{
	if(document.form1.username.value=="" || document.form1.pwd.value=="")
	{
		alert('����������');
		return false;
	}
}
</script>
	<body>
		<form method="post" name="form1" action="adminyanzheng.jsp">
			<table width="681" border="0" align="center" cellpadding="0"
				cellspacing="0" style="margin-top: 120px">
				<tr>
					<td width="353" height="259" align="center"
						background="images/login_1.gif">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="227" width="15%">
								</td>
								<td height="227">
									<table width="80%" height="51" border="0" align="center">
										<tr>
											<td align="center">
												<div
													style="font-family: ����; color: #FFFFFF; filter: Glow(Color =     #000000, Strength =     2); WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top: 5pt">
													<div align="center" class="STYLE5 STYLE7">
														��ѧ��ͨ����ϵͳ
													</div>
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<table width="90%" border="0" cellspacing="3" cellpadding="0">
										<tr>
											<td align="right" valign="bottom" style="color: #05B8E4">
												Power by
												<a href="http://www.xxxx.cn" target="_blank">xxxx</a>
												Copyright 2013
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td width="195" background="images/login_2.gif">
						<table width="190" height="106" border="0" align="center"
							cellpadding="2" cellspacing="0">
							<tr>
								<td height="50" colspan="2" align="right">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="60" height="30" align="right">
									�û�����
								</td>
								<td>
									<input name="username" type="TEXT"
										style="background: url(images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; width: 100px; background-color: #FFFFFF"
										id="username">
								</td>
							</tr>
							<tr>
								<td height="30" align="right">
									�� �룺
								</td>
								<td>
									<input name="pwd" TYPE="PASSWORD"
										style="background: url(images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; width: 100px; background-color: #FFFFFF"
										id="pwd">
								</td>
							</tr>
							<tr>
								<td height="30" align="right">
									Ȩ �ޣ�
								</td>
								<td>
									<select name="cx" id="cx">
										<option value="��ʦ">
											��ʦ
										</option>
										<option value="ѧ��">
											ѧ��
										</option>
										<option value="�ҳ�">
											�ҳ�
										</option>
									</select>
								</td>
							</tr>

							<tr>
								<td height="40" colspan="2" align="center">
									<input name="login" type="hidden" id="login" value="1">
									<img src="images/tip.gif" width="16" height="16">
									����Ƿ���½��
								</td>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" name="submit"
										style="background: url(images/login_5.gif) no-repeat"
										value=" ��  ½ " onClick="return check();">
									<input type="reset" name="Submit"
										style="background: url(images/login_5.gif) no-repeat"
										value=" ȡ  �� ">
								</td>
							<tr>
								<td height="5" colspan="2"></td>
						</table>
					</td>
					<td width="133" background="images/login_3.gif">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td height="161" colspan="3" background="images/login_4.gif"></td>
				</tr>
			</table>
		</form>
	</body>
</html>

