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
		var cell4 = row.insertCell(3);

		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idMinShareAmt").value;
		cell2.innerHTML = document.getElementById("idMaxShareAmt").value;
		cell3.innerHTML = document.getElementById("idShare").value;
		cell4.innerHTML = '<input type="button" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

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
		var minShareAmt = a.cells[0].innerHTML;
		var maxShareAmt = a.cells[1].innerHTML;
		var share = a.cells[2].innerHTML;
		document.getElementById("idMinShareAmt").value = minShareAmt;
		document.getElementById("idMaxShareAmt").value = maxShareAmt;
		document.getElementById("idShare").value = share;
	}

	function update() {
		alert('in update');

		//i = row.parentNode.parentNode.rowIndex;
		alert('indexupdate ' + i);
		var table = document.getElementById("tblData");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idMinShareAmt").value;
		e.cells[1].innerHTML = document.getElementById("idMaxShareAmt").value;
		e.cells[2].innerHTML = document.getElementById("idShare").value;
		alert('update end');

	}
	function clearing() {

		document.getElementById("sharePercentId").reset();
		alert("in clear");
	}
	function save() {
		alert("Share Percentage Saved Successfully");
		window.location.href = "<s:url value="SharePercentMstMgmt"/>";
	}

	function cancel() {
		window.location.href = "<s:url value="SharePercentMstMgmt"/>";
	}
</script>
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formHome" id="sharePercentId">
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
											name="global.lbl.product.code" /> &nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri"> &nbsp;</font><select size="1" name="D1"
									class="mediumselect">
										<option><s:text name="global.val.select.member" />...
										</option>
								</select>
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.currency" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<select size="1" name="D4"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<option><s:text name="global.val.currency" />...
										</option>
								</select>
								</td>
							</tr>

							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.from" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp; <sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.till" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
							</tr>

							<tr>
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
																name="global.lbl.min.share.amt" />&nbsp;&nbsp;&nbsp; </font></b>
											</td>
											<td><input tabindex="1" id="idMinShareAmt"
												name="txtPurposeCode25" size="15"
												style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right; float: left"
												value=""></td>
											<td>
												<p align="right">
													<b><font face="Calibri" size="2"> <s:text
																name="global.lbl.max.share.amt" />&nbsp;&nbsp;&nbsp;
													</font></b>
											</td>
											<td>
												<p align="center">
													<input tabindex="1" id="idMaxShareAmt"
														name="txtPurposeCode29" size="15"
														style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right; float: left"
														value=""><font face="Calibri" size="2"> </font>
											</td>
											<td>
												<p align="right">
													<b><font face="Calibri" size="2"><s:text
																name="global.lbl.share" /> %&nbsp; </font> </b>&nbsp;
											</td>
											<td>
												<p align="center">
													<input tabindex="1" id="idShare" name="txtPurposeCode14"
														size="10"
														style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; text-align: right; float: left"
														value="">
											</td>

										</tr>
									</table>
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

						<table>
							<tr>
								<td><font face="Calibri" size="1pt"></font></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" cellspacing="0">
							<tr height="1">
								<td width="25%" align="left"></td>
							</tr>
						</table> <!-- LIST -->
						<table id="tblData" width="100%">
							<tr bgcolor="#FF9966" height="25">
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.minimum.share.amt" /></font></b></td>
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.maximum.share.amt" /></font></b></td>
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text name="global.lbl.share" />%</font></b></td>
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.action" /></font></b></td>
							</tr>

						</table>
			</table>

			<table cellpadding="0" cellspacing="0" width="100%">
				<tr height="25">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="submit" value=" <s:text name="global.btn.save"/> "
						class="button" onclick=" validate();">
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
</body>

</html>