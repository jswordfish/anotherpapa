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
<link href="../menucss/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>
<script language="javascript">
	function startUp() {
			document.getElementById("idtrial").focus();
	}

	function save() {
		alert("Details Saved Successfully");
		window.location.href ="<s:url value="LoanInterestApplication"/>";
	}

	function view() {
		window.location.href = "<s:url value="LoanInterestApplication"/>";
	}
</script>
<sx:head />
</head>
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formLoanInterest" id="formLoanInterestId">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text
								name="global.lbl.interest.applicaion" /></font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
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
				<tr height="1" bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.trial.apply" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="trail" id="idtrail" class="mediumselect">
							<option><s:text name="global.val.select" />...
							</option>
					</select>
					</td>


				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.TOD" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="slct1"
						class="mediumselect">
							<option><s:text name="global.val.yes" />...
							</option>
							<option><s:text name="global.val.no" />...
							</option>
					</select>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.all.select.product" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="slct2" class="mediumselect">
							<option><s:text name="global.val.select" />...
							</option>
					</select>
					</td>

				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.product.code" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="slct3"
						class="mediumselect">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <a href=""><s:text name="global.lbl.get.date" /></a>
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.all.select.range" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="slct4" class="mediumselect">
							<option><s:text name="global.val.select" />...
							</option>
					</select>
					</td>
				</tr>

				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.from.account.number" /></font>
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
								name="global.lbl.to.account.number" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="slct8"
						class="mediumselect">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="slct9" class="mediumselect">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="slct10" class="mediumselect">
							<option><s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="txttoacnt" name="" size="30"
						class="mediumTxtLeftAlign"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.from.date" /></font>
					</td>
					<td bgcolor="#FFFFFF" width="25%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<sx:datetimepicker name="dateOfBirth"
							displayFormat="dd-MM-yyyy" />
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.to.date" /></font>
					</td>
					<td bgcolor="#FFFFFF" width="25%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<sx:datetimepicker name="dateOfBirth"
							displayFormat="dd-MM-yyyy" />
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.penal.TOD" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="slct11"
						class="mediumselect">
							<option><s:text name="global.val.select" />...
							</option>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.batch.code" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="slct12" class="mediumselect">
							<option><s:text name="global.val.select" />...
							</option>
					</select> <select size="1" name="slct13" class="mediumselect">
							<option><s:text name="global.val.select" />...
							</option>
					</select>
					</td>

				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp; <s:text
								name="global.lbl.PL.account.id" /></font>
					</td>
					<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						colspan="3">&nbsp; <select size="1" name="slct14"
						class="mediumselect">
							<option><s:text name="global.val.product" />...
							</option>
					</select> <select size="1" name="slct15" class="mediumselect">
							<option><s:text name="global.val.account" />...
							</option>
					</select> <select size="1" name="slct16" class="mediumselect">
							<option><s:text name="global.val.sub.account" />...
							</option>
					</select> <input type="text" tabindex="1" id="idTxtMeetingDate18"
						name="txtplacntid" size="30" class="mediumTxtLeftAlign"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>


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
						<input type="button" value="  <s:text name="global.btn.save"/>"
						class="button"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:save();">
					</td>
					<td width="50%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						colspan="2">&nbsp;<input type="button"
						value="<s:text name="global.btn.view"/>" class="button"
						style="font-family: Calibri; font-size: 10pt; color: #000080"
						onclick="javascript:view();">&nbsp;
					</td>
				</tr>
			</table>
		</form>

	</div>

</body>
</html>