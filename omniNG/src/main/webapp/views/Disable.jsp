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
	function startUp() {
		document.getElementById("idTxtMeetingDate").focus();
	}

	function save() {
		alert("Record saved successfully");
		window.location.href = "<s:url value="MemberAccountMgmt"/>";
	}

	function cancel() {
		window.location.href = "<s:url value="MemberAccountMgmt"/>";
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
	function addNominee() {
		document.getElementById("idTBLAsset").style.display = "none";
		document.getElementById("idTBLShare").style.display = "none";
		document.getElementById("idTBLAcMap").style.display = "none";
		document.getElementById("idTBLNominee").style.display = "inline";
	}
</script>
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
						color="#CC0000"><s:text name="global.lbl.add.member" /></font></td>
					<td width="60%" bgcolor="#FFFF99">&nbsp;<font
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
								name="global.lbl.meeting.date" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="1" id="idTxtMeetingDate"
						name="txtMeetingDate" size="15" value="12-Jul-2014"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;<img
						src="../media/icons-small/calendar.gif">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.customer.number" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" tabindex="2" name="T1" size="15"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.resolution.number" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="3" name="T1" size="15"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.resolution.details" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" tabindex="4" name="T1" size="30"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.farmer.name" />F/M/L&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="25" tabindex="5"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="T1" size="25" tabindex="6"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" tabindex="4" name="T1" size="30"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.father.spouse.name" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;&nbsp;
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" tabindex="4" name="T1" size="30"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.farmer.alias" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="35"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.farmer.category" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="D1"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option selected><s:text
									name="global.val.select.category" />...
							</option>
							<option>01 -
								<s:text name="global.val.small.farmer" /></option>
							<option>02 -
								<s:text name="global.val.big.farmer" /></option>
					</select>&nbsp;<input type="text" name="T1" size="15"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.gender" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D1"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option selected><s:text name="global.val.select.gender" />...
							</option>
							<option>M -
								<s:text name="global.lbl.male" /></option>
							<option>F -
								<s:text name="global.lbl.female" /></option>
							<option>O -
								<s:text name="global.lbl.others" /></option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.date.of.birth" />&nbsp;
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" tabindex="4" name="T1" size="15"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;<img
						src="../media/icons-small/calendar.gif">&nbsp;
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.caste" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D1"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option selected><s:text name="global.val.select.caste" />...
							</option>
							<option>01 -
								<s:text name="global.val.brahmin" /></option>
							<option>02 -
								<s:text name="global.val.lingayat" /></option>
							<option>03 -
								<s:text name="global.val.maratha" /></option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.occupation" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T1" size="15"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.address" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.city" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<img src="../media/icons-small/search.jpg">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2">&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.pincode" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T1" size="15"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2">&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.village.code" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;<img
						src="../media/icons-small/search.jpg">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.ration.card.no" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.election.card.no" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.PAN.no" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.phone.no" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.savings.account.no" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="20"
						value="Select Account Type..."
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;<img
						src="../media/icons-small/search.jpg">
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" value="Select Account Holder..." name="T1" size="20"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;<img
						src="../media/icons-small/search.jpg">

					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.KCC.details" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<input type="radio" name="YN">&nbsp;<s:text
								name="global.lbl.yes" />&nbsp;<input type="radio" name="YN">&nbsp;<s:text
								name="global.lbl.no" />
					</font></td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.KCC.card.no" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T1" size="25"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.no.of.family.members" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="5"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.no.of.dependents" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="T1" size="5"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.member.since" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="15"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;<img
						src="../media/icons-small/calendar.gif">
					</td>
					<td width="20%" bgcolor="#CCCCFF" rowspan="3" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.remarks" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" rowspan="3"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<textarea
							rows="5" cols="25"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></textarea>
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.bond.number" /> (<s:text
								name="global.lbl.if.any" />)&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="5"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.bond.date" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T1" size="15"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;<img
						src="../media/icons-small/calendar.gif">
					</td>
				</tr>
				<tr height="40" bgcolor="#FFFFFF">
					<td width="20%" colspan="5" bgcolor="#FFFFFF" valign="middle"
						align="center"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="button"
						value="<s:text name="global.btn.asset.details"/>"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:addAssetDet();"> &nbsp;<input
						type="button" value="<s:text name="global.btn.share.details"/>"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:addShareDet();"> &nbsp;<input
						type="button" value="<s:text name="global.btn.ac.mapping"/>"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:addAcMap();"> &nbsp;<input
						type="button" value="<s:text name="global.btn.nominee.details"/>"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:addNominee();">
					</td>
				</tr>
				<tr id="idTROtherDet">
					<td width="25%" colspan="4"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #FFFFFF">
						<table id="idTBLAsset" width="100%" cellspacing="0"
							cellpadding="0" style="display: none">
							<tr>
								<td width="100%" id="idTDAssetMain" bgcolor="#C0C0C0">
									<table id="idTBLAssetMain" width="100%" cellspacing="0"
										cellpadding="0">
										<tr height="25">
											<td width="100%" colspan="4" bgcolor="#7777FF"
												valign="middle" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><b><s:text
															name="global.lbl.add.asset.details" /></b></font>
											</td>
										</tr>
										<tr>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.sr" /> #&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.registration" /> #&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
										</tr>
										<tr>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.plot" /> #&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.post" /> #&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
										</tr>
										<tr>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.village" />&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.taluka" />&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
										</tr>
										<tr>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.district" />&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.city" />&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
										</tr>
										<tr>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.state" />&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.country" />&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
										</tr>
										<tr>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.area" /> (<s:text
														name="global.lbl.unit1" />)&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
												<select size="1" name="D2"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
													<option><s:text name="global.val.select.units" />...
													</option>
													<option><s:text name="global.val.acre" /></option>
													<option><s:text name="global.val.hectare" /></option>
													<option><s:text name="global.val.gunthe" /></option>
													<option><s:text name="global.val.sqr.mtr" /></option>
													<option><s:text name="global.val.sqr.ft" /></option>
											</select>
											</td>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.area" />(<s:text name="global.lbl.unit2" />)&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
												<select size="1" name="D3"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
													<option><s:text name="global.val.select.units" />...
													</option>
													<option><s:text name="global.val.acre" /></option>
													<option><s:text name="global.val.hectare" /></option>
													<option><s:text name="global.val.gunthe" /></option>
													<option><s:text name="global.val.sqr.mtr" /></option>
													<option><s:text name="global.val.sqr.ft" /></option>
											</select>
											</td>
										</tr>
										<tr>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.rate" /> (<s:text name="global.lbl.INR" />)&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right">
											</td>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.approx.value" /> (<s:text
														name="global.lbl.INR" />)&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
										</tr>
										<tr>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.o/s.loan" /> (<s:text
														name="global.lbl.if.any" />)&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"> <input type="radio"
													name="YN" value="V1" checked>
												<s:text name="global.lbl.yes" />
											</font> <input type="radio" name="YN" value="V2"><font
												size="2"><s:text name="global.lbl.no" /> </font>
											</td>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.o/s.loan.amount" /> (<s:text
														name="global.lbl.INR" />)&nbsp;</font>
											</td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<input type="text" name="T1" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right">
											</td>
										</tr>
										<tr>
											<td width="20%" bgcolor="#CCCCFF" valign="middle"
												align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><s:text
														name="global.lbl.remarks" />&nbsp;</font>
											</td>
											<td width="80%" bgcolor="#FFFFFF" valign="middle"
												align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
												colspan="3">&nbsp; <input type="text" name="T1"
												size="80"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
											</td>
										</tr>
										<tr height="25">
											<td width="100%" colspan="4" bgcolor="#7777FF"
												valign="middle" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
												<font face="Calibri" size="2"><b><u><s:text
																name="global.lbl.update" /></u></b></font>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="100%" id="idTDAssetList">
									<table width="100%" cellspacing="0" cellpadding="0">
										<tr bgcolor="#FF9966" height="25">
											<td width="5%" align="center"><font face="Calibri"
												size="2"><b><s:text name="global.lbl.sr" />#</b></font></td>
											<td width="10%" align="center"><font face="Calibri"
												size="2"><b><s:text
															name="global.lbl.registration" /> #</b></font></td>
											<td width="10%" align="center"><font face="Calibri"
												size="2"><b><s:text name="global.lbl.plot" /> #</b></font></td>
											<td width="10%" align="center"><font face="Calibri"
												size="2"><b><s:text name="global.lbl.post" />#</b></font></td>
											<td width="25%" align="center"><font face="Calibri"
												size="2"><b><s:text name="global.lbl.address" /></b></font></td>
											<td width="10%" align="center"><font face="Calibri"
												size="2"><b><s:text name="global.lbl.area" /></b></font></td>
											<td width="10%" align="center">
												<p align="right">
													<font face="Calibri" size="2"><b><s:text
																name="global.lbl.rate" />(<s:text name="global.lbl.INR" />)
													</b></font>
											</td>
											<td width="10%" align="center">
												<p align="right">
													<font face="Calibri" size="2"><b><s:text
																name="global.lbl.value" />(<s:text
																name="global.lbl.INR" />) </b></font>
											</td>
											<td width="10%" align="center"><font face="Calibri"
												size="2"><b><s:text name="global.lbl.action" /></b></font></td>
										</tr>
										<tr bgcolor="#FFFFEE" height="25">
											<td width="5%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">1</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">REG12343</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">PL/4302</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">PO2343</font>
											</td>
											<td width="25%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="left">
													<font face="Calibri" size="2">&nbsp;Wagoli, Pune,
														Pune, Maharashtra</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">25 Acre</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="right">
													<font face="Calibri" size="2"> 3000.00 </font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="right">
													<font face="Calibri" size="2"> 75000.00 </font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2"><u><s:text
															name="global.ref.edit" /></u>&nbsp;&nbsp; <u><s:text
															name="global.ref.del" /></u></font>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF" height="25">
											<td width="5%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">2</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">REG12343</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">PL/4302</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">PO2343</font>
											</td>
											<td width="25%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="left">
													<font face="Calibri" size="2">&nbsp;Wagoli, Pune,
														Pune, Maharashtra</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">25 Acre</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="right">
													<font face="Calibri" size="2"> 3000.00 </font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="right">
													<font face="Calibri" size="2"> 75000.00 </font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2"><u><s:text
															name="global.ref.edit" /></u>&nbsp;&nbsp; <u><s:text
															name="global.ref.del" /></u></font>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF" height="25">
											<td width="5%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2">&nbsp;</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												&nbsp;</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												&nbsp;</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												&nbsp;</td>
											<td width="25%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												&nbsp;</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												&nbsp;</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												&nbsp;</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												&nbsp;</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>

						<table id="idTBLShare" width="100%" cellspacing="0"
							cellpadding="0" style="display: none">
							<tr>
								<td width="100%">
									<table width="100%" cellspacing="0" cellpadding="0">
										<tr height="25" bgcolor="7777FF">
											<td ALIGN="center" colspan="7" width="100%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b><font
													size="2" face="Calibri"><s:text
															name="global.lbl.share.capital" /></font></b></td>
										</tr>
										<tr bgcolor="#FFFFFF" height="25">
											<td width="15%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b><font
													size="2" face="Calibri"><s:text
															name="global.lbl.date" />&nbsp;</font></b></td>
											<td width="15%" align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T2" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
											<td width="15%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b><font
													size="2" face="Calibri"><s:text
															name="global.lbl.share" /> %&nbsp;</font></b></td>
											<td width="15%" align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T3" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
											<td width="15%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
												size="2" face="Calibri"><b><s:text
															name="global.lbl.share.amount" /> (<s:text
															name="global.lbl.INR" />)&nbsp;</b></font></td>
											<td width="15%" align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T4" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
											<td width="10%" bgcolor="#CCCCFF" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b><u><font
														size="2" face="Calibri"><s:text
																name="global.lbl.update" /></font></u></b></td>
										</tr>
										<tr height="25">
											<td width="100%" colspan="7">
												<table width="100%" cellspacing="1" cellpadding="0">
													<tr bgcolor="#FF9966" height="25">
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
															face="Calibri" size="2"><b><s:text
																		name="global.lbl.date" /></b></font></td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
															face="Calibri" size="2"><b><s:text
																		name="global.lbl.share" /> %</b></font></td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
															<p align="right">
																<font face="Calibri" size="2"><b><s:text
																			name="global.lbl.share.amount" /></b></font>
														</td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
															<p align="right">
																<font face="Calibri" size="2"><b><s:text
																			name="global.lbl.o/s.loan.amount" /></b></font>
														</td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
															face="Calibri" size="2"><b><s:text
																		name="global.lbl.o/s.loan.type" /></b></font></td>
														<td width="30%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
															<p align="left">
																<font face="Calibri" size="2"><b>&nbsp; <s:text
																			name="global.lbl.remarks" /></b></font>
														</td>
														<td width="20%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
															face="Calibri" size="2"><b><s:text
																		name="global.lbl.action" /></b></font></td>
													</tr>
													<tr bgcolor="#FFFFEE" height="25">
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
															face="Calibri" size="2">12-Dec-13</font></td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
															face="Calibri" size="2">10%</font></td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
															<p align="right">
																<font face="Calibri" size="2">2000.00</font>
														</td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
															<p align="right">
																<font face="Calibri" size="2">22000.00</font>
														</td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
															face="Calibri" size="2"> Tractor Loan</font></td>
														<td width="30%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
															<p align="left">
																<font face="Calibri" size="2">&nbsp;Will be
																	repaid in next 2 months</font>
														</td>
														<td width="20%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
															face="Calibri" size="2"><s:text
																	name="global.ref.edit" /> <s:text name="global.ref.del" /></font></td>
													</tr>
													<tr bgcolor="#FFFFFF" height="25">
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
														<td width="10%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
														<td width="30%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
														<td width="20%" align="center"
															style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>

						<table id="idTBLAcMap" width="100%" cellspacing="0"
							cellpadding="0" style="display: none">
							<tr>
								<td>
									<table id="idTBLAcMapDet" width="100%" cellspacing="0"
										cellpadding="0">
										<tr height="25" bgcolor="#7777FF">
											<td width="25%" colspan="4" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2"><b><s:text
															name="global.lbl.add.account.details" /></b></font>
											</td>
										</tr>
										<tr height="25">
											<td width="25%" align="right" bgcolor="#CCCCFF"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b><font
													face="Calibri" size="2"><s:text
															name="global.lbl.account.type" />&nbsp;</font></b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
												size="1" name="D4"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
													<option><s:text
															name="global.val.select.account.type" />...
													</option>
													<option><s:text name="global.val.savings.bank.ac" /></option>
													<option><s:text name="global.val.current.account" /></option>
													<option><s:text
															name="global.val.recurring.account" /></option>
													<option><s:text name="global.val.fixed.deposit" /></option>
											</select></td>
											<td width="25%" align="right" bgcolor="#CCCCFF"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b><font
													face="Calibri" size="2"><s:text
															name="global.lbl.account" />#&nbsp;</font></b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T5" size="30"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
										</tr>
										<tr height="25">
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b><font
													face="Calibri" size="2"><s:text
															name="global.lbl.account.name" />&nbsp;</font></b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T6" size="30"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b><font
													face="Calibri" size="2"><s:text
															name="global.lbl.remarks" />&nbsp;</font></b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T7" size="30"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
										</tr>
										<tr height="25" bgcolor="#7777FF">
											<td width="25%" colspan="4" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2"><b><u><s:text
																name="global.lbl.update" /></u></b></font>
											</td>
										</tr>
										<tr height="25">
											<td width="25%"><font face="Calibri" size="2">&nbsp;</font></td>
											<td width="25%"><font face="Calibri" size="2">&nbsp;</font></td>
											<td width="25%"><font face="Calibri" size="2">&nbsp;</font></td>
											<td width="25%"><font face="Calibri" size="2">&nbsp;</font></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table id="idTBLNominee" width="100%" cellspacing="0"
							cellpadding="0" style="display: none">
							<tr>
								<td>

									<table id="idTBLNomineeDet" width="100%" cellspacing="0"
										cellpadding="0">
										<tr height="25" bgcolor="#7777FF">
											<td width="25%" colspan="4" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2"><b><s:text
															name="global.lbl.add.nominee.details" /></b></font>
											</td>
										</tr>
										<tr height="25">
											<td width="25%" align="right" bgcolor="#CCCCFF"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b><font
													face="Calibri" size="2"><s:text
															name="global.lbl.full.name" />&nbsp;</font></b></td>
											<td width="75%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
												colspan="3">&nbsp;<input type="text" name="T8"
												size="30"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
										</tr>
										<tr height="25">
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.address" />&nbsp;</font>
											</b></td>
											<td width="75%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
												colspan="3">&nbsp;<input type="text" name="T10"
												size="75"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
										</tr>
										<tr height="25">
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.date.of.birth" />&nbsp;</font>
											</b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T6" size="30"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.gender" />&nbsp;</font>
											</b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
												size="1" name="D5"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
													<option selected><s:text
															name="global.val.select.gender" />...
													</option>
													<option>M -
														<s:text name="global.lbl.male" /></option>
													<option>F -
														<s:text name="global.lbl.female" /></option>
											</select></td>
										</tr>
										<tr height="25">
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.relationship" />&nbsp;</font>
											</b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T6" size="30"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											</td>
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.nominee.share" />%&nbsp;</font>
											</b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T9" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
										</tr>
										<tr height="25">
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.is.minor" />&nbsp;</font>
											</b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="checkbox" name="C1" value="ON"></td>
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.guardian.name" />&nbsp;</font>
											</b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T7" size="30"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
										</tr>
										<tr height="25">
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.address" />&nbsp;</font>
											</b></td>
											<td width="75%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
												colspan="3">&nbsp;<input type="text" name="T6"
												size="75"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
										</tr>
										<tr height="25">
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.guardian.DOB" />&nbsp;</font>
											</b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T6" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
												<img src="../media/icons-small/calendar.gif">
											</td>
											<td width="25%" bgcolor="#CCCCFF" align="right"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.nomination.date" />&nbsp;</font>
											</b></td>
											<td width="25%"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
												type="text" name="T11" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
												<img src="../media/icons-small/calendar.gif"></td>
										</tr>
										<tr height="25" bgcolor="#7777FF">
											<td width="25%" colspan="4" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<font face="Calibri" size="2"><b><u><s:text
																name="global.lbl.update" /></u></b></font>
											</td>
										</tr>
									</table>

									<table width="100%" cellspacing="1" cellpadding="0">
										<tr bgcolor="#FF9966" height="25">
											<td width="5%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.sr" />#</font>
											</b></td>
											<td width="20%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="left">
													<b> <font face="Calibri" size="2">&nbsp;<s:text
																name="global.lbl.nominee.name" /></font></b>
											</td>
											<td width="30%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="left">
													<b> <font face="Calibri" size="2">&nbsp;<s:text
																name="global.lbl.address" /></font></b>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p>
													<b> <font face="Calibri" size="2"><s:text
																name="global.lbl.relation" /></font></b>
											</td>
											<td width="5%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.share" /> %</font>
											</b></td>
											<td width="15%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p>
													<font face="Calibri" size="2"><b>&nbsp;</b></font><b><font
														face="Calibri" size="2"><s:text
																name="global.lbl.date.of.birth" /></font></b>
											</td>
											<td width="15%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
												face="Calibri" size="2"><b><s:text
															name="global.lbl.action" /></b></font></td>
										</tr>
										<tr bgcolor="#FFFFEE" height="25">
											<td width="5%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
												face="Calibri" size="2">1</font></td>
											<td width="20%" align="left"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
												face="Calibri" size="2">&nbsp;Mohan Kumar</font></td>
											<td width="30%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="left">
													<font face="Calibri" size="2">&nbsp;Wagli Gaon,
														Vithalwadi, pune, Maharastra 444101</font>
											</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="center">
													<font face="Calibri" size="2">Son</font>
											</td>
											<td width="5%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
												face="Calibri" size="2"> 50%</font></td>
											<td width="15%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<p align="center">
													<font face="Calibri" size="2">&nbsp;12-Dec-1990</font>
											</td>
											<td width="15%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
												face="Calibri" size="2"> <u><s:text
															name="global.ref.edit" /></u>&nbsp;&nbsp; <u><s:text
															name="global.ref.del" /></u></font></td>
										</tr>
										<tr bgcolor="#FFFFFF" height="25">
											<td width="5%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
											<td width="20%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
											<td width="30%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
											<td width="10%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
											<td width="5%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
											<td width="15%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
											<td width="15%" align="center"
												style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="55" bgcolor="#9999FF">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="<s:text name="global.btn.save"/>"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:save();">
					</td>
					<td width="20%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="<s:text name="global.btn.cancel"/>"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:cancel();">
					</td>
					<td width="30%" align="left"
						style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
				</tr>
			</table>


		</form>

	</div>
</body>

</html>