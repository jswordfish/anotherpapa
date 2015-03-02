<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.infrasofttech.domain.entities.PrdAcNumberConfig"%>
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
    
   <!--  <link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
        <script src="js1/jquery.min.js"></script>
    <script src="js1/bootstrap.min.js"></script>
     -->
     <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
     
    <style class="cp-pen-styles">label{margin-left: 20px;}
		#datepicker{width:180px; margin: 0 20px 20px 20px;}
		#datepicker > span:hover{cursor: pointer;}
	</style>

<script language="javascript">
	function startUp() {
	    alert("branch  "+document.getElementById("idMode").value);
    }
			 
</script>
<script>		 
function validate(form) {
alert("validat"+document.getElementById("idTotalAc").value);
		var totalAcLen = document.getElementById("idTotalAc").value;
	//var subTotalAcLen = document.getElementById("idSubAccountAc").value;
	var branch = document.getElementById("idBranch"); alert("1");
	var branchRank = document.getElementById("idBranchRank").value; alert("2");
	var branchLength = document.getElementById("idBranchLen").value;alert("3");

	var currency = document.getElementById("idCurrency"); alert("4");
	var currencyRank = document.getElementById("idCurrencyRank").value; alert("5");
	var currencyLength = document.getElementById("idCurrencyLen").value; alert("6");

	var customer = document.getElementById("idCustomer"); alert("7");
	var customerRank = document.getElementById("idCustomerRank").value; alert("8");
	var customerLength = document.getElementById("idCustomerLen").value; alert("9");

	var product = document.getElementById("idProductYN"); alert("10");
	var productRank = document.getElementById("idProductRank").value; alert("11");
	var productLength = document.getElementById("idProductLen").value; alert("12");

	var subAccount = document.getElementById("idSubAccount"); alert("13");
	var subAccountRank = document.getElementById("idSubAccountRank").value; alert("14");
	var subAccountLength = document.getElementById("idSubAccountLen").value; alert("15");
	var accountLength = document.getElementById("idAccountLen").value; alert("16");
	
	 alert('accountLength'+accountLength);
    var errorMsg=new Array();
  
    alert("17");
	
		var totalLength = parseInt(branchLength) + parseInt(currencyLength)
				+ parseInt(productLength) + parseInt(customerLength)
				+ parseInt(accountLength)+parseInt(subAccountLength);
		if (totalAcLen != totalLength)

		{ alert("18");
			errorMsg.push("sum of length should match Total A/c length");
			//document.getElementById("el").innerHTML = 'sum of length should match Total A/c length ';

		}

	

	// var totalLength=branchlength+currencyLength+customerLength+productlength+SubAccountlength;  

	if (branch.checked == true) {
alert("19");
		if (branchRank === null || branchRank === '') {
			//document.getElementById("el").innerHTML = 'Branch Rank Required';
		//	branchRank = document.getElementById("idBranchRank").focus();
			errorMsg.push("Branch Rank Required");
		}

		if (branchLength == 0 || branchLength == '') {
			//document.getElementById("el").innerHTML = 'Branch Length Required';
			errorMsg.push("Branch Length Required");
		}
	}

	if (currency.checked == true) { alert("20");
		if (currencyRank == 0 || currencyRank == '') {
		//	document.getElementById("el").innerHTML = 'Currency Rank Required';
			errorMsg.push("Currency Rank Required");
		}

		if (currencyLength == 0 || currencyLength == '') {
		//	document.getElementById("el").innerHTML = 'Currency Length Required';
			errorMsg.push("Currency Length is required");

		}
	}

	if (customer.checked == true) { alert("21");
		if (customerRank == 0 || customerRank == '') {
			//document.getElementById("el").innerHTML = 'Customer Rank Required';
			errorMsg.push("Customer Rank is required");
		}

		if (customerLength == 0 || customerLength == '') {
			//document.getElementById("el").innerHTML = 'Customer Length Required';
			errorMsg.push("Customer Length is required");

		}
	}

	if (product.checked == true) { alert("22");
		if (productRank == 0 || productRank == '') {
			//document.getElementById("el").innerHTML = 'Product Rank Required';
			errorMsg.push("Product Rank is required");
		}

		if (productLength == 0 || productLength == '') {
			//document.getElementById("el").innerHTML = 'Product Length Required';
			errorMsg.push("Product Length is required");

		}
	}
	if (subAccount.checked == true) { alert("23");
		if (subAccountRank == 0 || subAccountRank == '') {
			//document.getElementById("el").innerHTML = 'Sub A/c Rank Required';
			errorMsg.push("Sub A/c Rank is required");
		}

		if (subAccountLength == 0 || subAccountLength == '') {

		//	document.getElementById("el").innerHTML = 'Sub A/c Length Required';
			errorMsg.push("Sub A/c Length is required");

		}

	

	}
	alert("24");

	 
			
	var messageHtml = "";

	    errorMsg.forEach(function (message) {
	    	
	        messageHtml +=  message + '<br/>';
	        
	    });
	    alert("errorMsg");
	    document.getElementById("error").innerHTML = messageHtml;
		alert("messageHtml..."+messageHtml);
		alert( document.getElementById("error").innerHTML);
	    if(errorMsg.length>0)
	    	{
	    	return false;
	    	}
	    else
	    	
	    	{
	    	return true;
	    	}
	 
}
	


</script>


 <script>
 
 
     $(document).ready(function(){ 
    	         
       
          var branch=document.getElementById("idBranch").value;
          var currency=document.getElementById("idCurrency").value;
          var customer=document.getElementById("idCustomer").value;
          var product=document.getElementById("idProductYN").value;
          var subaccount=document.getElementById("idSubAccount").value;
        
        if(branch=='true')
        	{ 
        	
        	$("#idBranch").prop("checked","checked");
        	
        	}
        else
        	{
        	   $("#idBranchRank").prop("readonly",true).css({"background-color" : "#DEDEDE","color" : "#DEDEDE"	}).val('0'); 
        	   $("#idBranchLen").prop("readonly",true).css({"background-color" : "#DEDEDE","color" : "#DEDEDE"	}).val('0');
        	}
         if(currency=='true')
    	{
    	$("#idCurrency").prop("checked","checked");
    	
    	}
         else
        	 {
        	 
        	 $("#idCurrencyRank").prop("readonly", true).css({
 				"background-color" : "#DEDEDE",
 				"color" : "#DEDEDE"
 			}).val('0');
 			$("#idCurrencyLen").prop("readonly",true).css({
 				"background-color" : "#DEDEDE",
 				"color" : "#DEDEDE"
 			}).val('0');
        	 }
         if(customer=='true')
    	{
    	$("#idCustomer").prop("checked","checked");
    	
    	}
         else
        	 {
        	 $("#idCustomerRank").prop("readonly", true).css({
 				"background-color" : "#DEDEDE",
 				"color" : "#DEDEDE"
 			}).val('0');
 			$("#idCustomerLen").prop("readonly", true).css({
 				"background-color" : "#DEDEDE",
 				"color" : "#DEDEDE"
 			}).val('0');
        	 
        	 }
        if(product=='true')
    	{
    	$("#idProductYN").prop("checked","checked");
    	
    	}
        else
        	{
        	$("#idProductRank").prop("readonly", true).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			$("#idProductLen").prop("readonly",true).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
        	
        	}
        if(subaccount=='true')
    	{
    	$("#idSubAccount").prop("checked","checked");
    	
    	}
        else
        	{
        	$("#idSubAccountRank").prop("readonly", true).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			$("#idSubAccountLen").prop("readonly",true).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
        	
        	}
     });
  
     </script>

 



<script language="javascript">
$(document).ready( function () {
		$("#idBranch").change(function() {
			
		
	        $("#idBranchRank").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			$("#idBranchLen").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			if ($(this).is(':checked')) {
				$("#idBranchRank").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');
				$("#idBranchLen").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');
			}

			
		
		});
		$("#idCurrency").change(function() {
			$("#idCurrencyRank").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			$("#idCurrencyLen").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			
			if ($(this).is(':checked')) {
				$("#idCurrencyRank").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');
				$("#idCurrencyLen").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');

			}
		});
		$("#idCustomer").change(function() {
			$("#idCustomerRank").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			$("#idCustomerLen").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			if ($(this).is(':checked')) {
				$("#idCustomerRank").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');
				$("#idCustomerLen").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');

			}
		});
		$("#idProductYN").change(function() {
			$("#idProductRank").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			$("#idProductLen").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			if ($(this).is(':checked')) {
				$("#idProductRank").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');
				$("#idProductLen").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');
			}
		});
		$("#idSubAccount").change(function() {
			$("#idSubAccountRank").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			$("#idSubAccountLen").prop("readonly", !$(this).is(':checked')).css({
				"background-color" : "#DEDEDE",
				"color" : "#DEDEDE"
			}).val('0');
			if ($(this).is(':checked')) {

				$("#idSubAccountRank").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');
				$("#idSubAccountLen").css({
					"background-color" : "#FFFFFF",
					"color" : "#000000"
				}).val('');

			}
	
	});
		
});    </script>
           

	
<script src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
    
	
	<style type="text/css">
		.bs-example{
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
<body onLoad="javascript:startUp();">
<form id="omniProductForm" method="POST" action="PrdAcNumberSave" onsubmit="return validate(this);">
<%
	String mode = (String)request.getAttribute("mode");
	System.out.println("PrdAcNumberConfig JSP mode:"+mode);
	
	Map<String, String> sepr = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();


	sepr = (Map<String, String>)request.getAttribute("sepr");
	if(sepr == null){ sepr = new HashMap<String, String>(); }
	
	modules = (Map<String, String>)request.getAttribute("modules");
	if(modules == null){ modules = new HashMap<String, String>(); }
	
	
	products = (Map<String, String>)request.getAttribute("products");
	if(products == null){ products = new HashMap<String, String>(); }
	
	
	
	PrdAcNumberConfig prdAcNumberConfig = (PrdAcNumberConfig)request.getAttribute("prdAcNumberConfig");
%>
<div id="result" class="container">
<input type="hidden" id="idMode" name="mode" value="<%= mode %>">
<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
	    	<div align="left" id="idErrTbl" class="errorDiv" style="display:none">
			<p id="el" style="color: #FF0040" align="left"></p>			
			<p id="error" style="color: #FF0040" align="left"></p>
			<p id="error2" style="color: #FF0040" align="left"></p>
		  </div>
     	
		<div align="left">
		<table class="table table-condensed">
		
		<tr class="active">
	
	<td class="col-md-1">Module Code:</td>
	<td class="col-md-1">
		<select id="moduleCode" name="moduleCode">
			<% for(Map.Entry<String, String> entry : modules.entrySet()) { 
					if(null != prdAcNumberConfig.getModuleCode() &&
							prdAcNumberConfig.getModuleCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1">Product Code:</td>
	<td class="col-md-1">
		<select id="idProduct" name="productCode">
			<% for(Map.Entry<String, String> entry : products.entrySet()) { 
					if(null != prdAcNumberConfig.getProductCode() &&
							prdAcNumberConfig.getProductCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1">A/C Number Separator:</td>
	<td class="col-md-1">
		<select id="sepr" name="sepr">
			<% for(Map.Entry<String, String> entry : sepr.entrySet()) { 
					if(null != prdAcNumberConfig.getSepr() &&
							prdAcNumberConfig.getSepr().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1">Total A/c Length:</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="idTotalAc" name="totalAccountLen" type="text" value="" /></td>
	<%	}else{%>
			<td class="col-md-1"><input  id="idTotalAc" name="totalAccountLen" type="text"  value="<%= prdAcNumberConfig.getTotalAccountLen() %>"/></td>
	<%	}%>
</tr>
<%-- <tr class="active">
	<td class="col-md-1">Total Sub A/c Length:</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="totalSubAccountLen" name="totalSubAccountLen" type="text"  value="<%= prdAcNumberConfig.getProductCode() %>"/></td>
	<%	}else{%>
			<td class="col-md-1"><input  id="totalSubAccountLen" name="totalSubAccountLen" type="text"  value="<%= prdAcNumberConfig.getProductCode() %>"/></td>
	<%	}%>
	<td class="col-md-1">&nbsp;</td>
	<td class="col-md-1">&nbsp;</td>
</tr> --%>
<tr>
			<td width="100%" colspan="4">
			<table width="50%" border="1" cellspacing="0" cellpadding="0"><tr><td width="100%">
				<table width="100%" cellspacing="1" border="0">
					<tr bgcolor="#A0A0FF">
						<td width="50%"  class="col-md-1">Select</td>
						<td width="30%"  class="col-md-1">Parameter</td>
						<td width="10%"  class="col-md-1">Rank</td>
						<td width="10%"  class="col-md-1">Length</td>
					</tr>
							
			
			
				<tr class="active">
	            <td width="50%"  class="col-md-1">
	<input  id="idBranch" type="checkbox" name="branchYN" value="<%= prdAcNumberConfig.getBranchYN() %>"></td>
	<td width="30%" class="col-md-1">Branch</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input tabindex="7" type="text" id="idBranchRank" name="branchRank"  ></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input tabindex="7" type="text" id="idBranchRank" name="branchRank"    value="<%= prdAcNumberConfig.getBranchRank() %>"/></td>
	<%	}%>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input tabindex="8" id="idBranchLen" type="text" name="branchLen"  ></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input tabindex="8" id="idBranchLen" type="text" name="branchLen"   value="<%= prdAcNumberConfig.getBranchLen() %>"/></td>
	<%	}%>
     </tr>		


	<tr class="active">
     <td width="50%"  class="col-md-1">
	<input type="checkbox" name="currencyYN" id="idCurrency" value="<%= prdAcNumberConfig.getCurrencyYN() %>"></td>
	</td>
	<td width="30%" class="col-md-1">Currency</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="idCurrencyRank" name="currencyRank" type="text" /></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="idCurrencyRank" name="currencyRank" type="text"  value="<%= prdAcNumberConfig.getCurrencyRank() %>"/></td>
	<%	}%>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="idCurrencyLen" name="currencyLen" type="text"  /></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="idCurrencyLen" name="currencyLen" type="text"  value="<%= prdAcNumberConfig.getCurrencyLen() %>"/></td>
	<%	}%>
</tr>		


	<tr class="active">
     <td width="50%"  class="col-md-1">
	 <input  id="idProductYN" type="checkbox" name="productYN" value="<%= prdAcNumberConfig.getProductYN() %>"></td>
	</td>
	<td width="30%" class="col-md-1">Product</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="idProductRank" name="productRank" type="text" /></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="idProductRank" name="productRank" type="text"  value="<%= prdAcNumberConfig.getProductRank() %>"/></td>
	<%	}%>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="idProductLen" name="productLen" type="text" /></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="idProductLen" name="productLen" type="text"  value="<%= prdAcNumberConfig.getProductLen() %>"/></td>
	<%	}%>
</tr>		


	<tr class="active">
     <td width="50%"  class="col-md-1">
	 
	  <input  id="idCustomer" type="checkbox" name="customerYN" value="<%= prdAcNumberConfig.getCustomerYN() %>"></td>
	 </td>
	<td width="30%" class="col-md-1">Customer</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="idCustomerRank" name="customerRank" type="text"  /></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="idCustomerRank" name="customerRank" type="text"  value="<%= prdAcNumberConfig.getCustomerRank() %>"/></td>
	<%	}%>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="idCustomerLen" name="customerLen" type="text" /></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="idCustomerLen" name="customerLen" type="text"  value="<%= prdAcNumberConfig.getCustomerLen() %>"/></td>
	<%	}%>
</tr>		
	
	
	
	<tr class="active">
     <td width="50%"  class="col-md-1">
	  <input type="checkbox" " value="" name="accountYN" checked  disabled="disabled"></td>
	
	</td>
	<td width="30%" class="col-md-1">Account</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="accountRank" name="accountRank" type="text"/></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="accountRank" name="accountRank" type="text"  value="<%= prdAcNumberConfig.getAccountRank() %>"/></td>
	<%	}%>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="idAccountLen" name="accountLen" type="text" /></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="idAccountLen" name="accountLen" type="text"  value="<%= prdAcNumberConfig.getAccountLen() %>"/></td>
	<%	}%>
</tr>		
	
	
	<tr class="active">
     <td width="50%"  class="col-md-1">
	  <input  id="idSubAccount" type="checkbox" name="subAccountYN" value="<%= prdAcNumberConfig.getSubAccountYN() %>"></td>
	
	</td>
	<td width="30%" class="col-md-1">SubAccount</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="idSubAccountRank" name="subAccountRank" type="text"  /></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="idSubAccountRank" name="subAccountRank" type="text"  value="<%= prdAcNumberConfig.getSubAccountRank() %>"/></td>
	<%	}%>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td width="10%" class="col-md-1"><input id="idSubAccountLen" name="subAccountLen" type="text" /></td>
	<%	}else{%>
			<td width="10%" class="col-md-1"><input  id="idSubAccountLen" name="subAccountLen" type="text"  value="<%= prdAcNumberConfig.getSubAccountLen() %>"/></td>
	<%	}%>
</tr>		
				</table>
				</td></tr></table>
			</td>
		</tr>
		
				<tr class="active">
	<td class="col-md-1">Effective From Date:</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="effFromDate" name="effFromDate" type="text" /></td>
	<%	}else{%>
			<td class="col-md-1"><input  id="effFromDate" name="effFromDate" type="text"  value="<%= prdAcNumberConfig.getEffFromDate() %>"/></td>
	<%	}%>
	<td class="col-md-1">Effective Till Date:</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="effTillDate" name="effTillDate" type="text" /></td>
	<%	}else{%>
			<td class="col-md-1"><input  id="effTillDate" name="effTillDate" type="text"  value="<%= prdAcNumberConfig.getEffTillDate() %>"/></td>
	<%	}%>
</tr>
		<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="Save" value="Save">
			<input type="reset" name="Clear" value="Clear">
			<input type="button" name="List" value="Back to List" onclick="javasript:goToList()">
	</td>
</tr>
		</table>
			</div>

</div>
</form>
</body>
</html>
