<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>

<head>
<link href="css/stylesheet.css" rel="stylesheet" />


<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="validate.js"></script>


<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<style>
</style>
<script language="javascript">
	function startUp() {
		document.getElementById("idTxtMeetingDate").focus();
	}
</script>
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">
		<table id="idErrTbl" style="display: none">
			<tr>
				<td valign="middle" align="left" bgcolor="#FFAAAA"><font
					face="Calibri" size="3" color="#000000">
						<p id="el">Hi</p>
				</font></td>
			</tr>
		</table>

		<form name="acntLimitMst" id="acntLimitMstId" action="" method="post">
			<div>
				<table id="idTblTitle" width="100%" height="26" cellpadding="0"
					cellspacing="1">
					<tr height="1" bgcolor="#FFFFFF">
						<td colspan="3" width="100%"></td>
					</tr>
					<tr height="25" bgcolor="#FFFFFF">
						<td colspan="1" width="20%"><font face="Calibri" size="2"
							color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
							color="#CC0000"><s:text
									name="global.lbl.CD.OD.account.limits.master" /></font></td>
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
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.branch.code" /></font>
						</td>

						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" id="idBranchCode" name="branchCode" size="10"
							tabindex="1" class="smallTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.account" /></font>
						</td>
						<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
							align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" name="D1" class="mediumselect" tabindex="2">
								<option><s:text name="global.val.product" />...
								</option>
						</select> <select size="1" name="D2" class="mediumselect" tabindex="3">
								<option><s:text name="global.val.account" />...
								</option>
						</select> <select size="1" name="D3" class="mediumselect" tabindex="4">
								<option><s:text name="global.val.sub.account" />...
								</option>
						</select> <input type="text" id="idAccountId" name="accountId" size="30"
							value="" class="mediumTxtLeftAlign" tabindex="5">
						</td>
						<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						</td>
					</tr>
					<tr>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.from.date" /></font>
						</td>

						<td width="30%" align="left">&nbsp;&nbsp; <sx:datetimepicker
								name="dateOfBirth" displayFormat="dd-MM-yyyy" /> &nbsp;<input
							tabindex="9" type="submit"
							value="<s:text name="global.btn.view"/>" class="button"></td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.currency.code" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" id="idCurrencyCode" name="currencyCode"
							size="10" tabindex="10" class="smallTxtLeftAlign">
						</td>
					</tr>
				</table>

			</div>

			<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.account.status" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D4" tabindex="11">
							<option><s:text name="global.val.select" />...
							</option>
					</select>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.PLR.link" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri"> <input type="radio" value="V8" name="R1"
							tabindex="12" checked class="radiobutton"></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" tabindex="13"
						name="R1" value="V8" class="radiobutton"><font size="2"><s:text
								name="global.lbl.no" /></font>&nbsp;
					</td>
				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.recommending.authority" /></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D5" tabindex="14">
							<option><s:text name="global.val.select" />...
							</option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.recommending.user.code" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" id="idRemUserCode" name="remUserCode" size="10"
						tabindex="15" class="smallTxtLeftAlign">&nbsp;<input
						type="text" id="idBranchCode" name="branchCode" size="10"
						tabindex="16" class="mediumTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.sanctioning.authority" /></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D6" tabindex="17">
							<option><s:text name="global.val.select" />...
							</option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.sanctioning.user.code" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" id="idSancUserCode" name="SancUSerCode"
						size="10" tabindex="18" class="smallTxtLeftAlign">&nbsp;<input
						type="text" id="idBranchCode" name="branchCode" size="10"
						tabindex="19" class="mediumTxtLeftAlign">
					</td>
				</tr>
				<tr>


					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.santion.date" /></font>
					</td>


					<td width="30%" align="left">&nbsp;&nbsp; <sx:datetimepicker
							name="dateOfBirth" displayFormat="dd-MM-yyyy" />
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.expiry.date" /></font>
					</td>
					<td width="30%" align="left">&nbsp;&nbsp; <sx:datetimepicker
							name="dateOfBirth" displayFormat="dd-MM-yyyy" />
					</td>
				</tr>
				<tr>


					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.sanctioned.limit" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" id="idSancLimit" name="sancLimit" size="10"
						tabindex="26" class="mediumTxtRightAlign">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.grace.days.for.drawing.power" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" id="idGraceDayDrawingPwr"
						name="graceDayDrawingPwr" size="10" tabindex="27"
						class="smallTxtLeftAlign">
					</td>
				</tr>


				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.grace.days.for.expiry" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" id="idGraceDaysfrExpiry"
						name="graceDaysfrExpiry" size="10" tabindex="28"
						class="smallTxtLeftAlign">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.expiry.date.with.grace.period" /></font>
					</td>
					<td width="30%" align="left">&nbsp;&nbsp;<sx:datetimepicker
							name="dateOfBirth" displayFormat="dd-MM-yyyy" /></td>

				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.remarks" /></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" id="idRemarks" name="Remarks" size="10"
						class="veryLargeTxtLeft" tabindex="32">
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					</td>
				</tr>
			</table>

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
			<div
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.interest.rate" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" id="idInterestRate" name="InterestRate"
							size="10" tabindex="33" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.to.date" /></font>
						</td>
						<td width="30%" align="left">&nbsp;&nbsp;<sx:datetimepicker
								name="dateOfBirth" displayFormat="dd-MM-yyyy" /></td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.slab.from" /></font>
						</td>

						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" id="idSlabFrom" name="slabFrom" size="10"
							tabindex="37" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.slab.to" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" id="idSlabTo" name="slabTo" size="10"
							tabindex="38" class="mediumTxtLeftAlign">
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
			<div
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="100%" valign="middle" bgcolor="#0000FF" valign="middle"
							align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2" color="#FFFFFF"><b><s:text
										name="global.lbl.slab.rate" /></b></font>
						</td>
					</tr>
				</table>
				<table id=tblData width="100%" cellpadding="0" cellspacing="1">

					<tr>
						<td height="21" bgcolor="#CCCCFF" align="center"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text name="global.lbl.sr.no" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF" align="center"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.slab.amount" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.slab.rate" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF" align="center"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text name="global.lbl.offset" /></font></b></td>

						<td height="21" bgcolor="#CCCCFF" align="center"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text name="global.lbl.action" /></font></b></td>
					</tr>

				</table>
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
				<table id="idTblTxn1" width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri"><s:text
									name="global.lbl.total.slab.amount" /></font>
						</td>
						<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
							align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" id="idTotalSlabAmt" name="totalSlabAmt"
							size="10" tabindex="39">
						</td>
						<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr height="25">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="submit" value=" <s:text name="global.btn.save"/> "
						tabindex="40" class="button" onclick=" validate();">
					</td>
					<td width="20%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="<s:text name="global.btn.cancel"/>"
						tabindex="41" class="button" onclick="cancel();">
					</td>
					<td width="30%" align="left"
						style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
				</tr>
			</table>
		</form>

	</div>
	<script type="text/javascript">
		function validate() {
			new FormValidator(
					'formHome',
					[ {
						name : 'prCode',
						display : 'Product code',
						rules : 'required|numeric'
					}, {
						name : 'prName',
						display : 'Product name',
						rules : 'alpha_numeric|required'
					}, ],
					function(errors, evt) {

						if (errors.length > 0) {
							var errorString = '';
							document.getElementById("idErrTbl").style.display = "inline";
							for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
								errorString += errors[i].message + '<br />';
							}

							el.innerHTML = errorString;
						}

					});
			//Find a <table> element with id="myTable":

		}
	</script>

</body>

</html>