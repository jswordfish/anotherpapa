<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<link href="css/stylesheet.css" rel="stylesheet" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<style>
</style>
<script language="javascript">
	function startUp() {
		//	document.getElementById("idTxtMeetingDate").focus();
	}

	function save() {
		alert("Approved Successfully");
		//	window.location.href = "<s:url value ="LoanDrawalMgmt.jsp"/>";
	}

	function cancel() {
		//	window.location.href = "<s:url value="LoanDrawalMgmt.jsp"/>";
	}

	function addAssetDet() {
		document.getElementById("idTBLAsset").style.display = "inline";
		document.getElementById("idTBLShare").style.display = "none";
		document.getElementById("idTBLAcMap").style.display = "none";
		document.getElementById("idTBLNominee").style.display = "none";
	}
	function addShareDet() {
		document.getElementById("idTBLAsset").style.display = "none";
		document.getElementById("idTBLShare").style.display = "inline";
		document.getElementById("idTBLAcMap").style.display = "none";
		document.getElementById("idTBLNominee").style.display = "none";
	}
	function addAcMap() {
		document.getElementById("idTBLAsset").style.display = "none";
		document.getElementById("idTBLShare").style.display = "none";
		document.getElementById("idTBLAcMap").style.display = "inline";
		document.getElementById("idTBLNominee").style.display = "none";
	}
	function addNomineeDet() {
		document.getElementById("idTBLAsset").style.display = "none";
		document.getElementById("idTBLShare").style.display = "none";
		document.getElementById("idTBLAcMap").style.display = "none";
		document.getElementById("idTBLNominee").style.display = "inline";
	}
</script>
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">

		<form name="formHome" id="formHomeId">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text name="global.lbl.loan.approval" /></font></td>
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
			<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
				<tr height="35" bgcolor="#0000FF">
					<td width="25%" valign="middle" bgcolor="#0000FF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2" color="#FFFFFF"><b>Talegaon
								Primary Agriculture Society</b></font>
					</td>
				</tr>
			</table>

			<div id="idCropInsurance"
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px;">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<!-- Table for insurance data entry -->
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr height="25">
									<td width="100%" bgcolor="#9999FF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.view.pending.approvals" /></font></b>
									</td>
								</tr>
								<tr>
									<td width="100%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.term.loan.type" />:
									</font><%-- <select size="1" name="D81">
											<option><s:text name="global.val.term.loan.type" />...
											</option>
											</select> --%>
											
								<select name="region" tabindex="14" class="mediumselect">
								<option value="-1"><s:text
									name="***select option***" /></option>
								<option value="Home Loan"><s:text
									name="Home Loan" /></option>
								<option value="Car Loan"><s:text
									name="Car Loan" /></option>
									</select>
											&nbsp; <font face="Calibri" size="2"> <s:text
												name="global.lbl.application.number" />:
									</font>&nbsp;<input type="text" tabindex="4" name="T40">&nbsp;
										<font face="Calibri" size="2"><s:text
												name="global.lbl.drawal.date" />: </font> &nbsp; <sx:datetimepicker
											name="dateOfBirth" displayFormat="dd-MM-yyyy" />&nbsp; <u><b><font
												face="Calibri" size="2"><s:text
														name="global.ref.view" /></font></b></u>
									</td>
								</tr>

								<tr height="25">
									<td align="center" width="100%">&nbsp;</td>
								</tr>
							</table>
					<tr>
						<td colspan="4" width="100%">
							<!-- Table for crop insurance list -->
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr height="20">
									<td width="4%" bgcolor="#9999FF" valign="middle" align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										&nbsp;</td>
									<td width="11%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.application.number" />#
										</font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.customer" />#
										</font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.purpose.code" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<p align="right">
											<b><font face="Calibri" size="2">&nbsp;<s:text
														name="global.lbl.disbursement" />&nbsp;&nbsp;
											</font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<p align="right">
											<b><font face="Calibri" size="2"><s:text
														name="global.lbl.interest.rate" />&nbsp;&nbsp; </font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.loan.account" /> #
										</font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2"><s:text
													name="global.lbl.action" /></font></b>
									</td>
								</tr>
								<tr height="20">
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>

			<table>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>

			<table width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#9999FF">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="<s:text name="global.btn.approve"/>"
						class="button" onclick="javascript:save();"> <input
						type="button" value="<s:text name="global.btn.reject"/> "
						class="button" onclick="javascript:save();">
					</td>
					<td width="50%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						colspan="2">&nbsp;<input type="button"
						value="<s:text name="global.btn.cancel"/>" class="button"
						onclick="javascript:cancel();">&nbsp;
					</td>
				</tr>
			</table>
		</form>

	</div>
	<script src="placeholders.js"></script>
</body>

</html>