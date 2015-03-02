<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<link href="../menucss/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>
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
<style>
</style>
<script language="javascript">

function startUp(){
}

function save(){
	alert("User Password Updated Successfully");
	window.location.href = "<s:url value="UserMgmt"/>";
}

function cancel(){
	window.location.href = "<s:url value="UserMgmt"/>";
}

</script>
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<form name="formHome" id="formHomeId">

		<table id="idTblTitle" width="100%" height="26" cellpadding="0"
			cellspacing="1">
			<tr height="1" bgcolor="#FFFFFF">
				<td colspan="3" width="100%"></td>
			</tr>
			<tr height="25" bgcolor="#FFFFFF">
				<td colspan="1" width="20%"><font face="Calibri" size="2"
					color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
					color="#CC0000"><s:text
							name="global.lbl.assign.new.password" /></font></td>
				<td width="60%" bgcolor="#FFFF99">&nbsp;<font
					face="Wingdings 2" size="2" color="#000000"> </font><font
					face="Calibri" size="2" color="#CC0000">&nbsp;&nbsp;</font></td>
				<td width="20%" bgcolor="#FFFFFF">
					<p align="center">
						<b><font size="2" face="Calibri"><s:text
									name="global.lbl.branch.code" />&nbsp;: 02</font></b>
				</td>
			</tr>
		</table>

		<table border="0" width="1024" align="center" cellspacing="0"
			height="100%">
			<tr height="400" bgcolor=#FFFFFF>
				<td align="center" valign="top">

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
													name="global.lbl.user.code" />&nbsp;</font>
										</td>
										<td bgcolor="#FFFFFF" width="25%"
											style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" name="D7"
											style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
												<option><s:text name="global.val.select.user" />...
												</option>
												<option selected>Mohan Yadav</option>
												<option>Shyam Mishra</option>
										</select>
										</td>
										<td bgcolor="#CCCCFF" width="25%" align="right"
											style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<font face="Calibri" size="2"><s:text
													name="global.lbl.user.name" />&nbsp;</font>
										</td>
										<td bgcolor="#FFFFFF" width="25%"
											style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="text" tabindex="1" id="idTxtPurposeCode12"
											name="txtPurposeCode12" size="25"
											style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; background-color: #C0C0C0"
											value="Mohan Yadav">
										</td>
									</tr>
									<tr>
										<td bgcolor="#CCCCFF" width="25%" align="right"
											style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<font face="Calibri" size="2"><s:text
													name="global.lbl.new.password" />&nbsp;</font>
										</td>
										<td bgcolor="#FFFFFF" width="25%"
											style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="password" tabindex="1" id="idTxtPurposeCode15"
											name="pwd" size="20"
											style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
											value="********">
										</td>
										<td bgcolor="#CCCCFF" width="25%" align="right"
											style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<font face="Calibri" size="2"><s:text
													name="global.lbl.repeat.password" />&nbsp;</font>
										</td>
										<td bgcolor="#FFFFFF" width="25%"
											style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="password" tabindex="1" id="idTxtPurposeCode16"
											name="txtPurposeCode16" size="20"
											style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
											value="********">
										</td>
									</tr>
								</table>

							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" cellspacing="0">
									<tr height="25" bgcolor="#9999FF">
										<td width="50%" align="right"
											style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
											<input type="button"
											value="<s:text name="global.btn.update"/>" class="button">
										</td>
										<td width="50%" align="left"
											style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
											<input type="button"
											value="<s:text name="global.btn.cancel"/>" class="button"
											onclick="javascript:cancel();">
										</td>
									</tr>
									<tr height="1">
										<td width="25%" align="left" colspan="4"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<!-- LIST -->
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</form>

	<script type="text/javascript">
		$('#formHomeId').parsley();
		
	</script>

</body>

</html>