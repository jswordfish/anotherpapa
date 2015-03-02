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
}

function savePrd(){
	alert("Product Saved Successfully");
//	window.location.href = 'manageLoanType.htm';
}

function save(){
	alert("Inward Done, Bill Booked Successfully");
//	window.location.href = 'manageLoanType.htm';
}

function cancel(){
//	window.location.href = 'manageLoanType.htm';
}
function PDSProductAdd(){
	window.open("PDSProductAdd.htm","Add Product","height=300,location=no,menubar=no,status=no,titlebar=no,toolbar=no,width=1200");
}
function ShowMember(){
	var val = document.getElementById("idSelectSource").value;
	if (val == "member"){
		document.getElementById("idSelectMember").style.display = "inline";
	}else{
		document.getElementById("idSelectMember").style.display = "none";
	}
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
						color="#CC0000">PDS INWARDS</font></td>
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
									<font face="Calibri" size="2">PDS&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<select size="1" name="D1"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option>Select PDS...</option>
										<option selected>Sharma Depot</option>
										<option>Verma Stockists</option>
								</select>
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Inward From Source&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<select size="1" name="D4" id="idSelectSource"
									onchange="javascript:ShowMember();"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option>Select Source...</option>
										<option value="govt" selected>Governtment</option>
										<option value="member">PACS Members</option>
								</select> <select size="1" name="D7" id="idSelectMember"
									style="display: none; font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option>Member...</option>
								</select>
								</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Bill No.&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<input type="text" tabindex="1" id="idTxtPurposeCode5"
									name="txtPurposeCode5" size="20"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
									value="BIL/14/10/2330">
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Bill Date&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<input type="text" tabindex="1" id="idTxtPurposeCode6"
									name="txtPurposeCode6" size="15"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: left"
									value="12-Oct-14"> <img
									src="../media/icons-small/calendar.gif">
								</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Bill Amount&nbsp; </font>&nbsp;
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<input type="text" tabindex="1" id="idTxtPurposeCode11"
									name="txtPurposeCode11" size="20"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"
									value="7700.00">
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Inward Date&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<input type="text" tabindex="1" id="idTxtPurposeCode7"
									name="txtPurposeCode7" size="15"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: left"
									value="13-Oct-14"> <img
									src="../media/icons-small/calendar.gif"> <input
									type="text" tabindex="1" id="idTxtPurposeCode12"
									name="txtPurposeCode12" size="10"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: left"
									value="15:30">
								</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Bill Party&nbsp; </font>&nbsp;
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<input type="text" tabindex="1" id="idTxtPurposeCode15"
									name="txtPurposeCode15" size="30"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: left"
									value="Central Govt. Warehouse Ltd.">
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
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
									<input type="button" value="Create New Product"
									style="font-family: Calibri; font-size: 10pt; color: #000080"
									onclick="javascript:PDSProductAdd();" name="btnCNPrd">
								</td>
							</tr>
							<tr>
								<td width="100%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="4">
									<table border="0" width="99%" cellspacing="1" cellpadding="0">
										<tr>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2">Product</font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2">Quantity</font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2">Rate</font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24">&nbsp;</td>
										</tr>
										<tr>
											<td bgcolor="#FFFFFF">
												<p align="center">
													<select size="1" name="D5"
														style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
														<option>Select Product...</option>
														<option selected>Wheat</option>
														<option>Rice</option>
														<option>Dal - Latur</option>
													</select>
											</td>
											<td>
												<p align="center">
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
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idTxtPurposeCode14"
														name="txtPurposeCode14" size="10"
														style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"
														value="2.80">
											</td>
											<td><b><font face="Calibri" size="2">&nbsp;&nbsp;
														<u> ADD</u>
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
										face="Calibri" size="2">Product</font></b></td>
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2">Quantity</font></b></td>
								<td width="10%" align="left" bgcolor="#8A8AFF">
									<p align="right">
										<b> <font face="Calibri" size="2">&nbsp;Rate
												(INR)&nbsp; </font></b>
								</td>
								<td width="10%" align="right" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2">&nbsp;Total (INR)</font></b></td>
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2">Action</font></b></td>
							</tr>
							<tr bgcolor="#FFFFEE" height="25">
								<td width="20%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Wheat</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">1000 Kgs.</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="right">
										<font face="Calibri" size="2">&nbsp;1.90</font>
								</td>
								<td width="10%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">&nbsp;1900.00</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><u>EDIT</u>&nbsp;&nbsp; <u>DEL</u></font>
								</td>
							</tr>
							<tr bgcolor="#FFFFFF" height="25">
								<td width="20%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Rice</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">500 Kgs.</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="right">
										<font face="Calibri" size="2">&nbsp;2.00</font>
								</td>
								<td width="10%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">1000.00&nbsp;</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><u>EDIT</u>&nbsp;&nbsp; <u>DEL</u></font>
								</td>
							</tr>
							<tr bgcolor="#FFFFEE" height="25">
								<td width="20%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Dal - Latur</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">2000 Kgs.</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="right">
										<font face="Calibri" size="2">&nbsp;1.90</font>
								</td>
								<td width="10%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">3800.00&nbsp;</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><u>EDIT</u>&nbsp;&nbsp; <u>DEL</u></font>
								</td>
							</tr>
							<tr bgcolor="#FFFFFF" height="25">
								<td width="20%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">Rice - Surat</font>
								</td>
								<td width="10%" align="center"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">500 Kgs.</font>
								</td>
								<td width="10%" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<p align="right">
										<font face="Calibri" size="2">&nbsp;2.00</font>
								</td>
								<td width="10%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2">1000.00&nbsp;</font>
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
											<td width="50%" align="right"
												style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
												<input type="button" value="SAVE &amp; BILL BOOKING"
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