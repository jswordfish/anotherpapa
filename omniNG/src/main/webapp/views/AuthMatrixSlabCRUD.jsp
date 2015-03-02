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
<script language="javascript">
	var i;
	var j = 1;
	var count1 = 1;
	var count2 = 1;
	var newCount;
	function disable() {
		if (count1 >= 1) {
			document.getElementById("idAdd").disabled = true;
		}
		count1++;
	}
	function disableSave() {
		document.getElementById("idSave").disabled = true;
	}

	function view() {
		window.location.href = "<s:url value="AuthMatrixMgmt"/>";
	}

	function disableAuthBy() {
		var mode = document.getElementById("idAuthMode").value;
		if (mode == "SELF") {
			document.getElementById("idAuthBy").disabled = true;
		} else {
			document.getElementById("idAuthBy").disabled = false;
		}
	}

	function disableCurrency() {
		var basedOn = document.getElementById("idBasedOnCode").value;
		if (basedOn == "AMT") {
			document.getElementById("idCurrency").disabled = false;
		} else {
			document.getElementById("idCurrency").disabled = true;
		}
	}

	function enable() {
		document.getElementById("idSave").disabled = false;
	}

	function add() {

		var table = document.getElementById("tblData1");

		var row = table.insertRow(1);

		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		var cell6 = row.insertCell(5);
		var cell7 = row.insertCell(6);
		var cell8 = row.insertCell(7);
		cell1.innerHTML = '<select style="width: 150px;" name="basedOnCode" id="idBasedOnCode" onchange="disableCurrency();"  tabindex="2"><c:forEach var="authSlab" items="${authMatrixSlabs1}"><option value="${authSlab.basedOnCode}">${authSlab.basedOnCode}</option>	</c:forEach></select>';
		cell2.innerHTML = '<select style="width: 150px;" multiple="multiple" name="currency" id="idCurrency" tabindex="3" headerValue="AMT"><c:forEach var="currency" items="${currency1}"><option value="${currency.currencyISOCode}">${currency.currencyISOCode}</option></c:forEach></select>';
		cell3.innerHTML = '<input style="width: 150px;" type="text" id="idFromRange" name="fromRange" tabindex="4" width="10"/>';
		cell4.innerHTML = '<input style="width: 150px;" type="text" name="toRange" id="idToRange" tabindex="5"/>';
		cell5.innerHTML = '<select style="width: 150px;" name="authType"  tabindex="6" id="idAuthType"><c:forEach var="authSlabs" items="${authMatrixSlabs1}"><option value="${authSlabs.authType}">${authSlabs.authType}</option></c:forEach></select>';
		cell6.innerHTML = '<select style="width: 150px;" name="authMode" id="idAuthMode" onchange="disableAuthBy();" tabindex="7" headerValue="MULTI"><c:forEach var="authSlabs" items="${authMatrixSlabs1}"><option value="${authSlabs.authMode}">${authSlabs.authMode}</option></c:forEach></select>';
		cell7.innerHTML = '<input style="width: 150px;" type="text"  id="idAuthBy" class="input" name="countOfAuthorizers" tabindex="8"><a href="#" onclick="dynamicAddAutoDelete();">DEF</a> ';
		cell8.innerHTML = '<input type="button" id="idDel" tabindex="9" class="smallbtn" value ="DEL" onclick="deleteRow(this);"/> ';

		/* cell1.style.width = '1%';
		cell2.style.width = '1%';
		cell3.style.width = '1%';
		cell4.style.width = '1%';
		cell5.style.width = '2%';
		cell6.style.width = '2%';
		cell7.style.width = '2%';
		cell8.style.width = '1%'; */

		j++;
	}

	function dynamicAddAutoDelete() {
		var table = document.getElementById("tblData2");
		var mlNo = document.getElementById("idAuthBy").value;
		if (count1 > 1) {
			table.innerHTML = "";
			count2 = 0;
		}
		for (var i = mlNo; i >= 1; i--) {
			var row = table.insertRow(0);
			var cell1 = row.insertCell(0);
			cell1.innerHTML = 'Rank:'
					+ i
					+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Roles:<select multiple="multiple" name="role'+i+'" id="idRole'+i+'" ><c:forEach var="roles" items="${roleMsts1}"><option value="${roles.roleCode}">${roles.roleName}</option></c:forEach></select>';
			count2++;
		}
		count2;
		count1++;
	}

	function deleteRow(row) {
		i = row.parentNode.parentNode.rowIndex;
		document.getElementById('tblData1').deleteRow(i);
	}

	function list() {
		document.getElementById("idList").action = "AuthMatrixMgmt";
	}

	//Ajax to save Data of authmatrixslab
	$(document).ready(function() {
		$('#idSave').click(function(e) {
			e.preventDefault();
			var basedOnCode = $("#idBasedOnCode").val();
			var currency = $("#idCurrency").val();
			var fromRange = $("#idFromRange").val();
			var toRange = $("#idToRange").val();
			var authType = $("#idAuthType").val();
			var authMode = $("#idAuthMode").val();
			var authBy = $("#idAuthBy").val();
			var roles = new Array();
			for (var j = 1; j <= authBy; j++) {
				var temp = $('#idRole' + j).val();
				roles.push(temp);
			}

			$.ajax({
				url : "AuthMatrixSlabSave",
				data : {
					'basedOnCode' : basedOnCode,
					'currency' : currency,
					'fromRange' : fromRange,
					'toRange' : toRange,
					'authType' : authType,
					'authMode' : authMode,
					'authBy' : authBy,
					'roles' : roles

				},
				type : "post",
				cache : false,
				success : function(data) {
					$("#idBasedOnCode").prop("disabled", "disabled");
					$("#idCurrency").prop("disabled", "disabled");
					$("#idFromRange").prop("readonly", "readonly");
					$("#idToRange").prop("readonly", "readonly");
					$("#idAuthType").prop("disabled", "disabled");
					$("#idAuthMode").prop("disabled", "disabled");
					$("#idAuthBy").prop("readonly", "readonly");

					for (var i = 1; i <= authBy; i++) {
						$('#idRole' + i).prop("disabled", "disabled");
					}

					$("#idErrMsg").show();
					$("#idErrMsg").fadeOut(7200);
					$("#idSave").prop("disabled", true);
					$("#idAdd").prop("disabled", false);

				}
			});
		});
	});
</script>

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
	<form id="omniAuthMatrixSlabForm" method="POST" action="authMatrixSlabSave">
		<%
	AuthEvent authEvent =new AuthEvent();
	BranchMst branchMst=new BranchMst();
	CurrencyMst currency=new CurrencyMst();
	
	String mode = (String)request.getAttribute("mode");
	System.out.println("Product JSP mode:"+mode);
	
	String mode = (String) request.getAttribute("mode");
	System.out.println("Product JSP mode:" + mode);
	Map<String, String> authEvents = new HashMap<String, String>();
	Map<String, String> braches = new HashMap<String, String>();
	Map<String, String> currencies = new HashMap<String, String>();

	authEvents = (Map<String, String>) request.getAttribute("authEvents");
	currencies = (Map<String, String>) request.getAttribute("curencies");
	branches = (Map<String, String>) request.getAttribute("branches");
	AuthMatrix authMatrix = (AuthMatrix) request.getAttribute("authMatrix");
	
	if (authEvents == null) {
		authEvents = new HashMap<String, String>();
	}

	braches = (Map<String, String>) request.getAttribute("braches");
	if (braches == null) {
		braches = new HashMap<String, String>();
	}

	curencies = (Map<String, String>) request.getAttribute("curencies");
	if (curencies == null) {
		curencies = new HashMap<String, String>();
		
	
	
%>
		<div id="result" class="container">
			<input type="hidden" name="mode" value="<%= mode %>">
			<table class="table table-condensed">
				<%-- <tr class="active">
	<td class="col-md-1">Product Code:</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="productCode" name="productCode" type="text"  value="<%= product.getProductCode() %>"/></td>
	<%	}else{%>
			<td class="col-md-1"><input readonly id="productCode" name="productCode" type="text"  value="<%= product.getProductCode() %>"/></td>
	<%	}
	<td class="col-md-1">Product Name:</td>
	<td class="col-md-1"><input id="productName" name="productName" type="text" 
				value="<%= product.getProductName() %>" /></td>
</tr>%> --%>
				<tr class="active">
					<td class="col-md-1">Auth Event:</td>
					<td class="col-md-1"><select id="currencyCode"
						name="currencyCode">
							<% for(Map.Entry<String, String> entry : authEvents.entrySet()) { 
							if(null != authEvent.getAuthEventCode() &&
							product.getAuthEventCode().equalsIgnoreCase(entry.getKey())) { 
			%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
							<%		} else { %>
							<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
							<%		} 			
				} 
			%>
					</select></td>

					<td class="col-md-1">Name:</td>
					<td class="col-md-1"><input id="idAuthMatrixName"
						name="authMatrixName" type="text"
						value="<%= authMatrix.getAuthMatrixName() %>" /></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Branch:</td>
					<td class="col-md-1"><select id="idBranch" name="branch">
							<% for(Map.Entry<String, String> entry : branches.entrySet()) { 
					if(null != branchMst.getBranchCode()&&
							branchMst.getBranchCode().equalsIgnoreCase(entry.getKey())) { 
			%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
							<%		} else { %>
							<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
							<%		} 			
				} 
			%>
					</select></td>
					<td class="col-md-1">Currency:</td>
					<td class="col-md-1"><select id="idCurrency" name="currency">
					<% for(Map.Entry<String, String> entry : currencies.entrySet()) { 
						if(null != currency.getCurrencyISOCode()&&
							currency.getCurrencyISOCode().equalsIgnoreCase(entry.getKey())) { 
			%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
							<%		} else { %>
							<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
							<%		} 			
				} 
			%>
					</select></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Effective From:</td>
					<td class="col-md-1"><input id="idEffFrom" name="effFromDate"
						type="text" value="<%= authMatrix.getEffFrom() %>" /></td>
					<td class="col-md-1">Effective Till:</td>
					<td class="col-md-1"><input id="effTillDate" name="idEffTill"
						type="text" value="<%=authMatrix.getEffFrom() %>" /></td>
				</tr>
				<tr class="active">
					<td colspan="4" width="100%" height="25" align="center"><input
						type="submit" name="Save" value="Save"> <input
						type="reset" name="Clear" value="Clear"> <input
						type="button" name="List" value="Back to List"
						onClick="javascript:goToList();"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
