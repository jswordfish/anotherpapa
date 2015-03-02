<%@page import="com.infrasofttech.domain.entities.ParamLoanAc"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>



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
<script>
	function callAdd(){
		document.forms["formparamLoan"].action = "paramloanAcCRUD.action";
		document.forms["formparamLoan"].submit();
	}
	function callViewDisabled(){
		document.forms["formparamLoan"].action = "paramloanDisableList.action";
		document.forms["formparamLoan"].submit();
	}	
	</script>

<script
	src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>


<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>

</head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<br>
	<div id="result" class="container">

		<form name="formparamLoan" method="post">
			<input type="hidden" name="productCode" value="-1"> <input
				type="hidden" name="moduleCode" value="-1">
				<input
				type="hidden" name="effectiveFrom" value="-1"> <input
				type="hidden" name="mode" value="CREATE">
			<button type="button" class="btn btn-primary" onclick="callAdd();" ><s:text name="global.btn.add.loan.params" /></button>
			<button type="button" class="btn btn-primary"
				onclick="callViewDisabled();"><s:text name="global.btn.show.disabled.param.loans" /></button>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th><s:text name="global.lbl.loan.type" /></th>
					<th><s:text name="global.lbl.product.code" /></th>
					<th><s:text name="global.lbl.branch.code" /></th>
					<th><s:text name="global.lbl.effective.from.date" /></th>
					<th><s:text name="global.lbl.effective.till.date" /></th>
					<th><s:text name="global.lbl.action" /></th>
				</tr>
			</thead>
			<%
				List<ParamLoanAc> paramLoanAcs = (List<ParamLoanAc>) request
						.getAttribute("paramLoanAcs");
			%>
			<tbody>
				<%
					for (ParamLoanAc paramLoanAc : paramLoanAcs) {
				%>
				<tr class="active">
					<td><%=paramLoanAc.getLoanType()%></td>
					<td><%=paramLoanAc.getProdCode()%></td>
					<td><%=paramLoanAc.getBranchCode()%></td>
					<td><%=paramLoanAc.getEffectiveFrom()%></td>
					<td><%=paramLoanAc.getEffectiveTill()%></td>
					<td><a
						href="paramloanAcCRUD.action?productCode=<%=paramLoanAc.getProdCode()%>&moduleCode=<%=paramLoanAc.getModuleCode()%>&branchCode=<%=paramLoanAc.getBranchCode()%>&effectiveFrom=<%=paramLoanAc.getEffectiveFrom()%>&mode=UPDATE"><s:text name="global.ref.edit" /></a>
						<a
						href="paramloanAcDisable.action?productCode=<%=paramLoanAc.getProdCode()%>&moduleCode=<%=paramLoanAc.getModuleCode()%>&branchCode=<%=paramLoanAc.getBranchCode()%>&effectiveFrom=<%=paramLoanAc.getEffectiveFrom()%>&mode=DISABLE"><s:text name="global.ref.disable" /></a>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>