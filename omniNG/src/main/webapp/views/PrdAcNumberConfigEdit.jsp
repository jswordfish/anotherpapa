<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="dayBean" class="com.infrasofttech.bean.DayBean" />
<jsp:useBean id="monthBean" class="com.infrasofttech.bean.MonthBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<link rel="stylesheet" href="css/jquery-ui.css">
<%-- <script type="text/javascript"	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script> --%>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<%-- <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> --%>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/validate.js"></script>	

<title>Welcome to PACS</title>

<script language="javascript">
	function startUp() {
		document.getElementById("idProduct").focus();
	                  }
</script>

<!-- Start Multi-Select script   -->
<script language="javascript">
/* This is the function that will get executed after the DOM is fully loaded */
$(document).ready( function () {
		$("select").change(function() {
           
			if ($(this).prop("value") == "All") {
				
				$("select[multiple] option").prop("selected", true);
			}
			if ($(this).prop("value") == "Selected") {

				$("select[multiple] option").prop("selected", false);
			}

		}).change();
	});

	
</script>
<!--  End Multi-Select -->
<!-- Date Format Validation -->
<script language="javascript">
$(document).ready(function() {

	
	$('#datepicker').change(function(e){
	   var dtVal=$('#datepicker').val();
	   if(!ValidateDate(dtVal))
	   {
      $('#idErrTbl').css({"display":"inline"});
      $('#el').html("Effective From Date format should be mm/dd/yyyy");
      $('#datepicker').focus();
	    return false;
	     e.preventDefault();
	   }
	   else
	   {
	   $('#idErrTbl').css({"display":"none"});
	   }
	   
	   });
	

	$('#datepicker2').change(function(e){
		   var dtVal=$('#datepicker2').val();
		   if(!ValidateDate(dtVal))
		   {
	      $('#idErrTbl').css({"display":"inline"});
	      $('#el').html("Effective Till Date format should be mm/dd/yyyy");
	      $('#datepicker2').focus();
		    return false;
		     e.preventDefault();
		   }
		   else
			   {
			   $('#idErrTbl').css({"display":"none"});
			   }
		   
		   });
	

	});


	function ValidateDate(dtValue)
	{
	var dtRegex = new RegExp(/\b\d{1,2}[\/]\d{1,2}[\/]\d{4}\b/);
	return dtRegex.test(dtValue);
	}
</script>

<!-- Enanable and Disable textfields when checkbox is checked  -->
<script language="javascript">
$(document).ready( function () {
		$("#idBranch").change(function() {
			
	        $("#idBranchRank").prop("readonly", !$(this).is(':checked'));
			$("#idBranchLen").prop("readonly", !$(this).is(':checked')); 
	
			
		
		}).change();
		$("#idCurrency").change(function() {
			$("#idCurrencyRank").prop("readonly", !$(this).is(':checked'));
			$("#idCurrencyLen").prop("readonly", !$(this).is(':checked'));
			
		}).change();
		$("#idCustomer").change(function() {
			$("#idCustomerRank").prop("readonly", !$(this).is(':checked'));
			$("#idCustomerLen").prop("readonly", !$(this).is(':checked'));
		
		}).change();
		$("#idProductYN").change(function() {
			$("#idProductRank").prop("readonly", !$(this).is(':checked'));
			$("#idProductLen").prop("readonly", !$(this).is(':checked'));
		
		}).change();
		$("#idSubAccount").change(function() {
			$("#idSubAccountRank").prop("readonly", !$(this).is(':checked'));
			$("#idSubAccountLen").prop("readonly", !$(this).is(':checked'));
		
		}).change();
	    
  
	
	});
		
           </script>
           

<!-- Start Date Picker  -->
  <script type="text/javascript">
  $(document).ready(
		  
		  /* This is the function that will get executed after the DOM is fully loaded */
		  function () {
		    $( "#datepicker" ).datepicker({
		      changeMonth: true,//this option for allowing user to select month
		      changeYear: true //this option for allowing user to select from year range
		    });
		    $( "#datepicker2" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true //this option for allowing user to select from year range
			    });
		  }

		);
  </script>
 <!-- End Date Picker  -->
 
 <!--should enter text field value when checkbox is checked   -->
  <script type="text/javascript">
  function testLength(){
	  

          var totalAcLen=document.getElementById("idTotalAc").value;
          var subTotalAcLen=document.getElementById("idSubAccountAc").value;
		  var branch=document.getElementById("idBranch");
		  var branchRank=document.getElementById("idBranchRank").value;
		  var branchLength=document.getElementById("idBranchLen").value;
		 
		  var currency=document.getElementById("idCurrency");
		  var currencyRank=document.getElementById("idCurrencyRank").value;	
		  var currencyLength=document.getElementById("idCurrencyLen").value;
		 
		  var customer=document.getElementById("idCustomer");
		  var customerRank=document.getElementById("idCustomerRank").value;
		  var customerLength=document.getElementById("idCustomerLen").value;
		
		  var product=document.getElementById("idProductYN");
		  var productRank=document.getElementById("idProductRank").value;
		  var productLength=document.getElementById("idProductLen").value;
		 
		  var subAccount=document.getElementById("idSubAccount");
		  var subAccountRank=document.getElementById("idSubAccountRank").value;		 
		  var subAccountLength=document.getElementById("idSubAccountLen").value;		 
		  var accountLength=document.getElementById("idAccountLen").value;
		 // alert('accountLength'+accountLength)

		  if(accountLength==0||accountLength==null||accountLength==' ')
			  {
			  document.getElementById("el").innerHTML='Account Length is required';
			  accountLength=document.getElementById("idAccountLen").focus();
			  }
		       else
			      {
		    	   var totalLength=parseInt(branchLength)+parseInt(currencyLength)+parseInt(productLength)+parseInt(customerLength)+parseInt(accountLength);
					  if(totalAcLen!=totalLength)
					   		 
					  {  
			        
						  document.getElementById("el").innerHTML='sum of length should match Total A/c length ';
					  
					  }
			 
			  
			       }
	
	    
		// var totalLength=branchlength+currencyLength+customerLength+productlength+SubAccountlength;  
		 
		
		
		  if(branch.checked==true)
			  { 
			  
			    if(branchRank===null||branchRank==='')
				{
				document.getElementById("el").innerHTML='Branch Rank Required';
				branchRank=document.getElementById("idBranchRank").focus();
				}
			  
			    if(branchLength==0||branchLength=='')
			   {	
			    document.getElementById("el").innerHTML='Branch Length Required';
			   }
		       }
		
		  if(currency.checked==true)
		    {
	        	if(currencyRank==0||currencyRank=='')
			      {
			document.getElementById("el").innerHTML='Currency Rank Required';
			        }
		  
		        if(currencyLength==0||currencyLength=='')
	        	  {
		        	document.getElementById("el").innerHTML='Currency Length Required';
		        
		           }
	        }
		  
		  if(customer.checked==true)
		  {
	 	         if(customerRank==0||customerRank=='')
		       	{
			       document.getElementById("el").innerHTML='Customer Rank Required';
			       }
		  
		        if(customerLength==0||customerLength=='')
	        	{
			document.getElementById("el").innerHTML='Customer Length Required';
			  
		        }
	     }
		  
		  if(product.checked==true)
		  {
	 	        if(productRank==0||productRank=='')
		       	{
		       	document.getElementById("el").innerHTML='Product Rank Required';
			      }
		  
		        if(productLength==0||productLength=='')
	        	{
			   document.getElementById("el").innerHTML='Product Length Required';
		
		        }
	  }
		  if(subAccount.checked==true)
		  {
	 	        if(subAccountRank==0||subAccountRank=='')
		       	{
		       	document.getElementById("el").innerHTML='Sub A/c Rank Required';
			      }
		  
		        if(subAccountLength==0||subAccountLength=='')
	        	{
		        	
			    document.getElementById("el").innerHTML='Sub A/c Length Required';
			 
		        }
		        
		        if(totalAcLen>=subTotalAcLen)
				  {
				  
				  document.getElementById("el").innerHTML='Total Sub A/c Length should be greater than Total A/c Length';
				  }
		        if(subTotalAcLen==0||subTotalAcLen=='')
	        	{
	        	document.getElementById("el").innerHTML='Total sub A/c length is required';
	        	 }
		       
		          var totalLength2=parseInt(branchLength)+parseInt(currencyLength)+parseInt(productLength)+parseInt(customerLength)+parseInt(accountLength)+parseInt(subAccountLength);
				
		          if(subTotalAcLen!=totalLength2)
				   		 
				  {  
		        alert("subacclength"+totalLength2);
					  document.getElementById("el").innerHTML='sum of length should match Total sub A/c length ';
				  
				  }
		        
		 
		      
	              }
		  }
  
  
  
  </script>
  <!-- End Of account number length check  -->
  <style>
  #mandatory{
  color: #FF0040;
  font-size: 10px;
  }

  </style>

</head>

<body onLoad="javascript:startUp();">
<form name="frmPrdAc" method="POST" action="PrdAcNoConfigUpdate" onsubmit="return testLength();">
		<div><input type="hidden" name="vToken"></div>
	<div id="idPageTitle" class="pageTitle" style="display:block">&nbsp;<s:text name="global.lbl.PrdAcNoConfig" />
		
	</div>
	<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
	    	<div  id="idErrTbl"  class="errorDiv" style="display:none">
			<p id="el" style="color: #FF0040">
			</p>
		</div>
	
		<div align="left">
		
		<table width="100%" cellspacing = "0">
	<s:iterator value="prdAcNumberConfig">
		<tr>
			<td width="20%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#CCCCFF" valign="middle" width="20%" >
				<font face="Calibri" size="2">&nbsp;&nbsp;<s:text name="global.lbl.product" />&nbsp;
				</font>	<span id="mandatory">*</span>
			</td>
			<td width="30%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%" >&nbsp;&nbsp;
				<font face="Calibri" size="2">
				<select  id="idProduct" name="product">
						<option value="">Select...</option>
						<option value="All">All</option>
						<option value="Selected">Selected</option>
				</select>
				</font>
			</td>
			<td rowspan=2 width="20%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#CCCCFF" valign="middle" width="20%">
				<font face="Calibri" size="2">&nbsp;&nbsp;
					<s:text name="global.lbl.select.product" />&nbsp;<span id="mandatory">*</span>
				</font>
			</td>
			<td rowspan=2 width="30%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
				<font face="Calibri" size="2">
				<select id="idProducts2" name="productCode" multiple="multiple" >
		
					<s:iterator value="products">
			<option selected="selected" value='<s:property value="id"/>' style="font-face: Calibri;font-size: '2'"><s:property value="productCode"/>::<s:property value="productName"/>'</option>
				</s:iterator>
				</select>
			</font>
			</td>
		</tr>
		<tr>
			<td width="20%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; 
					border-bottom: 1px dotted #C0C0C0" align="left" bgcolor="#CCCCFF" valign="middle" width="20%">
				<font face="Calibri" size="2">&nbsp;&nbsp;<s:text name="global.lbl.separator" />&nbsp;
				</font>
			</td>

			<td width="30%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; 
					border-bottom: 1px dotted #C0C0C0"
					align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
				<font face="Calibri" size="2">
				<select id="separatorId" name="sepr">
                   
					<option value=" ">Blank</option>
					<option value="/">Slash (/)</option>
					<option value="-">Hyphen (-)</option>
					<option value=".">Dot</option>
				</select>
				</font>
			</td>
			<td></td><td></td>
		</tr>
		<tr>
			<td width="20%"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#CCCCFF" valign="middle" width="20%"><font
				face="Calibri" size="2">&nbsp;&nbsp;<s:text name="global.lbl.total.ac.length" />&nbsp;	</font>	<span id="mandatory">*</span>
		   </td>
			<td width="30%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
			 <input id="idTotalAc"  name="totalAccountLen" size="15"
				style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
				type="text" value='<s:property value="totalAccountLen"/>'>
				
		
		   </td>
			<td width="20%"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
				face="Calibri" size="2"><s:text name="global.lbl.toal.sac.length" />&nbsp;</font>
			</td>
			<td width="30%"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#FFFFFF" valign="middle" width="80%">&nbsp;
				<input id="idSubAccountAc" tabindex="5" name="totalSubAccountLen" size="15"
				style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
				type="text" value='<s:property value="totalSubAccountLen"/>' >
				
			</td>
		</tr>
		
		<tr>
			<td width="100%" colspan="4">
			<table width="50%" border="1" cellspacing="0" cellpadding="0"><tr><td width="100%">
				<table width="100%" cellspacing="1" border="0">
					<tr bgcolor="#A0A0FF">
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.select"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.parameter"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.rank"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.length"></s:text></font></td>
					</tr>
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input id="idBranch" type="checkbox" name="branchYN" value='<s:property value="branchYN"/>'></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.branch"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><input type="text" id="idBranchRank" name="branchRank"  size="5" value='<s:property value="branchRank"/>'></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input id="idBranchLen" type="text" name="branchLen" size="5" value='<s:property value="branchLen"/>'></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input type="checkbox" name="currencyYN" id="idCurrency" value='<s:property value="currencyYN"/>'></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.currency"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input type="text" id="idCurrencyRank" name="currencyRank" size="5" value='<s:property value="currencyRank"/>'></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input id="idCurrencyLen" type="text" name="currencyLen" size="5" value='<s:property value="currencyLen"/>'></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input type="checkbox" name="customerYN" id="idCustomer" value='<s:property value="customerYN"/>'></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.customer"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input type="text" id="idCustomerRank" name="customerRank" size="5" value='<s:property value="customerRank"/>'></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input  type="text" id="idCustomerLen" name="customerLen" size="5" value='<s:property value="customerLen"/>'></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input type="checkbox" name="productYN" id="idProductYN" value='<s:property value="productYN"/>'></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.product"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input type="text" id="idProductRank" name="productRank" size="5" value='<s:property value="productRank"/>'></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input type="text" id="idProductLen" name="productLen" size="5" value='<s:property value="productLen"/>'></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input type="checkbox" name="accountYN" checked  disabled="disabled"></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.account"></s:text></font><span id='mandatory'>*</span></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input type="text" name="accountRank" size="5" value='<s:property value="accountRank"/>'></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input type="text" id="idAccountLen" name="accountLen" size="5" value='<s:property value="accountLen"/>'></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input type="checkbox" name="subAccountYN" id="idSubAccount" value='<s:property value="subAccountYN"/>'></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.sub.account"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input type="text" name="subAccountRank" id="idSubAccountRank" size="5" value='<s:property value="subAccountRank"/>'></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input type="text" id="idSubAccountLen" name="subAccountLen" size="5" value='<s:property value="subAccountLen"/>'></font></td>
					</tr>				
				</table>
				</td></tr></table>
			</td>
		</tr>
		<tr>
			<td width="20%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#CCCCFF" valign="middle" width="20%">
				<font face="Calibri" size="2">&nbsp;&nbsp;
					<s:text name="global.lbl.effectivedate" />&nbsp;</font>	<span id="mandatory">*</span>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2"><input id="datepicker" type="text" name="effFromDate" placeholder="mm/dd/yyyy" size="15" value='<s:property value="effTillDate"/>'></font>
			</td>
			<td  width="20%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
					align="left" bgcolor="#CCCCFF" valign="middle" width="20%">
				<font	face="Calibri" size="2">&nbsp;&nbsp;
				<s:text name="global.lbl.effective.tilldate" />&nbsp;
				</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" style="border-left-width: 1px; 
						border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2"><input id="datepicker2" type="text" name="effTillDate" placeholder="mm/dd/yyyy" size="15" value='<s:property value="effTillDate"/>'></font>
			</td>
		</tr>
		<tr>  <!-- BLANK LINE INTENTIONAL -->
			<td><input type="hidden" name="id" value='<s:property value="id"/>'/></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr height="25" bgcolor="#9999FF">
			<td style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
				align="left" width="20%">&nbsp;
			</td>
			<td style="border-top: 1px solid #000080; border-bottom: 1px solid #000080; adding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
				align="right" width="30%">&nbsp; <input
				value="<s:text name="global.btn.update"/>"
				style="font-family: Calibri; font-size: 10pt; color: #000080"
				type="submit" tabindex="17"   >
			</td>
			<td
				style="border-top: 1px solid #000080; border-bottom: 1px solid #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
				align="left" width="20%">&nbsp; <input
				value="<s:text name="global.btn.cancel"/>"
				style="font-family: Calibri; font-size: 10pt; color: #000080"
				onclick="javascript:cancel();" type="reset" tabindex="18">
			</td>
			<td
				style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
				align="left" width="30%">&nbsp;
			</td>
		</tr>
</s:iterator>
	</table>
	</div>
		
		
		
		
		
			
	</form>
	
	<script type="text/javascript">
	new FormValidator(
				'frmPrdAc',
				[   {
					name : 'product',
					display : 'Product',
					rules : 'required'
				},{
					name : 'totalAccountLen',
					display : 'Total Account Length',
					rules : 'required|numeric|max_length[2]'
				}, {
					name : 'subTotalAccountLen',
					display : 'Sub Total Account Length',
					rules : 'numeric|max_length[2]'
				},{
					name : 'accountRank',
					display : 'Account Rank',
					rules : 'required|numeric|max_length[2]'
				}, {
					name : 'accountLen',
					display : 'Account Length',
					rules : 'required|numeric|max_length[2]'
				}, {
					name : 'branchRank',
					display : 'Branch Rank',
					rules : 'numeric|max_length[2]'
				}, {
					name : 'branchLen',
					display : 'Branch Length',
					rules : 'numeric|max_length[2]'
				}, {
					name : 'currencyRank',
					display : 'Currency Rank',
					rules : 'numeric|max_length[2]'
				}, {
					name : 'currencyLen',
					display : 'Currency Length',
					rules : 'numeric|max_length[2]'
				}, {
					name : 'productRank',
					display : 'product Rank',
					rules : 'numeric|max_length[2]'
				},{
					name : 'productLen',
					display : 'Product Length',
					rules : 'numeric|max_length[2]'
				},{
					name : 'customerLen',
					display : 'Customer Length',
					rules : 'numeric|max_length[2]'
				},  {
					name : 'customerRank',
					display : 'customer Rank',
					rules : 'numeric|max_length[2]'
				},{
					name : 'effFromDate',
					display : 'From Date',
					rules : 'required'
				},   {
					name : 'productCode',
					display : 'Select Product',
					rules : 'required'
				},     ],
				
			    
				function(errors, evt) {
					

					if (errors.length > 0) {
					
						var errorString = '';
					  document.getElementById("idErrTbl").style.display = "inline";
						for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
							errorString += errors[i].message + '<br />';
							
						}
					//	alert("js error"+errorString);
					document.getElementById("el").innerHTML = errorString;
						
					}
				}); 
	 	</script>

	 	
		
	
</body>

</html>