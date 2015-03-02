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
//	document.getElementById("idTxtMeetingDate").focus();
}

function save(){
	alert("Saved Successfully");
//	window.location.href = "<s:url value="LoanDrawalMgmt"/>";
}

function cancel(){
//	window.location.href = "<s:url value="LoanDrawalMgmt.jsp"/>";
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
						color="#CC0000"><s:text name="global.lbl.loan.repayment" /></font></td>
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
													name="global.lbl.enter.loan.details" /></font></b>
									</td>
								</tr>
								<tr>
									<td width="100%" bgcolor="#FFFFFF" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">&nbsp; <b><s:text
													name="global.lbl.customer" />:</b>
									</font> <select name="D83" class="dropDown">
											<option><s:text name="global.val.customer" />#:
											</option>
									</select><font face="Calibri" size="2">&nbsp; <b>&nbsp;&nbsp;
												<s:text name="global.lbl.term.loan.type" />:
										</b>
									</font><select size="1" name="D81"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.term.loan.type" />...
											</option>
									</select>&nbsp;&nbsp;&nbsp; <b> <font face="Calibri" size="2"><s:text
													name="global.lbl.purpose.code" />:</font></b>&nbsp;<select name="D82"
										class="dropDown">
											<option><s:text name="global.val.purpose.code" />..
											</option>
									</select>&nbsp;&nbsp; &nbsp;<font face="Calibri" size="2"><b><s:text
													name="global.lbl.loan.account" />#:</b>&nbsp; </font> <input
										type="text" tabindex="4" name="T46" size="20"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;&nbsp;
									</td>
								</tr>

								<tr height="25">
									<td align="center" width="100%">
										<p align="left">
											&nbsp;<b><font face="Calibri" size="2"> <s:text
														name="global.lbl.transfer.debit.account" /> #:
											</font></b> <select name="D77" class="dropDown">
												<option><s:text name="global.val.product" />...
												</option>
											</select> <select name="D78" class="dropDown">
												<option><s:text name="global.val.account" />...
												</option>
											</select> <select name="D79" class="dropDown">
												<option><s:text name="global.val.sub.account" />...
												</option>
											</select> <input type="text" tabindex="1" id="idTxtMeetingDate19"
												name="txtMeetingDate19" size="30" value=""
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><b><font
												face="Calibri" size="2">&nbsp;&nbsp;&nbsp; <u><s:text
															name="global.ref.view" /></u></font></b>
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
									<td width="11%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.principle" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.total.interest" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.crop.type.interest" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<p align="right">
											<b><font face="Calibri" size="2">&nbsp;<s:text
														name="global.lbl.adjust.principle" />&nbsp;&nbsp;
											</font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<p align="right">
											<b><font face="Calibri" size="2"><s:text
														name="global.lbl.adjust.interest" /> &nbsp;&nbsp; </font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" valign="middle"
										align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<b><font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.other.details" /></font></b>
									</td>
								</tr>
								<tr height="20">

								</tr>
								<tr height="20">
									<td width="11%" bgcolor="#9999FF" align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<p align="right">
											<b><font face="Calibri" size="2"><s:text
														name="global.lbl.balance.principle" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<p align="left">
											&nbsp;<input type="text" tabindex="4" name="T107" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
									</td>
									<td width="10%" bgcolor="#9999FF" align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<p align="right">
											<b><font face="Calibri" size="2"><s:text
														name="global.lbl.tot.prin.amt.adjust" /></font></b>
									</td>
									<td width="10%" bgcolor="#9999FF" align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<p align="left">
											&nbsp;<input type="text" tabindex="4" name="T108" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
									</td>
									<td width="10%" bgcolor="#9999FF" align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										&nbsp;</td>
									<td width="10%" bgcolor="#9999FF" align="center"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										&nbsp;</td>
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
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;&nbsp;
						<input type="button" value="<s:text name="global.btn.save"/>"
						class="button" onclick="javascript:save();">
					</td>
					<td width="50%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						colspan="2">&nbsp; <input type="button"
						value="<s:text name="global.btn.cancel"/>" class="button"
						onclick="javascript:cancel();">&nbsp;
					</td>
				</tr>
			</table>
		</form>

	</div>
</body>

</html>