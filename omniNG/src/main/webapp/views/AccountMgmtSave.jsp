<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	var i;
	function startUp() {

		/* document.forms[0].mlValue.value=""; */
		document.getElementById("idTxtMeetingDate").focus();
		var table = document.getElementById("tblData");
		var numOfRows = table.rows.length;

		if (numOfRows == 1) {
			document.getElementById("idAdd").disabled = false;
			document.getElementById("idUpdate").disabled = true;
			document.getElementById("idClear").disabled = true;
		} else {

			document.getElementById("idUpdate").disabled = false;
			document.getElementById("idClear").disabled = false;
		}
	}
	/* function addbtn() {
		alert('in add');
		add();
		document.getElementById("idClear").disabled = false;
	      
	} */

	function add() {
		document.getElementById("idClear").disabled = false;
		document.getElementById("idUpdate").disabled = false;
		var table = document.getElementById("tblData");

		//Find a <table> element with id="myTable":

		// Create an empty <tr> element and add it to the 1st position of the table:
		var row = table.insertRow(1);

		// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idNomineeName").value;
		cell2.innerHTML = document.getElementById("idDateOfBirth").value;
		cell3.innerHTML = document.getElementById("idRelationship").value;
		cell4.innerHTML = document.getElementById("idPercentageShare").value;
		cell5.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

		clearing();
		var tableid = "tblData";
		var tbl = document.getElementById(tableid);
		var tableValues = getMLValues(tableid);
		alert("tableValues..." + tableValues);
		var MlVal = getMultiArrayStringMargin(tableValues);
		alert("MlVal....." + MlVal);
		document.forms[0].mlValue.value = MlVal;
		alert("document.forms[0].mlValue.value..."
				+ document.forms[0].mlValue.value);
	}
	function deleteRow(row) {
		i = row.parentNode.parentNode.rowIndex;
		document.getElementById('tblData').deleteRow(i);

	}
	/* function editbtn() {
		edit(this);
		

	} */
	function edit(row) {
		document.getElementById("idUpdate").disabled = false;
		document.getElementById("idClear").disabled = false;
		document.getElementById("idAdd").disabled = true;
		document.getElementById("idDel").disabled = true;

		var table = document.getElementById("tblData");
		i = row.parentNode.parentNode.rowIndex;

		var a = table.rows[i];
		var nomineeName = a.cells[0].innerHTML;
		var dateOfBirth = a.cells[1].innerHTML;
		var relationship = a.cells[2].innerHTML;
		var percentageShare = a.cells[3].innerHTML;
		document.getElementById("idNomineeName").value = nomineeName;
		document.getElementById("idDateOfBirth").value = dateOfBirth;
		document.getElementById("idRelationship").value = relationship;
		document.getElementById("idPercentageShare").value = percentageShare;

	}

	function update() {

		//i = row.parentNode.parentNode.rowIndex;

		var table = document.getElementById("tblData");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idNomineeName").value;
		e.cells[1].innerHTML = document.getElementById("idDateOfBirth").value;
		e.cells[2].innerHTML = document.getElementById("idRelationship").value;
		e.cells[3].innerHTML = document.getElementById("idPercentageShare").value;

		document.getElementById("idUpdate").disabled = true;
		document.getElementById("idAdd").disabled = false;
		document.getElementById("idDel").disabled = false;

		var tableid = "tblData";
		var tbl = document.getElementById(tableid);
		var tableValues = getMLValues(tableid);
		var MlVal = getMultiArrayStringMargin(tableValues);
		document.forms[0].mlValue.value = MlVal;
	}
	function clearing() {

		/*  document.getElementById("formHomeId").reset();  */
		document.getElementById("idNomineeName").value = '';
		document.getElementById("idDateOfBirth").value = '';
		document.getElementById("idRelationship").value = '';
		document.getElementById("idPercentageShare").value = '';

		/*  document.getElementById('idCategory').value=''; */
	}

	function save() {

		var tableid = "tblData";
		var tbl = document.getElementById(tableid);
		var tableValues = getMLValues(tableid);
		var MlVal = getMultiArrayStringMargin(tableValues);
		document.forms["formHomeId"].mlValue.value = MlVal;

		document.forms["formHomeId"].submit();

		/* window.location.href = "<s:url value="ProdMstMgmtSave"/>"; */
	}

	function cancel() {
		window.location.href = "<s:url value=""/>";
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
	function getMLValues(tableid) {
		var tableValues = new Array();

		var tbl = document.getElementById(tableid);
		for (var i = 1; i < tbl.rows.length; i++) {
			var rowValues = getRowValues(tbl.rows[i]);
			//alert("rowValues--"+rowValues);
			tableValues[tableValues.length] = rowValues;
			//alert("in side tableValues--"+tableValues);
		}
		return tableValues;
	}
	function getRowValues(row) {
		var rowValues = new Array();
		var tds = row.getElementsByTagName("td");
		//alert("tds..."+tds);
		var fld = " ";
		//alert(tds.length-1);
		for (var r = 0; r < tds.length - 1; r++) {
			if (tds[r].hasChildNodes())
				fld = tds[r].firstChild.nodeValue;

			else
				fld = " ";
			//alert("fld..."+fld);
			rowValues[rowValues.length] = fld;
		}
		return rowValues;
	}

	function getMultiArrayStringMargin(multiValues) {

		var str = '';
		for (var i = 0; i < multiValues.length; i++) {

			var rowVal = multiValues[i];

			for (var j = 0; j < rowVal.length; j++) {
				//alert("rowVal[j]).."+(rowVal[j].split("~")));
				var sely = (rowVal[j]).split("~");
				// alert("sely  ..."+sely);
				str = str + sely[0] + '~';
			}
			str = str + '!';
		}
		//alert("getMultiArrayStringMargin..."+str);
		return str;
	}
</script>
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">

		<form name="formHome" id="formHomeId" action="AccountMgmtSave">
			<input type="hidden" value="vToken">
			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp; </font> <font face="Calibri"
						color="#CC0000"><s:text name="global.lbl.create.account" />
					</font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp; <font
						face="Wingdings 2" size="2" color="#000000"> </font> <font
						face="Calibri" size="2" color="#000000"> SUCCESS or FAILURE
							message with green or red background </font> <font face="Calibri"
						size="2" color="#CC0000">&nbsp;&nbsp; </font>
					</td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b> <font size="2" face="Calibri">&nbsp; <s:text
										name="global.lbl.branch.code" />: 02
							</font>
							</b>
					</td>
				</tr>
			</table>
			<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
				<tr height="35" bgcolor="#0000FF">
					<td width="25%" valign="middle" colspan="4" bgcolor="#0000FF"
						valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2" color="#FFFFFF"> <b>Talegaon
								Primary Agriculture Society</b>
					</font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"> <s:text
								name="global.lbl.product" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						
						<select id="idProduct" name="productName">
						
								<c:forEach var="product" items="${productName}">
									<option value="${product.id}">${product.productCode}:${product.productName}</option>
								</c:forEach>

						</select>
						
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"> <s:text
								name="global.lbl.customer" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					
						<select size="1" name="customer" class="mediumselect">
							<option value="A/C">A/C:A/C</option>
							<option value="ADMI ">ADMI:ADMIRAL</option>
							<option value="CAPT">CAPT:CAPT</option>
							<option value="CL">CL:CL</option>
							<option value="DR">DR:DR</option>
							<option value="GENE">GENE:GENERAL</option>
							<option value="LIEU">IEU:LIEUTENANT</option>
							<option value="MAJO">MAJO:MAJOR</option>
							<option value="MAST">MAST:MAST</option>
							<option value="MD">MD:MD</option>
							<option value="MESS">MESS:MESSERS</option>
							<option value="MISS">MISS:MISS</option>
							<option value="MR">MR:MR</option>
							<option value="MRS">MRS:MRS</option>
							<option value="MS">MS:MS</option>
							<option value="SAYD">SAYD:SAYD</option>
							<option value="SB">SB:Saving Bank</option>
							<option value="SMTI">SMTI:SMTI</option>
							<option value="SRI">SRI:SRI</option>
							<option value="THE">THE:THE</option>
							<option>
								<s:text name="global.lbl.customer" />
							</option>
					</select>
					</td>
				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"> <s:text
								name="global.lbl.currency" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						
						<select id="idCurrency" name="currencyName">
						<c:forEach var="currency" items="${currencyName}"> 
						<option value="${currency.id}">${currency.currencyISOCode} : ${currency.currencyName}</option>						
						</c:forEach>
						
					
						</select>
						
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"> <s:text
								name="global.lbl.address" />&nbsp;
					</font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <textarea tabindex="3" name="T4"></textarea>
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"> <s:text
								name="global.lbl.mode.of.operation" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="modeOfOperation" class="mediumselect">
							<option value="1">1.SELF"</option>
							<option value="2">2.EITHER OR SURVIVOR</option>
							<option value="3">3.FORMER OR SURVIVOR</option>
							<option value="4">4.JOINTLY OR SURVIVOR</option>
							<option value="5">5.ANY ONE SINGLE OR SURVIVOR</option>
							<option value="6">6.ANY 2 JOINTLY</option>
							<option value="7">7.ANY 3 JOINTLY</option>
							<option value="8">8.KARTA</option>
							<option value="9">9.PARTNERS SIGN JOINTLY</option>
							<option value="10">10.MINOR GREATER THEN 13 YRS</option>
							<option value="11">11.OPERATED BY GURADIAN</option>
							<option value="12">12.BOTH JOINTLY</option>
							<option value="13">13.ALL JOINTLY</option>
							<option value="14">14.FIRST ONLY</option>
							<option value="15">15.FIRST TWO JOINTLY</option>
							<option value="16">16.FIRST THREE JOINTLY</option>
							<option value="17">17.LATER OR SURVIVOR</option>
							<option value="18">18.MANAGING PARTNERS</option>
							<option value="19">19.PARTNER SINGLY</option>
							<option value="20">20.DIRECTOR AS PER ARTICLE OF ASSN.</option>
							<option value="21">21.MANAGING DIRECTOR</option>
							<option value="22">22.TRUSTY SINGLY</option>
							<option value="23">23.TRUSTY JOINTLY</option>
							<option value="24">24.SECY&PRESIDENT</option>
							<option value="25">25.SECY&TREASURER</option>
							<option value="26">26.PRESIDENT JOINTLY WITH VPR OR
								SECRE</option>
							<option value="27">27.PROPRITOR</option>
							<option value="28">28.THUMB EXPRESSION</option>
							<option value="29">29.ANY ONE</option>
							<option value="30">30.ANY TWO PARTNERS</option>
							<option value="31">31.CHAIRMEN</option>
							<option value="32">32.ANY 1 OF 1&2, ANY 1 REST</option>
							<option value="33">33.ANY 2 OF FIRST 3</option>
							<option value="34">34.SEC JNT WITH TER CRM</option>
							<option value="35">35.TRSR JOINT WITH CRM/CR</option>
							<option value="36">36.ANY ONE DIRECTOR</option>
							<option value="37">37.CRM/TRS/JTTR/JNSEC</option>
							<option value="38">38.1&2 JOINTLY</option>
							<option value="39">39.GENERAL MANAGER</option>
							<option value="40">40.SECOND ONLY</option>
							<option value="41">41.PARTNERS/DIR/IND/JOINT</option>
							<option value="42">42.MANDATE HOLDER/PROPR</option>
							<option value="43">43.PRESIDENT/WS PRESIDENT/SE</option>
							<option value="44">44.PARTNER ONLY</option>
							<option value="45">45.PARTNER JOINTLY</option>
							<option value="46">46.PARTNER/PARTNER</option>
							<option value="47">47.ANY 1&2 AND 3&4 JOINTLY</option>
							<option value="48">48.NO.1 JNT/WITH ANYONE</option>
							<option value="49">49.PRINCIPLE/SEC/TRST/P</option>
							<option value="50">50.ONLY PRINCIPLE</option>
							<option value="51">51.PRESIDENT&TREASURER</option>
							<option value="52">52.ONLY PRESIDENT</option>
							<option value="53">53.PROPRIETOR/AUTHORISED SIG</option>
							<option value="54">54.PRESIDENT/SECY/TRESURER</option>
							<option value="55">55.NO.2 JOINT WITH ANY ONE</option>
							<option value="56">56.DIRECTOR OR AUTHORISED SIGN.</option>
							<option value="57">57.SECY JOINT WITH PRES/VICE PRES</option>
							<option value="58">58.2&3 ANY ONE</option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.telephone" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="telephoneCode" size="15"
						class="mediumTxtRightAlign"> <input type="text"
						name="telephoneNo" size="15" class="mediumselect">&nbsp;
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"> <s:text
								name="global.lbl.account.type" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="accountType" class="mediumselect">
							<option value="1">1.NORMAL ACCOUNT</option>
							<option value="2">2.STAFF ACCOUNT</option>
							<option value="3">3.PROPERITERY FIRM/TRADING A/C</option>
							<option value="4">4.PENSION</option>
							<option value="5">5.CO-OP SOCIETY</option>
							<option value="6">6.N.R.E ACCOUNT</option>
							<option value="7">7.N.R.O ACCOUNT</option>
							<option value="8">8.SPECIAL</option>
							<option value="9">9.MINOR ACCOUNT</option>
							<option value="10">10.INSTITUTIONAL</option>
							<option value="11">11.OTHER INSTITUTIONAL A/C</option>
							<option value="12">12.OTHER CO-OP BANK</option>
							<option value="13">13.SENIOR CITIZON</option>
							<option value="14">14.GOVT.A/C</option>
							<option value="15">15.SALARY A/C</option>
							<option value="16">16.SELF HELP GROUP A/C</option>
							<option value="17">17.NGO A/C</option>
							<option value="18">18.NRI A/C</option>
							<option value="19">19.JLGE A/C</option>
							<option value="20">20.EX-STAFF SENIOR CITIZON</option>
							<option value="21">21.COMPANY A/C</option>
							<option value="22">22.DDS AGENT</option>
							<option value="23">23.PARTNERSHIP</option>
							<option value="24">24.BANKERS</option>
							<option value="25">25.CLUB</option>
							<option value="26">26.MANAGING DIRECTOR</option>
							<option value="27">27.PROPRITORSHIP</option>
							<option value="28">28.SYSTEM RESERVE</option>
							<option value="29">29.INDIVIDUAL(GANGALI)</option>
							<option value="30">30.H.U.F A/C</option>
							<option value="31">31.TRUST</option>
							<option value="32">32.OTHERS</option>

					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.account.status" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="accountStatus" class="mediumselect">
							<option value="1">1.001-NORMAL/OPERATIVE</option>
							<option value="2">2.002-NEW</option>
							<option value="3">3.003-CLOSED</option>
							<option value="4">4.004-NON OPERATIVE</option>
							<option value="5">5.005-DORMANT</option>
							<option value="6">6.006-CALLED BACK A/C</option>
							<option value="7">7.007-SUIT FILED</option>
							<option value="8">8.008-NPA A/C</option>
							<option value="9">9.009-INTEREST CEASED</option>
							<option value="10">10.010-GARNISHEE A/C</option>
							<option value="11">11.011-HALF CLOSED</option>

					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"> <s:text
								name="global.lbl.freeze.type" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="freezeType" class="mediumselect">
							<option value="1">1.NO FREEZE</option>
							<option value="2">2.DEBIT FREEZE</option>
							<option value="3">3.CREDIT FREEZE</option>
							<option value="4">4.TOTAL FREEZE</option>
							<option value="5">5.INTERNAL A/C FREEZE</option>
					</select></td>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text name="global.lbl.reason" />
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="reason" class="mediumselect">
							<option value="1">1.CREDIT DEPARTMENT MEMO</option>
							<option value="2">2.MINOR TURNED MAJOR</option>
							<option value="3">3.BANK MANAGER INSTRUCTION</option>
							<option value="4">4.COURT ORDER</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"> <s:text
								name="global.lbl.additional.information" /> 1
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="additionalInformation2" size="25"
						class="largeTxtRightalign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"> <s:text
								name="global.lbl.additional.inforamtion" /> 2
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="T23" size="25" class="largeTxtRightAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					</td>
				</tr>
			</table>

			<div
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="100%" bgcolor="#B3B3FF" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="4" height="25">&nbsp; <font face="Calibri" size="2">
								<b> <s:text name="global.lbl.holder.details" />
							</b>
						</font>
						</td>
					</tr>

					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.name.of.holder" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="nameOfHolder" size="30"
							class="mediumTxtRightAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.holders" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="holders" size="5"
							class="smallTxtRightAlign" value="2">&nbsp; <font
							face="Calibri" size="2"><u><b> <s:text
											name="global.lbl.add" /></b></u> </font>
						</td>

					</tr>

					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.telephone" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="holderTelephoneCode" size="10"
							class="mediumTxtRightAlign"> <input type="text"
							name="holderTelephoneNo" size="10" class="mediumTxtRightAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp;<s:text
									name="global.lbl.email" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="eMail" size="30"
							class="largeTxtRightAlign">
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.date.of.birth" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<sx:datetimepicker name="holderDateOfBirth"
								displayFormat="dd-MM-yyyy" />
						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.total.no.of.holders" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="noOfHolders" size="30"
							class="mediumTxtRightAlign">
						</td>

					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.gender" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri"> <input type="radio" value="M"
								class="radiobutton" name="gender" checked>
						</font> <font size="2"> <s:text name="global.lbl.male" />
						</font> <input type="radio" name="gender" class="radiobutton" value="F">
							<font size="2"> <s:text name="global.lbl.female" />
						</font>
						</td>


						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.address" />
						</font>
						</td>
						<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							colspan="3">&nbsp; <textarea name="holderAddress"></textarea>
						</td>

					</tr>
					<tr>
						<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						</td>
						<td width="20%" bgcolor="#FFFFFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
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
							colspan="4" height="25">&nbsp; <font face="Calibri" size="2">
								<b> <s:text name="global.lbl.nominee.details" />
							</b>
						</font>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.date.of.nomination" />
						</font>&nbsp;
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<sx:datetimepicker name="dateOfNomination"
								displayFormat="dd-MM-yyyy" />
						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.relationship" />
						</font>&nbsp;
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" name="relationshipWithNominee"
							class="mediumselect" id="idRelationship">
								<option value="1">1.FATHER</option>
								<option value="2">2.MOTHER</option>
								<option value="3">3.BROTHER</option>
								<option value="4">4.SISTER</option>
								<option value="5">5.HUSBAND</option>
								<option value="6">6.WIFE</option>
						</select>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.name.of.nominee" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="nameOfNominee" size="30"
							id="idNomineeName" class="mediumTxtRightAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.address" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<textarea name="AddressOfNominee"></textarea>
						</td>

					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.village" />&nbsp;</font>
						</td>
						
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						
						<select id="idVillage" name="villageName">
						
								<c:forEach var="village" items="${villageName}">
									<option value="${village.id}">${village.villageCode}:${village.villageName}</option>
								</c:forEach>

						</select>
						
					</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.municipality" />&nbsp;</font>
						</td>
						<td
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
								
						<select id="idMunicipality" name="municipalityName">
								<c:forEach var="municipality" items="${municipalityName}">
									<option value="${municipality.id}">${municipality.municipalityCode}:${municipality.municipalityName}</option>
								</c:forEach>

						</select>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp;&nbsp;<s:text
									name="global.lbl.district.city" />&nbsp;
						</font>
						</td>
						<td
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
							<select id="idDistrict" name="districtName">
								<c:forEach var="district" items="${districtName}">
									<option value="${district.id}">${district.districtCode}:${district.districtName}</option>
								</c:forEach>

						</select>
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp;<s:text
									name="global.lbl.state" /></font>
						</td>
						<td
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
							<select id="idState" name="stateName">
								<c:forEach var="state" items="${stateName}">
									<option value="${state.id}">${state.stateCode}:${state.stateName}</option>
								</c:forEach>

						</select>
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.country" /></font>
						</td>
						<td
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
							align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
							
							<select id="idCountry" name="CountryName">
								<c:forEach var="country" items="${countryName}">
									<option value="${country.id}">${country.countryCode}:${country.countryName}</option>
								</c:forEach>
						</select>
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text name="global.lbl.pincode" /></font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" class="mediumTxtLeftAlign" name="pinCode"
							tabindex="11">&nbsp;
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.telephone" /></font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" name="nomineeTelephoneCode" size="10"
							class="mediumTxtRightAlign"> <input type="text"
							name="nomineeTelephoneNo" size="10" class="mediumTxtRightAlign"></td>
						<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2">&nbsp;<s:text
									name="global.lbl.email" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
							type="text" name="nomineeEMail" size="30"
							class="largeTxtRightAlign"></td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.date.of.birth" /></font></td>
						<td width="30%" align="left">&nbsp;&nbsp;<sx:datetimepicker
								id="idDateOfBirth" name="nomineeDateOfBirth"
								displayFormat="dd-MM-yyyy" /> &nbsp;
						</td>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
							face="Calibri" size="2"><s:text
									name="global.lbl.is.nominee.minor" />?</font></td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri"> <input type="radio" value="V9"
								class="radiobutton" name="isNomineeMinor" checked>
						</font> <font size="2"> <s:text name="global.lbl.yes" />
						</font> <input type="radio" name="isNomineeMinor" class="radiobutton"
							value="V10"> <font size="2"> <s:text
									name="global.lbl.no" />
						</font>
						</td>

					</tr>
					<tr>

						<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.minor.type" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" name="district" class="mediumselect">
								<option value="1">1.LEGAL MINOR</option>
								<option value="2">2.NATURAL MINOR</option>
						</select>
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.percentage.share" />(%)
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" id="idPercentageShare" name="percentageShare"
							size="10" class="smallTxtRightAlign">
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.gaurdian.of.minor.nominee" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="guardianOfMinorNominee" size="30"
							class="mediumTxtRightAlign">
						</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"> <s:text
									name="global.lbl.remarks" />
						</font>
						</td>
						<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" name="remarks" size="70"
							class="largeTxtRightAlign">
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td><font face="Calibri" size="1pt"></font></td>
					</tr>
				</table>


				<table width="100%" cellpadding="0" cellspacing="1">
					<tr height="25">
						<td width="30%" align="center"
							style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
							<input type="button" value=" <s:text name="global.btn.add"/> "
							id="idAdd" class="button" onclick="add();"> &nbsp; <input
							type="button" value=" <s:text name="global.btn.update"/> "
							id="idUpdate" class="button" onclick="update();">&nbsp; <input
							type="button" value=" <s:text name="global.btn.clear"/> "
							id="idClear" class="button" onclick="clearing();">
						</td>
					</tr>
				</table>
			</div>


			<div>
				<input type="hidden" id="crw">
				<table id="tblData" width="100%" cellpadding="0" cellspacing="1">
					<tr height="25" valign="middle">
						<td width="30%" bgcolor="#B3B3FF" valign="middle" align="center"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
								<font face="Calibri" size="2">&nbsp; <s:text
										name="global.lbl.nominee.name" /></font>
						</b></td>
						<td width="15%" bgcolor="#B3B3FF" valign="middle" align="center"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
								<font face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.date.of.birth" /></font>
						</b></td>
						<td width="15%" bgcolor="#B3B3FF" valign="top" align="center"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
								<font face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.relationship" /></font>
						</b></td>
						<td width="20%" bgcolor="#B3B3FF" valign="top" align="center"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
								<font face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.percentage.share" />(%)
							</font>
						</b></td>
						<td width="20%" bgcolor="#B3B3FF" valign="top" align="center"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><b>
								<font face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.action" /></font>
						</b></td>
					</tr>
					<tr height="20" bgcolor="FFFFFF">

					</tr>

				</table>
			</div>
			<!-- <table>
				<tr>
					<td><font face="Calibri" size="1pt"></font></td>
				</tr>
			</table>
 -->



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
						<input type="submit" value="  <s:text name="global.btn.save"/> "
						class="button">
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
			<input type="hidden" value="multilevelValue" name="multilevelValue">
		</form>

	</div>
</body>

</html>