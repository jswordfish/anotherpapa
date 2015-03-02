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

function startUp(){
//	document.getElementById("idTxtLoanTypeCode").focus();
}

function save(){
	alert("Product Saved Successfully");
	window.close();
//	window.location.href = 'manageLoanType.htm';
}

function cancel(){
	window.close();
//	window.location.href = 'manageLoanType.htm';
}
</script>
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">
		<table border="0" width="1024" align="center" cellspacing="0"
			height="100%">
			<tr height="400" bgcolor=#FFFFFF>
				<td align="center" valign="top">

					<form name="formHome" id="formHomeId">
						<table id="idTblTitle" width="100%" height="26" cellpadding="0"
							cellspacing="1">
							<tr height="25" bgcolor="#FFFFFF">
								<td colspan="1" width="20%"><font face="Calibri" size="2"
									color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
									color="#CC0000">PDS ADD PRODUCT</font></td>
								<td width="60%" bgcolor="#FFFF99">&nbsp;<font
									face="Wingdings 2" size="2" color="#000000"> </font><font
									face="Calibri" size="2" color="#000000">SUCCESS or
										FAILURE message with green or red background</font><font
									face="Calibri" size="2" color="#CC0000">&nbsp;&nbsp;</font></td>
								<td width="20%" bgcolor="#FFFFFF">
									<p align="center">
										<b><font size="2" face="Calibri">&nbsp;Branch Code:
												02</font></b>
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
												<font face="Calibri" size="2">Product Code&nbsp;</font>
											</td>
											<td bgcolor="#FFFFFF" width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<input type="text" tabindex="1" id="idTxtPurposeCode11"
												name="txtPurposeCode11" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
												value="PRD001">
											</td>
											<td bgcolor="#CCCCFF" width="25%" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">Product Name&nbsp;</font>
											</td>
											<td bgcolor="#FFFFFF" width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<input type="text" tabindex="1" id="idTxtPurposeCode12"
												name="txtPurposeCode12" size="25"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
												value="Wheat">
											</td>
										</tr>
										<tr>
											<td bgcolor="#CCCCFF" width="25%" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">Product Type&nbsp;</font>
											</td>
											<td bgcolor="#FFFFFF" width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<select size="1" name="D4"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
													<option>Select Product Type...</option>
											</select>
											</td>
											<td bgcolor="#CCCCFF" width="25%" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">Rate&nbsp;</font>
											</td>
											<td bgcolor="#FFFFFF" width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<input type="text" tabindex="1" id="idTxtPurposeCode14"
												name="txtPurposeCode14" size="10"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"
												value="2.80">
											</td>
										</tr>
										<tr>
											<td bgcolor="#CCCCFF" width="25%" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">Procured from
													Source&nbsp;</font>
											</td>
											<td bgcolor="#FFFFFF" width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<select size="1" name="D5"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
													<option>Select Source...</option>
													<option>Governtment</option>
													<option>PACS Members</option>
											</select>
											</td>
											<td bgcolor="#CCCCFF" width="25%" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">Quantity&nbsp;</font>
											</td>
											<td bgcolor="#FFFFFF" width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<input type="text" tabindex="1" id="idTxtPurposeCode13"
												name="txtPurposeCode13" size="10"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"
												value="1000.00"> <select size="1" name="D6"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
													<option>Select UOM...</option>
													<option selected>Kgs</option>
													<option>Grams</option>
													<option>Ton</option>
													<option>Quintal</option>
											</select>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%" cellspacing="0">
										<tr height="25" bgcolor="#9999FF">
											<td width="50%" align="right"
												style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
												<input type="button" value="SAVE/UPDATE"
												style="font-family: Calibri; font-size: 10pt; color: #000080"
												onclick="javascript:save();">
											</td>
											<td width="50%" align="left"
												style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
												<input type="button" value="CANCEL"
												style="font-family: Calibri; font-size: 10pt; color: #000080"
												onclick="javascript:cancel();">
											</td>
										</tr>
										<tr height="1">
											<td width="25%" align="left" colspan="4"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<!-- LIST -->
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>

</html>