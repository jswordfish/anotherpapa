<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<link href="/css/stylesheet.css" rel="stylesheet" />

<script language="javascript">
	function startUp() {
		//alert("startUp is calling");
		
	}

	function basic() {
		//alert("basic is loading");
		document.getElementById("idTBLookuplist").style.display = "none";
		
	}
	
</script>

</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="frmCustomerUpdationWelcomekit"
			id="idfrmCustomerUpdationWelcomekit" method="POST"
			action="CustomerUpdationWelcomekit">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td width="40%"><font face="Calibri" size="2" color="#CC0000">
							&nbsp;&nbsp;&nbsp;</font><font face="Calibri" color="#CC0000">
							Process Program To Account Creation </font></td>
					<td width="40%" bgcolor="#FFFF99">&nbsp;<font face="Calibri"
						size="2" color="#000000">SUCCESS or FAILURE message with
							green or red background</font><font face="Calibri" size="2"
						color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri">&nbsp;Branch Code: 02</font></b>
					</td>
				</tr>
			</table>

			<table id="idTblBranch" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.trial.or.apply" /></font>
					</td>
					<td colspan="3" required width="30%" bgcolor="#FFFFFF"
						valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D14"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>-Select[1001]-</option>
							<option>-Select[1002]-</option>
							<option>-Select[1003]-</option>
							<option>-Select[1004]-</option>
					</select>
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>

				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.customer.number" /></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="T20" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required data-parsley-type="integer">

					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>

				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.all.or.specific.product" /></font>
					</td>
					<td colspan="3" required width="30%" bgcolor="#FFFFFF"
						valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="D14"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>-Select[1001]-</option>
							<option>-Select[1002]-</option>
							<option>-Select[1003]-</option>
							<option>-Select[1004]-</option>
					</select>
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>

				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.product.code" /></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
						<input type="text" name="T20" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> &nbsp;&nbsp;&nbsp; <img alt="Search"
						src="media/icons/search.png" width="16" height="16">&nbsp;&nbsp;&nbsp;
						<input type="text" name="T20" size="10" class="largeTxtLeftAlign"
						required>
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.from.branch" /></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
						<input type="text" name="T20" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> &nbsp;&nbsp;&nbsp; <img alt="Search"
						src="media/icons/search.png" width="16" height="16">

					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.to.branch" /></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
						<input type="text" name="T20" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> &nbsp;&nbsp;&nbsp; <img alt="Search"
						src="media/icons/search.png" width="16" height="16">

					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>

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
			<table>
				<tr>
					<td width="100%" align="center">&nbsp; <input type="submit"
						value="<s:text name="global.btn.submit"/>" class="button">
						&nbsp;&nbsp;&nbsp; <input type="submit"
						value="<s:text name="global.btn.view.report"/>" class="bigbtn">
					</td>
				</tr>
			</table>
		</form>

	</div>

</body>

</html>
