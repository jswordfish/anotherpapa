<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/stylesheet.css" />" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<script type="text/javascript" src="validate.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<style>
</style>
<script type="text/javascript">
	$(document).ready(

	/* This is the function that will get executed after the DOM is fully loaded */
	function() {
		$("#idEffectiveFrom").datepicker({
			changeMonth : true,//this option for allowing user to select month
			changeYear : true,
			dateFormat : 'dd-mm-yy',//this option for allowing user to select format
			duration : 'fast',
			yearRange : '1960:2050'
		//this option for allowing user to select from year range
		});

		$("#idFromDate").datepicker({
			changeMonth : true,//this option for allowing user to select month
			changeYear : true,
			dateFormat : 'dd-mm-yy',//this option for allowing user to select format
			duration : 'fast',
			yearRange : '1960:2050'
		//this option for allowing user to select from year range
		});
		$("#idToDate").datepicker({
			changeMonth : true,//this option for allowing user to select month
			changeYear : true,
			dateFormat : 'dd-mm-yy',//this option for allowing user to select format
			duration : 'fast',
			yearRange : '1960:2050'
		//this option for allowing user to select from year range
		});
		$("#idEffectiveTill").datepicker({
			changeMonth : true,//this option for allowing user to select month
			changeYear : true,
			dateFormat : 'dd-mm-yy',//this option for allowing user to select format
			duration : 'fast',
			yearRange : '1960:2050'
		//this option for allowing user to select from year range
		});
	}

	);

	function ValidateDate(dtValue) {
		var dtRegex = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/);
		return dtRegex.test(dtValue);
	}
	function ValidateDate1() {
		var idEffectiveFrom = document.getElementById("idEffectiveFrom").value;
		var idEffectiveTill = document.getElementById("idEffectiveTill").value;

		var parts = idEffectiveFrom.split("-");
		var parts1 = idEffectiveTill.split("-");
		var EffectiveFrom = new Date(parseInt(parts[2], 10), parseInt(parts[1],
				10) - 1, parseInt(parts[0], 10));

		EffectiveFrom.setHours(0, 0, 0, 0);

		var EffectiveTill = new Date(parseInt(parts1[2], 10), parseInt(
				parts1[1], 10) - 1, parseInt(parts1[0], 10));
		EffectiveTill.setHours(0, 0, 0, 0);
		var idFromDate = document.getElementById("idFromDate").value;
		var idToDate = document.getElementById("idToDate").value;
		if (idEffectiveFrom !== null && idEffectiveFrom !== ''
				&& idEffectiveFrom !== undefined) {
			if (!ValidateDate(idEffectiveFrom)) {
				document.getElementById("idErrTbl").style.display = "inline";
				document.getElementById("el2").innerHTML = "";
				document.getElementById("el2").innerHTML = " <s:text name="global.error.msg.invalid.effective.from"/> ";
				return false;
			} else {
				document.getElementById("idErrTbl").style.display = "inline";
				document.getElementById("el2").innerHTML = "";

			}
		}
		if (idEffectiveTill !== null && idEffectiveTill !== ''
				&& idEffectiveTill !== undefined) {
			if (!ValidateDate(idEffectiveTill)) {
				document.getElementById("idErrTbl").style.display = "inline";
				document.getElementById("el2").innerHTML = "";
				document.getElementById("el2").innerHTML = " <s:text name="global.error.msg.invalid.effective.till"/> ";
				return false;
			} else {

				document.getElementById("idErrTbl").style.display = "inline";
				document.getElementById("el2").innerHTML = "";

			}
		}
		if (idFromDate !== null && idFromDate !== ''
				&& idFromDate !== undefined) {
			if (!ValidateDate(idFromDate)) {
				document.getElementById("idErrTbl").style.display = "inline";
				document.getElementById("el2").innerHTML = "";
				document.getElementById("el2").innerHTML = "<s:text name="global.error.msg.invalid.from.date"/>";
				return false;
			} else {
				document.getElementById("idErrTbl").style.display = "inline";
				document.getElementById("el2").innerHTML = "";
			}
		}
		if (idToDate !== null && idToDate !== '' && idToDate !== undefined) {
			if (!ValidateDate(idToDate)) {
				document.getElementById("idErrTbl").style.display = "inline";
				document.getElementById("el2").innerHTML = "";
				document.getElementById("el2").innerHTML = "<s:text name="global.error.msg.invalid.to.date"/>";
				return false;
			} else {
				document.getElementById("idErrTbl").style.display = "inline";
				document.getElementById("el2").innerHTML = "";
			}
		}

		if (idEffectiveTill !== null && idEffectiveTill !== ''
				&& idEffectiveTill !== undefined)
			if (EffectiveTill <= EffectiveFrom) {
				document.getElementById("idErrTbl").style.display = "inline";
				document.getElementById("el2").innerHTML = "";
				document.getElementById("el2").innerHTML = "<s:text name="global.error.msg.compare.date"/>";
				return false;
			}
	}
</script>
<script type="text/javascript">
	function toggleTable(tblName) {
		//idNonPerformTbl,idAccountingTbl,idOtherTbl
		if (tblName == "idAccountingTbl") {
			document.getElementById("idAccountingTbl").style.display = "block";
			document.getElementById("idOtherTbl").style.display = "none";
			document.getElementById("idNonPerformTbl").style.display = "none";
		}
		if (tblName == "idOtherTbl") {
			document.getElementById("idOtherTbl").style.display = "block";
			document.getElementById("idAccountingTbl").style.display = "none";
			document.getElementById("idNonPerformTbl").style.display = "none";
		}
		if (tblName == "idNonPerformTbl") {
			document.getElementById("idNonPerformTbl").style.display = "block";
			document.getElementById("idAccountingTbl").style.display = "none";
			document.getElementById("idOtherTbl").style.display = "none";
		}

	}
</script>
</head>

<body bgcolor="#F5F5F3" topmargin="0"
	onload="startUp1(),startUp2(),startUp3();">
	<div align="center">


		<form name="formHome1" id="formHomeId" method="post"
			action="paramLoanAccountAddSave" onsubmit="return ValidateDate1()">
			<div>
				<input type="hidden" name="vToken">
			</div>

			<div id="idErrMsg" class="errorDiv" style="display: none">
				<s:text name="errMsg"></s:text>
			</div>
			<div id="idErrTbl" class="errorDiv" style="display: none">
				<p id="el" style="color: #FF0040" align="left"></p>
				<p id="el2" style="color: #FF0040" align="left"></p>
			</div>

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text name="global.lbl.add.loan.params" /></font></td>
					<td width="20%" bgcolor="#FFFFFF"></td>
				</tr>
			</table>
			<!-- BASIC INFORMATION START -->
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								id="basicInfo" href="#"><s:text
										name="global.lbl.basic.information" /></a>
						</b></font>
					</td>
				</tr>
			</table>
			<div style="display: block;" id="basicTbl">
				<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							align="left" bgcolor="#CCCCFF" valign="middle" width="20%"><font
							face="Calibri" size="2">&nbsp;&nbsp;<s:text
									name="global.lbl.branch.code" />&nbsp;
						</font></td>

						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select multiple="multiple" tabindex="1" name="branches1"
							class="multiSelect">
								<option value="">Select...</option>
								<c:forEach var="branches" items="${branches}">

									<option value="${branches.id}">${branches.branchCode}:${branches.branchName}</option>
								</c:forEach>

						</select>
						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.product.code" /></font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select tabindex="2" name="prodCode" class="mediumselect">
								<option value="">Select...</option>
								<c:forEach var="products" items="${products}">

									<option value="${products.productCode}">${products.productCode}:${products.productName}</option>
								</c:forEach>
						</select>
						</td>
					</tr>

					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.loan.type" />&nbsp;</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><select size="1"
								tabindex="3" name="loanType" class="mediumselect">
									<option value="">Select...</option>
									<c:forEach var="mapLoanType" items="${mapLoanType}">

										<option value="${mapLoanType.key}">${mapLoanType.value}</option>
									</c:forEach>
							</select></font>
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text name="global.lbl.equated" />
								Y/N&nbsp;
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<!-- <font face="Calibri"></font> --> <input type="radio"
							value="true" tabindex="4" class="radiobutton" name="equated"
							checked><font size="2"><s:text
									name="global.lbl.yes" /> </font><input type="radio" tabindex="5"
							name="equated" class="radiobutton" value="false"><font
							size="2"><s:text name="global.lbl.no" /></font>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text name="global.lbl.funded" />
								Y/N&nbsp;
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri"> <input type="radio" value="true"
								class="radiobutton" tabindex="6" name="funded" checked></font><font
							size="2"><s:text name="global.lbl.yes" /> </font><input
							type="radio" tabindex="7" name="funded" class="radiobutton"
							value="false"><font size="2"><s:text
									name="global.lbl.no" /> </font>
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.interest.application.frequency" />&nbsp;
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<select
							size="1" tabindex="8" name="interestApplicationFrequency"
							class="mediumselect">
								<option value="">Select...</option>
								<c:forEach var="mapInterestApplicationFrequency"
									items="${mapInterestApplicationFrequency}">

									<option value="${mapInterestApplicationFrequency.key}">${mapInterestApplicationFrequency.value}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.grace.days.installment" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="9" name="graceDaysInstallment"
							size="10" class="mediumTxtLeftAlign">

						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.product.calc.type" />&nbsp;
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<select
							size="1" name="productCalculationType" tabindex="10"
							class="mediumselect">
								<option value="">Select...</option>
								<c:forEach var="mapProductCalculationType"
									items="${mapProductCalculationType}">

									<option value="${mapProductCalculationType.key}">${mapProductCalculationType.value}</option>
								</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.holiday.period" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" name="holidayPeriod" tabindex="11"
							class="mediumselect">
								<option value="">Select...</option>
								<c:forEach var="mapHoliDayPeriod" items="${mapHoliDayPeriod}">
									<option value="${mapHoliDayPeriod.key}">${mapHoliDayPeriod.value}</option>
								</c:forEach>
						</select>
						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.default.transfer.batch" />&nbsp;
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" tabindex="12" name="defaultTransferBatch"
							class="mediumselect">
								<option value="">Select...</option>
								<c:forEach var="batches" items="${batches}">

									<option value="${batches.batchCode}">${batches.batchCode}:${batches.batchName}</option>
								</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.minimum.term" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" placeholder="0.000" tabindex="13"
							name="minimumTerm" size="10" class="mediumTxtRightAlign">
						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.maximum.term" />&nbsp;
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="14" name="maximumTerm" size="10"
							class="mediumTxtLeftAlign">
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.minimum.amount" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="15" name="minimumAmount" size="10"
							class="mediumTxtRightAlign" placeholder="0.000">&nbsp;
						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.maximum.amount" />&nbsp;
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="16" name="maximumAmount" size="10"
							placeholder="0.000" class="mediumTxtRightAlign">&nbsp;
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.grace.days.interest" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="17" name="graceDayInterest"
							size="10" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.round.off.option" />&nbsp;
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" tabindex="18" name="roundOff"
							class="mediumselect">
								<option value="">Select...</option>
								<c:forEach var="mapRoundOff" items="${mapRoundOff}">

									<option value="${mapRoundOff.key}">${mapRoundOff.value}</option>
								</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.min.days.for.interest" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="19" name="minimumDaysOfInterest"
							size="10" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.penal.interest.rate" /></font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="20" name="penalInterestRate"
							placeholder="0.000" size="10" class="mediumTxtRightAlign"><font
							face="Calibri" size="2">%</font>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.max.penal.interest.rate" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="21" name="maxPenalInterestRate"
							size="10" placeholder="0.000" class="mediumTxtRightAlign">
							<font face="Calibri" size="2">%</font>
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.interest.tax" /> %
						</font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="22" name="interestTax" size="10"
							placeholder="0.000" class="mediumTxtRightAlign"><font
							face="Calibri" size="2">%</font>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.NPA.penal.rate" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="23"
							name="notPerformingAccountpenalRate" size="10"
							placeholder="0.000" class="mediumTxtRightAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.interest.charge.type" /></font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" tabindex="24" name="interestChargeType"
							class="mediumselect">
								<option value="">Select...</option>
								<c:forEach var="mapInterestChargeType"
									items="${mapInterestChargeType}">

									<option value="${mapInterestChargeType.key}">${mapInterestChargeType.value}</option>
								</c:forEach>
						</select>
						</td>

					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.months" />(<s:text
									name="global.lbl.value.date" />)</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="25" size="10" name="monthValueDate"
							class="mediumTxtLeftAlign" />
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.death.insurance" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="26" name="deathInsurance" size="10"
							placeholder="0.000" class="mediumTxtRightAlign"><font
							face="Calibri" size="2">%</font>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp; <s:text
									name="global.lbl.guarantee.deposit" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="27" name="guaranteeDeposit"
							size="10" placeholder="0.000" class="mediumTxtRightAlign">
						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.guarantee.fund" /></font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
							type="text" tabindex="28" name="guaranteeFund" size="10"
							placeholder="0.000" class="mediumTxtRightAlign"></td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.effectivedate" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
							type="text" tabindex="29" name="effectiveFrom1"
							placeholder="dd-mm-yyyy" id="idEffectiveFrom" size="10"
							class="mediumTxtLeftAlign"></td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.effective.tilldate" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
							type="text" tabindex="30" placeholder="dd-mm-yyyy"
							name="effectiveTill1" id="idEffectiveTill" size="10"
							class="mediumTxtLeftAlign"></td>
					</tr>

					<tr>
						<td width="100%" bgcolor="#FFFFFF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4">&nbsp;</td>
					</tr>
				</table>
			</div>
			<!-- BASIC INFORMATION END -->



			<!-- ACCOUNTING PARAMETERS START -->

			<table width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								id="basicInfo" onclick="toggleTable('idAccountingTbl');"
								href="#"><s:text name="global.lbl.accounting.parameters" /></a>
						</b></font>
					</td>
				</tr>
			</table>

			<div style="display: none;" id="idAccountingTbl">
				<table id="idTBLookuplist1" width="100%" height="100%"
					align="center" cellpadding="0" cellspacing="0">

				</table>

				<table width="100%" height="100%" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.minimum.closure.term" />&nbsp;</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="31" name="minimumClosureTerm"
							size="10" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.discounted.interest.rate" />Y/N&nbsp;</font>
						</td>

						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri"> <input type="radio" tabindex="32"
								value="true" class="radiobutton" name="discoutedInterestRate"
								checked></font><font size="2"><s:text
									name="global.lbl.yes" /> </font><input type="radio" tabindex="33"
							class="radiobutton" name="discoutedInterestRate" value="false"><font
							size="2"><s:text name="global.lbl.no" /> </font>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"> <s:text
									name="global.lbl.days.in.year" />&nbsp;
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="34" name="numberOfDaysInYear"
							size="10" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.maximum.sanction.limit" />&nbsp;</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" tabindex="35" name="maximumSanctionLimit" size="15"
							placeholder="0.000" class="mediumTxtRightAlign"></td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.accept.non-performing.a/c.date" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri"> <input type="radio" tabindex="36"
								value="true" class="radiobutton"
								name="acceptNonPerformingAccountDate" checked></font><font
							size="2"><s:text name="global.lbl.yes" /> </font><input
							type="radio" class="radiobutton" tabindex="37"
							name="acceptNonPerformingAccountDate" value="false"><font
							size="2"><s:text name="global.lbl.no" /> </font>
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.charge.full.month.int" /> (<s:text
									name="global.lbl.closure" />)</font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri"><input type="radio" value="true"
								tabindex="38" class="radiobutton"
								name="chargeFullMonthInterestClosure" checked></font><font
							size="2"><s:text name="global.lbl.yes" /> </font><input
							type="radio" name="chargeFullMonthInterestClosure"
							class="radiobutton" tabindex="39" value="false"><font
							size="2"><s:text name="global.lbl.no" /> </font></td>
					</tr>

					<tr>
						<td width="100%" bgcolor="#FFFFFF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4">&nbsp;</td>
					</tr>
				</table>
			</div>
			<!-- ACCOUNTING PARAMETERS END -->




			<!-- OTHER PARAMETERS START -->
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								id="basicInfo" onclick="toggleTable('idOtherTbl');" href="#"><s:text
										name="global.lbl.other.parameters" /></a>
						</b></font>
					</td>
				</tr>
			</table>

			<div style="display: none;" id="idOtherTbl">
				<table id="idTBLookuplist2" width="100%" height="100%"
					align="center" cellpadding="0" cellspacing="0">
					<tr height="1" bgcolor="#FFFFFF">
						<td colspan="3" width="100%"></td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.val.from.date" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
							type="text" tabindex="4" name="fromDate1"
							placeholder="dd-mm-yyyy" id="idFromDate" size="10"
							class="mediumTxtLeftAlign"></td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.val.to.date" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="41" placeholder="dd-mm-yyyy"
							name="toDate1" id="idToDate" size="10" class="mediumTxtLeftAlign">
						</td>
					</tr>
					<tr>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp; <s:text
									name="global.lbl.status" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="42" id="idStatus" name="status"
							size="10" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp;<s:text
									name="global.lbl.no.of.account" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="43" name="numOfAccount" size="10"
							class="mediumTxtLeftAlign">
						</td>
					</tr>

					<tr>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp; <s:text
									name="global.lbl.last.account" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="44" id="idLastAccount"
							name="lastAccount" size="10" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp;<s:text
									name="global.lbl.un-recov.exp.ac" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="45" id="idUnRecovExpAc"
							name="unRecovExpAc" size="10" class="mediumTxtLeftAlign">
						</td>
					</tr>


					<tr>
						<td width="100%" bgcolor="#FFFFFF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4" height="22">&nbsp;</td>
					</tr>

				</table>
			</div>

			<!-- OTHER PARAMETERS END -->


			<!-- NON PERFORMING PARAMETERS END -->
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								id="basicInfo" onclick="toggleTable('idNonPerformTbl');"
								href="#"><s:text
										name="global.lbl.non.performing.account.parameters" /></a>
						</b></font>
					</td>
				</tr>
			</table>

			<div style="display: none;" id="idNonPerformTbl">

				<table id="idTBLookuplist3" width="100%" height="100%"
					align="center" cellpadding="0" cellspacing="0">
					<tr height="1" bgcolor="#FFFFFF">
						<td colspan="3" width="100%"></td>
					</tr>
					<tr>
						<td width="100%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4" height="22"><b><font face="Calibri" size="2">&nbsp;
									<s:text name="global.lbl.non-performing.account.interest" />
							</font></b></td>
					</tr>

					<tr>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp; <s:text
									name="global.lbl.receivable.ac" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="46" id="idNPAAIntRecvAc"
							name="NPAAIntRecvAc" size="10" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp;<s:text
									name="global.lbl.reserve.ac" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" tabindex="47" name="NPAAIntResAc" size="15"
							id="idNPAAIntResAc" class="mediumTxtLeftAlign"></td>
					</tr>

					<tr>
						<td width="100%" bgcolor="#FFFFFF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4" height="22">&nbsp;</td>
					</tr>
					<tr>
						<td width="100%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4" height="22"><b><font face="Calibri" size="2">&nbsp;
									<s:text name="global.lbl.non-performing.account.penal.interest" />
							</font></b></td>
					</tr>

					<tr>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp; <s:text
									name="global.lbl.receivable.ac" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="48" id="idNPAPIntRecvAc"
							name="NPAPIntRecvAc" size="10" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp;<s:text
									name="global.lbl.reserve.ac" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" tabindex="49" name="NPAPIntResAc" size="15"
							id="idNPAPIntResAc" class="mediumTxtLeftAlign"></td>
					</tr>
					<tr>
						<td width="100%" bgcolor="#FFFFFF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4" height="22">&nbsp;</td>
					</tr>
					<tr>
						<td width="100%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4" height="22"><b><font face="Calibri" size="2">&nbsp;
									<s:text name="global.lbl.non-performing.account.other.charges" />
							</font></b></td>
					</tr>

					<tr>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp; <s:text
									name="global.lbl.receivable.ac" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" tabindex="50" id="idNPAOCRecvAc"
							name="NPAOCRecvAc" size="10" class="mediumTxtLeftAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp;<s:text
									name="global.lbl.reserve.ac" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" tabindex="51" name="NPAOCResAc" size="15"
							id="idNPAOCResAc" class="mediumTxtLeftAlign"></td>
					</tr>

				</table>
			</div>
			<!-- NON PERFORMING PARAMETERS END -->


			<table cellpadding="0" cellspacing="0" width="100%">
				<tr height="25" bgcolor="#9999FF">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="submit" tabindex="52"
						value="<s:text name="global.btn.save"/>" class="button"
						onclick="javascript:save();">
					</td>
					<td width="20%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="reset" tabindex="53"
						value="<s:text name="global.btn.cancel"/>" class="button"
						onclick="javascript:cancel();">
					</td>
					<td width="30%" align="left"
						style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
				</tr>
			</table>

		</form>
	</div>
	<script type="text/javascript">
		new FormValidator(
				'formHome1',

				[ {
					name : 'branches1',
					display : 'Branch Code',
					rules : 'required'
				}, {
					name : 'prodCode',
					display : 'Prod Code',
					rules : 'required'
				}, {
					name : 'loanType',
					display : 'Loan Type',
					rules : 'required'
				}, {
					name : 'effectiveFrom1',
					display : 'Effective FromDate',
					rules : 'required'
				}, {
					name : 'graceDaysInstallment',
					display : 'Grace Days Installment',
					rules : 'numeric'
				}, {
					name : 'minimumTerm',
					display : 'Minimum Term',
					rules : 'decimal'
				}, {
					name : 'maximumTerm',
					display : 'Maximum Term',
					rules : 'numeric'
				}, {
					name : 'minimumAmount',
					display : 'Minimum Amount',
					rules : 'decimal'
				}, {
					name : 'maximumAmount',
					display : 'Maximum Amount',
					rules : 'decimal'
				}, {
					name : 'graceDayInterest',
					display : 'Grace DayInterest',
					rules : 'numeric'
				}, {
					name : 'minimumDaysOfInterest',
					display : 'Minimum Days Of Interest',
					rules : 'numeric'
				}, {
					name : 'penalInterestRate',
					display : 'Penal Interest Rate',
					rules : 'decimal'
				}, {
					name : 'maxPenalInterestRate',
					display : 'Maximum Penal Interest Rate',
					rules : 'decimal'
				}, {
					name : 'interestTax',
					display : 'Interest Tax',
					rules : 'decimal'
				}, {
					name : 'notPerformingAccountpenalRate',
					display : 'Non Performing Account penalRate',
					rules : 'decimal'
				}, {
					name : 'monthValueDate',
					display : 'Month Value Date',
					rules : 'numeric'
				}, {
					name : 'deathInsurance',
					display : 'Death Insurance',
					rules : 'decimal'
				}, {
					name : 'guaranteeDeposit',
					display : 'Guarantee Deposit',
					rules : 'decimal'
				}, {
					name : 'guaranteeFund',
					display : 'guarantee Fund',
					rules : 'decimal'
				}, {
					name : 'minimumClosureTerm',
					display : 'Minimum Closure Term',
					rules : 'numeric'
				}, {
					name : 'numberOfDaysInYear',
					display : 'Number Of Days InYear',
					rules : 'numeric'
				}, {
					name : 'numOfAccount',
					display : 'Num Of Account',
					rules : 'numeric'
				}, {
					name : 'maximumSanctionLimit',
					display : 'Maximum Sanction Limit',
					rules : 'decimal'
				}, ],

				function(errors, evt) {

					if (errors.length > 0) {

						var errorString = '';
						document.getElementById("idErrTbl").style.display = "inline";
						for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
							errorString += errors[i].message + '<br />';

						}
						//	alert("js error"+errorString);
						document.getElementById("el").innerHTML = errorString;

					} else {
						document.getElementById("el").innerHTML = " ";
					}

				});
	</script>
</body>
</html>