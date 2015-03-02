		 
function validate(form) {

		var totalAcLen = document.getElementById("idTotalAc").value;
	//var subTotalAcLen = document.getElementById("idSubAccountAc").value;
	var branch = document.getElementById("idBranch"); 
	var branchRank = document.getElementById("idBranchRank").value; 
	var branchLength = document.getElementById("idBranchLen").value;

	var currency = document.getElementById("idCurrency"); 
	var currencyRank = document.getElementById("idCurrencyRank").value; 
	var currencyLength = document.getElementById("idCurrencyLen").value;

	var customer = document.getElementById("idCustomer");
	var customerRank = document.getElementById("idCustomerRank").value; 
	var customerLength = document.getElementById("idCustomerLen").value;

	var product = document.getElementById("idProductYN"); 
	var productRank = document.getElementById("idProductRank").value; 
	var productLength = document.getElementById("idProductLen").value;

	var subAccount = document.getElementById("idSubAccount"); 
	var subAccountRank = document.getElementById("idSubAccountRank").value;
	var subAccountLength = document.getElementById("idSubAccountLen").value; 
	var accountLength = document.getElementById("idAccountLen").value;
	
	
    var errorMsg=new Array();
  
    
	
		var totalLength = parseInt(branchLength) + parseInt(currencyLength)
				+ parseInt(productLength) + parseInt(customerLength)
				+ parseInt(accountLength)+parseInt(subAccountLength);
		if (totalAcLen != totalLength)

		{ 
			errorMsg.push("sum of length should match Total A/c length");
		

		}

	

	// var totalLength=branchlength+currencyLength+customerLength+productlength+SubAccountlength;  

	if (branch.checked == true) {

		if (branchRank === null || branchRank === '') {
			
			errorMsg.push("Branch Rank Required");
		}

		if (branchLength == 0 || branchLength == '') {
			
			errorMsg.push("Branch Length Required");
		}
	}

	if (currency.checked == true) { 
		if (currencyRank == 0 || currencyRank == '') {
		
			errorMsg.push("Currency Rank Required");
		}

		if (currencyLength == 0 || currencyLength == '') {
	
			errorMsg.push("Currency Length is required");

		}
	}

	if (customer.checked == true) { 
		if (customerRank == 0 || customerRank == '') {
			
			errorMsg.push("Customer Rank is required");
		}

		if (customerLength == 0 || customerLength == '') {
			
			errorMsg.push("Customer Length is required");

		}
	}

	if (product.checked == true) { 
		if (productRank == 0 || productRank == '') {
		
			errorMsg.push("Product Rank is required");
		}

		if (productLength == 0 || productLength == '') {
		
			errorMsg.push("Product Length is required");

		}
	}
	if (subAccount.checked == true) { 
		if (subAccountRank == 0 || subAccountRank == '') {
			
			errorMsg.push("Sub A/c Rank is required");
		}

		if (subAccountLength == 0 || subAccountLength == '') {

	
			errorMsg.push("Sub A/c Length is required");

		}

	

	}
	

	 
			
	var messageHtml = "";

	    errorMsg.forEach(function (message) {
	    	
	        messageHtml +=  message + '<br/>';
	        
	    });
	   
	    document.getElementById("error").innerHTML = messageHtml;
		
		
	    if(errorMsg.length>0)
	    	{
	    	return false;
	    	}
	    else
	    	
	    	{
	    	return true;
	    	}
	 
}
	



 
 
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
		
});  

	



	// End Date Picker 
	
	
	


