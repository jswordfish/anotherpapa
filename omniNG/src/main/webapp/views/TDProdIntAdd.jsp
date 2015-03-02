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

function startUp(){
//	document.getElementById("idTxtLoanTypeCode").focus();
}

function save(){
	alert("Record saved successfully");
	window.location.href = "<s:url value="TDProdIntMgmt"/>";
}

function cancel(){
	window.location.href = "<s:url value="TDProdIntMgmt"/>";
}
</script>
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formHome" id="formHomeId">
			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text name="global.lbl.td.interest.add" /></font></td>
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
											name="global.lbl.product" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri"> &nbsp;</font><select size="1" name="D1">
										<option><s:text name="global.val.select.member" />...
										</option>
								</select>
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;</td>
							</tr>

							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.from" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									&nbsp;<sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.effective.till" />&nbsp;&nbsp; </font>
								</td>
								<td bgcolor="#FFFFFF" width="25%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<sx:datetimepicker name="dateOfBirth"
										displayFormat="dd-MM-yyyy" />
								</td>
							</tr>
							<tr>
								<td bgcolor="#CCCCFF" width="25%" align="right"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
									<font face="Calibri" size="2"><s:text
											name="global.lbl.remarks" />&nbsp;</font>
								</td>
								<td bgcolor="#FFFFFF" width="75%"
									style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
									colspan="3">&nbsp;<input type="text" tabindex="1"
									id="idTxtPurposeCode5" name="txtPurposeCode5" size="70"
									style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
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
															name="global.lbl.interest.rate" /></font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24"><b>
													<font face="Calibri" size="2"><s:text
															name="global.lbl.penal.interest.rate" /></font>
											</b></td>
											<td bgcolor="#8A8AFF" align="center" height="24" width="128">&nbsp;</td>
										</tr>
										<tr>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idTxtPurposeCode26"
														name="txtPurposeCode26" class="smallTxtRightAlign">
											</td>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idTxtPurposeCode25"
														name="txtPurposeCode25" class="smallTxtRightAlign"
														value="7">
											</td>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idTxtPurposeCode13"
														name="txtPurposeCode13" class="smallTxtRightAlign"
														value="6.25">
											</td>
											<td>
												<p align="center">
													<input type="text" tabindex="1" id="idTxtPurposeCode14"
														name="txtPurposeCode14" class="smallTxtRightAlign"
														value="1.00">
											</td>
											<td width="128"><b><font face="Calibri" size="2">&nbsp;&nbsp;
														<u> <s:text name="global.lbl.add.update" /></u>
												</font></b></td>
										</tr>

									</table>
							<tr height="25" bgcolor="#8A8AFF">
								<td
									style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
									align="left" width="20%">&nbsp;</td>
								<td
									style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
									align="right" width="30%">&nbsp; <input type="submit"
									value="<s:text name="global.btn.save"/>" tabindex="19"
									class="button" align="middle" onclick="javascript:save();">
								</td>
								<td
									style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
									align="left" width="20%">&nbsp; <input
									value="<s:text name="global.btn.cancel"/>" tabindex="20"
									align="middle" class="button" onclick="javascript:cancel();"
									type="button">
								</td>
								<td
									style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
									align="left" width="30%">&nbsp;</td>
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
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<!-- LIST -->
						<table width="100%">
							<tr bgcolor="#FF9966" height="25">
								<td width="20%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.months" /></font></b></td>
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text name="global.lbl.days" /></font></b></td>
								<td width="10%" align="left" bgcolor="#8A8AFF">
									<p align="right">
										<b> <font face="Calibri" size="2">&nbsp;<s:text
													name="global.lbl.interest.rate" />&nbsp;
										</font></b>
								</td>
								<td width="10%" align="right" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.penal.interest.rate" /></font></b></td>
								<td width="10%" align="center" bgcolor="#8A8AFF"><b> <font
										face="Calibri" size="2"><s:text
												name="global.lbl.action" /></font></b></td>
							</tr>
							<tr bgcolor="#FFFFEE" height="25">

							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>

	</div>
	<script src="placeholders.js"></script>
</body>
</html>