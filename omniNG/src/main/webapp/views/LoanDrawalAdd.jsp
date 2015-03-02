<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	function startUp() {
			document.getElementById("idTxtMeetingDate").focus();
	}

	function save() {
		alert("Drawal Details Saved Successfully");
		window.location.href ="<s:url value="LoanDrawalMgmt"/>";
	}

	function cancel() {
		window.location.href = "<s:url value="LoanDrawalMgmt"/>";
	}

	function showTbl() {
		document.getElementById("idCropInsurance").style.display = "block";
	}

	function hideTbl() {
		document.getElementById("idCropInsurance").style.display = "none";
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
						color="#CC0000"><s:text name="global.lbl.add.loan.drawal" /></font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
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
			<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
				<tr height="35" bgcolor="#0000FF">
					<td width="25%" valign="middle" colspan="4" bgcolor="#0000FF"
						valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2" color="#FFFFFF"><b>Talegaon
								Primary Agriculture Society</b></font>
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.customer.code" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D14" class="mediumselect">
							<option><s:text name="global.val.customer" />...
							</option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.customer.name" /> &nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" tabindex="2" name="T1" class="largeTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.purpose.code" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D30" class="mediumselect">
							<option><s:text name="global.val.purpose.code" />...
							</option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.term.loan.type" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="D31" class="mediumselect">
							<option><s:text name="global.val.term.loan.type" />...
							</option>
					</select></td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.memo.number" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D32" class="mediumselect">
							<option><s:text name="global.val.memo.number" />...
							</option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.sanction.number" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="D33" class="mediumselect">
							<option><s:text name="global.lbl.sanction.number" />...
							</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.total.sanctioned.limit" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="4" name="T18"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.limit.utilized" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" tabindex="4" name="T19" size="20"
						class="mediumTxtLeftAlign"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.kcc.member" />#</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D19" class="mediumselect">
							<option><s:text name="global.val.kcc.member" />...
							</option>
					</select> <input type="text" tabindex="4" name="T14" size="20"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text name="global.lbl.crop.type" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="D18" class="mediumselect">
							<option><s:text name="global.val.crop.type" />...
							</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.cash.transfer" />(C) /(T)
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="4" name="T20" size="15"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.application.date" /></font>
					</td>
					<td bgcolor="#FFFFFF" width="25%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp; <sx:datetimepicker name="dateOfBirth"
							displayFormat="dd-MM-yyyy" />
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.credit.account.id" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="D74"
						class="mediumselect">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="D75" class="mediumselect">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="D76" class="mediumselect">
							<option><s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate18"
						name="txtMeetingDate18" size="30" class="mediumTxtLeftAlign"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.cash.transfer" /> (C) / (T)
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="4" name="T22" size="15"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.application.date" /></font>

					</td>
					<td bgcolor="#FFFFFF" width="25%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp; <sx:datetimepicker name="dateOfBirth"
							displayFormat="dd-MM-yyyy" />
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.loan.amount" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="4" name="T28" size="15"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.no.of.installment" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T29" size="10" class="smallTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.loan.amount.id" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="D77"
						class="mediumselect">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="D78" class="mediumselect">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="D79" class="mediumselect">
							<option><s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate19"
						name="txtMeetingDate19" size="30" value=""
						class="mediumTxtLeftAlign"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.interest.rate" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="4" name="T30" size="15"
						class="smallTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.interest.frequency" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="D80" class="mediumselect">
							<option><s:text name="global.val.interest.frequency" />...
							</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.installment.start.date" />
					</font>
					</td>
					<td bgcolor="#FFFFFF" width="25%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp; <sx:datetimepicker name="dateOfBirth"
							displayFormat="dd-MM-yyyy" />
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.due.date" /></font>
					</td>
					<td bgcolor="#FFFFFF" width="25%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp; <sx:datetimepicker name="dateOfBirth"
							displayFormat="dd-MM-yyyy" />
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.gestation.period" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="4" name="T34" size="15"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.installment.amount" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T35" size="15" class="mediumTxtLeftAlign"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.os.balance" /> /
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="4" name="T38" size="15"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.customer.share.balance" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T39" size="15" class="mediumTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.current.share.amount.applicable" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="4" name="T36" size="15"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.apply.crop.insurance" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri"> <input type="radio" class="radiobutton"
							value="V1" name="R1" onchange="javascript:showTbl();"><font
							size="2"> <s:text name="global.lbl.yes" />
						</font> <input type="radio" class="radiobutton" value="V2" name="R1"
							onchange="javascript:hideTbl();" checked><font size="2"><s:text
									name="global.lbl.no" /></font></font></td>
				</tr>
			</table>
			<table>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>

			<div id="idCropInsurance"
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; display: none">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<!-- Table for insurance data entry -->
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr height="25">
									<td colspan="4" width="100%" bgcolor="#9999FF" valign="middle"
										align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.add.edit.crop.insurance" /></font></b>
									</td>
								</tr>
								<tr>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.farmer.type" /></font>
									</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
										size="1" name="D81"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.farmer.type" />...
											</option>
									</select></td>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.no.of.farmers" /></font>
									</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
										type="text" tabindex="4" name="T40" size="10"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
								</tr>
								<tr>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.notification.area" /></font>
									</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
										size="1" name="D82"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.notification.area" />...
											</option>
									</select></td>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.gram.panchayat" /></font>
									</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
										size="1" name="D83"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.gram.panchayat" />...
											</option>
									</select></td>
								</tr>
								<tr>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.area" /></font>
									</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
										type="text" tabindex="4" name="T41" size="15"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.sum.assurance" /></font>
									</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
										type="text" tabindex="4" name="T42" size="15"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
								</tr>
								<tr>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.premium.amount" /></font>
									</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
										type="text" tabindex="4" name="T43" size="15"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.subsidy.amount" /></font>
									</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
										type="text" tabindex="4" name="T44" size="15"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
								</tr>
								<tr>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.net.premium.amount" /></font>
									</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
										type="text" tabindex="4" name="T45" size="15"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
									<td width="25%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
									<td width="25%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
								</tr>

								<tr height="25">
									<td align="center" width="100%" colspan="4"><u> <b><font
												face="Calibri" size="2">&nbsp;<s:text
														name="global.lbl.add.update" /> /
											</font></b></u></td>
								</tr>
							</table>
					<tr>
						<td colspan="4" width="100%">
							<!-- Table for crop insurance list -->
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr height="20">
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.farmer.type" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.no.of.farmers" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.notified.area" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.gram.panchayat" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.area" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.sum.assured" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.premium" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.subsidy" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.net.premium" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.action" /></font></b>
									</td>
								</tr>
								<tr height="20" bgcolor="FFFFFF">
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
						<input type="button" value="  <s:text name="global.btn.save"/>"
						class="button"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:save();">
					</td>
					<td width="50%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						colspan="2">&nbsp;<input type="button"
						value="<s:text name="global.btn.cancel"/>" class="button"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:cancel();">&nbsp;
					</td>
				</tr>
			</table>
		</form>

	</div>
</body>

</html>