<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="../menucss/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>
<style>
</style>
<script language="javascript">
	function addParams() {
		window.location.href = "<s:url value="ParamLoanAccntAdd"/>";
	}

	function edit() {
		/* 	alert("1");
			alert("ID: " + document.getElementById("id").value); */
		document.forms["formHomeId"].submit();
	}
	function disable() {
		/* alert("2");
		alert("ID: " + document.getElementById("id").value); */
		document.forms["formHomeId"].submit();
	}
	function search() {
		/* alert("2");
		alert("ID: " + document.getElementById("id").value); */
		document.forms["formHomeId"].submit();
	}
	function startUp() {
	}
</script>
</head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formHome" id="formHomeId">
			<div>
				<input type="hidden" name="vToken">
			</div>
			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text name="global.lbl.manage.loan.ac" /></font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#000000"></font><font
						face="Calibri" size="2" color="#CC0000">&nbsp;&nbsp;</font></td>

				</tr>
			</table>
			<table id="idTblTxn" width="100%" height="100%" cellpadding="0"
				cellspacing="0">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="5" width="100%" bgcolor="#FFFFFF"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFff">
					<td width="20%">
						<p align="left">
							<font face="Calibri" size="2">&nbsp; <input tabindex="1"
								type="button" value="<s:text name="global.btn.add.params"/>"
								class="bigbtn" onclick="javascript:addParams();"></font> <font
								face="Calibri" size="2">&nbsp;</font>
					</td>
					<td width="50%"><font face="Calibri" size="2"><select
							tabindex="2" size="1" name="searchBy" 
							style="font-family: Calibri; font-size: 10pt; color: #808080; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<option><s:text name="global.val.search.by" />...
								</option>
								<option><s:text name="global.val.product.code" /></option>
								<option><s:text name="global.val.product.name" /></option>
								<option><s:text name="global.val.loan.type" /></option>
								<option><s:text name="global.val.disabled" /></option>
						</select> <input type="text" name="T1" size="30"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<s:url id="searchURL"	action="ParamLoanAccntListSearch">
							<s:param name="searchBy" value="%{searchBy}"></s:param>
										</s:url> <s:a href="%{searchURL}">Disable</s:a> &nbsp;&nbsp; <a
										href="" onclick="javascript:search();"> </a>
							
							<%-- <input tabindex="3" type="button"
							value="<s:text name="global.btn.go"/>" name="B1" class="smallbtn">&nbsp; --%></font></td>


				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="5" width="100%"></td>
				</tr>
				<tr height="300">
					<td valign="top" align="left" width="100%" colspan="5">
						<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0"
							border="0" bordercolor="lightgray">
							<tr height="25" bgcolor="#FF9966" id="idTRTitlerow"
								valign="middle">
								<td width="0%" align="left"></td>
								<td width="20%" align="left"><b><font face="Calibri"
										size="2">&nbsp;&nbsp;<s:text name="global.lbl.loantype" /></font></b></td>

								<td width="20%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;&nbsp;</b></font><b><font face="Calibri"
										size="2"><s:text name="global.lbl.product" /></font></b></td>

								<td width="15%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;<s:text
												name="global.lbl.effectivedate" /></b></font>
								<td width="15%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;<s:text
												name="global.lbl.effective.tilldate" /></b></font></td>
								<td width="30%" align="center"><font face="Calibri"
									size="2"><b><s:text name="global.lbl.action" /></b></font></td>
							</tr>


							<s:iterator value="paramLoanAc">
								<%-- <s:iterator value="products"> --%>

								<tr height="25" id="idTRDatarow" valign="middle">
									<td width="0%" align="left" class="trList"><s:hidden
											value="id" /></td>



									<td width="20%" align="left" class="trList"><font
										face="Calibri" size="2">&nbsp;&nbsp; <s:property
												value="loanType" />
									</font></td>
									<td width="20%" align="center" class="trList"><font
										face="Calibri" size="2">&nbsp;&nbsp;<s:property
												value="prodCode" /></font></td>


									<td width="15%" align="center" class="trList"><font
										face="Calibri" size="2">&nbsp;&nbsp;<s:property
												value="effectiveFrom" /></font></td>
									<td width="15%" align="center" class="trList"><font
										face="Calibri" size="2">&nbsp;&nbsp;<s:property
												value="effectiveTill" /></font></td>
									<td class="trList" width="30%" align="center"><s:url
											id="editURL" action="ParamLoanAccntEdit">
											<s:param name="id" value="%{id}"></s:param>
										</s:url> <s:a href="%{editURL}">Edit</s:a> &nbsp;&nbsp; <a href=""
										onclick="javasript:edit();"></a> <s:url id="enableURL"
											action="ParamLoanAccntEnable">
											<s:param name="id" value="%{id}"></s:param>
										</s:url> <s:a href="%{enableURL}">Enable</s:a> &nbsp;&nbsp; <a
										href="" onclick="javasript:disable();"> </a></td>

								</tr>
							</s:iterator>
							<%-- </s:iterator> --%>
						</table>

					</td>
				</tr>
			</table>


		</form>

	</div>
</body>

</html>