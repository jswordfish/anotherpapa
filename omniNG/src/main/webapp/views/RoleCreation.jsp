<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<link href="css/stylesheet.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
</style>
<script language="javascript">
function startUp() {
}

function addUser() {
	window.location.href = "<s:url value="roleAdd"/>";
	return false;
}

</script>
</head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">
		<table border="0" width="1024" align="center" cellspacing="0"
			height="100%">
			<tr bgcolor=#FFFFFF>
				<td colspan="7" align="center" valign="top">
					<form name="formHome" id="formHomeId">
						<table id="idTblTitle" width="100%" height="26" cellpadding="0"
							cellspacing="1">
							<tr height="1" bgcolor="#FFFFFF">
								<td colspan="3" width="100%"></td>
							</tr>
							<tr height="25" bgcolor="#FFFFFF">
								<td colspan="1" width="20%"><font face="Calibri" size="2"
									color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
									color="#CC0000"><s:text name="global.lbl.create.role" /></font></td>
								<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
									face="Wingdings 2" size="2" color="#000000"> </font><font
									face="Calibri" size="2" color="#CC0000">&nbsp;&nbsp;</font></td>
								<td width="20%" bgcolor="#FFFFFF">
									<p align="center">
										<b><font size="2" face="Calibri"><s:text
													name="global.lbl.branch.code" />&nbsp;: 02</font></b>
								</td>
							</tr>
						</table>
						<table id="idTblTxn" width="100%" height="100%" cellpadding="0"
							cellspacing="0">
							<tr height="1" bgcolor="#FFFFFF">
								<td colspan="5" width="100%" bgcolor="#FFFFFF"></td>
							</tr>
							<tr height="25" bgcolor="#FFFFff">
								<td width="20%">
									<p align="left">
										<font face="Calibri" size="2">&nbsp; <input
											type="button" class="bigbtn"
											value="<s:text name="global.btn.add.role"/>"
											onclick="javascript:addUser();"></font> <font face="Calibri"
											size="2">&nbsp;</font>
								</td>
								<td width="50%"><font face="Calibri" size="2"> <select
										size="1" name="D1">
											<option><s:text name="global.val.search.by" />...
											</option>
											<option><s:text name="global.val.role.all" /></option>
											<option><s:text name="global.val.role.code" /></option>										
											<option><s:text name="global.val.role.name" /></option>											
											<option><s:text name="global.val.disabled" /></option>
									</select> <input type="text" name="T1" size="30"> <input
										type="button" class="smallbtn"
										value="<s:text name="global.btn.go"/>" name="B1"
										style="color: #000080; font-family: Calibri; font-size: 10pt">&nbsp;
								</font></td>
								<td width="20%" colspan="2">
									<p align="center">
										<font face="Calibri" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1
											- 10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font> <font face="Calibri"
											size="2">&nbsp;</font>
								</td>
								<td width="10%" align="center"><font face="Calibri"
									size="2" color="#00CC00">&nbsp; <u><a
											target="_blank" href="SAMPLE_DOWNLOAD_XLS.txt"> <font
												face="Calibri" size="2" color="#00CC00">PDF</font></a></u></font>&nbsp;&nbsp;<font
									face="Calibri" size="2" color="#00CC00"><u>CSV</u></font>&nbsp;&nbsp;<font
									face="Calibri" size="2" color="#00CC00"><u>XLS</u></font></td>
							</tr>
							<tr height="1" bgcolor="#FFFFFF">
								<td colspan="5" width="100%"></td>
							</tr>
							<tr>

								<td valign="top" align="left" width="100%" colspan="5">
									<table width="100%" id="idListTbl" cellspacing="1"
										cellpadding="0">
										<tr height="25" bgcolor="#FF9966" id="idTRTitlerow"
											valign="middle">
											<td width="0" align="center"></td>

											<td width="20%" align="center"><b><font
													face="Calibri" size="2">&nbsp;&nbsp;<s:text
															name="global.lbl.role.code" /></font></b></td>
											<td width="60%" align="center"><font face="Calibri"
												size="2"><b>&nbsp;&nbsp;<s:text
															name="global.lbl.role.name" />
												</b></font></td>
											<td width="20%" align="center"><font face="Calibri"
												size="2"><b><s:text name="global.lbl.action" /></b></font></td>
										</tr>

										<s:iterator value="users">
											<tr>
												<td align="center"><s:hidden value="id" /></td>
												<td align="center"><s:property value="roleCode" /></td>
												<td align="center"><s:property value="roleName" /></td>
											
												<td align="center">-</td>
												<td align="center">-</td>
												<td><a href="">EDIT</a>&nbsp;&nbsp;<a href="">DISABLE</a>
												</td>
											</tr>
										</s:iterator>

									</table>

								</td>
							</tr>
						</table>
					</form>
		</table>
	</div>
</body>

</html>