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
	/*** Add Script ***/
	function open1(){
		document.getElementById("mainId").style.display = "block";
	}
</script>

</head>

<body>
	<form id="idForm?" method="POST" action="???">
		<div><input type="hidden" name="vToken"></div>
		<div id="idPageTitle" class="pageTitle" style="display:block">&nbsp;<s:text name="Transaction Screen - SB"></s:text></div>
		<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
		<div  id="idErrTbl"  class="errorDiv" style="display:none">
			<p id="el">
			</p>
		</div>
		<div>
			<table width="100%">
				<tr valign="top">
					<td width="5%" align="right">Transaction:</td>
					<td width="5%">
						<select class="smallselect">
							<option>Cash</option>
							<option>Transfer</option>
						</select>
					</td>
					<td width="5%" align="right">Account: </td>
					<td width="25%">
						<input type="text" class="mediumTxtLeftAlign" value="product...">&nbsp;
						<input type="text" class="mediumTxtLeftAlign" value="account...">&nbsp;
						<input type="text" class="mediumTxtLeftAlign" value="sub account...">&nbsp;
					</td>
					<td width="5%" align="right">Activity: </td>
					<td width="10%">
						<select class="smallselect">
							<option>Debit</option>
							<option>Credit</option>
						</select>
					</td>
					<td width="5%" align="right">Currency: </td>
					<td width="10%">
						<select class="smallselect">
							<option>INR</option>
							<option>USD</option>
						</select>
					</td>
					<td width="20%" align="left">
						&nbsp;&nbsp;<input type="button" value="NEW SET" class="smallbtn" onClick="open1();">
						&nbsp;&nbsp;<input type="button" value="ADD" class="smallbtn">
					</td>
				</tr>
			</table>
		</div>
		
		<div id="mainId" style="display:none">
			<table border="1" width="100%">
				<tr valign="top">
					<td width="75%">
						<table>
							<tr>
								<td align="right">Instrument Date:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Instrument Number:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">
									Instrument Type:&nbsp;
								</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">
									Value Date:&nbsp;
								</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">Narration:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Instrument Amount</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">Conv. Rate:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">LCY Amount:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">National Id Type:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Id #:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">Token Number:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Current Share Amount: nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td align="right">
									&nbsp;&nbsp;<input type="button" value="Save" class="smallbtn" onClick="open1();">
								</td>
								<td align="left">
									&nbsp;&nbsp;<input type="button" value="Clear" class="smallbtn" onClick="open1();">
								</td>
								<td align="right">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
					<td rowspan="2" width="25%">
						<table border="1" width="100%" cellspacing="0">
							<tr bgcolor="#AAAAFF">
								<td>Signature View</td>
							</tr>
							<tr height="50">
								<td>Signature....</td>
							</tr>
						</table>
						<table border="1" width="100%" cellspacing="0">
							<tr bgcolor="#AAAAFF">
								<td>Account Information</td>
							</tr>
							<tr height="75">
								<td>Account Information....</td>
							</tr>
						</table>
						<table border="1" width="100%" cellspacing="0">
							<tr bgcolor="#AAAAFF">
								<td>Joint Names</td>
							</tr>
							<tr height="100">
								<td>Joint Names....</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="75%">
						<table>
							<tr>
								<td align="right">Other Information:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Status:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Operation Mode:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">Sanction Limit:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Drawing Power:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Unapplied Interest:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">Shadow Clear:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Shadow Total:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Actual Clear:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">Actual Total:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Available Balance:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Adhoc Limit:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
							</tr>
							<tr>
								<td align="right">Total Lien:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">Unclear Effect:&nbsp;</td>
								<td>
									<input type="text" class="mediumTxtLeftAlign">
								</td>
								<td align="right">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
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