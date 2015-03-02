<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.infrasofttech.domain.entities.ParamLoanAc"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
    <link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
        <script src="js1/jquery.min.js"></script>
    <script src="js1/bootstrap.min.js"></script>
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    
    <style class="cp-pen-styles">label{margin-left: 20px;}
		#datepicker{width:180px; margin: 0 20px 20px 20px;}
		#datepicker > span:hover{cursor: pointer;}
	</style>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
 <script type="text/javascript">
  $(document).ready(
		  
		  /* This is the function that will get executed after the DOM is fully loaded */
		  function () {
		    $( "#effectFromDateDetails" ).datepicker({
		      changeMonth: true,
		      changeYear: true,
		      yearRange: '1960:2100',
		      dateFormat:'yy-mm-dd'
		    });
		    $( "#effectTillDateDetails" ).datepicker({
			      changeMonth: true,
			      changeYear: true,
			      yearRange: '1960:2100',
			      dateFormat:'yy-mm-dd'
			    });
		  }

	);
  </script>
  <script src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
    
	
	<style type="text/css">
		.bs-example{
			margin: 20px;
		}
	</style>


<script>
		function validateInput(){
			var effectFromDateDetails = document.getElementById("effectFromDateDetails").value;
			
			if(effectFromDateDetails.length > 0){
				return true;
			}else{
				alert("Please enter effectFromDate!!!");
				return false;
			}
		}
	</script>
<script type="text/javascript">
	function toggleTable(tblName) {
		//idNonPerformTbl,idAccountingTbl,idOtherTbl
		if (tblName == "idAccountingTbl") {
			document.getElementById("idAccountingTbl").style.display = "block";
			document.getElementById("idOtherTbl").style.display = "none";
			document.getElementById("idNonPerformTbl").style.display = "none";
		}
		if (tblName == "idOtherTbl") {
			document.getElementById("idOtherTbl").style.display = "block";
			document.getElementById("idAccountingTbl").style.display = "none";
			document.getElementById("idNonPerformTbl").style.display = "none";
		}
		if (tblName == "idNonPerformTbl") {
			document.getElementById("idNonPerformTbl").style.display = "block";
			document.getElementById("idAccountingTbl").style.display = "none";
			document.getElementById("idOtherTbl").style.display = "none";
		}

	}
</script>
<script>
	$(document).ready(function() {
		var data = [];
		<c:forEach  var="modules" items="${codes}">
		data.push('<c:out value="${modules.branchCode}"/>');
		</c:forEach>
		for (var i = 0; i < data.length; i++) {
			$('#idBranchCode option').map(function() {
				if ($(this).val() == data[i])
					return this;
			}).attr('selected', 'selected');
		}
	});
</script>
<script>
	function goToList(){
		document.forms["omniParamLoanAcForm"].action = "paramLoanList.action";
		document.forms["omniParamLoanAcForm"].submit();
	}
	</script>
</head>
<body>
	<form id="omniParamLoanAcForm" method="POST" action="paramLoanAcSave">

		<%
			String mode = (String) request.getAttribute("mode");
			System.out.println("ParamLoanAc JSP mode:" + mode);

			Map<String, String> interestApplicationFrequency = new HashMap<String, String>();
			Map<String, String> productCalculationType = new HashMap<String, String>();
			Map<String, String> roundOff = new HashMap<String, String>();
			Map<String, String> interestChargeType = new HashMap<String, String>();
			Map<String, String> loanType = new HashMap<String, String>();
			Map<String, String> holiDayPeriod = new HashMap<String, String>();
			Map<String, String> branches = new HashMap<String, String>();
			Map<String, String> products = new HashMap<String, String>();
			Map<String, String> batches = new HashMap<String, String>();
			Map<String, String> branchCodes = new HashMap<String, String>();

			interestApplicationFrequency = (Map<String, String>) request
					.getAttribute("interestApplicationFrequency");
			productCalculationType = (Map<String, String>) request
					.getAttribute("productCalculationType");
			roundOff = (Map<String, String>) request.getAttribute("roundOff");
			interestChargeType = (Map<String, String>) request
					.getAttribute("interestChargeType");
			holiDayPeriod = (Map<String, String>) request
					.getAttribute("holiDayPeriod");
			loanType = (Map<String, String>) request.getAttribute("loanType");
			branches = (Map<String, String>) request.getAttribute("branches");
			products = (Map<String, String>) request.getAttribute("products");
			branchCodes = (Map<String, String>) request
					.getAttribute("branchCodes");

			if (interestApplicationFrequency == null) {
				interestApplicationFrequency = new HashMap<String, String>();
			}

			if (productCalculationType == null) {
				productCalculationType = new HashMap<String, String>();
			}

			if (roundOff == null) {
				roundOff = new HashMap<String, String>();
			}

			if (interestChargeType == null) {
				interestChargeType = new HashMap<String, String>();
			}

			if (loanType == null) {
				loanType = new HashMap<String, String>();
			}

			if (holiDayPeriod == null) {
				holiDayPeriod = new HashMap<String, String>();
			}

			if (branches == null) {
				branches = new HashMap<String, String>();
			}

			if (products == null) {
				products = new HashMap<String, String>();
			}
			if (branchCodes == null) {
				branchCodes = new HashMap<String, String>();
			}
			/*  batches = (Map<String, String>) request.getAttribute("batches");
			if (batches == null) {
				batches = new HashMap<String, String>();
			} */
			ParamLoanAc paramLoanAc = (ParamLoanAc) request
					.getAttribute("paramLoanAc");
		%>
		<div id="result" class="container">
			<input type="hidden" name="mode" value="<%=mode%>">
			<table class="table table-condensed">

				<tr class="active">
					<td class="col-md-1">Product Code:</td>
					<td class="col-md-1"><select id="productCode"
						name="productCode">
							<%
								for (Map.Entry<String, String> entry : products.entrySet()) {

									if (null != paramLoanAc.getProdCode()
											&& paramLoanAc.getProdCode().equalsIgnoreCase(
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
					<td rowspan="3" class="col-md-1">Branch :</td>
					<td rowspan="3" class="col-md-1"><select id="idBranchCode"
						multiple="multiple" name="branchCode">
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
					<td class="col-md-1">LoanType:</td>
					<td class="col-md-1"><select id="loanType" name="loanType">
							<%
								for (Map.Entry<String, String> entry : loanType.entrySet()) {

									if (null != paramLoanAc.getLoanType()
											&& paramLoanAc.getLoanType().equalsIgnoreCase(
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
				</tr>
				<tr class="active">
					<td class="col-md-1">Equated Y/N:</td>
					<td class="col-md-1">
						<%
							if (null != paramLoanAc.getEquated()
									&& paramLoanAc.getEquated() == true) {
						%> <input checked="checked" type="radio" name="equated"
						id="equated" value="Y">&nbsp;Yes <input type="radio"
						name="equated" id="equated" value="N">&nbsp;No <%
 	} else {
 %> <input type="radio" name="equated" id="equated" value="Y">&nbsp;Yes
						<input checked="checked" type="radio" name="equated" id="equated"
						value="N">&nbsp;No <%
 	}
 %>
					</td>

				</tr>

				<tr class="active">
					<td class="col-md-1">Funded Y/N:</td>
					<td class="col-md-1">
						<%
							if (null != paramLoanAc.getFunded()
									&& paramLoanAc.getFunded() == true) {
						%> <input checked="checked" type="radio" name="funded" id="funded"
						value="Y">&nbsp;Yes <input type="radio" name="funded"
						id="funded" value="N">&nbsp;No <%
 	} else {
 %> <input type="radio" name="funded" id="funded" value="Y">&nbsp;Yes
						<input checked="checked" type="radio" name="funded" id="funded"
						value="N">&nbsp;No <%
 	}
 %>
					</td>
					<td class="col-md-1">InterestApplicationFrequency:</td>
					<td class="col-md-1"><select id="interestApplicationFrequency"
						name="interestApplicationFrequency">
							<%
								for (Map.Entry<String, String> entry : interestApplicationFrequency
										.entrySet()) {
									if (null != paramLoanAc.getInterestApplicationFrequency()
											&& paramLoanAc.getInterestApplicationFrequency()
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
					<td class="col-md-1">Grace Days Installment:</td>
					<td class="col-md-1"><input id="graceDaysInstallment"
						name="graceDaysInstallment" type="text"
						value="<%=paramLoanAc.getGraceDaysInstallment()%>" /></td>

					<td class="col-md-1">Product Calc. Type:</td>
					<td class="col-md-1"><select id="productCalculationType"
						name="productCalculationType">
							<%
								for (Map.Entry<String, String> entry : productCalculationType
										.entrySet()) {
									if (null != paramLoanAc.getProductCalculationType()
											&& paramLoanAc.getProductCalculationType()
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
					<td class="col-md-1">Holiday Period:</td>
					<td class="col-md-1"><select id="holiDayPeriod"
						name="holiDayPeriod">
							<%
								for (Map.Entry<String, String> entry : holiDayPeriod.entrySet()) {
									if (null != paramLoanAc.getHolidayPeriod()
											&& paramLoanAc.getHolidayPeriod().equalsIgnoreCase(
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
					<td class="col-md-1">Default Transfer Batch:</td>
					<td class="col-md-1">
					<select id="defaultTransferBatch"
						name="defaultTransferBatch">
							<%
								for (Map.Entry<String, String> entry : batches.entrySet()) {
									if (null != paramLoanAc.getDefaultTransferBatch()
											&& paramLoanAc.getDefaultTransferBatch()
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
					</select>
					
					

				</tr>
				<tr class="active">
					<td class="col-md-1">Minimum Term:</td>
					<td class="col-md-1"><input id="minimumTerm"
						name="minimumTerm" type="text"
						value="<%=paramLoanAc.getMinimumTerm()%>" /></td>
					<td class="col-md-1">Maximum Term:</td>
					<td class="col-md-1"><input id="maximumTerm"
						name="maximumTerm" type="text"
						value="<%=paramLoanAc.getMaximumTerm()%>" /></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Minimum Amount:</td>
					<td class="col-md-1"><input id="minimumAmount"
						name="minimumAmount" type="text"
						value="<%=paramLoanAc.getMinimumAmount()%>" /></td>
					<td class="col-md-1">Maximum Amount:</td>
					<td class="col-md-1"><input id="maximumAmount"
						name="maximumAmount" type="text"
						value="<%=paramLoanAc.getMaximumAmount()%>" /></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Grace Days Interest:</td>
					<td class="col-md-1"><input id="graceDaysInterest"
						name="graceDaysInterest" type="text"
						value="<%=paramLoanAc.getGraceDayInterest()%>" /></td>

					<td class="col-md-1">Round Off:</td>
					<td class="col-md-1"><select id="roundOff" name="roundOff">
							<%
								for (Map.Entry<String, String> entry : roundOff.entrySet()) {
									if (null != paramLoanAc.getRoundOff()
											&& paramLoanAc.getRoundOff().equalsIgnoreCase(
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
				</tr>

				<tr class="active">
					<td class="col-md-1">Min days for Interest:</td>
					<td class="col-md-1"><input id="minDaysForInterest"
						name="minDaysForInterest" type="text"
						value="<%=paramLoanAc.getMinimumDaysOfInterest()%>" /></td>
					<td class="col-md-1">Penal Interest Rate:</td>
					<td class="col-md-1"><input id="penalInterestRate"
						name="penalInterestRate" type="text"
						value="<%=paramLoanAc.getPenalInterestRate()%>" /></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Max Penal Interest Rate:</td>
					<td class="col-md-1"><input id="maxPenalInterestRate"
						name="maxPenalInterestRate" type="text"
						value="<%=paramLoanAc.getMaxPenalInterestRate()%>" /></td>
					<td class="col-md-1">Interest Tax :</td>
					<td class="col-md-1"><input id="interestTax"
						name="interestTax" type="text"
						value="<%=paramLoanAc.getInterestTax()%>" /></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Non Performing Account penal Rate:</td>
					<td class="col-md-1"><input id="notPerformingAccountpenalRate"
						name="notPerformingAccountpenalRate" type="text"
						value="<%=paramLoanAc.getNotPerformingAccountpenalRate()%>" /></td>

					<td class="col-md-1">Interest Charge Type:</td>
					<td class="col-md-1"><select id="interestChargeType"
						name="interestChargeType">
							<%
								for (Map.Entry<String, String> entry : roundOff.entrySet()) {
									if (null != paramLoanAc.getInterestChargeType()
											&& paramLoanAc.getInterestChargeType()
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
					<td class="col-md-1">Months(valuDate):</td>
					<td class="col-md-1"><input id="monthValueDate"
						name="monthValueDate" type="text"
						value="<%=paramLoanAc.getMonthValueDate()%>" /></td>
					<td class="col-md-1">Death Insurance:</td>
					<td class="col-md-1"><input id="deathInsurance"
						name="deathInsurance" type="text"
						value="<%=paramLoanAc.getDeathInsurance()%>" /></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Guarantee Deposit:</td>
					<td class="col-md-1"><input id="guaranteeDeposit"
						name="guaranteeDeposit" type="text"
						value="<%=paramLoanAc.getGuaranteeDeposit()%>" /></td>
					<td class="col-md-1">Guarantee Fund:</td>
					<td class="col-md-1"><input id="guaranteeFund"
						name="guaranteeFund" type="text"
						value="<%=paramLoanAc.getGuaranteeFund()%>" /></td>
				</tr>
				<tr class="active">
					<td class="col-md-1">Effect From Date :</td>
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
						value="<%=paramLoanAc.getEffectiveFrom()%>" /></td>
					<%
						}
					%>



					<td class="col-md-1">Effect Till Date :</td>

					<%
						if (mode.equalsIgnoreCase("CREATE")) {
					%>

					<td class="col-md-1"><input id="effectTillDateDetails"
						name="effectTillDateDetails" type="text" value="" /></td>
					<%
						} else {
							if (null != paramLoanAc.getEffectiveFrom()) {
					%>

					<td class="col-md-1"><input id="effectTillDateDetails"
						name="effectTillDateDetails" type="text"
						value="<%=paramLoanAc.getEffectiveTill()%>" /></td>
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

			</table>

			<table class="table table-condensed">
				<tr class="active">
					<td class="col-md-1"><b> <a id="basicInfo"
							onclick="toggleTable('idAccountingTbl');" href="#">Accounting
								Parameter</a>
					</b></td>
				</tr>
			</table>
			<div style="display: none;" id="idAccountingTbl">
				<table class="table table-condensed">
					<tr class="active">
						<td class="col-md-1">Minimum Closure Term:</td>
						<td class="col-md-1"><input id="minimumClosureTerm"
							name="minimumClosureTerm" type="text"
							value="<%=paramLoanAc.getMinimumClosureTerm()%>" /></td>

						<td class="col-md-1">Discounted Interest rate Y/N:</td>
						<td class="col-md-1">
							<%
								if (null != paramLoanAc.getDiscoutedInterestRate()
										&& paramLoanAc.getDiscoutedInterestRate() == true) {
							%> <input checked="checked" type="radio"
							name="discoutedInterestRate" id="discoutedInterestRate" value="Y">&nbsp;Yes
							<input type="radio" name="discoutedInterestRate"
							id="discoutedInterestRate" value="N">&nbsp;No <%
 	} else {
 %> <input type="radio" name="discoutedInterestRate"
							id="discoutedInterestRate" value="Y">&nbsp;Yes <input
							checked="checked" type="radio" name="discoutedInterestRate"
							id="discoutedInterestRate" value="N">&nbsp;No <%
 	}
 %>
						</td>
					</tr>
					<tr class="active">
						<td class="col-md-1">Number Of Days In Year:</td>
						<td class="col-md-1"><input id="numberOfDaysInYear"
							name="numberOfDaysInYear" type="text"
							value="<%=paramLoanAc.getNumberOfDaysInYear()%>" /></td>
						<td class="col-md-1">Maximum Sanction Limit:</td>
						<td class="col-md-1"><input id="maximumSanctionLimit"
							name="maximumSanctionLimit" type="text"
							value="<%=paramLoanAc.getMaximumSanctionLimit()%>" /></td>
					</tr>
					<tr class="active">
						<td class="col-md-1">Accept Non Performin Account Date:</td>
						<td class="col-md-1">
							<%
								if (null != paramLoanAc.getAcceptNonPerformingAccountDate()
										&& paramLoanAc.getAcceptNonPerformingAccountDate() == true) {
							%> <input checked="checked" type="radio"
							name="acceptNonPerformingAccountDate"
							id="acceptNonPerformingAccountDate" value="Y">&nbsp;Yes <input
							type="radio" name="acceptNonPerformingAccountDate"
							id="acceptNonPerformingAccountDate" value="N">&nbsp;No <%
 	} else {
 %> <input type="radio" name="acceptNonPerformingAccountDate"
							id="acceptNonPerformingAccountDate" value="Y">&nbsp;Yes <input
							checked="checked" type="radio"
							name="acceptNonPerformingAccountDate"
							id="acceptNonPerformingAccountDate" value="N">&nbsp;No <%
 	}
 %>
						</td>
						<td class="col-md-1">Charge Full Month Interest In Closure:</td>
						<td class="col-md-1">
							<%
								if (null != paramLoanAc.getChargeFullMonthInterestClosure()
										&& paramLoanAc.getChargeFullMonthInterestClosure() == true) {
							%> <input checked="checked" type="radio"
							name="chargeFullMonthInterestClosure"
							id="chargeFullMonthInterestClosure" value="Y">&nbsp;Yes <input
							type="radio" name="chargeFullMonthInterestClosure"
							id="chargeFullMonthInterestClosure" value="N">&nbsp;No <%
 	} else {
 %> <input type="radio" name="chargeFullMonthInterestClosure"
							id="chargeFullMonthInterestClosure" value="Y">&nbsp;Yes <input
							checked="checked" type="radio"
							name="chargeFullMonthInterestClosure"
							id="chargeFullMonthInterestClosure" value="N">&nbsp;No <%
 	}
 %>
						</td>
					</tr>
				</table>
			</div>
			<table class="table table-condensed">
				<tr class="active">
					<td class="col-md-1"><b> <a id="basicInfo"
							onclick="toggleTable('idOtherTbl');" href="#">Other
								Parameters </a>
					</b></td>
				</tr>
			</table>
			<div style="display: none;" id="idOtherTbl">
				<table class="table table-condensed">
					
					<tr class="active">
						<td class="col-md-1">Status :</td>
						<td class="col-md-1"><input id="status" name="status"
							type="text" value="<%=paramLoanAc.getStatus()%>" /></td>
						<td class="col-md-1">no.of Account :</td>
						<td class="col-md-1"><input id="numOfAccount"
							name="numOfAccount" type="text"
							value="<%=paramLoanAc.getNumOfAccount()%>" /></td>
					</tr>
					<tr class="active">
						<td class="col-md-1">Last Account:</td>
						<td class="col-md-1"><input id="lastAccount"
							name="lastAccount" type="text"
							value="<%=paramLoanAc.getLastAccount()%>" /></td>
						<td class="col-md-1">Un-Recov Exp A/C :</td>
						<td class="col-md-1"><input id="unRecovExpAc"
							name="unRecovExpAc" type="text"
							value="<%=paramLoanAc.getUnRecovExpAc()%>" /></td>
					</tr>
				</table>
			</div>
			<table class="table table-condensed">
				<tr class="active">
					<td class="col-md-1"><b> <a id="basicInfo"
							onclick="toggleTable('idNonPerformTbl');" href="#">Non
								Performing Account Parameters </a>
					</b></td>
				</tr>
			</table>
			<div style="display: none;" id="idNonPerformTbl">
				<table class="table table-condensed">
					<tr class="active">
						<td class="col-md-1">Non Performing Account Interest</td>
					</tr>
					<tr class="active">
						<td class="col-md-1">NPAAIntrecvA/C:</td>
						<td class="col-md-1"><input id="NPAAIntRecvAc"
							name="NPAAIntRecvAc" type="text"
							value="<%=paramLoanAc.getNpaAIntRecvAc()%>" /></td>
						<td class="col-md-1">NPAAIntResA/C :</td>
						<td class="col-md-1"><input id="NPAAIntResAc"
							name="NPAAIntResAc" type="text"
							value="<%=paramLoanAc.getNpaAIntResAc()%>" /></td>
					</tr>
					<tr class="active">
						<td class="col-md-1">Non Performing Account Penal Interest</td>
					</tr>
					<tr class="active">
						<td class="col-md-1">NPAPIntRecvA/C:</td>
						<td class="col-md-1"><input id="NPAPIntRecvAc"
							name="NPAPIntRecvAc" type="text"
							value="<%=paramLoanAc.getNpaPIntRecvAc()%>" /></td>
						<td class="col-md-1">NPAPIntResA/C :</td>
						<td class="col-md-1"><input id="NPAPIntResAc"
							name="NPAPIntResAc" type="text"
							value="<%=paramLoanAc.getNpaPIntResAc()%>" /></td>
					</tr>
					<tr class="active">
						<td class="col-md-1">Non Performing Account Other Charges</td>
					</tr>
					<tr class="active">
						<td class="col-md-1">NPAOCRecvA/C:</td>
						<td class="col-md-1"><input id="NPAOCRecvAc"
							name="NPAOCRecvAc" type="text"
							value="<%=paramLoanAc.getNpaOCRecvAc()%>" /></td>
						<td class="col-md-1">NPAOCResA/C :</td>
						<td class="col-md-1"><input id="NPAOCResAc" name="NPAOCResAc"
							type="text" value="<%=paramLoanAc.getNpaOCResAc()%>" /></td>
					</tr>
				</table>

			</div>
			<table class="table table-condensed">
				<tr class="active">
					<td colspan="4" width="100%" height="25" align="center"><input
						type="submit" name="Save" value="Save" onClick="return validateInput();"><input
						type="button" name="List" value="Back to List"
						onClick="javascript:goToList();"></td>
				</tr>
			</table>
			<input type="hidden" id="status" name="createdBy" type="text"
				value="<%=paramLoanAc.getCreatedBy()%>" /> <input type="hidden" id="status"
				name="createdDate" type="text"
				value="<%=paramLoanAc.getCreatedDate()%>" />
		</div>
	</form>
</body>
</html>