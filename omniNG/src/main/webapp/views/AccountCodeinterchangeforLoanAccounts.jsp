<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to PACS</title>
<link href="../menucss/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>
<script language="javascript">
	function startUp() {
			document.getElementById("idtrial").focus();
	}

	function save() {
		alert("Details Saved Successfully");
		window.location.href ="<s:url value="AccountCodeinterchangeforLoanAccounts"/>";
	}

	function view() {
		window.location.href = "<s:url value="AccountCodeinterchangeforLoanAccounts"/>";
	}
	function cancel() {
		window.location.href = "<s:url value="AccountCodeinterchangeforLoanAccounts"/>";
	}
</script>
</head>
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formAccount" id="formAccountId">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="40%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text
								name="global.lbl.account.code.interchange.for.loan.accounts" /></font></td>
					<td width="40%" bgcolor="#FFFF99">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#000000">SUCCESS or FAILURE
							message with green or red background</font><font face="Calibri" size="2"
						color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri">&nbsp;Branch Code: 02</font></b>
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
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.old.account.id" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="slct5"
						class="mediumselect">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="slct6" class="mediumselect">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="slct7" class="mediumselect">
							<option><s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate18"
						name="txtfromacnt" size="30" class="mediumTxtLeftAlign"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.create.account.id" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <input type="radio" class="radiobutton"
						name="acntid" value="yes" checked>
					<s:text name="global.lbl.yes" /> <input type="radio"
						class="radiobutton" name="acntid" value="no">
					<s:text name="global.lbl.no" /></td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.arbitration.product.code" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="slct4" class="mediumTxtRightAlign">
						<input type="text" name="slct5" class="largeTxtRightAlign">

					</td>
				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.arbitration.account.id" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="slct5"
						class="mediumselect">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="slct6" class="mediumselect">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="slct7" class="mediumselect">
							<option><s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate18"
						name="txtfromacnt" size="30" class="mediumTxtLeftAlign"></td>
				</tr>
				<tr>
			</table>
			<table>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#9999FF">
					<td align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td align="center"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="  <s:text name="global.btn.save"/>"
						class="button" onclick="javascript:save();"> &nbsp;<input
						type="button" value="<s:text name="global.btn.cancel"/>"
						class="button" onclick="javascript:cancel();">&nbsp;

						&nbsp;<input type="button"
						value="<s:text name="global.btn.view.report"/>" class="bigbtn"
						onclick="javascript:view();">&nbsp;
					</td>
				</tr>
			</table>
		</form>

	</div>

</body>
</html>