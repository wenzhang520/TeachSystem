<%@ page language="java" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">

		<title>�û���¼</title>
		<link href="images/css1/css.css" rel="stylesheet" type="text/css">

	</head>
	<SCRIPT language=javascript>
<!--
var displayBar=true;
function switchBar(obj){
	if (displayBar)
	{
		parent.frame.cols="0,*";
		displayBar=false;
		obj.value="����߹���˵�";
	}
	else{
		parent.frame.cols="195,*";
		displayBar=true;
		obj.value="�ر���߹���˵�";
	}
}

function fullmenu(url){
	if (url==null) {url = "admin_left.asp";}
	parent.leftFrame.location = url;
}

//-->
</SCRIPT>
	<body>
		<table width="99%" height="166" border="0" align="center"
			cellpadding="2" cellspacing="1" class="table">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						��ӭ�����ѧ��ͨ����ϵͳ ��̨����ϵͳ
					</th>
				</tr>
				<tr>
					<td colspan="2" class="td_bg">
						XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
					</td>
				</tr>
			</tbody>
		</table>
		<table width="99%" height="251" border="0" align="center"
			cellpadding="2" cellspacing="1" class="table">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						��ӭ�����ѧ��ͨ����ϵͳ ��̨����ϵͳ
					</th>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						����������
					</td>
					<td width="83%" class="td_bg">
						<strong>XXX</strong>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						��ϵ��ʽ
						<span class="TableRow2"></span>
					</td>
					<td class="td_bg">
						E-mail��blizzard12@163.com QQ��15645167
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						����ʱ��
						<span class="TableRow2"></span>
					</td>
					<td class="td_bg" width="83%">
						<%
							java.util.Date date = new java.util.Date();

							java.text.SimpleDateFormat format = new java.text.SimpleDateFormat(
									"yyyy-MM-dd", java.util.Locale.CHINA);

							//HH 24-hours, hh 12-hours
							String result = format.format(date);
							out.print(result);
						%>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						ָ����ʦ
					</td>
					<td class="td_bg">
						������
					</td>
				</tr>
				<tr>
					<td height="23" colspan="2" class="td_bg">
						&nbsp;
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>

