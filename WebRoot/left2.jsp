
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
		<link href="images/css1/left_css.css" rel="stylesheet" type="text/css">

	</head>
	<SCRIPT language=JavaScript>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
	<body bgcolor="16ACFF">
		<table width="98%" border="0" cellpadding="0" cellspacing="0"
			background="images/tablemde.jpg">
			<tr>
				<td height="5" background="images/tableline_top.jpg"
					bgcolor="#16ACFF"></td>
			</tr>
			<tr>
				<td>
					<TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0
						class=leftframetable>
						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(1);
												height=25>
												������Ϣ����
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu1 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="student/student_updt.jsp" target=main>������Ϣ����</A>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_bottom.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_top.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			
			
			<tr>
				<td>
					<TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0
						class=leftframetable>
						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(4);
												height=25>
												������Ϣ�鿴
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu4 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="student/notice_list.jsp" target=main>������Ϣ�鿴</A>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_bottom.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_top.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			
			
			<tr>
				<td>
					<TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0
						class=leftframetable>
						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(5);
												height=25>
												���ñ�����Ϣ�鿴
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu5 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="student/record_list.jsp" target=main>���ñ�����Ϣ�鿴</A>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_bottom.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_top.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			
			
			
			<tr>
				<td>
					<TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0
						class=leftframetable>
						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(6);
												height=25>
												ѧ���ɼ��鿴
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu6 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
									
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="student/score_list.jsp" target=main>ѧ���ɼ��鿴</A>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_bottom.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_top.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			
			
			
			<tr>
				<td>
					<TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0
						class=leftframetable>
						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(7);
												height=25>
												һ��ͨ������Ϣ�鿴
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu7 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="student/card_list.jsp" target=main>һ��ͨ������Ϣ�鿴</A>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_bottom.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_top.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			
			
			
			<tr>
				<td>
					<TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0
						class=leftframetable>
						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(8);
												height=25>
												ͼ��ݽ�����Ϣ�鿴
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu8 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="student/library_list.jsp" target=main>ͼ��ݽ�����Ϣ�鿴</A>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</td>
			</tr>
			<tr>
				<td height="5" background="images/tableline_bottom.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>
			
		</table>
	</body>
</html>

