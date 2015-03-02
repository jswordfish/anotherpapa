<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.ParamCheckingAc"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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
	$(document).ready(function() {
		var data = [];
		<c:forEach  var="branches" items="${paramChkAcs}">
		data.push('<c:out value="${branches.branchCode}"/>');
		</c:forEach>
		for (var i = 0; i < data.length; i++) {
			$('#idBranchCode option').map(function() {
				if ($(this).val() == data[i])
					return this;
			}).attr('selected', 'selected');
		}
	});
</script>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(

	/* This is the function that will get executed after the DOM is fully loaded */
	function() {
		$("#effectFromDateDetails").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1960:2100',
			dateFormat : 'yy-mm-dd'
		});
		$("#effectTillDateDetails").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1960:2100',
			dateFormat : 'yy-mm-dd'
		});
	}

	);
</script>
<script>
	function goToList() {
		document.forms["omniParamChkForm"].action = "paramChkList.action";
		document.forms["omniParamChkForm"].submit();
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

<body>
	<form id="omniParamChkForm" method="POST" action="paramChkSave">
		<%
			String mode = (String) request.getAttribute("mode");
			System.out.println("Product JSP mode:" + mode);

			Map<String, String> payReceiveMap = new HashMap<String, String>();
			Map<String, String> roundOffMap = new HashMap<String, String>();
			Map<String, String> intrCalBalMap = new HashMap<String, String>();
			Map<String, String> intAppFreqMap = new HashMap<String, String>();
			Map<String, String> disIntRateMap = new HashMap<String, String>();
			Map<String, String> prodCalcMap = new HashMap<String, String>();
			Map<String, String> modules = new HashMap<String, String>();
			Map<String, String> products = new HashMap<String, String>();
			Map<String, String> batches = new HashMap<String, String>();
			Map<String, String> branches = new HashMap<String, String>();
			Map<String, String> branchCodes = new HashMap<String, String>();

			payReceiveMap = (Map<String, String>) request
					.getAttribute("payReceiveMap");
			if (payReceiveMap == null) {
				payReceiveMap = new HashMap<String, String>();
			}

			roundOffMap = (Map<String, String>) request
					.getAttribute("roundOffMap");
			if (roundOffMap == null) {
				roundOffMap = new HashMap<String, String>();
			}

			intrCalBalMap = (Map<String, String>) request
					.getAttribute("intrCalBalMap");
			if (intrCalBalMap == null) {
				intrCalBalMap = new HashMap<String, String>();
			}

			intAppFreqMap = (Map<String, String>) request
					.getAttribute("intAppFreqMap");
			if (intAppFreqMap == null) {
				intAppFreqMap = new HashMap<String, String>();
			}

			modules = (Map<String, String>) request.getAttribute("modules");
			if (modules == null) {
				modules = new HashMap<String, String>();
			}

			disIntRateMap = (Map<String, String>) request
					.getAttribute("disIntRateMap");
			if (disIntRateMap == null) {
				disIntRateMap = new HashMap<String, String>();
			}

			prodCalcMap = (Map<String, String>) request
					.getAttribute("prodCalcMap");
			if (prodCalcMap == null) {
				prodCalcMap = new HashMap<String, String>();
			}

			products = (Map<String, String>) request.getAttribute("products");
			if (products == null) {
				products = new HashMap<String, String>();
			}

			batches = (Map<String, String>) request.getAttribute("batches");
			if (batches == null) {
				batches = new HashMap<String, String>();
			}
			branches = (Map<String, String>) request.getAttribute("branches");
			if (branches == null) {
				branches = new HashMap<String, String>();
			}
			modules = (Map<String, String>) request.getAttribute("modules");
			if (modules == null) {
				modules = new HashMap<String, String>();
			}
			branchCodes = (Map<String, String>) request
					.getAttribute("branchCodes");
			if (branchCodes == null) {
				branchCodes = new HashMap<String, String>();
			}

			ParamCheckingAc paramCheckingAc = (ParamCheckingAc) request
					.getAttribute("paramCheckingAc");
		%>
		<div id="result" class="container">
			<input type="hidden" name="mode" value="<%=mode%>">
			<table class="table table-condensed">

				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.product.code" /></td>
					<td class="col-md-1"><select id="productCode"
						name="productCode">
							<%
								for (Map.Entry<String, String> entry : products.entrySet()) {
									if (null != paramCheckingAc.getProdCode()
											&& paramCheckingAc.getProdCode().equalsIgnoreCase(
													entry.getKey())) {
							%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%></option>
							<%
								} else {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
								}
							%>
					</select></td>
					<td class="col-md-1" rowspan="3"><s:text name="global.lbl.branch.code" /></td>
					<td class="col-md-1" rowspan="3"><select id="idBranchCode"
						name="branchCode" multiple="multiple">
							<%
								for (Map.Entry<String, String> entry : branches.entrySet()) {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
							%>
					</select></td>


				</tr>

				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.interest.pay.receive.customer" /></td>
					<td class="col-md-1"><select id="interestPayOrReceiveCustomer"
						name="interestPayOrReceiveCustomer">
							<%
								for (Map.Entry<String, String> entry : payReceiveMap.entrySet()) {
									if (null != paramCheckingAc.getInterestPayOrReceiveCustomer()
											&& paramCheckingAc.getInterestPayOrReceiveCustomer()
													.equalsIgnoreCase(entry.getKey())) {
							%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%></option>
							<%
								} else {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
								}
							%>
					</select></td>
				</tr>
				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.default.transfer.batch" /></td>
					<td class="col-md-1"><select id="idBatch"
						name="defaultTransferBatch">
							<%
								for (Map.Entry<String, String> entry : batches.entrySet()) {
									if (null != paramCheckingAc.getDefaultTransferBatch()
											&& paramCheckingAc.getDefaultTransferBatch()
													.equalsIgnoreCase(entry.getKey())) {
							%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%></option>
							<%
								} else {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
								}
							%>
					</select></td>
				</tr>
				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.interest.DR/CR.ac " /></td>
					<td class="col-md-1"><input id="intAcNo" name="intAcNo"
						type="text" value="<%=paramCheckingAc.getIntAcNo()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.penal.interest.DR/CR.ac" /></td>
					<td class="col-md-1"><input id="penalIntAcNo"
						name="penalIntAcNo" type="text"
						value="<%=paramCheckingAc.getPenalIntAcNo()%>" /></td>

				</tr>
				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.interest.receivable.ac" /></td>
					<td class="col-md-1"><input id="intRecvAcNo"
						name="intRecvAcNo" type="text"
						value="<%=paramCheckingAc.getIntRecvAcNo()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.interest.reserve.ac" /></td>
					<td class="col-md-1"><input id="intResAcNo" name="intResAcNo"
						type="text" value="<%=paramCheckingAc.getIntResAcNo()%>" /></td>

				</tr>
				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.penal.interest.rate" /></td>
					<td class="col-md-1"><input id="penalInterestRate"
						name="penalInterestRate" type="text"
						value="<%=paramCheckingAc.getPenalInterestRate()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.max.interest.rate" /></td>
					<td class="col-md-1"><input id="maximumInterestRate"
						name="maximumInterestRate" type="text"
						value="<%=paramCheckingAc.getMaximumInterestRate()%>" /></td>

				</tr>


				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.adhoc.interest.rate " /></td>
					<td class="col-md-1"><input id="adhocInterestRate"
						name="adhocInterestRate" type="text"
						value="<%=paramCheckingAc.getAdhocInterestRate()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.max.adhoc.penal.interest.rate" /></td>
					<td class="col-md-1"><input id="maximumAdhocInterestRate"
						name="maximumAdhocInterestRate" type="text"
						value="<%=paramCheckingAc.getMaximumAdhocInterestRate()%>" /></td>

				</tr>
				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.TDS" /></td>
					<td class="col-md-1">
						<%
							if (null != paramCheckingAc.getTds()
									&& paramCheckingAc.getTds() == true) {
						%> <input checked="checked" type="radio" name="tds" id="tds"
						value="Y">&nbsp;Yes <input type="radio" name="tds"
						id="tds" value="N">&nbsp;No <%
 	} else {
 %> <input type="radio" name="tds" id="tds" value="Y">&nbsp;Yes
						<input checked="checked" type="radio" name="tds" id="tds"
						value="N">&nbsp;No <%
 	}
 %>
					</td>
					<td class="col-md-1"><s:text name="global.lbl.TDS.percentage" /></td>
					<td class="col-md-1"><input id="tdsPercent" name="tdsPercent"
						type="text" value="<%=paramCheckingAc.getTdsPercent()%>" /></td>
				</tr>

				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.TDS.ac.id" /></td>
					<td class="col-md-1"><input id="idTxtMeetingDate2"
						name="tdsAcNo" type="text"
						value="<%=paramCheckingAc.getTdsAcNo()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.interest.tax" /></td>
					<td class="col-md-1"><input id="interestTax"
						name="interestTax" type="text"
						value="<%=paramCheckingAc.getInterestTax()%>" /></td>

				</tr>

				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.round.off.option" /></td>
					<td class="col-md-1"><select id="roundOffOption"
						name="roundOffOption">
							<%
								for (Map.Entry<String, String> entry : roundOffMap.entrySet()) {
									if (null != paramCheckingAc.getRoundOffOption()
											&& paramCheckingAc.getRoundOffOption()
													.equalsIgnoreCase(entry.getKey())) {
							%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%></option>
							<%
								} else {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
								}
							%>
					</select></td>

					<td class="col-md-1"><s:text name="global.lbl.tmp.OD.interest.rate.tax" /></td>
					<td class="col-md-1"><input
						id="temporaryOverdraftInterestRate"
						name="temporaryOverdraftInterestRate" type="text"
						value="<%=paramCheckingAc.getTemporaryOverdraftInterestRate()%>" /></td>


				</tr>
				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.NPA.penal.interest" /></td>
					<td class="col-md-1"><input id="nonPerpormingAssetPanelRate"
						name="nonPerpormingAssetPanelRate" type="text"
						value="<%=paramCheckingAc.getNonPerpormingAssetPanelRate()%>" /></td>

					<td class="col-md-1"><s:text name="global.lbl.interest.calc.balance.type" /></td>
					<td class="col-md-1"><select
						id="interestCalculationBalancingType"
						name="interestCalculationBalancingType">
							<%
								for (Map.Entry<String, String> entry : intrCalBalMap.entrySet()) {
									if (null != paramCheckingAc
											.getInterestCalculationBalancingType()
											&& paramCheckingAc
													.getInterestCalculationBalancingType()
													.equalsIgnoreCase(entry.getKey())) {
							%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%></option>
							<%
								} else {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
								}
							%>
					</select></td>
				</tr>
				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.value.max.months" /></td>
					<td class="col-md-1"><input id="valueMaxMonth"
						name="valueMaxMonth" type="text"
						value="<%=paramCheckingAc.getValueMaxMonth()%>" /></td>

					<td class="col-md-1"><s:text name="global.lbl.interest.appln.frequency " /></td>
					<td class="col-md-1"><select id="interestApplicationFrequency"
						name="interestApplicationFrequency">
							<%
								for (Map.Entry<String, String> entry : intAppFreqMap.entrySet()) {
									if (null != paramCheckingAc.getInterestApplicationFrequency()
											&& paramCheckingAc.getInterestApplicationFrequency()
													.equalsIgnoreCase(entry.getKey())) {
							%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%></option>
							<%
								} else {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
								}
							%>
					</select></td>
				</tr>

				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.discounted.interest.rate" /></td>
					<td class="col-md-1"><select id="discountedInterestRate"
						name="discountedInterestRate">
							<%
								for (Map.Entry<String, String> entry : disIntRateMap.entrySet()) {
									if (null != paramCheckingAc.getDiscountedInterestRate()
											&& paramCheckingAc.getDiscountedInterestRate()
													.equalsIgnoreCase(entry.getKey())) {
							%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%></option>
							<%
								} else {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
								}
							%>
					</select></td>

					<td class="col-md-1"><s:text name="global.lbl.product.calc.type " /></td>
					<td class="col-md-1"><select id="productCalculationType"
						name="productCalculationType">
							<%
								for (Map.Entry<String, String> entry : prodCalcMap.entrySet()) {
									if (null != paramCheckingAc.getProductCalculationType()
											&& paramCheckingAc.getProductCalculationType()
													.equalsIgnoreCase(entry.getKey())) {
							%>
							<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue()%></option>
							<%
								} else {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
								}
							%>
					</select></td>
				</tr>

				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.day.of.month" /></td>
					<td class="col-md-1"><input id="dayOfMonth" name="dayOfMonth"
						type="text" value="<%=paramCheckingAc.getDayOfMonth()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.days.count.per.year" /></td>
					<td class="col-md-1"><input id="daysCountPerYear"
						name="daysCountPerYear" type="text"
						value="<%=paramCheckingAc.getDaysCountPerYear()%>" /></td>

				</tr>

				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.last.account" /></td>
					<td class="col-md-1"><input id="status" name="status"
						type="text" value="<%=paramCheckingAc.getStatus()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.days.count.per.year" /></td>
					<td class="col-md-1"><input id="lastAcNo" name="lastAcNo"
						type="text" value="<%=paramCheckingAc.getLastAcNo()%>" /></td>

				</tr>

				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.move.account.to.inoperative.head" /></td>
					<td class="col-md-1"><input 
						id="moveAcToInoperativeHead" name="moveAcToInoperativeHead"
						type="text" value="<%=paramCheckingAc.getMoveAcToInoperativeHead()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.after.months"/></td>
					<td class="col-md-1"><input 
						id="afterMonthsInoperative" name="afterMonthsInoperative" type="text"
						value="<%=paramCheckingAc.getAfterMonthsInOperative()%>" /></td>

				</tr>

				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.move.account.to.indormant.head" /></td>
					<td class="col-md-1"><input 
						id="moveAccountToInDormantHead" name="moveAccountToInDormantHead"
						type="text" value="<%=paramCheckingAc.getMoveAccountToInDormantHead()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.after.months"/></td>
					<td class="col-md-1"><input id="afterMonthsDormant"
						 name="afterMonthsDormant" type="text" value="<%=paramCheckingAc.getAfterMonthsDormant()%>" /></td>

				</tr>
				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.minimu,.product.above.which.tod.to.charge"/></td>
					<td class="col-md-1"><input id="minimumProductTODCharge"
						name="minimumProductTODCharge" type="text"
						value="<%=paramCheckingAc.getMinimumProductTODCharge()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.status"/></td>
					<td class="col-md-1"><input id="status" name="status"
						type="text" value="<%=paramCheckingAc.getStatus()%>" /></td>

				</tr>
				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.min.charges " />(<s:text name="global.lbl.TOD" />)</td>
					<td class="col-md-1"><input id="minimumTODChargeAmount"
						name="minimumTODChargeAmount" type="text"
						value="<%=paramCheckingAc.getMinimumTODChargeAmount()%>" /></td>
					<td class="col-md-1"><s:text name="global.lbl.min.interest.amt" />(<s:text name="global.lbl.SB" />)</td>
					<td class="col-md-1"><input id="minimumSBInterestAmount"
						name="minimumSBInterestAmount" type="text"
						value="<%=paramCheckingAc.getMinimumSBInterestAmount()%>" /></td>

				</tr>


				<tr class="active">
					<td class="col-md-1"><s:text name="global.lbl.effective.from.date" /></td>
					<%
						if (mode.equalsIgnoreCase("CREATE")) {
					%>

					<td class="col-md-1"><input id="effectFromDateDetails"
						name="effectFromDateDetails" type="text" value="" /></td>
					<%
						} else {
					%>

					<td class="col-md-1"><input id="effectFromDateDetails"
						name="effectFromDateDetails" type="text"
						value="<%=paramCheckingAc.getEffectiveFrom()%>" /></td>
					<%
						}
					%>



					<td class="col-md-1"><s:text name="global.lbl.effective.till.date" /></td>

					<%
						if (mode.equalsIgnoreCase("CREATE")) {
					%>

					<td class="col-md-1"><input id="effectTillDateDetails"
						name="effectTillDateDetails" type="text" value="" /></td>
					<%
						} else {
							if (null != paramCheckingAc.getEffectiveFrom()) {
					%>

					<td class="col-md-1"><input id="effectTillDateDetails"
						name="effectTillDateDetails" type="text"
						value="<%=paramCheckingAc.getEffectiveTill()%>" /></td>
					<%
						} else {
					%>
					<td class="col-md-1"><input id="effectTillDateDetails"
						name="effectTillDateDetails" type="text" value="" /></td>

					<%
						}
						}
					%>
				</tr>


				<tr class="active">
					<td colspan="4" width="100%" height="25" align="center"><input
						type="submit" name="Save" value="<s:text name="global.btn.save" />"><input
						type="button" name="List" value="<s:text name="global.btn.back.to.list" />"
						onClick="javascript:goToList();"></td>
				</tr>
			</table>
			<input type="hidden" id="createdDate" name="createdBy" type="text"
				value="<%=paramCheckingAc.getCreatedBy()%>" /> <input type="hidden"
				id="createdDate" name="createdDate" type="text"
				value="<%=paramCheckingAc.getCreatedDate()%>" />
		</div>
	</form>
</body>
</html>
