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
function startUp1() {
	//alert("startUp is calling");
	
	basic1();
	//todo
}
function startUp2() {
	//alert("startUp is calling");
	
	basic2();
	//todo
}
function startUp3() {
	//alert("startUp is calling");
	
	basic3();
	//todo
}

	function basic1() {
		//alert("basic is loading");
		var elemt1 = document.getElementById("idTBLookuplist1");
	
		elemt1.style.display = "none";
	}

	function basic2() {
		//alert("basic is loading");
		var elemt2 = document.getElementById("idTBLookuplist2");

		elemt2.style.display = "none";
	}
	function basic3() {
		//alert("basic is loading");
		var elemt3 = document.getElementById("idTBLookuplist3");

		elemt3.style.display = "none";
	}
	function toggleTable1() {
		var elem1 = document.getElementById("idTBLookuplist1");

		var hide = elem1.style.display == "none";
		if (hide) {
			elem1.style.display = "table";
		} else {
			elem1.style.display = "none";
		}
	}
	function toggleTable2() {
		var elem2 = document.getElementById("idTBLookuplist2");

		var hide = elem2.style.display == "none";
		if (hide) {
			elem2.style.display = "table";
		} else {
			elem2.style.display = "none";
		}
	}
	function toggleTable3() {
		var elem3 = document.getElementById("idTBLookuplist3");

		var hide = elem3.style.display == "none";
		if (hide) {
			elem3.style.display = "table";
		} else {
			elem3.style.display = "none";
		}
	}
	function startUp() {
		//	document.getElementById("idTxtMeetingDate").focus();
	}

	function save() {
		alert("TD / RD Params Saved Successfully");
		window.location.href = "<s:url value="ParamTDMgmt"/>";
	}

	function cancel() {
		window.location.href = "<s:url value="ParamTDMgmt"/>";
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

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp1(),startUp2(),startUp3();">
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
						color="#CC0000"><s:text name="global.lbl.add.td.params" /></font></td>
					<td width="60%" bgcolor="#FFFFF">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font></td>
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
				<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%"><font
						face="Calibri" size="2">&nbsp;&nbsp;<s:text
								name="global.lbl.branch" />&nbsp;
					</font></td>
					<%-- <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
						<s:select tabindex="7" label="global.lbl.branch" multiple="true" name="branches1" size="1" 
 								  list="branches" listKey="branchId" listValue="branchCode+'-'+branchName" emptyOption="false" 
 								  style="font-family: Calibri; font-size: 10pt; width:200px" /> 
					</td> --%>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<select size="1" name="branches1"  class="mediumselect"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<option><s:text name="global.val.Branch-01" />
								</option>
								<option><s:text name="global.val.Branch-02" />
								</option>
								<option><s:text name="global.val.Branch-03" />
								</option>
						</select></td>	
				</tr>				
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.product.code" />&nbsp;</font>
					</td>
					<%-- <td bgcolor="#FFFFFF" width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp; <s:select label="global.lbl.product.code" multiple="false" name="products1" size="1" 
 								  list="products" listKey="prodId" listValue="prodcode+'-'+prodname" emptyOption="false" 
 								  style="font-family: Calibri; font-size: 10pt; width:200px" /> 
					</td> --%>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<select size="1" name="products1"  class="mediumselect"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<option><s:text name="global.val.product-01" />
								</option>
								<option><s:text name="global.val.product-02" />
								</option>
								<option><s:text name="global.val.product-03" />
								</option>
						</select></td>	
					
				</tr> 

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.effective.from" />&nbsp;</font>
					</td>
					<td bgcolor="#FFFFFF" width="25%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp; <sx:datetimepicker name="dateOfBirth"
							displayFormat="dd-MM-yyyy" />
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.effective.till" />&nbsp;&nbsp; </font>
					</td>
					<td bgcolor="#FFFFFF" width="25%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<sx:datetimepicker name="dateOfBirth" displayFormat="dd-MM-yyyy" />
					</td>
				</tr>

				<tr>
					<%-- <td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.product.code" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D23" class="mediumselect">
							<option><s:text name="global.val.select.product.code" />...
							</option>
					</select>
					</td> --%>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.period.type" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="periodType" class="mediumselect">
							<option><s:text name="global.val.both" /></option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.installment.principle" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D83" class="mediumselect">
							<option><s:text name="global.val.principle" /></option>
							<option><s:text name="global.val.installment" /></option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.maximum.deposit.period" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="maximumDepositPeriod" size="10" class="mediumTxtRightAlign"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.minimum.deposit.period" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="minimumDepositPeriod" size="10"
						class="mediumTxtRightAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.maximum.amount" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="maximumAmount" size="20"
						class="mediumTxtRightAlign">
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
						<input type="text" name="minimumAmount" size="15"
						class="mediumTxtRightAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.RD.penal.amount" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="rdPenalAmount" size="20"
						class="mediumTxtRightAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.RD.penal.rate" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="rdPenalRate" size="10"
						class="mediumTxtRightAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.RD.installment.frequency" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="rdInstallementFrequency" class="mediumselect">
							<option><s:text name="global.val.monthly" /></option>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.consecutive.delay.installment" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="consecutiveDelayInstallment" size="10"
						class="mediumTxtRightAlign">&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.unit.value" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="unitValue" size="10"
						class="mediumTxtRightAlign">&nbsp;
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.units.allowed" /> Y/N</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri"> <input type="radio" value="V13"
							name="unitsAllowed" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="unitsAllowed"
						class="radiobutton" value="V14"><font size="2"><s:text
								name="global.lbl.no" /></font>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.grace.days.for.installment" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="graceDaysForInstallement" size="10" class="samllTxtRightAlign"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.grace.days.maturity" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T37" size="10" class="smallTxtRightAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.interest.paid" /> Y/N&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri"><input type="radio" value="V19" name="interestPaid"
							class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio"
						class="radiobutton" name="interestPaid" value="V20"><font size="2"><s:text
								name="global.lbl.no" /></font></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.interest.frequency" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="interestFrequency" class="mediumselect">
							<option><s:text name="global.val.yearly" /></option>
							<option><s:text name="global.val.half.yearly" /></option>
							<option><s:text name="global.val.quarterly" /></option>
							<option><s:text name="global.val.monthly" /></option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.customer.frequency" /> Y/N&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri"><input type="radio" class="radiobutton"
							value="V21" name="customerFrequency" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="customerFrequency"
						class="radiobutton" value="V22"><font size="2"><s:text
								name="global.lbl.no" /></font></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.cumulative.frequency" /> Y/N</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri"> &nbsp;<input type="radio" value="V15"
							name="cumulativeFrequency" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="cumulativeFrequency"
						class="radiobutton" value="V16"><font size="2"><s:text
								name="global.lbl.no" /></font>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.interest.round.off" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="interestRoundOff" class="mediumselect">
							<option><s:text name="global.val.nearest" /> 1.00
							</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.days.in.year" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T41" size="10" class="smallTxtRightAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.formula.maturity" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="formulaMaturity"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.bounding.on.2.digits" /></option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.maturity.period" /> Y/N</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri"> &nbsp;<input type="radio"
							class="radiobutton" value="V17" name="maturityPeriod" checked></font><font
						size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" class="radiobutton" name="maturityPeriod" value="V18"><font
						size="2"><s:text name="global.lbl.no" /></font>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.pre.maturity.penal.rate" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="preMaturityPenalRate" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.pre.maturity.interest.type" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="preMaturityInterestType"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text
									name="global.val.co-op.daily.4.digit.round.off" /></option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.certificate.query" /> Y/N&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri"><input type="radio" class="radiobutton"
							value="V23" name="certificateQuery" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="certificateQuery"
						class="radiobutton" value="V24"><font size="2"><s:text
								name="global.lbl.no" /></font></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.penal.+.offset.months" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="penalOrOffsetMonth" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.principle.amount.in.units" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="prinicipalAmountInUnit" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.default.transfer.batch" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="dafaultTransferBatch"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.TN.INT" /></option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.maturity.value.in.units" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" name="maturityValueInUnit" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.max.amount.pay.by.cash" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="maximumAmountPayByCash" size="15"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.premature.closure" /> Y/N&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri"><input type="radio" value="V25"
							class="radiobutton" name="preMatureClosure" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="preMatureClosure"
						class="radiobutton" value="V26"><font size="2"><s:text
								name="global.lbl.no" /></font></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.minimum.installment" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="minimumInstallments" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right">
					</td>
					<td width="20%" bgcolor="#FFFFFF" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.interest.debit.account" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp;<select size="1" name="D71"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="D72"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="D73"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>
								<s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate17"
						name="txtMeetingDate17" size="30" value=""
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.interest.credit.account" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
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
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.RD.penal.account" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp;<select size="1" name="D77"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="D78"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="D79"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>
								<s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate19"
						name="txtMeetingDate19" size="30" value=""
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.TD.cash.payment.ac" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp;<select size="1" name="D80"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="D81"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="D82"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>
								<s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate20"
						name="txtMeetingDate20" size="30" value=""
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
				</tr>

				<tr>
					<td width="100%" bgcolor="#FFFFFF" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="4">&nbsp;</td>
				</tr>
			</table>


			<table id="idTblBtn" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr>
					<!-- <td width="10%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td> -->
					<td width="40%" bgcolor="#FFFFFF" align="left"
						id="idCellShowTable">
						<a id="loginLink" onclick="toggleTable1();" href="#"> <b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.payout.details" /></font></b>
					</a>
					</td>
					<td width="10%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
					<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
				</tr>

			</table>
			<table id="idTBLookuplist1" width="100%" height="100%" align="center"
				cellpadding="0" cellspacing="0">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.home.currency" /> Y/N</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri"> <input type="radio" value="true"
							name="homeCurrency" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="homeCurrency"
						class="radiobutton" value="false"><font size="2"><s:text
								name="global.lbl.no" /></font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.maturity.deposit.transfer" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp;<select size="1" name="D80"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="D81"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="D82"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>
								<s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate20"
						name="txtMeetingDate20" size="30" value=""
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.add.residual.days" /> Y/N</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri"> <input type="radio" value="true"
							name="residualDays" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="residualDays"
						class="radiobutton" value="false"><font size="2"><s:text
								name="global.lbl.no" /></font>
					</td>
				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.minimum.interest.days" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="minimumInterestDays" size="20" class="smallTxtRightAlign">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.pay.overdue.interest.at.closure.from" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="payOverDueDays" size="20" class="smallTxtRightAlign">
						<s:text name="global.lbl.days" />
					</td>


				</tr>

				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.short.term.period.months.days" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="shortTermPeriodMonth" size="20" class="smallTxtRightAlign">/<input
						type="text" name="T47" size="20" class="smallTxtRightAlign">

					</td>
				</tr>

				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.locking.period" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="lockingPeriod" size="20" class="smallTxtRightAlign">
						<s:text name="global.lbl.days" />
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.deposit.amount" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="depositAmount" size="20"
						class="mediumTxtTxtRightAlign" value="0.00">
					</td>


				</tr>

				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.interest.payout" />% &nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="InterestPayOut" size="20" value="0.000000"
						class="mediumTxtRightAlign">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.payout.frequency" />&nbsp;</font>
					</td>
					<%-- <td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						 <s:select label="global.lbl.payout.frequency" multiple="false" name="payoutFrequency" size="1" 
 								  list="lookups" listKey="lookupId" listValue="" emptyOption="false" 
 								  style="font-family: Calibri; font-size: 10pt; width:200px" /> 
					</td> --%>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<select size="1" name="payoutFrequency"  class="mediumselect"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<option><s:text name="global.val.payout-01" />
								</option>
								<option><s:text name="global.val.payout-02" />
								</option>
								<option><s:text name="global.val.payout-03" />
								</option>
						</select></td>	
				</tr>
			</table>

			<table id="idTblBtn" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr>
					<!-- <td width="10%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td> -->
					<td width="40%" bgcolor="#FFFFFF" align="left"
						id="idCellShowTable">
						<a id="loginLink" onclick="toggleTable2();" href="#"> <b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.renewal.details" /></font></b>
					</a>
					</td>
					<td width="10%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
					<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
				</tr>

			</table>
			<table id="idTBLookuplist2" width="100%" height="100%" align="center"
				cellpadding="0" cellspacing="0">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.auto.renewal"/> Y/N</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri"> <input type="radio" value="true"
							name="payRenewal" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="payRenewal"
						class="radiobutton" value="false"><font size="2"><s:text
								name="global.lbl.no" /></font>
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.renewal.with.interest" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri"> <input type="radio" value="true"
							name="renewalWithInterest" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="renewalWithInterest"
						class="radiobutton" value="false"><font size="2"><s:text
								name="global.lbl.no" /></font>
					</td>
				</tr>

				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.number.of.renewals" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="noOfRenewals" size="20" class="smallTxtRightAlign">

					</td>
				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.renew.with.back.date.interest.rate.period" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="renewalWithBackDate" size="20" class="smallTxtRightAlign">

					</td>
				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.renew.with.current.date.interest.rate.period" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="renewalWithCurrentDate" size="20" class="smallTxtRightAlign">

					</td>
				</tr>

			</table>

			<table id="idTblBtn" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr>
					<!-- <td width="10%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td> -->
					<td width="40%" bgcolor="#FFFFFF" align="left"
						id="idCellShowTable">
						<a id="loginLink" onclick="toggleTable3();" href="#"> <b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.TDS.details" /></font></b>
					</a>
					</td>
					<td width="10%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
					<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
				</tr>

			</table>
			<table id="idTBLookuplist3" width="100%" height="100%" align="center"
				cellpadding="0" cellspacing="0">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.tax.project" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri"> <input type="radio" value="true"
							name="taxProject" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="taxProject"
						class="radiobutton" value="false"><font size="2"><s:text
								name="global.lbl.no" /></font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.TDS.auto.deduction" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri"> <input type="radio" value="true"
							name="tdsAutoDeduction" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="tdsAutoDeduction"
						class="radiobutton" value="false"><font size="2"><s:text
								name="global.lbl.no" /></font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.interest.tax" />% &nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="interestTax" size="20" value="0.000000"
						class="mediumTxtRightAlign">
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.TDS.amount" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="tdsAmount" size="20" value="0.00"
						class="mediumTxtRightAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.TDS.account" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp;<select size="1" name="D80"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="D81"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="D82"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>
								<s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate20"
						name="txtMeetingDate20" size="30" value=""
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
				</tr>

			</table>
			&nbsp;
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr height="25" bgcolor="#9999FF">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="  <s:text name="global.btn.save"/>  "
						class="button" onclick="javascript:save();">
					</td>
					<td width="20%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="<s:text name="global.btn.cancel"/>"
						class="button" onclick="javascript:cancel();">
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