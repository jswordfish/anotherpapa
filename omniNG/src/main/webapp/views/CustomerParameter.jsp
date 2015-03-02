<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.BranchMst"%>
<%@page import="java.util.*"%>
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
    
    <link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
        <script src="js1/jquery.min.js"></script>
    <script src="js1/bootstrap.min.js"></script>
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    
    <style class="cp-pen-styles">label{margin-left: 20px;}
		#datepicker{width:180px; margin: 0 20px 20px 20px;}
		#datepicker > span:hover{cursor: pointer;}
	</style>
	
	<script>
		$(function () {
		    $('#datepicker').datepicker({
		        autoclose: true,
		        todayHighlight: true
		    }).datepicker('update', new Date());
		    ;
		});
		
	
	</script>
	<script src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
	<style type="text/css">
		.bs-example{
			margin: 20px;
		}
	</style>
	<script>
	function viewDtls(){
		document.forms["custParamForm"].action = "viewCustomerParameter.action";
		document.forms["custParamForm"].submit();
	}	
	function saveDtls(){
		document.forms["custParamForm"].action = "saveCustomerParameter.action";
		document.forms["custParamForm"].submit();
	}	
	</script> 
	
	</head>
<body>
<form id="omniForm" name="custParamForm" method="POST" action="customerParameterSave">
<%
	String creditAccount = (String)request.getAttribute("creditAccount");
	String shareCapitalAccount = (String)request.getAttribute("shareCapitalAccount");
	String shareSuspenseAccount = (String)request.getAttribute("shareSuspenseAccount");
	String adjustmentAccount = (String)request.getAttribute("adjustmentAccount");
	String instrumentAccount = (String)request.getAttribute("instrumentAccount");
	String yearNumberForHundi = (String)request.getAttribute("yearNumberForHundi");
	String penalInterestRate = (String)request.getAttribute("penalInterestRate");
	String dueDateMonthforTL = (String)request.getAttribute("dueDateMonthforTL");
	String postponedAdjustmentTenorYears = (String)request.getAttribute("postponedAdjustmentTenorYears");
%>

<div id="result" class="container">
<table class="table table-condensed"><tr class="active"><td class="col-md-1">
	<s:text name="global.lbl.customer.code" />&nbsp;<input id="customerCode" name="customerCode" type="text"  value=""/>
	&nbsp;&nbsp;<input type="button" name="viewBtn" value="<s:text name="global.btn.view"/>" onClick="viewDtls();">
</td></tr></table>
<table class="table table-condensed">
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.creditAccount" /></td>
	<td class="col-md-1"><input id="creditAccount" name="creditAccount" type="text" value="<%= creditAccount %>"/></td>
	<td class="col-md-1"><s:text name="global.lbl.shareCapitalAccount" /></td>
	<td class="col-md-1"><input id="shareCapitalAccount" name="shareCapitalAccount" type="text" value="<%= shareCapitalAccount %>"/></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.shareSuspenseAccount" /></td>
	<td class="col-md-1"><input id="shareSuspenseAccount" name="shareSuspenseAccount" type="text"  value="<%= shareSuspenseAccount %>"/></td>
	<td class="col-md-1"><s:text name="global.lbl.adjustmentAccount" /></td>
	<td class="col-md-1"><input id="adjustmentAccount" name="adjustmentAccount" type="text"  value="<%= adjustmentAccount %>"/></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.instrumentAccount" /></td>
	<td class="col-md-1"><input id="instrumentAccount" name="instrumentAccount" type="text"  value="<%= instrumentAccount %>"/></td>
	<td class="col-md-1"><s:text name="global.lbl.yearNumberForHundi" /></td>
	<td class="col-md-1"><input id="yearNumberForHundi" name="yearNumberForHundi" type="text"  value="<%= yearNumberForHundi %>"/></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.penalInterestRate" /></td>
	<td class="col-md-1"><input id="penalInterestRate" name="penalInterestRate" type="text"  value="<%= penalInterestRate %>"/></td>
	<td class="col-md-1"><s:text name="global.lbl.dueDateMonthforTL" /></td>
	<td class="col-md-1"><input id="dueDateMonthforTL" name="dueDateMonthforTL" type="text"  value="<%= dueDateMonthforTL %>"/></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.postponedAdjustmentTenorYears" /></td>
	<td class="col-md-1"><input id="postponedAdjustmentTenorYears" name="postponedAdjustmentTenorYears" type="text"  value="<%= postponedAdjustmentTenorYears %>"/></td>
	<td class="col-md-1"></td>
	<td class="col-md-1"></td>
</tr>
<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="Save" value="<s:text name="global.btn.save"/>" onClick="saveDtls();">
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
