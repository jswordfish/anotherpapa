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
<link href="css/stylesheet.css" rel="stylesheet" />
<style>
</style>
<script language="javascript">
   var i;
	function startUp() {
		//	document.getElementById("idTxtLoanTypeCode").focus();
	}
	function add() {
		var frm = document.forms[0];
		var table = document.getElementById("tblData");

		//Find a <table> element with id="myTable":

		// Create an empty <tr> element and add it to the 1st position of the table:
		var row = table.insertRow(1);

		// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		

		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idAmountUpto").value;
		cell2.innerHTML = document.getElementById("idInterestRate").value;
		
		cell3.innerHTML = '<input type="button" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

		clearing();
	}
	function deleteRow(row) {
		i = row.parentNode.parentNode.rowIndex;
		document.getElementById('tblData').deleteRow(i);
		alert('deleted!!');
	}
	function edit(row) {
		alert('in edit');
		var table = document.getElementById("tblData");
	    i = row.parentNode.parentNode.rowIndex;
		var a = table.rows[i];
		var amountUpto = a.cells[0].innerHTML;
		var interestRate = a.cells[1].innerHTML;
	
		document.getElementById("idAmountUpto").value = amountUpto;
		document.getElementById("idInterestRate").value = interestRate;

	}

	function update() {
		alert('in update');

		//i = row.parentNode.parentNode.rowIndex;
		alert('indexupdate ' + i);
		var table = document.getElementById("tblData");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idAmountUpto").value;
		e.cells[1].innerHTML = document.getElementById("idInterestRate").value;
		alert('update end');

	}
	function clearing() {

		document.getElementById("loanIntSlabId").reset();
		alert("in clear");
	}
	function save() {
		alert("Loan Interest Slab Saved Successfully");
		window.location.href = "<s:url value="LoanIntSlabMgmt"/>";
	}

	function cancel() {
		window.location.href = "<s:url value="LoanIntSlabMgmt"/>";
	}
</script>
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formHome" id="loanIntSlabId">
			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text
								name="global.lbl.loan.interest.slab.add" /></font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri">&nbsp; <s:text
										name="global.lbl.branch.code" />: 02
							</font></b>
					</td>
				</tr>
			</table>
			<table id="idTBLLimitSanctionAll" width="100%" height="26"
				cellpadding="0" cellspacing="1">
				<tr>
					<td>
						<!-- MAIN TOP BLOCK -->
						<table width="100%" cellspacing="1" cellpadding="0">
							<tr height="35" bgcolor="#0000FF">
								<td width="25%" valign="middle" colspan="4" bgcolor="#0000FF"
									valign="middle" align="left"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
									face="Calibri" size="2" color="#FFFFFF"><b>Talegaon
											Primary Agriculture Society</b></font>
								</td>
							</tr>

							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.term.loan.type" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri"> &nbsp;</font><select size="1" name="D1">
										<option><s:text name="global.val.select.member" />...
										</option>
								</select>
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.purpose.code" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<select size="1" name="D2">
										<option><s:text name="global.val.company" /></option>
								</select>
								</td>
							</tr>

							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.currency" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<select size="1" name="D3" class="mediumselect">
										<option><s:text name="global.val.currency" />...
										</option>
								</select>
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.from" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.till" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" width="100%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="4">
									<table border="0" width="100%" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<p align="right">
													<b><font face="Calibri" size="2"><s:text
																name="global.lbl.amount.upto" />: </font></b>
											</td>
											<td>
												<p align="center">
													<input tabindex="1" id="idAmountUpto"
														name="txtPurposeCode25" class="mediumTxtRightAlign"
														value="">
											</td>
											<td>
												<p align="right">
													<b><font face="Calibri" size="2"><s:text
																name="global.lbl.interest.rate" />: </font></b>
											</td>
											<td>
												<p align="center">
													<input tabindex="1" id="idInterestRate"
														name="txtPurposeCode14" class="mediumTxtRightAlign"
														value="">
											</td>

										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table width="100%" cellpadding="0" cellspacing="1">
							<tr height="25">
								<td width="30%" align="center"
									style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
									<input type="button" value=" <s:text name="global.btn.add"/> "
									id="btnAdd" class="button" onclick="add();"> &nbsp; <input
									type="button" value=" <s:text name="global.btn.update"/> "
									class="button" onclick="update();">&nbsp; <input
									type="button" value=" <s:text name="global.btn.clear"/> "
									class="button" onclick="clearing();">
								</td>
							</tr>
						</table>
						<table width="100%" cellspacing="0">
							<tr height="1">
								<td width="25%" align="left"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<!-- LIST -->
						<table id="tblData" width="75%" align="center">
							<tr bgcolor="#FF9966" height="25">
								<td width="25%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.amount.upto" /></font></b></td>
								<td width="25%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.interest.rate" /></font></b></td>
								<td width="25%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.action" /></font></b></td>
							</tr>

						</table>
			</table>
			<br>
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr height="25">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="submit" value=" <s:text name="global.btn.save"/> "
						class="button" onclick=" save();">
					</td>
					<td width="20%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="<s:text name="global.btn.cancel"/>"
						class="button" onclick="cancel();">
					</td>
					<td width="30%" align="left"
						style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
				</tr>
			</table>
		</form>

	</div>
	<script src="placeholders.js"></script>
</body>

</html>