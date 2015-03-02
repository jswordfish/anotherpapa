<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link href="css/stylesheet.css" rel="stylesheet" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
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
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);

		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idMonths").value;
		cell2.innerHTML = document.getElementById("idDays").value;
		cell3.innerHTML = document.getElementById("idFromAmt").value;
		cell4.innerHTML = document.getElementById("idOffsetIntRate").value;
		cell5.innerHTML = '<input type="button" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

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
		var months = a.cells[0].innerHTML;
		var days = a.cells[1].innerHTML;
		var fromAmt = a.cells[2].innerHTML;
		var offsetIntRate = a.cells[3].innerHTML;
		document.getElementById("idMonths").value = months;
		document.getElementById("idDays").value = days;
		document.getElementById("idFromAmt").value =fromAmt;
		document.getElementById("idOffsetIntRate").value = offsetIntRate;


	}

	function update() {
		alert('in update');

		//i = row.parentNode.parentNode.rowIndex;
		alert('indexupdate ' + i);
		var table = document.getElementById("tblData");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idMonths").value;
		e.cells[1].innerHTML = document.getElementById("idDays").value;
		e.cells[2].innerHTML = document.getElementById("idFromAmt").value;
		e.cells[3].innerHTML = document.getElementById("idOffsetIntRate").value;
		alert('update end');

	}
	function clearing() {

		document.getElementById("intOffsetMstid").reset();
		alert("in clear");
	}

	function save() {
		alert("Interest Offset Saved Successfully");
		window.location.href = "<s:url value="IntOffsetMstMgmt"/>";
	}

	function cancel() {
		window.location.href = "<s:url value="IntOffsetMstMgmt"/>";
	}
</script>
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formHome" id="intOffsetMstid">
			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text
								name="global.lbl.interest.offset.add" /></font></td>
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
								<td bgcolor="#CCCCFF" width="20%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font><s:text name="global.lbl.product" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="30%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri"> &nbsp;</font><select size="1" name="D1">
										<option><s:text name="global.val.select.member" />...
										</option>
								</select>
								</td>
								<td bgcolor="#CCCCFF" width="20%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri"><s:text
											name="global.lbl.account.type" />&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="30%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<select size="1" name="D2">
										<option><s:text name="global.val.company" /></option>
								</select>
								</td>
							</tr>

							<tr>
								<td bgcolor="#CCCCFF" width="20%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.from" />&nbsp;</font>
								</td>
								<td colspan="1" bgcolor="#FFFFFF" width="30%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
								<td bgcolor="#CCCCFF" width="20%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.till" />&nbsp;&nbsp; </font>
								</td>
								<td colspan="1" bgcolor="#FFFFFF" width="30%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="20%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.from" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="30%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
								<td bgcolor="#CCCCFF" width="20%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.till" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="30%"
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
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.months" /></font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.days" /></font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.from.amount" /></font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.offset.interest.rate" /></font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24" width="128">&nbsp;</td>
										</tr>
										<tr>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idMonths"
														name="txtPurposeCode26" size="10"
														class="smallTxtRightAlign" value="">
											</td>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idDays"
														name="txtPurposeCode25" size="10"
														class="smallTxtRightAlign" value="">
											</td>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idFromAmt"
														name="txtPurposeCode13" size="15"
														class="smallTxtRightAlign" value="">
											</td>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idOffsetIntRate"
														name="txtPurposeCode14" size="10"
														class="smallTxtRightAlign" value="">
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
						</table> <!-- LIST -->
						<table id="tblData" width="100%" align="center">
							<tr bgcolor="#FF9966" height="25">
								<td width="20%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.months" /></font>
								</b></td>
								<td width="20%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text name="global.lbl.days" /></font>
								</b></td>
								<td width="20%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.from.amount" />&nbsp;
									</font></b></td>
								<td width="20%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.offset.interest.rate" /></font>
								</b></td>
								<td width="20%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.action" /></font>
								</b></td>
							</tr>

						</table>
			</table>
			<table width="100%" cellspacing="0">
				<tr height="25" bgcolor="#8A8AFF">
					<td
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						align="left" width="20%">&nbsp;</td>
					<td
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						align="right" width="30%">&nbsp; <input type="submit"
						value="<s:text name="global.btn.save"/>" align="middle"
						tabindex="19" class="button" onclick="javascript:save();">
					</td>
					<td
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						align="left" width="20%">&nbsp; <input
						value="<s:text name="global.btn.cancel"/>" tabindex="20"
						class="button" align="middle" onclick="javascript:cancel();"
						type="button">
					</td>
					<td
						style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						align="left" width="30%">&nbsp;</td>
				</tr>

			</table>
		</form>

	</div>

</body>

</html>