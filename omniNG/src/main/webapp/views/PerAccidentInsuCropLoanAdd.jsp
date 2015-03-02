<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
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
	alert("Personal Accident Insurance Details Saved Successfully");
	window.location.href = "<s:url value="PerAccidentInsuCropLoanMgmt"/>";
}

function cancel(){
	window.location.href = "<s:url value="PerAccidentInsuCropLoanMgmt"/>";
}
</script>
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">

		<form name="formHome" id="formHomeId">
			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text
								name="global.lbl.personal.accident.insurance" /></font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri">&nbsp;<s:text
										name="global.lbl.branch.code" />: 02
							</font></b>
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
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.from" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp; <sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.till" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
							</tr>

							<tr>
							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.term.loan.type" /> &nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri"> &nbsp;</font><select size="1" name="D1"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option><s:text name="global.val.term.loan.type" />...
										</option>
								</select>
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.purpose.code" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<select size="1" name="D4"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option><s:text name="global.val.purpose.code" />...
										</option>
								</select>
								</td>
							</tr>

							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.crop.type" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<select size="1" name="D8"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option><s:text name="global.val.select.crop" />...
										</option>
								</select>
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.month" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<select size="1" name="D5"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option><s:text name="global.val.month" />...
										</option>
								</select>
								</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.bank.contribution.amount" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<input type="text" tabindex="1" id="idTxtPurposeCode31"
									name="txtPurposeCode31" size="15"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: left">
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.farmer.contribution.amount" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<input type="text" tabindex="1" id="idTxtPurposeCode33"
									name="txtPurposeCode33" size="15"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: left">
								</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.bank.contribution.ac" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="75%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="3">&nbsp;<select size="1" name="D74"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option><s:text name="global.val.product" />...
										</option>
								</select> <select size="1" name="D75"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option><s:text name="global.val.account" />...
										</option>
								</select> <select size="1" name="D76"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option><s:text name="global.val.sub.account" />...
										</option>
								</select> <input type="text" tabindex="1" id="idTxtMeetingDate18"
									name="txtMeetingDate18" size="30" value=""
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" width="100%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="100%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="4">
									<p align="center">
										<input type="button"
											value="<s:text name="global.btn.save.update"/>"
											class="button" onclick="javascript:save();">&nbsp;&nbsp;
										<input type="button"
											value="<s:text name="global.btn.cancel"/>" class="button"
											onclick="javascript:cancel();">
								</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" width="100%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="4">&nbsp;</td>
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
					</td>
				</tr>
			</table>
		</form>

	</div>
</body>

</html>