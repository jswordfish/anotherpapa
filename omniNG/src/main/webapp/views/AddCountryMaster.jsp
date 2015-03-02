<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<link href="/css/commons.css" rel="stylesheet" />
<!-- add these lines for front end validations -->
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="parsley.js">

</script>
<script type="text/javascript" src="parsley.remote.js"></script>
<!-- end -->
<script language="javascript">
	function startUp() {
		//alert("startUp is calling");
		document.getElementById("idBrCode").focus();
		//todo
	}

</script>

</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="frmCountryMaster" id="idfrmCountryMaster" method="POST" action="AddCountrySave">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td width="20%"><font face="Calibri" size="2" color="#CC0000">
							&nbsp;&nbsp;&nbsp;</font><font face="Calibri" color="#CC0000">
							COUNTRY MASTER | CREATE </font></td>
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
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.country.code" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="countryCode" size="10" class="mediumTxtLeftAlign">
					
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.country.name" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="countryName" size="40"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>



				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.zone" />&nbsp;</font>
					</td>


				<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						name="zone" tabindex="14" class="mediumselect">
							<option value="North">
							<s:text
									name="North" /></option>
							<option value="South"><s:text
									name="South" /></option>
							<option value="East"><s:text
									name="East" /></option>
							<option value="West"><s:text
									name="West" /></option>
					</select></td>


					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.region" />&nbsp;</font>
					</td>
					
					
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						name="region" tabindex="14" class="mediumselect">
							<option value="Maharashtra"><s:text
									name="Maharashtra" /></option>
							<option value="Gujrat"><s:text
									name="Gujrat" /></option>
					</select></td>
					
					
				</tr>
				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.grace.prd.yn" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri"><input type="radio" value="V1"
							name="gracePrdYn" class="radiobutton"> </font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="gracePrdYn"
						class="radiobutton" value="V2"><font size="2"> <s:text
								name="global.lbl.no" /></font>&nbsp;
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;&nbsp;<s:text
								name="global.lbl.grace.prd" />&nbsp;
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
						<input type="text" name="gracePrd" class="verySmallTxtLeft">&nbsp;Days
					</td>
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


				<tr height="25" bgcolor="#C4C4FF">
					<td width="15%" align="left"><font face="Calibri" size="2"
						color="#595959"><b>&nbsp;&nbsp;<s:text
									name="global.lbl.global.validations" /></b></font></td>
					<td width="18%"></td>
					<td width="15%" align="right"><font face="Calibri" size="2"
						color="#595959"><b></b></font></td>
					<td width="18%"></td>
					<td width="15%" align="right"><font face="Calibri" size="2"
						color="#595959"><b></b></font></td>
					<td width="18%"></td>
				</tr>



				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.country.type" />&nbsp;</font>
					</td>
				<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
						name="countryType" tabindex="14" class="mediumselect">
							<option value="Asia Pacific"><s:text
									name="Asia Pacific" /></option>
							<option value="North American"><s:text
									name="North American" /></option>
							<option value="South American"><s:text
									name="South American" /></option>
					</select></td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.ecgc.cover.yn" />&nbsp;</font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri"> &nbsp;<input type="radio" value="V15"
							name="ecgcCoverYn" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="ecgcCoverYn"
						class="radiobutton" value="V16"><font size="2"><s:text
								name="global.lbl.no" /></font>&nbsp;</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.restricted.yn" />&nbsp;</font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri"> &nbsp;<input type="radio" value="V15"
							name="restrictedYn" class="radiobutton" checked></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" name="restrictedYn"
						class="radiobutton" value="V16"><font size="2"><s:text
								name="global.lbl.no" /></font>&nbsp;</td>
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



				<tr height="25" bgcolor="#9999FF">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="submit" value=" <s:text name="global.btn.save"/> "
						class="button" tabindex="31">
					</td>
					<td width="20%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="<s:text name="global.btn.cancel"/>"
						class="button" onclick="javascript:CountryMaster();">
					</td>
					<td width="20%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
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