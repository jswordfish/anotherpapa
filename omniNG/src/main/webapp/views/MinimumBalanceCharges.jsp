<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to PACS</title>
<link href="../menucss/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>
<style>
</style>
<script language="javascript">

function startUp(){
	document.getElementById("idTxtMeetingDate").focus();
}

function cancel(){
	window.location.href = "<s:url value="MinimumBalanceChargesList"/>";;
}

function addAssetDet(){
	document.getElementById("idTBLAsset").style.display = "inline";
	document.getElementById("idTBLShare").style.display = "none";
	document.getElementById("idTBLAcMap").style.display = "none";
	document.getElementById("idTBLNominee").style.display = "none";
}
function addShareDet(){
	document.getElementById("idTBLAsset").style.display = "none";
	document.getElementById("idTBLShare").style.display = "inline";
	document.getElementById("idTBLAcMap").style.display = "none";
	document.getElementById("idTBLNominee").style.display = "none";
}
function addAcMap(){
	document.getElementById("idTBLAsset").style.display = "none";
	document.getElementById("idTBLShare").style.display = "none";
	document.getElementById("idTBLAcMap").style.display = "inline";
	document.getElementById("idTBLNominee").style.display = "none";
}
function addNomineeDet(){
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

		<form name="formMinimum" id="formMinimumId"
			action="MinimumBalanceChargesList">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text
								name="global.lbl.minimum.charges.balance" /></font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#000000">SUCCESS or FAILURE
							message with green or red background</font><font face="Calibri" size="2"
						color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri">&nbsp;<s:text
										name="global.lbl.branch.code" />: 02
							</font></b>
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
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.product.code" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" size="1" name="txt1" class="smallTxtLeftAlign">
						<input type="text" name="txt2" class="largeTxtLeftAlign"></td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.all.selected" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="D17" class="mediumselect">
							<option><s:text name="global.val.select" />...
							</option>
					</select>
					</td>
				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.account.type.customer.category" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="D23" class="mediumselect">
							<option><s:text name="global.val.select" />...
							</option>
					</select></td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.effective.date" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<sx:datetimepicker name="dateOfBirth" displayFormat="dd-MM-yyyy" />
						&nbsp; <input type="button" class="smallbtn" value="view">
					</td>
				</tr>

				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.skip.charges" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri"><input type="radio" value="M"
							class="radiobutton" name="R1" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="R1"
						class="radiobutton" value="F"><font size="2"><s:text
								name="global.lbl.no" /></font></td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.allow.temporary.overdraft.balance" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri"><input type="radio" value="M"
							class="radiobutton" name="R2" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="R2"
						class="radiobutton" value="F"><font size="2"><s:text
								name="global.lbl.no" /></font></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.frequency.of.application" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="txt5" class="smallTxtLeftAlign">
					</td>
				</tr>

			</table>


			<div
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="20%" bgcolor="#FFFFFF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							height="25">&nbsp;<font><b><s:text
										name="global.lbl.account.facility" /></b> </font>
						</td>


						<td width="30%" bgcolor="#FFFFFF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							height="25">&nbsp;<font><b><s:text
										name="global.lbl.with.cheque.book" /></b> </font>
						</td>
						<td width="20%" bgcolor="#FFFFFF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							height="25">&nbsp;<font><b><s:text
										name="global.lbl.without.cheque.book" /></b> </font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>

					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.minimum.balance.required" /></font></td>

						<td width="30%" bgcolor="#FFFFFF"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" name="txt2" class="mediumTxtLeftAlign" value="0.00">
						</td>
						<td colspan="2" width="20%" bgcolor="#FFFFFF"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" name="txt4" class="mediumTxtLeftAlign" value="0.00">
						</td>
						<td width="30%" bgcolor="#FFFFFF"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					</tr>

					<tr>
						<td width="20%" bgcolor="#CCCCFF"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text name="global.lbl.charges" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" name="T20" size="15" class="mediumTxtRightAlign">
							&nbsp;
						</td>
						<td colspan="2" width="30%" bgcolor="#FFFFFF" valign="middle"
							align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" name="T20" size="15" class="mediumTxtRightAlign">

						</td>
						<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					</tr>

					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font><s:text
									name="global.lbl.charges.type" /></font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
							size="1" name="D22" class="mediumselect">
								<option><s:text name="global.val.select" />...
								</option>
						</select></td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font><s:text
									name="global.lbl.free.instances" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="txt7" size="15"
							class="smallTxtLeftAlign">&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<div
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="100%" bgcolor="#B3B3FF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4" height="25">&nbsp;<font face="Calibri" size="2"><b><s:text
										name="global.lbl.charges.parameters" /></b> </font>
						</td>
					</tr>

					<tr>
						<td bgcolor="#CCCCFF" width="20%"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text
									name="global.lbl.PL.credit.account" />&nbsp;&nbsp; </font>
						</td>
						<td bgcolor="#FFFFFF" width="80%"
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
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.batch.code" /></font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" name="txt7" class="smallTxtLeftAlign"> <input
							type="text" name="txt8" class="largeTxtLeftAlign">
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.minimum.charges" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="txt9" size="15"
							class="mediumTxtLeftAlign" value="0.00"> &nbsp;
						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.maximum.charges" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="txt10" size="15"
							class="mediumTxtLeftAlign" value="0.00"> &nbsp;
						</td>
					</tr>
				</table>
			</div>

			<div
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="100%" bgcolor="#B3B3FF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4" height="25">&nbsp;<font face="Calibri" size="2"><b><s:text
										name="global.lbl.proces.status" /></b> </font>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.process.flag" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select name="slct1" class="mediumselect">
								<option><s:text name="global.val.select" /></option>
						</select> &nbsp;
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.last.applied.date" /></font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<sx:datetimepicker name="dateOfBirth" displayFormat="dd-MM-yyyy" />
						</td>

					</tr>
					<tr>
						<td bgcolor="#CCCCFF" width="20%"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text
									name="global.lbl.last.applied.account.id" />&nbsp;&nbsp; </font>
						</td>
						<td bgcolor="#FFFFFF" width="80%"
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
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.particulars" /></font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="txt9" class="largeTxtLeftAlign">
						</td>
					</tr>

				</table>
			</div>

			<table>
				<tr>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="20%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>



			</table>


			<table>
				<tr>
					<td width="100%" align="center">&nbsp; <input type="button"
						value="<s:text name="global.btn.save"/>" class="button"
						onclick="javascript:cancel();"> &nbsp;&nbsp;&nbsp; <input
						type="button" value="<s:text name="global.btn.cancel"/>"
						class="button" onclick="javascript:cancel();">
					</td>
				</tr>
			</table>
		</form>

	</div>
</body>

</html>