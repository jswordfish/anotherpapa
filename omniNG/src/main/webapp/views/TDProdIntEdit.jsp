<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

function startUp(){
//	document.getElementById("idTxtLoanTypeCode").focus();
}

function save(){
	alert("Record saved successfully");
	window.location.href = "<s:url value="TDProdIntMgmt"/>";
}

function cancel(){
	window.location.href = "<s:url value="TDProdIntMgmt"/>";
}
</script>
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formHome" id="formHomeId">
			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000">TD INTEREST - ADD</font></td>
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
			<table id="idTBLLimitSanctionAll" width="100%" height="26"
				cellpadding="0" cellspacing="1">
				<tr>
					<td>
						<!-- MAIN TOP BLOCK -->
						<table width="100%" cellspacing="1" cellpadding="0">
							<tr height="35" bgcolor="#0000FF">
								<td width="25%" valign="middle" colspan="4" bgcolor="#0000FF"
									valign="middle" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2" color="#FFFFFF"><b>Talegaon
											Primary Agriculture Society</b></font>
								</td>
							</tr>

							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Product&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri"> &nbsp;</font><select size="1" name="D1"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option>Select Member...</option>
								</select>
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
							</tr>

							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Effective From&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<input type="text" tabindex="1" id="idTxtPurposeCode24"
									name="txtPurposeCode24" size="10"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: left">
									<img border="0" src="../media/icons-small/calendar.gif"
									width="16" height="16">
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Effective Till&nbsp;&nbsp;
								</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<input type="text" tabindex="1" id="idTxtPurposeCode18"
									name="txtPurposeCode18" size="10"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: left">
									<img border="0" src="../media/icons-small/calendar.gif"
									width="16" height="16">
								</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Remarks&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="75%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="3">&nbsp;<input type="text" tabindex="1"
									id="idTxtPurposeCode5" name="txtPurposeCode5" size="70"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" width="100%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="4">
									<table border="0" width="100%" cellspacing="0" cellpadding="0">
										<tr>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2">Months</font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2">Days</font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2">Interest Rate</font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2">Penal Interest Rate</font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24" width="128">&nbsp;</td>
										</tr>
										<tr>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idTxtPurposeCode26"
														name="txtPurposeCode26" size="10"
														style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"
														value="0">
											</td>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idTxtPurposeCode25"
														name="txtPurposeCode25" size="10"
														style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"
														value="7">
											</td>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idTxtPurposeCode13"
														name="txtPurposeCode13" size="10"
														style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"
														value="6.25">
											</td>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idTxtPurposeCode14"
														name="txtPurposeCode14" size="10"
														style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"
														value="1.00">
											</td>
											<td width="128"><b><font face="Calibri" size="2">&nbsp;&nbsp;
														<u> ADD/UPDATE</u>
												</font></b></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" cellspacing="0">
							<tr height="1">
								<td width="25%" align="left"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<!-- LIST -->
						<table width="100%">
							<tr bgcolor="#FF9966" height="25">
								<td width="20%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2">Months</font></b></td>
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2">Days</font></b></td>
								<td width="10%" align="left" bgcolor="#8A8AFF">
									<p align="right">
										<b> <font face="Calibri" size="2">&nbsp;Interest
												Rate&nbsp; </font></b>
								</td>
								<td width="10%" align="right" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2">Penal Interest Rate</font></b></td>
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2">Action</font></b></td>
							</tr>
							<tr bgcolor="#FFFFEE" height="25">
								<td width="20%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">0</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">7</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="right">
										<font face="Calibri" size="2">6.25</font>
								</td>
								<td width="10%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;1.00</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><u>EDIT</u>&nbsp;&nbsp; <u>DEL</u></font>
								</td>
							</tr>
							<tr bgcolor="#FFFFFF" height="25">
								<td width="20%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">0</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">30</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="right">
										<font face="Calibri" size="2">&nbsp;6.75</font>
								</td>
								<td width="10%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">1.00&nbsp;</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><u>EDIT</u>&nbsp;&nbsp; <u>DEL</u></font>
								</td>
							</tr>
							<tr bgcolor="#FFFFEE" height="25">
								<td width="20%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">0</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">45</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="right">
										<font face="Calibri" size="2">&nbsp;7.25</font>
								</td>
								<td width="10%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">1.00&nbsp;</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><u>EDIT</u>&nbsp;&nbsp; <u>DEL</u></font>
								</td>
							</tr>
							<tr bgcolor="#FFFFFF" height="25">
								<td width="60%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="5">
									<table width="100%" cellspacing="0">
										<tr height="25" bgcolor="#9999FF">
											<td width="100%" align="right"
												style="border-top: 1px dotted #C0C0C0; border-bottom: 1px dotted #C0C0C0;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; border-left-width: 1px; border-right-width: 1px"
												colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
										</tr>
										<tr height="25" bgcolor="#9999FF">
											<td width="50%" align="right"
												style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
												<input type="button" value="SAVE / UPDATE"
												style="font-family: Calibri; font-size: 10pt; color: #000080"
												onclick="javascript:save();">
											</td>
											<td width="50%" align="left"
												style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;<input
												type="button" value="CANCEL"
												style="font-family: Calibri; font-size: 10pt; color: #000080"
												onclick="javascript:cancel();">
											</td>
										</tr>
										<tr height="1">
											<td width="25%" align="left" colspan="2"></td>
										</tr>
									</table>
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