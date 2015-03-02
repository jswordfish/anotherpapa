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
function addLoanType()
{
	window.location.href = "<s:url value= "addLoanType"/>";
}
function editMember()
{
	window.location.href = "<s:url value="addLoanType"/>";
}
function startUp(){
}
function edit(){
	
	alert("ID: " + document.getElementById("id").value);
	document.forms["formHomeId"].submit();
}
function disable(){
	
	alert("ID: " + document.getElementById("id").value);
	document.forms["formHomeId"].submit();
}
</script>
</head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">

		<form name="formHome" id="formHomeId">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text name="global.lbl.manage.loan.types" /></font></td>
					<td width="60%" bgcolor="#FFFF99">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#000000">SUCCESS or FAILURE
							message with green or red background</font><font face="Calibri" size="2"
						color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri"><s:text
										name="global.lbl.branch.code" />&nbsp;: 02</font></b>
					</td>
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
							<font face="Calibri" size="2">&nbsp; <input type="button"
								value="<s:text name="global.btn.add.loan.type"/>" class="bigbtn"
								onclick="javascript:addLoanType();"></font> <font
								face="Calibri" size="2">&nbsp;</font>
					</td>
					<td width="50%"><font face="Calibri" size="2"><select
							name="D1" class="dropDown">
								<option selected><s:text name="global.val.search.by" />...
								</option>
								<option><s:text name="global.val.purpose.code" /></option>
								<option><s:text name="global.val.purpose.description" /></option>
								<option><s:text name="global.val.disabled" /></option>
						</select> <input type="text" name="T1" size="30"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<input type="button" value="<s:text name="global.btn.go"/>"
							name="B1" class="button">&nbsp;</font></td>
					<td width="20%" colspan="2">
						<p align="center">
							<font face="Calibri" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1
								- 10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font> <font face="Calibri"
								size="2">&nbsp;</font>
					</td>
					<td width="10%" align="center">&nbsp;<font color="#00CC00"><u><a
								target="_blank" href="SAMPLE_DOWNLOAD_XLS.txt"><font
									color="#00CC00">PDF</font></a></u></font>&nbsp;&nbsp;<font color="#00CC00"><u>CSV</u></font>&nbsp;&nbsp;<font
						color="#00CC00"><u>XLS</u></font></td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="5" width="100%"></td>
				</tr>
				<tr height="300">
					<td valign="top" align="left" width="100%" colspan="5">
						<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0">
							<tr height="25" bgcolor="#FF9966" id="idTRTitlerow"
								valign="middle">
								<td width="5%" align="center"></td>
								<td width="35%" align="center"><b><font face="Calibri"
										size="2">&nbsp;&nbsp;<s:text
												name="global.lbl.loan.type.code" /></font></b></td>
								<td width="35%" align="center"><font face="Calibri" size="2"><b>&nbsp;&nbsp;</b></font><b><font
										face="Calibri" size="2"><s:text
												name="global.lbl.description" /></font></b></td>
								<td width="25%" align="center"><font face="Calibri"
									size="2"><b><s:text name="global.lbl.action" />.</b></font></td>
							</tr>

							<tr height="1" bgcolor="#FFFFFF">
							</tr>
                            <s:iterator value="loanType">
								<tr>
									<td width="5%" align="center"><s:hidden value="id" /></td>
									<td width="35%" align="center"><s:property value="loanTypeCode" /></td>
									<td width="35%" align="center"><s:property value="loanTypeDesc" /></td>
									

									<td width="25%" align="center"><s:url id="editURL" action="LoanTypeMstEdit">
											<s:param name="id" value="%{id}"></s:param>
										</s:url> <s:a href="%{editURL}">Edit</s:a> &nbsp;&nbsp; <a href=""
										onclick="javasript:edit();"> <%-- <s:text name="global.lbl.disable" /> --%>
									</a> <s:url id="disableURL" action="LoanTypeMstDisable">
											<s:param name="id" value="%{id}"></s:param>
										</s:url> <s:a href="%{disableURL}">Disable</s:a> &nbsp;&nbsp; <a
										href="" onclick="javasript:disable();"> </a></td>
								</tr>

							</s:iterator>
						</table>

					</td>
				</tr>
			</table>


		</form>

	</div>
</body>

</html>