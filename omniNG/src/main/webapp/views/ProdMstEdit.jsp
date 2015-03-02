<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>

<head>

<link href="css/stylesheet.css" rel="stylesheet" />


<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="validate.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
	
</script>
<script type="text/javascript" src="functions.js"></script>

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<style>
</style>
<script language="javascript">
	var i;
	function startUp() {
		
		document.getElementById("idProductCode").focus();
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
		var cell6 = row.insertCell(5);
		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idCategory").value;
		cell2.innerHTML = document.getElementById("idType").value;
		cell3.innerHTML = document.getElementById("idDescription").value;
		cell4.innerHTML = document.getElementById("idMinNum").value;
		cell5.innerHTML = document.getElementById("idMaxNum").value;
		cell6.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

		clearing();
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
		var category = a.cells[0].innerHTML;
		var type = a.cells[1].innerHTML;
		var desc = a.cells[2].innerHTML;
		var minNum = a.cells[3].innerHTML;
		var maxNum = a.cells[4].innerHTML;
		document.getElementById("idCategory").value = category;
		document.getElementById("idType").value = type;
		document.getElementById("idDescription").value = desc;
		document.getElementById("idMinNum").value = minNum;
		document.getElementById("idMaxNum").value = maxNum;
		

	}

	function update() {
		

		//i = row.parentNode.parentNode.rowIndex;
		
		var table = document.getElementById("tblData");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idCategory").value;
		e.cells[1].innerHTML = document.getElementById("idType").value;
		e.cells[2].innerHTML = document.getElementById("idDescription").value;
		e.cells[3].innerHTML = document.getElementById("idMinNum").value;
		e.cells[4].innerHTML = document.getElementById("idMaxNum").value;
		
		document.getElementById("idUpdate").disabled = true;
		document.getElementById("idAdd").disabled = false;
		document.getElementById("idDel").disabled = false;

	}
	function clearing() {

		document.getElementById("formHomeId").reset();
		
	}

	function save() {
		
		window.location.href = "<s:url value="ProdMstMgmtSave"/>";
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
</script>
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

		<form name="formHome" id="formHomeId" action="ProdMstMgmtSave"
			method="post">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text name="global.lbl.add.product" /></font></td>
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
								name="global.lbl.product.code" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="1" id="idProductCode" name="prodCode"
						class="mediumTxtLeftAlign">&nbsp; <b><u><font
								face="Calibri" size="2" color="#003399"><s:text
										name="global.ref.verify" /></font></u></b>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.product.name" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
						type="text" tabindex="2" name="prodName" size="30"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.currency" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select name="currency" tabindex="3" class="mediumselect">
							<option value="-1"><s:text name="global.val.currency" />...
							</option>
							<option value="INR" selected><s:text
									name="global.val.INR" /></option>
							<option value="USD"><s:text name="global.val.USD" /></option>
							<option value="AUD"><s:text name="global.val.AUD" /></option>
							<option value="GBP"><s:text name="global.val.GBP" /></option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.customer.internal" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						name="customerInternal" tabindex="4" class="mediumselect">
							<option selected><s:text name="global.val.customer" /></option>
							<option><s:text name="global.val.internal" /></option>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.voucher.entry.level" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="vcrEntryLevel" tabindex="5">
							<option><s:text name="global.val.select" />...
							</option>
							<option selected><s:text name="global.val.account" /></option>
							<option><s:text name="global.val.sub.account" /></option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.account.open.level" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="vcrOpenLevel" tabindex="6">
							<option><s:text name="global.val.select" />...
							</option>
							<option selected><s:text name="global.val.account" /></option>
							<option><s:text name="global.val.sub.account" /></option>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;&nbsp;<s:text
								name="global.lbl.module.type" />&nbsp;
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<select
						name="moduleType" tabindex="7">
							<option value="SavingBank"><s:text
									name="global.val.savings.bank" /></option>
							<option value="CurrentDeposits"><s:text
									name="global.val.current.deposits" /></option>
							<option value="CashCredit"><s:text
									name="global.val.cash.credit" /></option>
							<option value="OverDraft"><s:text
									name="global.val.over.draft" /></option>
							<option value="SafeCustody"><s:text
									name="global.val.safe.custody" /></option>

					</select></td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.type.of.deposit" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="typeOfDeposit" tabindex="8">
							<option><s:text name="global.val.local.deposit" /></option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.auto.generate.ac" /> #</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;

						<font face="Calibri"> <input type="radio" value="V7"
							name="autoGenAcNoYN" tabindex="9" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" name="autoGenAcNoYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.auto.generate.sub.ac" /> #
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;

						<font face="Calibri"> <input type="radio" value="V7"
							name="autoGenSubAcNoYN" tabindex="10" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" name="autoGenSubAcNoYN" class="radiobutton">
						<font size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>

				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.minimum.balance.cheque.book" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="minBalChqBook" tabindex="11"
						class="smallTxtLeftAlign" value="500.00">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.asset.liability" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						name="assetLiability" tabindex="12" class="mediumselect">
							<option value="Asset"><s:text name="global.val.asset" /></option>
							<option value="Liability"><s:text
									name="global.val.liability" /></option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.minimum.balance.non-cheque" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="minBalNonChqBook" tabindex="13"
						class="smallTxtLeftAlign" value="300.00">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.financial.non-financial" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						name="finNonFin" tabindex="14" class="mediumselect">
							<option value="Financial"><s:text
									name="global.val.financial" /></option>
							<option value="NonFinancial"><s:text
									name="global.val.non.financial" /></option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.conditional.asset.gl" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="conditionalAssetGL" tabindex="15">
							<option value="Select"><s:text name="global.val.select" />...
							</option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.conditional.liability.gl" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="conditionalLiabilityGL" tabindex="16">
							<option value="Select"><s:text name="global.val.select" />...
							</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.reconciliation.type" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="reconType" tabindex="17">
							<option value="None"><s:text name="global.val.none" /></option>
					</select> &nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.product.status" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						class="mediumselect" name="prdStatus" tabindex="18">
							<option value="Operative"><s:text
									name="global.val.operative" /></option>
							<option value="Non-Operative"><s:text
									name="global.val.non.operative" /></option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.accrued" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;

						<font face="Calibri"> <input type="radio" value="V7"
							name="accruedYN" tabindex="19" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" name="accruedYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>



					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.cash.dr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> <input type="radio" value="V7"
							name="cashDrYN" tabindex="20" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" name="cashDrYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>


					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text name="global.lbl.cash.cr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> <input type="radio" value="V7"
							name="cashCrYN" tabindex="21" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" name="cashCrYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.transfer.dr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> <input type="radio" value="V7"
							name="transferDrYN" tabindex="22" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" name="transferDrYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>



					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.transfer.cr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">


						<font face="Calibri"> <input type="radio" value="V7"
							name="transferCrYN" tabindex="23" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" name="transferCrYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>

				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.clearing.dr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> <input type="radio" value="V7"
							name="clearingDrYN" tabindex="24" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" name="clearingDrYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.clearing.cr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> <input type="radio" value="V7"
							name="clearingCrYN" tabindex="25" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" name="clearingCrYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>
				</tr>
			</table>

			<BR>
			<DIV
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<table width="100%" cellpadding="0" cellspacing="0" height="87">
					<thead>
						<tr height="15">
							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.category" />&nbsp;
							</font></td>
							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
								<input type="text" tabindex="26" id="idCategory" name="cateogry"
								size="15" value="">
							</td>

							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.type" />&nbsp;
							</font></td>

							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
								type="text" tabindex="27" name="catType" id="idType">
							</td>
						</tr>
						<tr height="15">
							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.description" />&nbsp;
							</font></td>
							<td colspan="3" width="80%" bgcolor="#FFFFFF" valign="middle"
								align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
								<textarea id="idDescription" name="catDesc" tabindex="28"></textarea>
							</td>
						</tr>
						<tr height="15">
							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.minimum.number" /></font></td>
							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
								<input type="text" tabindex="29" name="minNumber" id="idMinNum"
								class="mediumTxtLeftAlign">
							</td>
							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.maximum.number" /></font>
							</td>
							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
								type="text" tabindex="30" name="maxNumber" id="idMaxNum"
								class="mediumTxtLeftAlign">
							</td>

						</tr>
					</thead>
					<tbody></tbody>
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

				<table>
					<tr>
						<td><font face="Calibri" size="1pt"></font></td>
					</tr>
				</table>
				<div>
					<input type="hidden" id="crw">

					<!-- List table -->
					<table id=tblData width="100%" cellpadding="0" cellspacing="1">

						<tr>

							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Category" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Type" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Desc" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="MinNum" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="MaxNum" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Action" /></font></b></td>
						</tr>

					</table>
				</div>

			</DIV>
			<br>
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr height="25">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="submit" value=" <s:text name="global.btn.save"/> "
						class="button" tabindex="31">
					</td>
					<td
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						align="left" width="20%">&nbsp; <input
						value="<s:text name="global.btn.cancel"/>"
						style="font-family: Calibri; font-size: 10pt;"
						onclick="javascript:cancel();" type="reset" tabindex="32"
						class="button">
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