<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<link href="../menucss/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>
<style>
</style>
<script language="javascript">
function addAdvocateDetails()
{
	window.location.href ="<s:url value="AdvocateDetails"/>";
}
function editAdvocateDetails()
{
	window.location.href = "<s:url value="AdvocateDetails"/>";
}
function startUp(){
}
</script>
</head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formHome" id="formHomeId">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="40%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text name="global.menu.advocate.details" /></font></td>
					<td width="40%" bgcolor="#FFFFFF">&nbsp;<font
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
							<font face="Calibri" size="2">&nbsp; <input type="button"
								value="<s:text name="global.btn.add.advocate.details"/>"
								class="bigbtn" onclick="javascript:addAdvocateDetails();"></font>
							<font face="Calibri" size="2">&nbsp;</font>
					</td>
					<td width="50%"><font face="Calibri" size="2"> <select
							size="1" name="D1"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<option><s:text name="global.val.search.by" />...
								</option>
								<option><s:text name="global.lbl.name.of.the.advocate" /></option>
								<option><s:text name="global.lbl.advocate.code" /></option>
								<option><s:text name="global.lbl.contract.date" /></option>
								<option><s:text name="global.lbl.expiry.date" /></option>
								<option><s:text name="global.lbl.mobile.number" /></option>
								<option><s:text name="global.lbl.email" /></option>
								<option><s:text name="global.val.disabled" /></option>
						</select> <input type="text" name="T1" size="30"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<input type="button" value="<s:text name="global.btn.go"/>"
							name="B1" class="smallbtn">&nbsp;
					</font></td>
					<td width="20%" colspan="2">
						<p align="center">
							<font face="Calibri" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1
								- 10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font> <font face="Calibri"
								size="2">&nbsp;</font>
					</td>
					<td width="10%" align="center">&nbsp;<font color="#00CC00"><u><a
								target="_blank" href="SAMPLE_DOWNLOAD_XLS.txt"><font
									color="#00CC00">PDF</font></a></u></font>&nbsp;&nbsp;<font color="#00CC00"><u>CSV</u></font>&nbsp;&nbsp;<font
						color="#00CC00"><u>XLS</u></font></td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="5" width="100%"></td>
				</tr>
				<tr height="300">
					<td valign="top" align="left" width="100%" colspan="5">
						<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0">
							<tr height="25" bgcolor="#FF9966" id="idTRTitlerow"
								valign="middle">
								<td width="15%" align="left"><b><font face="Calibri"
										size="2">&nbsp;&nbsp;<s:text
												name="global.lbl.name.of.the.advocate" /></font></b></td>
								<td width="15%" align="left"><b><font face="Calibri"
										size="2">&nbsp;&nbsp;<s:text
												name="global.lbl.advocate.code" /></font></b></td>
								<td width="10%" align="left"><font face="Calibri" size="2"><b>&nbsp;&nbsp;</b></font><b><font
										face="Calibri" size="2"><s:text
												name="global.lbl.contract.date" /></font></b></td>
								<td width="10%" align="left"><font face="Calibri" size="2"><b>&nbsp;&nbsp;<s:text
												name="global.lbl.expiry.date" />
									</b></font>
								<td width="15%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;<s:text
												name="global.lbl.mobile.number" /></b></font>
								<td width="15%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;<s:text name="global.lbl.email" /></b></font>
								<td width="20%" align="center"><font face="Calibri"
									size="2"><b><s:text name="global.lbl.action" /></b></font></td>
							</tr>

							<tr height="1" bgcolor="#FFFFFF">
							</tr>

						</table>

					</td>
				</tr>
			</table>


		</form>


	</div>
</body>

</html>