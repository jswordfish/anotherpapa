<%@page import="com.infrasofttech.domain.entities.CustomerMst"%>
<%@page import="com.infrasofttech.domain.entities.UserMst"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
		
		
		$(function () {
		    $('#datepickerCustomerSince').datepicker({
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

  </head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">

<div id="result" class="container">
<form action="kyc.action">
<table class="table table-condensed">
<tr class="active">
	<td class="col-md-1">Customer Code:</td>
	<td class="col-md-1"><input id="customer.CustomerCode" name="customer.CustomerCode" type="text"  value=""/></td>
	<td class="col-md-1">Type</td>
	<td class="col-md-1"><input id="customer.CustomerTypeCode" name="customer.CustomerTypeCode" type="text" value="" /></td>
</tr>
<tr class="active">
	<td class="col-md-1">Customer Name - Salutation:</td>
	<td class="col-md-1"><input id="customer.CustomerSalutation" name="customer.CustomerSalutation" type="text"  value=""/></td>
	<td class="col-md-1">
		<td class="col-md-1"><input id="customer.CustomerFName" name="customer.CustomerFName" type="text" value="" /></td>
		<td class="col-md-1"><input id="customer.CustomerMName" name="customer.CustomerMName" type="text" value="" /></td>
		<td class="col-md-1"><input id="customer.CustomerLName" name="customer.CustomerLName" type="text" value="" /></td>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1">Date Of Birth:</td>
	<td class="col-md-3" colspan="3">
		
			<td>	<div id="datepicker" class="input-group date" data-date-format="mm-dd-yyyy">
					<input class="form-control" type="text" id="dob" name="dob" readonly />
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				</div>
			</td>
		
	
	</td>	
	
	<td class="col-md-1">KYC Type:</td>
	<td class="col-md-3" colspan="3">
		<input id="customer.KYCType" name="customer.KYCType" type="text" value="" />&nbsp;
	
	</td>	
</tr>
<tr class="active">
	<td class="col-md-1">Customer Since:</td>
	<td class="col-md-3" colspan="3">
		
			<td>	<div id="datepickerCustomerSince" class="input-group date" data-date-format="mm-dd-yyyy">
					<input class="form-control" type="text" id="CustomerSince" name="CustomerSince" readonly />
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				</div>
			</td>
		
	
	</td>	
	<td class="col-md-1">RelationShip Officer</td>
	<td class="col-md-1">
		<input id="customer.RelationshipOfficer" name="customer.RelationshipOfficer" type="text" value="" />&nbsp;
	</td>
</tr>
<tr class="active">
	<td class="col-md-1">HNW Category:</td>
	<td class="col-md-1">
		<input id="customer.HNWCategory" name="customer.HNWCategory" type="text" value="" />&nbsp;
	</td>
	<td class="col-md-1">Nationality</td>
	<td class="col-md-1">
		<input id="customer.nationality" name="customer.nationality" type="text" value="" />&nbsp;
	</td>
</tr>
<tr class="active">
	<td class="col-md-1">Gender:</td>
	<td><input id="customer.CustomerGender" name="customer.CustomerGender" type="text" value="" />&nbsp;<td class="col-md-1"></td>
	<td class="col-md-1">No of Children</td>
	<td class="col-md-1">
		<input id="customer.noOfChildren" name="customer.noOfChildren" type="text" value="" />&nbsp;
	</td>
</tr>
<tr class="active">
	<td class="col-md-1">Marital Status:</td>
	<td class="col-md-1"><input id="customer.CustMaritalStatus" name="customer.CustMaritalStatus" type="text"  value="" /></td>
	<td class="col-md-1">Father/Spouse Name:</td>
	<td class="col-md-1"><input id="customer.FatherSpouseName" name="customer.FatherSpouseName" type="text" value="" /></td>
</tr>
<tr class="active">
	<td class="col-md-1">Customer Limit Currency:</td>
	<td class="col-md-1"><input id="customer.CustomerAmtCurrency" name="customer.CustomerAmtCurrency" type="text"  value="" /></td>
	<td class="col-md-1">Customer Limit Amount:</td>
	<td class="col-md-1"><input id="customer.CustomerAmtLimit" name="customer.CustomerAmtLimit" type="text" value="" /></td>
</tr>
<tr class="active">
	<td class="col-md-1">Caste:</td>
	<td class="col-md-1"><input id="customer.CustomerCaste" name="customer.CustomerCaste" type="text"  value="" /></td>
	<td class="col-md-1">Caste Category:</td>
	<td class="col-md-1"><input id="customer.CustomerCasteCategory" name="customer.CustomerCasteCategory" type="text" value="" /></td>

</tr>
<tr class="active">
	<td class="col-md-1">Residence Phone:</td>
	<td class="col-md-1"><input id="customer.CustomerContact.residencePhone" name="customer.CustomerContact.residencePhone" type="text"  value="" /></td>
	<td class="col-md-1">Mobile 1:</td>
	<td class="col-md-1"><input id="customer.CustomerContact.mobile1" name="customer.CustomerContact.mobile1" type="text" value="" /></td>
	<td class="col-md-1">Mobile 2:</td>
	<td class="col-md-1"><input id="customer.CustomerContact.mobile2" name="customer.CustomerContact.mobile2" type="text" value="" /></td>

</tr>

<tr class="active">
	<td class="col-md-1">Email 1:</td>
	<td class="col-md-1"><input id="customer.CustomerContact.emailId1" name="customer.CustomerContact.emailId1" type="text" value="" /></td>

	<td class="col-md-1">Email 2:</td>
	<td class="col-md-1"><input id="customer.CustomerContact.emailId2" name="customer.CustomerContact.emailId2" type="text" value="" /></td>
	<td class="col-md-1">Fax No:</td>
	<td class="col-md-1"><input id="customer.CustomerContact.faxNo" name="customer.CustomerContact.faxNo" type="text" value="" /></td>
</tr>
<tr class="active">
	<td class="col-md-1">Office Phone 1:</td>
	<td class="col-md-1"><input id="customer.CustomerContact.officePhone1" name="customer.CustomerContact.officePhone1" type="text" value="" /></td>

	<td class="col-md-1">Office Phone 2:</td>
	<td class="col-md-1"><input id="customer.CustomerContact.officePhone2" name="customer.CustomerContact.officePhone2" type="text" value="" /></td>
	<td><input type="submit" name="Next" value="KYC Docs">&nbsp;  
	</td>
</tr>
<tr class="active">
	<td colspan="5">
		<a href="kyc.action"><u>KYC Docs</u></a>&nbsp;
		<a href="kycFamily.action"><u>KYC Family</u></a>&nbsp;
		<a href="customerAddress.action"><u>Addresses</u></a>&nbsp;
		<a href="customerBusiness.action"><u>Business Details</u></a>&nbsp;
		<a href="customerEmployment.action"><u>Employment Details</u></a>&nbsp;
		<a href="customerAsset.action"><u>Asset Details</u></a>&nbsp;
	</td>
</tr>
</table>

</form>
</div>

</body>
</html>