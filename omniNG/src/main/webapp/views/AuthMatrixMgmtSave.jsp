<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/stylesheet.css" />">
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/AuthMatrixMgmtSave.js"></script>
<script type="text/javascript">
	$(function() {
		$("#idAuthEvents").focus();
	});
</script>

</head>

<body bgcolor="#F5F5F3" topmargin="0">
	<form name="authMatrixMgmtSave" action="AuthMatrixMgmtSave" method="post">

		<div>
			<input type="hidden" name="authEvent1" id="idAuthEventList">
			<input type="hidden" name="vToken">
		</div>
		<div id="idPageTitle" class="pageTitle" style="display: block">
			&nbsp;
			<s:text name="global.page.title.auth.matrix"></s:text>
		</div>
		<div id="idErrMsg" class="errorDiv" style="display: none">
			<s:text name="errMsg"></s:text>
		</div>
		<div id="idErrTbl" class="errorDiv" style="display: none">
			<p id="el"></p>
		</div>
		<table>
			<tr>
				<td width="100%"></td>
			</tr>
		</table>
		<table width="100%" cellpadding="0" cellspacing="0">
			<tr height="35" bgcolor="#0000FF">
				<td width="25%" valign="middle" colspan="4" bgcolor="#0000FF"
					valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
					face="Calibri" size="2" color="#FFFFFF"></font>
				</td>

			</tr>
			<tr>
				<td><input type="hidden" name="vToken" /></td>
			</tr>
			<tr>

				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
					face="Calibri" size="2"> <s:text name="global.lbl.event" />
				</font></td>

				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					<select id="idAuthEvents" name="authEvents" tabindex="1">
						<c:forEach var="event" items="${authEvent1}">
							<option value="${event.id}">${event.authEventCode}:
								${event.authEventName}</option>
						</c:forEach>
				</select>
				</td>


				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
					face="Calibri" size="2">&nbsp;<s:text name="global.lbl.name" />&nbsp;
				</font></td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<input type="text" id="idAuthMatrixName" tabindex="2"
					name="authMatrixName" size="30"
					style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				</td>
			</tr>
			<tr>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<font face="Calibri" size="2"><s:text
							name="global.lbl.branches" /></font>
				</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<select multiple="multiple" name="branch" id="idBranch" size="5"
					tabindex="3">
						<c:forEach var="branch" items="${branches1}">
							<option value="${branch.id}">${branch.branchCode}:
								${branch.branchName}</option>
						</c:forEach>
				</select>
				</td>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
					face="Calibri" size="2">&nbsp;<s:text
							name="global.lbl.auth.matrix.currency" />&nbsp;
				</font></td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<select
					multiple="multiple" name="currency" id="idCurrency" size="5"
					tabindex="4">
						<c:forEach var="currency" items="${currency1}">
							<option value="${currency.id}">${currency.currencyISOCode}
								: ${currency.currencyName}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<font face="Calibri" size="2"><s:text
							name="global.lbl.eff.from" />&nbsp;</font>
				</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<input type="text" id="idEffFrom" name="effFromDate" tabindex="5"
					placeholder="dd-mm-yyyy">
				</td>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					<font face="Calibri" size="2">&nbsp;&nbsp;<s:text
							name="global.lbl.eff.till" />&nbsp;
				</font>
				</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
					type="text" name="effTillDate" id="idEffTill" tabindex="7"
					placeholder="dd-mm-yyyy">
				</td>
			</tr>

			<tr>
				<td width="20%" align="center">&nbsp;</td>
				<td width="30%" align="right">&nbsp; <input type="submit"
					tabindex="28" class="button"
					value="<s:text name="global.btn.save"/>">
				</td>
			</tr>
		</table>
	</form>

	<script type="text/javascript">
		new FormValidator(
				'authMatrixMgmtSave',
				[ {
					name : 'authMatrixName',
					display : 'Authmatrix name',
					rules : 'required'
				}, {
					name : 'branch',
					display : 'branch',
					rules : 'required'
				}, {
					name : 'currency',
					display : 'currency',
					rules : 'required'
				}, {
					name : 'effFromDate',
					display : 'Eff from date',
					rules : 'required'
				},

				],
				function(errors, evt) {

					if (errors.length > 0) {
						var errorString = '';
						document.getElementById("idErrTbl").style.display = "inline";
						for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
							errorString += errors[i].message + '<br />';
						}

						document.getElementById("el").innerHTML = errorString;
					}
				});
	</script>
</body>

</html>
