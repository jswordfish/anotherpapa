<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.CurrencyMst"%>
<%@page import="com.infrasofttech.domain.entities.BranchMst"%>
<%@page import="com.infrasofttech.domain.entities.AuthEvent"%>
<%@page import="com.infrasofttech.domain.entities.AuthMatrix"%>
<%@page import="java.util.*"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link rel="stylesheet" href="css1/bootstrap.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="js1/html5shiv.min.js"></script>
      <script src="js1/respond.min.js"></script>
    <![endif]-->

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

<script>
	$(function() {
		$('#datepicker').datepicker({
			autoclose : true,
			todayHighlight : true
		}).datepicker('update', new Date());
		;
	});
</script>

<script
	src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>


<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>

</head>

<%--   <% --%>
<!-- // 	UserMst user = (UserMst) request.getAttribute("user"); -->
<!-- //   	Address a1 = new Address(); -->
<!-- //   	a1.setAddress1("111"); -->
<!-- //   	a1.setCityId(2L); -->
<!-- //   	user.getAddresses().add(a1); -->
<!-- //   	request.setAttribute("user", user); -->
<%--   %> --%>
<body>
	<form id="omniAuthMatrix" method="POST" action="authMatrixSave">
		<%
			AuthMatrix authMatrix = new AuthMatrix();

			/* List<AuthEvent> authEvents = new ArrayList<AuthEvent>();
			List<CurrencyMst> currencies = new ArrayList<CurrencyMst>();
			List<BranchMst> branches = new ArrayList<BranchMst>(); */

			String mode = (String) request.getAttribute("mode");

			Map<String, String> authEvents = new HashMap<String, String>();
			Map<String, String> branches = new HashMap<String, String>();
			Map<String, String> currencys = new HashMap<String, String>();

			authEvents = (Map<String, String>) request
					.getAttribute("authEvents");
			currencys = (Map<String, String>) request
					.getAttribute("currencies");
			branches = (Map<String, String>) request.getAttribute("branches");
			authMatrix = (AuthMatrix) request.getAttribute("authMatrix");

			if (authEvents == null) {
				authEvents = new HashMap<String, String>();
			}

			if (branches == null) {
				branches = new HashMap<String, String>();
			}

			if (currencys == null) {
				currencys = new HashMap<String, String>();
			}
		%>
		<div id="result" class="container">
			<input type="hidden" name="mode" value="<%=mode%>">
			<table class="table table-condensed">
				<tr class="active">
					<td class="col-md-1">Auth Event:</td>
					<td class="col-md-1"><select id="idAuthEvents"
						name="authEvents">
							<%
								for (Map.Entry<String, String> entry : authEvents.entrySet()) {
									if (null != authMatrix.getAuthEvent().getAuthEventCode()
											&& authMatrix.getAuthEvent().getAuthEventCode()
													.equalsIgnoreCase((entry.getKey()))) {
							%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%>
							</option>
							<%
								} else {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%>
							</option>
							<%
								}
								}
							%>
					</select></td>

					<td class="col-md-1">Name:</td>
					<td class="col-md-1"><input id="idAuthMatrixName"
						name="authMatrixName" type="text"
						value="<%=authMatrix.getAuthMatrixName()%>" /></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Branch:</td>
					<td class="col-md-1"><select id="idBranch" name="branch"
						multiple="multiple">
							<%
								for (Map.Entry<String, String> entry : branches.entrySet()) {
									/*if (null != authMatrix.getBranches()
											 && authMatrix.getBranches().toArray()[0].equals((entry.getKey())) ) {*/
							%>
							<%-- <option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%>
							</option> --%>
							<%-- <%
								} else {
							%> --%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%>
							</option>
							<%
								//}
								}
							%>
					</select></td>
					<td class="col-md-1">Currency:</td>
					<td class="col-md-1"><select id="idCurrency" name="currency"
						multiple="multiple">
							<%
								for (Map.Entry<String, String> entry : currencys.entrySet()) {
									/*if (null != authMatrix.getCurrencies()
															 && authMatrix.getCurrencies().toArray()[0]
															 .equals((entry.getKey())) )  {*/
							%>
							<%-- <option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%>
							</option> --%>
							<%-- <%
								} else {
							%> --%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%>
							</option>
							<%
								//}
								}
							%>
					</select></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Effective From:</td>
					<%
						if (mode.equalsIgnoreCase("create")) {
					%>
					<td class="col-md-1"><input id="idEffFrom" name="effFromDate"
						type="text" value="" /></td>
					<td class="col-md-1">Effective Till:</td>
					<td class="col-md-1"><input id="effTillDate" name="idEffTill"
						type="text" value="" /></td>
					<%
						} else {
					%>
					<td class="col-md-1"><input id="idEffFrom" name="effFromDate"
						type="text" value="<%=authMatrix.getEffFrom()%>" /></td>
					<td class="col-md-1">Effective Till:</td>
					<td class="col-md-1"><input id="effTillDate" name="idEffTill"
						type="text" value="<%=authMatrix.getEffFrom()%>" /></td>
					<%
						}
					%>

				</tr>
				<tr class="active">
					<td colspan="4" width="100%" height="25" align="center"><input
						type="submit" name="Save" value="Save"> <input
						type="reset" name="Clear" value="Clear"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
