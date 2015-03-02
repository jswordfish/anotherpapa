<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.CustomerMst"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link rel="stylesheet" href="css1/bootstrap.min.css">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css"
	rel="stylesheet" type="text/css" />
<script src="js1/jquery.min.js"></script>
<script src="js1/bootstrap.min.js"></script>

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

<style class="cp-pen-styles">
label {
	margin-left: 20px;
}

#datepicker {
	width: 180px;
	margin: 0 20px 20px 20px;
}

#datepicker>span:hover {
	cursor: pointer;
}
</style>
<script
	src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>
<script>
	function validateInput() {
		var unlockUserLoginId = document.getElementById("customerCOde").value;

		if (unlockUserLoginId.length > 0) {
			return true;
		} else {
			alert("Please enter CustomeCode!!!");
			return false;
		}
	}
</script>

</head>
<body>
	<form id="omniBranchAddForm" method="POST" action="customerSignPhoto">
		<%
			CustomerMst customerMst = (CustomerMst) request
					.getAttribute("customerMst");
		%>
		<div id="result" class="container">
			<table class="table table-condensed">
				<tr class="active">
					<td class="col-md-1">Customer Code:</td>
					<td class="col-md-1">
					<% 
						
					if (null != customerMst.getCustomerCode()) {
					%>
					<input id="customerCOde"
						name="customerCOde" type="text" value="<%= customerMst.getCustomerCode()%>" />
						<%}else {%>
						<input id="customerCOde"
						name="customerCOde" type="text" value="" />
					<%} %>
					</td>
					<td class="col-md-1">&nbsp;</td>
					<td class="col-md-1">&nbsp;</td>
				</tr>



			</table>
			<div style='float: left;'>
				<table class="table table-condensed">
					<tr class="active">
					<td colspan="2" class="col-md-1">Signature:</td>
						<% 
						
					if (null != customerMst.getSignature()) {
					%>
					<td class="col-md-1"><img src="<%= customerMst.getSignature()%>" style="width: 250px; height: 100px"></td>
					<%}else {%>
					<td class="col-md-1"><img style="width: 250px; height: 100px"></td>
					<%} %>
					<td colspan="2" class="col-md-1">Photo:</td>
						<% 
						
					if (null != customerMst.getPhoto()) {
					%>
					<td class="col-md-1"><img src="<%= customerMst.getPhoto()%>" style="width: 180px; height: 180px"></td>
					<%}else {%>
					<td class="col-md-1"><img  style="width: 180px; height: 180px"></td>
					<%} %>
					</tr>
					<tr class="active">
						<td colspan="2" class="col-md-1">UploadSign:</td>
						<td><input type="file" name="sign" size="50" /></td>
						<td colspan="2" class="col-md-1">UploadPhoto:</td>
						<td><input type="file" name="userImage" size="50" /></td>
					</tr>
				</table>
			</div>

			<table class="table table-condensed">
				<tr class="active">
					<td colspan="4" width="100%" height="25" align="center"><input
						type="submit" name="buttonValue" value="Save" onClick="return validateInput();"></td>
				</tr>
			</table>

		</div>
	</form>
</body>
</html>