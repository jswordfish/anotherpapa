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
<style>
</style>
<script language="javascript">
	function startUp() {
	}

	function basicInfo() {
		document.getElementById("idBasicInfo").style.display = "block";
		document.getElementById("idAssetDtls").style.display = "none";
		document.getElementById("idNomineeDtls").style.display = "none";
		document.getElementById("idShareDtls").style.display = "none";
		document.getElementById("idCellBasicInfo").style.color = "red";
		document.getElementById("idCellAssetDtls").style.color = "black";
		document.getElementById("idCellNomineeDtls").style.color = "black";
		document.getElementById("idCellShareDtls").style.color = "black";
	}
	function assetDtls() {
		document.getElementById("idBasicInfo").style.display = "none";
		document.getElementById("idAssetDtls").style.display = "block";
		document.getElementById("idNomineeDtls").style.display = "none";
		document.getElementById("idShareDtls").style.display = "none";
		document.getElementById("idCellBasicInfo").style.color = "black";
		document.getElementById("idCellAssetDtls").style.color = "red";
		document.getElementById("idCellNomineeDtls").style.color = "black";
		document.getElementById("idCellShareDtls").style.color = "black";
	}
	function nomineeDtls() {
		document.getElementById("idBasicInfo").style.display = "none";
		document.getElementById("idAssetDtls").style.display = "none";
		document.getElementById("idNomineeDtls").style.display = "block";
		document.getElementById("idShareDtls").style.display = "none";
		document.getElementById("idCellBasicInfo").style.color = "black";
		document.getElementById("idCellAssetDtls").style.color = "black";
		document.getElementById("idCellNomineeDtls").style.color = "red";
		document.getElementById("idCellShareDtls").style.color = "black";
	}
	function shareDtls() {
		document.getElementById("idBasicInfo").style.display = "none";
		document.getElementById("idAssetDtls").style.display = "none";
		document.getElementById("idNomineeDtls").style.display = "none";
		document.getElementById("idShareDtls").style.display = "block";
		document.getElementById("idCellBasicInfo").style.color = "black";
		document.getElementById("idCellAssetDtls").style.color = "black";
		document.getElementById("idCellNomineeDtls").style.color = "black";
		document.getElementById("idCellShareDtls").style.color = "red";
	}
	function successMessage() {
		document.getElementById("idSuccessMessage").style.display = "inline";
	}
</script>
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">

		<form name="formHome" id="formHomeId">

			<table width="100%" cellpadding="0" cellspacing="0">
				<tr bgcolor="#FFFFFF" height="25">
					<td colspan="3" width="50%" bgcolor="#FFFF99"><b> <font
							face="Calibri" size="2">&nbsp;</font><font face="Calibri">&nbsp;</font></b><font
						face="Calibri" color="#003399"><s:text
								name="global.lbl.new.member.registration" /> </font> <font size="2"
						color="#595959" face="Calibri">(PACS &gt; Masters)</font></td>
					<td colspan="3" width="50%" bgcolor="#FFFF99">
						<p align="right">
							<b> <font face="Calibri" size="2" color="#595959"><s:text
										name="global.lbl.branch.code" /> : </font> <font face="Calibri"
								size="2" color="#003399"> <s:text
										name="global.lbl.branch.code" />02
							</font></b><font face="Calibri" size="2" color="#003399">, <b>Talegaon
									Primary Agriculture Credit Society&nbsp;&nbsp;</b></font>
					</td>
				</tr>
				<tr bgcolor="#FFFF99">
					<td colspan="6" width="100%">
						<p align="center" style="display: none" id="idSuccessMessage">
					</td>
				</tr>
				<tr height="25">
					<td width="10%" bgcolor="#808080"
						style="border-bottom-style: solid; border-bottom-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
					<td width="20%" bgcolor="#CCFFFF" align="center"
						id="idCellBasicInfo"
						style="border-left: 1px solid #0000FF; border-right: 1px solid #0000FF; border-top: 1px solid #0000FF; color =#000000; border-bottom-style: solid; border-bottom-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><b>
							<font face="Calibri" size="2"> <a
								href="javascript:basicInfo();" style="text-decoration: none"><s:text
										name="global.lbl.basic.information" /></a></font>
					</b></td>
					<td width="20%" bgcolor="#CCFFFF" align="center"
						id="idCellAssetDtls"
						style="border-right: 1px solid #0000FF; border-top: 1px solid #0000FF; border-bottom-style: solid; border-bottom-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><b>
							<font face="Calibri" size="2"> <a
								href="javascript:assetDtls();" style="text-decoration: none"><s:text
										name="global.lbl.asset.details" /></a></font>
					</b></td>
					<td width="20%" bgcolor="#CCFFFF" align="center"
						id="idCellNomineeDtls"
						style="border-right: 1px solid #0000FF; border-top: 1px solid #0000FF; border-bottom-style: solid; border-bottom-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><b>
							<font face="Calibri" size="2"> <a
								href="javascript:nomineeDtls();" style="text-decoration: none"><s:text
										name="global.lbl.nominee.details" /></a></font>
					</b></td>
					<td width="20%" bgcolor="#CCFFFF" align="center"
						id="idCellShareDtls"
						style="border-right: 1px solid #0000FF; border-top: 1px solid #0000FF; border-bottom-style: solid; border-bottom-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><b>
							<font face="Calibri" size="2"> <a
								href="javascript:shareDtls();" style="text-decoration: none"><s:text
										name="global.lbl.share.details" /></a></font>
					</b></td>
					<td width="10%" bgcolor="#808080"
						style="border-bottom-style: solid; border-bottom-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
				</tr>
			</table>
			<div align=justify id="idBasicInfo" style="display: none">
				<table width="100%" align="left" cellpadding="1" cellspacing="1">
					<tr height="100%">
						<td width="100%" height="100%"
							style="border-bottom-style: solid #000080; border-bottom-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<table width="100%" align="center" cellpadding="0"
								cellspacing="0">
								<tr height="10">
									<td><font face="Calibri" size="2">&nbsp;</font></td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.member.id" />:&nbsp;</b></font></td>
									<td width="18%"><input type="text" name="txtLabel1"
										size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
									</td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.member.type" />:&nbsp;</b></font></td>
									<td width="18%"><input type="text" name="txtLabel2"
										size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
									</td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.gender" />:&nbsp;</b></font></td>
									<td width="18%"><input type=radio name="rdoGender"
										value="M" checked><font face="Calibri" size="2">&nbsp;<s:text
												name="global.lbl.male" /></font> <input type=radio
										name="rdoGender" value="F"><font face="Calibri"
										size="2">&nbsp;<s:text name="global.lbl.female" /></font></td>
								</tr>

								<tr bgcolor="#F4F4F4">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.customer.name" />:&nbsp;</b></font></td>
									<td width="18%"><select size="1" name="D1"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.select" />...
											</option>
											<option><s:text name="global.val.mr" /></option>
											<option><s:text name="global.val.ms" /></option>
											<option><s:text name="global.val.mrs" /></option>
											<option><s:text name="global.val.dr" /></option>
									</select></td>
									<td width="15%" align="right"><input name="txtLabel3"
										size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"></td>
									<td width="18%"><input type="text" name="txtLabel2"
										size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
									</td>
									<td width="15%" align="right"><input type="text"
										name="txtLabel4" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><font
										face="Calibri" size="2" color="#595959"><b>&nbsp;</b></font></td>
									<td width="18%">&nbsp;</td>
								</tr>

								<tr bgcolor="#FFFFFF">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.member.DOB" />:&nbsp;</b></font></td>
									<td width="18%">&nbsp;<input name="txtLabel31" size="15"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
										&nbsp;<img border="0" src="../media/icons-small/calendar.gif"
										width="16" height="16">
									</td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.marital.status" />:&nbsp;</b></font></td>
									<td width="18%"><select size="1" name="D11"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.select" />...
											</option>
											<option><s:text name="global.val.single" /></option>
											<option selected><s:text name="global.val.married" /></option>
									</select></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.nationality" />:&nbsp;</b></font></td>
									<td width="18%"><select size="1" name="D11"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.select" />...
											</option>
											<option selected><s:text name="global.val.indian" /></option>
											<option><s:text
													name="global.val.non.resident.indian" /></option>
											<option><s:text name="global.val.foreigner" /></option>
									</select></td>
								</tr>

								<tr bgcolor="#F4F4F4">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.father.spouse.name" />:&nbsp;</b></font></td>
									<td width="18%">&nbsp;<input name="txtLabel31" size="25"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
									</td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.village.code" />:&nbsp;</b></font></td>
									<td width="18%">&nbsp;<input name="txtVillageCode"
										size="25"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
									</td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.member.registration" /> #:&nbsp;</b></font></td>
									<td width="18%">&nbsp;<input name="txtMemberReg" size="25"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
									</td>
								</tr>


								<tr bgcolor="#FFFFFF">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.caste" />:&nbsp;</b></font></td>
									<td width="18%"><select size="1" name="D11"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.select" />...
											</option>
											<option><s:text name="global.val.caste1" /></option>
											<option selected><s:text name="global.val.caste2" /></option>
									</select></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.caste.category" />:&nbsp;</b></font></td>
									<td width="18%"><select size="1" name="D11"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.select" />....
											</option>
											<option><s:text name="global.val.category1" /></option>
											<option selected><s:text name="global.val.category2" /></option>
									</select></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.mobile" />:&nbsp;</b></font></td>
									<td width="18%">&nbsp;<input name="txtMobile1" size="10"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
										&nbsp;<input name="txtMobile2" size="10"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
									</td>
								</tr>


								<tr bgcolor="#F4F4F4">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.additional.information" />:&nbsp;</b></font></td>
									<td width="85%" colspan="5">&nbsp;<input name="txtMobile1"
										size="60"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
									</td>
								</tr>

								<tr bgcolor="#FFFFFF">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.transaction.freeze" />:&nbsp;</b></font></td>
									<td width="18%"><font face="Calibri"> <input
											type="radio" value="Y" name="TFYN"></font><font size="2">&nbsp;<s:text
												name="global.lbl.yes" />&nbsp;&nbsp;
									</font><input type="radio" value="N" name="TFYN"><font
										size="2">&nbsp;<s:text name="global.lbl.no" />
									</font></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.reason" />:&nbsp;</b></font></td>
									<td width="52%" colspan="3">&nbsp;<input
										name="txtVillageCode0" size="25"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"></td>
								</tr>

							</table> <!-- ADDRESS DETAILS -->
							<table width="100%" cellpadding="0" cellspacing="0">

								<tr height="25" bgcolor="#C4C4FF">
									<td width="15%" align="left"><font face="Calibri" size="2"
										color="#595959"><b>&nbsp;&nbsp;<s:text
													name="global.lbl.address.details" /></b></font></td>
									<td width="18%"></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b></b></font></td>
									<td width="18%"></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b></b></font></td>
									<td width="18%"></td>
								</tr>

								<tr bgcolor="#FFFFFF">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.address.type" />:&nbsp;</b></font></td>
									<td width="18%"><select size="1" name="D11"
										style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
											<option><s:text name="global.val.select" />...
											</option>
											<option><s:text name="global.val.permanent" /></option>
											<option selected><s:text name="global.val.present" /></option>
									</select></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b></b></font></td>
									<td width="18%"></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b></b></font></td>
									<td width="18%"></td>
								</tr>

								<tr bgcolor="#FFFFFF">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b><s:text
													name="global.lbl.address" />:&nbsp;</b></font></td>
									<td width="18%">&nbsp;<input name="txtMobile1" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
									</td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b> <s:text
													name="global.lbl.village" />:
										</b></font></td>
									<td width="18%"><input name="txtMobile3" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b> <s:text
													name="global.lbl.state" />:
										</b></font></td>
									<td width="18%"><input name="txtMobile6" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"></td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b></b></font></td>
									<td width="18%">&nbsp;<input name="txtMobile1" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
									</td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b> <s:text
													name="global.lbl.municipality" />:
										</b></font></td>
									<td width="18%"><input name="txtMobile4" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b> <s:text
													name="global.lbl.country" />:
										</b></font></td>
									<td width="18%"><input name="txtMobile7" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"></td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b></b></font></td>
									<td width="18%">&nbsp;<input name="txtMobile1" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left">
									</td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b> <s:text
													name="global.lbl.district.city" />:
										</b></font></td>
									<td width="18%"><input name="txtMobile5" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#595959"><b> <s:text
													name="global.lbl.pincode" />:
										</b></font></td>
									<td width="18%"><input name="txtMobile8" size="20"
										style="border: 1px solid #000000; font-family: Calibri; font-size: 10pt; color: #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float: left"></td>
								</tr>

								<tr height="25" bgcolor="#C4C4FF">
									<td width="15%" align="right">
									<td width="18%"></td>
									<td width="15%" align="right"><font face="Calibri"
										size="2" color="#000000"><b><u><s:text
														name="global.lbl.save.update" /></u></b></font></td>
									<td width="18%"></td>
									<td width="15%" align="right"></td>
									<td width="18%"></td>
								</tr>
							</table>
							<table width="100%" cellpadding="0" cellspacing="1">

								<tr height="25" bgcolor="#C4C4FF">
									<td width="10%" align="left"><font face="Calibri" size="2"
										color="#595959"><b><s:text
													name="global.lbl.address.type" /></b></font></td>
									<td width="30%" align="left"><font face="Calibri" size="2"
										color="#595959"><b><s:text
													name="global.lbl.address" /></b></font></td>
									<td width="10%" align="left"><font face="Calibri" size="2"
										color="#595959"><b><s:text
													name="global.lbl.village" /></b></font></td>
									<td width="10%" align="left"><font face="Calibri" size="2"
										color="#595959"><b><s:text
													name="global.lbl.district.city" /></b></font></td>
									<td width="10%" align="left"><font face="Calibri" size="2"
										color="#595959"><b><s:text name="global.lbl.state" /></b></font></td>
									<td width="10%" align="left"><font face="Calibri" size="2"
										color="#595959"><b><s:text
													name="global.lbl.country" /></b></font></td>
									<td width="20%" align="left"><font face="Calibri" size="2"
										color="#595959"><b><s:text name="global.lbl.action" /></b></font></td>
								</tr>
								<tr height="25" bgcolor="#FFFFFF">
								</tr>

							</table> <br>
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr bgcolor="#3366FF">
									<td width="15%" align="right"></td>
									<td width="18%" align="right"></td>
									<td width="15%" align="right"><input type="button"
										value="<s:text name="global.btn.next"/>" name="btnNext"
										onclick="javascript:assetDtls();"></td>
									<td width="18%"></td>
									<td width="	5%" align="right"></td>
									<td width="18%"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>

			<div align=justify id="idAssetDtls" style="display: none">
				<table width="100%">
					<tr>
						<td colspan="6" width="100%"><s:text
								name="global.lbl.asset.details" /></td>
					</tr>
					<tr id="idNomineeDtls" style="display: none">
						<td colspan="6" width="100%"><s:text
								name="global.lbl.nominee.details" /></td>
					</tr>
					<tr id="idShareDtls" style="display: none">
						<td colspan="6" width="100%"><s:text
								name="global.lbl.share.details" /></td>
					</tr>
				</table>
			</div>
		</form>

	</div>
</body>

</html>