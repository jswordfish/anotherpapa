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
function addVendor()
{
	window.location.href = "<s:url value="InvtAddVendor"/>";
}
function editVendor()
{
	window.location.href = "<s:url value="InvtAddVendor"/>";
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
					<td width="20%"><font face="Calibri" size="2" color="#CC0000">
							&nbsp;&nbsp;&nbsp;</font><font face="Calibri" color="#CC0000">MANAGE
							VENDORS</font></td>
					<td width="60%" bgcolor="#FFFF99">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#000000">SUCCESS or FAILURE
							message with green or red background</font><font face="Calibri" size="2"
						color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri">&nbsp;Branch Code: 02</font></b>
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
								value="+ ADD VENDOR"
								style="font-family: Calibri; font-size: 10pt; color: #000080"
								onclick="javascript:addVendor();"></font> <font face="Calibri"
								size="2">&nbsp;</font>
					</td>
					<td width="50%"><font face="Calibri" size="2"><select
							size="1" name="D1"
							style="font-family: Calibri; font-size: 10pt; color: #808080; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<option>Search by...</option>
								<option>Vendor Code</option>
								<option selected>Vendor Name</option>
								<option>Address</option>
								<option>Disabled</option>
						</select> <input type="text" name="T1" size="30"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<input type="button" value="Go" name="B1"
							style="color: #000080; font-family: Calibri; font-size: 10pt">&nbsp;</font></td>
					<td width="20%" colspan="2">
						<p align="center">
							<font face="Calibri" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1
								- 10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font> <font face="Calibri"
								size="2">&nbsp;</font>
					</td>
					<td width="10%" align="center"><font face="Calibri" size="2">&nbsp;<font
							color="#00CC00"><u><a target="_blank"
									href="SAMPLE_DOWNLOAD_XLS.txt"><font color="#00CC00">PDF</font></a></u></font>&nbsp;&nbsp;<font
							color="#00CC00"><u>CSV</u></font>&nbsp;&nbsp;<font
							color="#00CC00"><u>XLS</u></font></font></td>
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
										size="2">&nbsp;&nbsp;Vendor Code</font></b></td>
								<td width="18%" align="left"><font face="Calibri" size="2"><b>&nbsp;&nbsp;Vendor
											Name</b></font></td>
								<td width="10%" align="left"><font face="Calibri" size="2"><b>&nbsp;&nbsp;</b></font><b><font
										face="Calibri" size="2">Vendor Type</font></b></td>
								<td width="22%" align="left"><b><font face="Calibri"
										size="2">&nbsp;Vendor Address</font></b></td>
								<td width="12%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;Contact Person</b></font>
								<td width="15%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;Contact Details</b></font></td>
								<td width="10%" align="center"><font face="Calibri"
									size="2"><b>Action</b></font></td>
							</tr>
							<tr height="25" bgcolor="#DEDEDE" id="idTRTitleSearchrow"
								valign="middle">
								<td width="15%" align="left"><font face="Calibri" size="2">&nbsp;<input
										type="text" size="15"
										style="font-family: Calibri; color: #676767; font-size: 10pt; border: 1px solid #808080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
										name="txtT1"></font></td>
								<td width="18%" align="left"><font face="Calibri" size="2">&nbsp;<input
										type="text" size="20"
										style="font-family: Calibri; color: #676767; font-size: 10pt; border: 1px solid #808080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
										name="txtT2"></font></td>
								<td width="10%" align="center"><font face="Calibri"
									size="2"> <input size="10"
										style="font-family: Calibri; color: #676767; font-size: 10pt; border: 1px solid #808080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"
										name="txtT3"></font></td>
								<td width="22%" align="center"><font face="Calibri"
									size="2"> <input size="15"
										style="font-family: Calibri; color: #676767; font-size: 10pt; border: 1px solid #808080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"
										name="txtT4"></font></td>
								<td width="12%" align="center"><font face="Calibri"
									size="2"> <input size="15"
										style="font-family: Calibri; color: #676767; font-size: 10pt; border: 1px solid #808080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"
										name="txtT5"></font></td>
								<td width="15%" align="center"><font face="Calibri"
									size="2"> <input size="15"
										style="font-family: Calibri; color: #676767; font-size: 10pt; border: 1px solid #808080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"
										name="txtT5"></font></td>
								<td width="10%" align="center"><font face="Calibri"
									size="2"> <input type="button" value="SEARCH"
										style="font-family: Calibri; font-size: 10pt; color: #000080"></font>
								</td>
							</tr>
							<tr height="1" bgcolor="#FFFFFF">
								<td></td>
							</tr>
							<tr height="25" bgcolor="#FFFFEE">
								<td width="15%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;VND/014/001</font></td>
								<td width="18%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;Vendor 1</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2">Regular</font></td>
								<td width="22%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="left">
										<font face="Calibri" size="2">&nbsp;E201, DJ Bldg, CB
											Road, Malad West, Mumbai-64</font>
								</td>
								<td width="12%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;Mohan Kumar</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;+91.9820594058</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><a target="_top"
										href="javascript:editVendor();" style="text-decoration: none">EDIT</a>&nbsp;&nbsp;
										<a target="_top" href="addMember.htm"
										style="text-decoration: none">DISABLE</a></font><font size="2">
								</font>
								</td>
							</tr>
							<tr height="25" bgcolor="#FFFFFF">
								<td width="15%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;VND/014/002</font></td>
								<td width="18%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;Vendor 2</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2">Regular</font></td>
								<td width="22%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="left">
										<font face="Calibri" size="2">&nbsp;E201, DJ Bldg, CB
											Road, Malad West, Mumbai-64</font>
								</td>
								<td width="12%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;Mohan Kumar</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;+91.9820594058</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><a target="_top"
										href="javascript:editVendor();" style="text-decoration: none">EDIT</a>&nbsp;&nbsp;
										<a target="_top" href="addMember.htm"
										style="text-decoration: none">DISABLE</a></font><font size="2">
								</font>
								</td>
							</tr>
							<tr height="25" bgcolor="#FFFFEE">
								<td width="15%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;VND/014/003</font></td>
								<td width="18%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;Vendor 3</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2">Regular</font></td>
								<td width="22%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="left">
										<font face="Calibri" size="2">&nbsp;E201, DJ Bldg, CB
											Road, Malad West, Mumbai-64</font>
								</td>
								<td width="12%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;Mohan Kumar</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;+91.9820594058</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><a target="_top"
										href="javascript:editVendor();" style="text-decoration: none">EDIT</a>&nbsp;&nbsp;
										<a target="_top" href="addMember.htm"
										style="text-decoration: none">DISABLE</a></font><font size="2">
								</font>
								</td>
							</tr>
							<tr height="25" bgcolor="#FFFFFF">
								<td width="15%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;VND/014/004</font></td>
								<td width="18%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;Vendor 4</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2">Regular</font></td>
								<td width="22%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="left">
										<font face="Calibri" size="2">&nbsp;E201, DJ Bldg, CB
											Road, Malad West, Mumbai-64</font>
								</td>
								<td width="12%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;Mohan Kumar</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;+91.9820594058</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><a target="_top"
										href="javascript:editVendor();" style="text-decoration: none">EDIT</a>&nbsp;&nbsp;
										<a target="_top" href="addMember.htm"
										style="text-decoration: none">DISABLE</a></font><font size="2">
								</font>
								</td>
							</tr>
							<tr height="25" bgcolor="#FFFFEE">
								<td width="15%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;VND/014/005</font></td>
								<td width="18%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;Vendor 5</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2">Regular</font></td>
								<td width="22%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="left">
										<font face="Calibri" size="2">&nbsp;E201, DJ Bldg, CB
											Road, Malad West, Mumbai-64</font>
								</td>
								<td width="12%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;Mohan Kumar</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;+91.9820594058</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><a target="_top"
										href="javascript:editVendor();" style="text-decoration: none">EDIT</a>&nbsp;&nbsp;
										<a target="_top" href="addMember.htm"
										style="text-decoration: none">DISABLE</a></font><font size="2">
								</font>
								</td>
							</tr>
							<tr height="25" bgcolor="#FFFFFF">
								<td width="15%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;VND/014/006</font></td>
								<td width="18%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;Vendor 6</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2">Regular</font></td>
								<td width="22%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="left">
										<font face="Calibri" size="2">&nbsp;E201, DJ Bldg, CB
											Road, Malad West, Mumbai-64</font>
								</td>
								<td width="12%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;Mohan Kumar</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;+91.9820594058</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><a target="_top"
										href="javascript:editVendor();" style="text-decoration: none">EDIT</a>&nbsp;&nbsp;
										<a target="_top" href="addMember.htm"
										style="text-decoration: none">DISABLE</a></font><font size="2">
								</font>
								</td>
							</tr>
							<tr height="25" bgcolor="#FFFFEE">
								<td width="15%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;VND/014/007</font></td>
								<td width="18%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;Vendor 7</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2">Regular</font></td>
								<td width="22%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="left">
										<font face="Calibri" size="2">&nbsp;E201, DJ Bldg, CB
											Road, Malad West, Mumbai-64</font>
								</td>
								<td width="12%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;Mohan Kumar</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;+91.9820594058</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><a target="_top"
										href="javascript:editVendor();" style="text-decoration: none">EDIT</a>&nbsp;&nbsp;
										<a target="_top" href="addMember.htm"
										style="text-decoration: none">DISABLE</a></font><font size="2">
								</font>
								</td>
							</tr>
							<tr height="25" bgcolor="#FFFFFF">
								<td width="15%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;VND/014/008</font></td>
								<td width="18%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;Vendor 8</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2">Regular</font></td>
								<td width="22%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="left">
										<font face="Calibri" size="2">&nbsp;E201, DJ Bldg, CB
											Road, Malad West, Mumbai-64</font>
								</td>
								<td width="12%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;Mohan Kumar</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
									face="Calibri" size="2">&nbsp;+91.9820594058</font></td>
								<td width="15%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><a target="_top"
										href="javascript:editVendor();" style="text-decoration: none">EDIT</a>&nbsp;&nbsp;
										<a target="_top" href="addMember.htm"
										style="text-decoration: none">DISABLE</a></font><font size="2">
								</font>
								</td>
							</tr>

						</table>

					</td>
				</tr>
			</table>


		</form>

	</div>
</body>

</html>