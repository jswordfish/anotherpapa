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
	/***   add script***/
</script>

</head>

<body>
	<form id="omniform" method="POST" action="???">
		<div><input type="hidden" name="vToken"></div>
		<div id="idPageTitle" class="pageTitle" style="display:block">&nbsp;<s:text name="global.pageTitle.???"></s:text></div>
		<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
		<div  id="idErrTbl"  class="errorDiv" style="display:none">
			<p id="el">
			</p>
		</div>
		<div>

			<!-- Main Body -->

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