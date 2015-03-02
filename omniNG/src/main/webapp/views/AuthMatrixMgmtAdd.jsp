<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/stylesheet.css" />">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
</head>
<script language="javascript">
	function add() {
		window.location.href = "<s:url value="AuthMatrixMgmtAdd"/>";
	}
	function edit() {
		window.location.href = "<s:url value="AuthMatrixMgmtAdd"/>";
	}
	function startUp() {
	}

	function disable() {
		alert("2");
		alert("ID: " + document.getElementById("id").value);
		document.forms["formHomeId"].submit();
	}
	function edit() {
		alert("1");
		alert("ID: " + document.getElementById("id").value);
		document.forms["formHomeId"].submit();
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Display tag Pagination and Sorting Example in JSP</title>
</head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">

	<form name="formHome" method="post" action="AuthMatrixMgmt"
		id="formHomeId">
		<div>
			<input type="hidden" name="vToken">
		</div>
		<div id="idPageTitle" class="pageTitle" style="display: block">
			&nbsp;
			<s:text name="global.page.title.auth.matrix.list"></s:text>
		</div>
		<div id="idErrMsg" class="errorDiv" style="display: none">
			<s:text name="errMsg"></s:text>
		</div>
		<div id="idErrTbl" class="errorDiv" style="display: none">
			<p id="el"></p>
		</div>
		<div>
			<table id="idTblTxn" width="100%" height="100%" cellpadding="0"
				cellspacing="0">

				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="5" width="100%" bgcolor="#FFFFFF"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td width="20%">
						<p align="left">
							<font face="Calibri" size="2">&nbsp; <input type="button"
								tabindex="1"
								value=" <s:text name="global.btn.add.auth.matrix" />"
								class="bigbtn" onclick="javascript:add();"></font> <font
								face="Calibri" size="2">&nbsp;</font>
					</td>
					<td width="50%"><font face="Calibri" size="2"> <select
							size="1" name="D1" tabindex="2">
								<option><s:text name="global.val.search.by" />...
								</option>
								<option><s:text name="global.val.name" /></option>
								<option><s:text name="global.val.event" /></option>
								<option><s:text name="global.val.effective.from" /></option>
								<option><s:text name="global.val.effective.till" /></option>
								<option><s:text name="global.val.disabled" /></option>
						</select> <input type="text" name="T1" size="30" tabindex="3"> <input
							type="button" value="<s:text name="global.btn.go"/>" name="B1"
							class="smallbtn" tabindex="4">&nbsp;
					</font></td>


				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="5" width="100%"></td>
				</tr>
				<tr height="300">
					<td valign="top" align="left" width="100%" colspan="5">
						<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0">

							<tr height="25" bgcolor="#FF9966" id="idTRTitlerow"
								valign="middle">
								<td width="0%" align="left"></td>

								<td width="20%" align="center"><b><font face="Calibri"
										size="2">&nbsp;&nbsp;<s:text name="global.lbl.name" /></font></b></td>
								<td width="20%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;&nbsp;</b></font><b><font face="Calibri"
										size="2"><s:text name="global.lbl.event" /></font></b></td>
								<td width="20%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;&nbsp;<s:text
												name="global.lbl.eff.from" />
									</b></font>
								<td width="20%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;<s:text name="global.lbl.eff.till" /></b></font>
								<td width="20%" align="center"><font face="Calibri"
									size="2"><b><s:text name="global.lbl.action" /></b></font></td>
							</tr>

							<s:iterator value="authMatrixs">
								<tr>
									<td width="0%" align="left" class="trList"><s:hidden
											value="id" /></td>
									<td align="center" class="trList"><s:property
											value="authMatrixName" /></td>
									<s:iterator value="authEvent">
										<td align="center" class="trList"><s:property
												value="authEventName" /></td>
									</s:iterator>
									<td align="center" class="trList"><s:property
											value="effFrom" /></td>
									<td align="center" class="trList"><s:property
											value="effTill" /></td>
									<td align="center" class="trList"><s:url id="editURL"
											action="">
											<s:param name="id" value="%{id}"></s:param>
										</s:url> <s:a href="%{editURL}">Edit </s:a>&nbsp;&nbsp; <a href=""
										onclick="javasript:edit();"></a> <s:url id="disableURL"
											action="AuthMatrixMgmtDisable">
											<s:param name="id" value="%{id}"></s:param>
										</s:url> <s:a href="%{disableURL}">Disable</s:a>&nbsp;&nbsp; <a
										href="" onclick="javasript:disable();"></a></td>
								</tr>
							</s:iterator>
						</table>
					</td>
				</tr>

			</table>
		</div>
	</form>

</body>

</html>