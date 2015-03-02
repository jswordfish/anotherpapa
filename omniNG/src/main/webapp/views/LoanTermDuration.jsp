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
	function startUp() {
		document.getElementById("idTxtMeetingDate").focus();
	}
	function cancel() {
		window.location.href = "<s:url value="LoanTermDuration"/>";
	}

	
</script>
<sx:head />
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
								name="global.lbl.loan.term.duration" /></font></td>
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
								name="global.lbl.branch.code" /></font></td>
					<td width="50%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="txt1" class="smallTxtLeftAlign">
					</td>

				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.product.code" /></font></td>
					<td width="50%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" class="mediumselect" name="slct1">
							<option><s:text name="global.val.select" /></option>
					</select> <input type="text" name="txt1" class="largeTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.effective.date" />&nbsp;
					</font></td>
					<td width="250" align="left">&nbsp; <sx:datetimepicker
							name="dateOfBirth" displayFormat="dd-MM-yyyy" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr height="300">
					<td valign="top" align="left" width="100%" colspan="5">
						<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0">
							<tr height="25" bgcolor="#FF9966" id="idTRTitlerow"
								valign="middle">
								<td width="10%" bgcolor="#CCCCFF" align="left"><b><font
										face="Calibri" size="2"><s:text name="global.lbl.sr.no" />&nbsp;&nbsp;</font></b></td>
								<td width="25%" bgcolor="#CCCCFF" align="center"><font
									face="Calibri" size="2"><b>&nbsp;&nbsp;<s:text
												name="global.lbl.loan.term.code" /></b></font></td>
								<td width="25%" bgcolor="#CCCCFF" align="center"><font
									face="Calibri" size="2"><b>&nbsp;&nbsp;<s:text
												name="global.lbl.up.to.months" /></b></font></td>
								<td width="20%" bgcolor="#CCCCFF" align="center"><b><font
										face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.edit" /></font></b></td>
								<td width="20%" bgcolor="#CCCCFF" align="center"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.remove" /></font></b></td>

							</tr>

							<tr height="1" bgcolor="#FFFFFF"></tr>


						</table>
			</table>
			<table>
				<tr>


					<td width="100%" align="center">&nbsp; <input type="button"
						value="<s:text name="global.btn.save"/>" class="button"
						onclick="javascript:cancel();"> &nbsp;&nbsp;&nbsp;&nbsp; <input
						type="button" value="<s:text name="global.btn.cancel"/>"
						class="button" onclick="javascript:cancel();">
					</td>
				</tr>
			</table>

		</form>

	</div>
</body>

</html>