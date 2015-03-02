<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <jsp:useBean id="nationalityBean" class="com.infrasofttech.bean.NationalityBean" /> --%> <!-- refer example for fetching drop downs from bean -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesheet.css" />" /><!-- for text-fields and labels -->
<link rel="stylesheet" href="<c:url value="/css/jquery-ui.css" />" /><!-- for date  -->
<script src="/js/validate.js" type="text/javascript"></script><!-- for front end validation -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<!-- All internal validations -->
<script language="javascript">

	function startUp() {
		document.getElementById("idChangeBranch").focus();
	}

</script>

</head>

<body>
	<form id="omniform" method="POST" action="changeBranchUpdate">
		<div><input type="hidden" name="vToken"></div>
		<div id="idPageTitle" class="pageTitle" style="display:block">&nbsp;<s:text name="global.pagetitle.changebranch"></s:text></div>
		<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
		<div  id="idErrTbl"  class="errorDiv" style="display:none"><p id="el"></p>
		</div>
		<div align="center">

			<!-- Main Body -->
			<table width="50%">
				<tr>
					<td width="50%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">
						<font face="Calibri" size="2">&nbsp;<s:text name="global.lbl.changebranch"/>&nbsp;
						</font>
					</td>
					<td width="50%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
						<input tabindex="1" id="idChangeBranch" name="changebranch" size="20" type="text">
						
						<select size="1" name="branch" id="idBranch" tabindex="1"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<c:forEach var="branch" items="${branches1}">
									<option value="${branch.branchCode}">${branch.branchCode}:${branch.branchName}</option>
								</c:forEach>

						</select>
					</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="20%">&nbsp;
					</td>
					<td width="50%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
							<input type="submit" value=" <s:text name="global.btn.changebranch"/> "
								id="idUpdate" class="button" tabindex="2" >					
					</td>
				</tr>
			</table>

		</div>
	</form>
	<%-- <script type="text/javascript">
		/* 	new FormValidator(
					'frmLogin',
					[ {
						name : 'brCode',
						display : 'branch code',
						rules : 'required|numeric'
					}, {
						name : 'loginId',
						display : 'Login Id',
						rules : 'required|alpha_numeric|min_length[4]'
					},],
					function(errors, evt) {

						if (errors.length > 0) {
							var errorString = '';
							document.getElementById("idErrTbl").style.display = "inline";
							for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
								errorString += errors[i].message + '<br />';
							}

							el.innerHTML = errorString;
						}
					}); */
	</script> --%>

</body>
</html>