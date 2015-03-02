<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	function startUp() {
		document.getElementById("idTxtMeetingDate").focus();
	}
	function cancel() {
		window.location.href = "<s:url value="LoanPDCMaintenance"/>";
	}

	
</script>
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">

		<form name="formLoanPDC" id="formLoanPDCId">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text
								name="global.lbl.loan.PDC.Instrument" /></font></td>
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
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.account.code" /></font></td>
					<td width="50%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						size="1" name="slct1" class="mediumselect">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="slct2" class="mediumselect">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="slct3" class="mediumselect">
							<option><s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate17"
						name="txt1" class="mediumTxtLeftAlign"> <a href=""><s:text
								name="global.ref.view" /></a>
					</td>

				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>


				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.no.of.installment" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="txt2" class="smallTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.installed.amount" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="1" id="idTxtMeetingDate17"
						name="txt3" class="mediumTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.remarks" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="txt4" class="largeTxtLeftAlign">&nbsp;&nbsp;

					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>
				<tr height="300">
					<td valign="top" align="left" width="100%" colspan="5">
						<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0">
							<tr height="25" bgcolor="#FF9966" id="idTRTitlerow"
								valign="middle">
								<td width="05%" bgcolor="#CCCCFF" align="left"><b><font
										face="Calibri" size="2"><s:text name="global.lbl.sr.no" />&nbsp;&nbsp;</font></b></td>
								<td width="15%" bgcolor="#CCCCFF" align="center"><font
									face="Calibri" size="2"><b>&nbsp;&nbsp;<s:text
												name="global.lbl.bank" /></b></font></td>
								<td width="15%" bgcolor="#CCCCFF" align="center"><font
									face="Calibri" size="2"><b>&nbsp;&nbsp;<s:text
												name="global.lbl.branch" /></b></font></td>
								<td width="20%" bgcolor="#CCCCFF" align="center"><b><font
										face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.type" /></font></b></td>
								<td width="10%" bgcolor="#CCCCFF" align="center"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.instrument.date" /></font></b></td>
								<td width="15%" bgcolor="#CCCCFF" align="center"><b><font
										face="Calibri" size="2"><s:text
												name="global.lbl.instrument.number" /></font></b></td>
								<td width="15%" bgcolor="#CCCCFF" align="center"><font
									face="Calibri" size="2"><b><s:text
												name="global.lbl.instrument.amount" /></b></font></td>
								<td width="20%" bgcolor="#CCCCFF" align="center"><font
									face="Calibri" size="2"><b><s:text
												name="global.lbl.stat" /></b></font></td>
							</tr>

							<tr height="1" bgcolor="#FFFFFF"></tr>


						</table>
			</table>
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
</body>

</html>