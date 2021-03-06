<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>


<link href="css/stylesheet.css" rel="stylesheet" />

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="validate.js"></script>

<script language="javascript">
	function startUp() {
		document.getElementById("idBranchCode").focus();
	}

	function entryTxn() {
		window.location.href = "<s:url value="Entry"/>";
	}
</script>
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div id="errors"></div>
	<div align="center">

		<table id="idErrTbl" style="display: none">
			<tr>
				<td valign="middle" align="left" bgcolor="#FFAAAA"><font
					face="Calibri" size="3" color="#000000">
						<p id="el">Hi</p>
				</font></td>
			</tr>
		</table>

		<form name="ReceiptPrinting" id="ReceiptPrintingId" action="">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text name="global.lbl.receipt.printing" /></font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri"><s:text
										name="global.lbl.branch.code" />&nbsp;: 02</font></b>
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
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.batch.code" /></font>
					</td>

					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="D1" tabindex="1"
						class="mediumselect">
							<option><s:text name="global.val.select" />...
							</option>
					</select> &nbsp;&nbsp; <input type="text" id="idBranchCode"
						name="branchCode" size="10" tabindex="2"
						class="mediumTxtLeftAlign"></td>

				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.account.id" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="D2" tabindex="3"
						class="mediumselect">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="D3" class="mediumselect" tabindex="4">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="D4" class="mediumselect" tabindex="5">
							<option><s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="6" id="idAccountId" name="accountId" />


					</td>
				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.alphacode" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" id="idAlphaCode" name="alphaCode" size="10"
						tabindex="7" class="mediumTxtLeftAlign">
					</td>

				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.certificate.date" /></font>
					</td>


					<td width="30%" align="left">&nbsp;&nbsp;<sx:datetimepicker
							name="dateOfBirth" displayFormat="dd-MM-yyyy" /></td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.printed.serial.no" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" id="idPrintedSrNo" name="printedSrNo" size="10"
						tabindex="11" class="mediumTxtLeftAlign">&nbsp; <input
						tabindex="12" type="submit"
						value="<s:text name="global.btn.view"/>" class="button">
					</td>
				</tr>


			</table>


			<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100%" height="25%" bgcolor="#CCCCFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
				</tr>
				<tr>
					<td width="100%" height="25%" bgcolor="#CCCCFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
				</tr>
				<tr>
					<td width="100%" height="25%" bgcolor="#CCCCFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
				</tr>
				<tr>
					<td width="100%" height="25%" bgcolor="#CCCCFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
				</tr>
			</table>
			<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#FFFFFF">

					<td width="30%" align="center"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input tabindex="12" type="submit"
						value="<s:text name="global.btn.print"/>" class="button">
						&nbsp; <input type="submit" tabindex="13"
						value="<s:text name="global.btn.cancel"/>" class="button">&nbsp;
					</td>

				</tr>
			</table>
		</form>

	</div>
	<script type="text/javascript">
		new FormValidator(
				'cashEntryMgmt',
				[ {
					name : 'transQueue',
					display : 'Transaction Queue',
					rules : 'required'
				}, {
					name : 'transId',
					display : 'Transaction Id',
					rules : 'required'
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
	</script>
</body>

</html>