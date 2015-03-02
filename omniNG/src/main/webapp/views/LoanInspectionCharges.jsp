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

		<form name="loanInspectionChargesMst" id="loanInspectionChargesMstId"
			action="" method="post">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text
								name="global.lbl.charges.for.advances.browse" /></font></td>
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
			<div
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
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

						<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<input type="text" id="idBranchCode" name="branchCode" size="10"
							tabindex="1" class="smallTxtLeftAlign">
						</td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.product.code" /></font>
						</td>
						<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" name="D80" tabindex="3" class="mediumselect">
								<option><s:text name="global.val.select" />...
								</option>
						</select>&nbsp; <input type="text" id="idAccountId" name="accountId"
							size="30" value="" class="mediumTxtLeftAlign" tabindex="5">
						</td>
					</tr>

					<tr>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.effective.date" /></font>
						</td>

						<td width="80%" align="left">&nbsp;&nbsp;<sx:datetimepicker
								name="dateOfBirth" displayFormat="dd-MM-yyyy" /></td>
					</tr>
					<tr>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.charge.type" /></font>
						</td>
						<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" name="D80" tabindex="3" class="mediumselect">
								<option><s:text name="global.val.select" />...
								</option>
						</select>&nbsp;<input tabindex="9" type="submit"
							value="<s:text name="global.btn.view"/>" class="button">
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

				<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0">
					<tr height="25" bgcolor="#FF9966" id="idTRTitlerow" valign="middle">
						<td height="21" bgcolor="#CCCCFF" align="center"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text name="global.lbl.sr.no" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF" align="center"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.amount.upto" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text name="global.lbl.type" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text name="global.lbl.amount" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.per.value" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.minimum.charge" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.maximum.charge" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text
										name="global.lbl.round.off" /></font></b></td>
						<td height="21" bgcolor="#CCCCFF" align="center"
							style="border-bottom: 1px dotted #C0C0C0"><b><font
								face="Calibri" size="2"><s:text name="global.lbl.action" /></font></b></td>
					</tr>
					<tr height="250" bgcolor="#FFFFFF">
					</tr>

				</table>
			</div>
			<div
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">

					<tr>

						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<font face="Calibri" size="2"><s:text
									name="global.lbl.pl.credit.account.id" /></font>
						</td>
						<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
							<select size="1" name="D77" class="mediumselect">
								<option><s:text name="global.val.product" />...
								</option>
						</select> <select size="1" name="D78" class="mediumselect">
								<option><s:text name="global.val.account" />...
								</option>
						</select> <select size="1" name="D79" class="mediumselect">
								<option><s:text name="global.val.sub.account" />...
								</option>
						</select> <input type="text" tabindex="1" id="idAccountId" name="accountId"
							size="30" value="" class="mediumTxtLeftAlign" tabindex="2">
						</td>
				</table>
			</div>

			<table>
				<tr>
					<td width="100%" align="center">&nbsp; <input type="button"
						value="<s:text name="global.btn.save"/>" class="button"
						onclick="javascript:cancel();"> &nbsp;&nbsp;&nbsp; <input
						type="button" value="<s:text name="global.btn.cancel"/>"
						class="button" onclick="javascript:cancel();">
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