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
	function VillageMaster()
	{
		window.location.href ="<s:url value="VillageMaster"/>";
	}
	function getMandalCode() {
		//alert(1);
		alert("1");
		alert("value of mandal code"+document.getElementById("mandalCode").value);
		//alert("value of mandalcode "+document.getElementById("mandalCode").value);
		
		//alert("ID: " + document.getElementById("id").value);
		//document.forms["formHomeId"].submit();
	}
</script>

</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="frmSubDivisionMaster" id="idfrmSubDivisionMaster"
			method="POST" action="AddVillageSave">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td width="20%"><font face="Calibri" size="2" color="#CC0000">
							&nbsp;&nbsp;&nbsp;</font><font face="Calibri" color="#CC0000">
							VILLAGE MASTER | CREATE </font></td>
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
								name="global.lbl.division" /></font>
					</td>

					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="division" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> &nbsp; <img alt="Search"
						src="media/icons/search.png" width="16" height="16"> <input
						type="text" name="division" size="40"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> 

					</td>
				</tr>
				<tr>

					 <td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.val.district" /></font>
					</td>

					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="district" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> &nbsp; <img alt="Search"
						src="media/icons/search.png" width="16" height="16">  <input
						type="text" name="T20" size="40"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> 

					</td>
 
 						<%-- <td>
 						<s:select label="global.val.district" multiple="true" name="districts1" size="4" 
								  list="districts1" listKey="id" listValue="districtCode+'-'+districtName" emptyOption="false"
								  style="font-family: Calibri; font-size: 10pt; width:200px" />
 						</td> --%>
				</tr>

				<tr>
				
				<%--  <td>
 						<s:select label="global.lbl.munciple.or.block" multiple="true" name="subDivisionThana" size="4" 
								  list="municipalitys1" listKey="id" listValue="thanaCode+'-'+thanaName" emptyOption="false"
								  style="font-family: Calibri; font-size: 10pt; width:200px" />
 						</td>  --%>
				
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.subdivision.or.thana" /></font>
					</td>

					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="subDivisionThana" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> &nbsp; <img alt="Search"
						src="media/icons/search.png" width="16" height="16">  <input
						type="text" name="T20" size="40"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required>
 
					</td> 
				</tr>
				<tr>

					<%--  <td>
 						<s:select label="global.lbl.subdivision.or.thana" multiple="true" name="municipalitys2" size="4" 
								  list="municipalitys1" listKey="id" listValue="municipalityCode+'-'+municipalityName" emptyOption="false"
								  style="font-family: Calibri; font-size: 10pt; width:200px" />
 						</td>
  --%>

				 <td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.munciple.or.block" /></font>
					</td>

					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="munciple" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> &nbsp; <img alt="Search"
						src="media/icons/search.png" width="16" height="16">  <input
						type="text" name="T20" size="40"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required>
 
					</td> 

				</tr>

				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.village.ward.code" /></font>
					</td>

					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="villageCode" size="10"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required> &nbsp; <input type="button"
						value="<s:text name="global.ref.verify"/>" class="button"
						onclick="javascript:VillageMaster();">
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

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.village.or.ward.description" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="villageName" size="40"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						required></td>

				</tr>

<%-- <tr>
		
	<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
	align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
	<s:select tabindex="7" label="global.lbl.mandal.code" multiple="false" name="mandalCode" size="1" 
				  list="mandalCodeValueList" listKey="id"  emptyOption="false" 
				  style="font-family: Calibri; font-size: 10pt; width:200px" /> 
	</td> 
</tr>

				<tr> 
					<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
						<s:select tabindex="7" label="global.lbl.revenue.village.cd" multiple="false" name="revenueVillCode" size="1" 
 								  list="revenueVillCodeList" listKey="id"  emptyOption="false" 
 								  style="font-family: Calibri; font-size: 10pt; width:200px" /> 
					</td> 
				</tr>
				
				<tr>
				<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
						<s:select tabindex="7" label="global.lbl.revenue.village.cd" multiple="false" name="blockCode" size="1" 
 								  list="blockCodeList" listKey="id"  emptyOption="false" 
 								  style="font-family: Calibri; font-size: 10pt; width:200px" /> 
					</td> 
				
				</tr>
				
				<tr>
				 <td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
						<s:select tabindex="7" label="global.lbl.service.area.code"
							multiple="false" name="serviceAreaCode" size="1" list="serviceAreaCodeList"
							listKey="id"
							emptyOption="false"
							style="font-family: Calibri; font-size: 10pt; width:200px" />
					</td>
				</tr> --%>
				
				
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.mandal.code" />&nbsp;</font>
					</td>
					<td required width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="mandalCode"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>-Select[1001]-</option>
							<option>-Select[1002]-</option>
							<option>-Select[1003]-</option>
							<option>-Select[1004]-</option>
					</select>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.revenue.village.cd" />&nbsp;</font>
					</td>
					<td required width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="revenueVillCode"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>-Select[1001]-</option>
							<option>-Select[1002]-</option>
							<option>-Select[1003]-</option>
							<option>-Select[1004]-</option>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.block.code" />&nbsp;</font>
					</td>
					<td required width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="blockCode"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>-Select[1001]-</option>
							<option>-Select[1002]-</option>
							<option>-Select[1003]-</option>
							<option>-Select[1004]-</option>
					</select>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.service.area.code" />&nbsp;</font>
					</td>
					<td required width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="serviceAreaCode"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>-Select[1001]-</option>
							<option>-Select[1002]-</option>
							<option>-Select[1003]-</option>
							<option>-Select[1004]-</option>
					</select>
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

				<tr height="25" bgcolor="#9999FF">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>

					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;

						<input type="submit" value="<s:text name="global.btn.save"/>"
						class="button"> &nbsp;
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
	<script type="text/javascript">
		$('#idfrmLookupCode').parsley();
		
	</script>
</body>

</html>