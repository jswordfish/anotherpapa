<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="nationalityBean"
	class="com.infrasofttech.bean.NationalityBean" />
<jsp:useBean id="maritalStatusBean"
	class="com.infrasofttech.bean.MaritalStatusBean" />
<jsp:useBean id="addressTypeBean"
	class="com.infrasofttech.bean.AddressTypeBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- For Date functions -->
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesheet.css" />" /><!-- for text-fields and labels -->
<script src="js/CustomerReg.js"></script>

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

<!-- Start Date Picker  -->
  <script type="text/javascript">
  $(document).ready(
		  
		  /* This is the function that will get executed after the DOM is fully loaded */
		  function () {
		    $( "#idCustomerDOB" ).datepicker({
		      changeMonth: true,
		      changeYear: true,
		      yearRange: '1960:2100'
		    });
		    $( "#idCustomerSince" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true,//this option for allowing user to select from year range
			      yearRange: '1960:2100'
			    });
		    $( "#idPassportIssuedDate" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true, //this option for allowing user to select from year range
			      yearRange: '1960:2100'   
		    });
		    $( "#idPassportExpiryDate" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true, //this option for allowing user to select from year range
			      yearRange: '1960:2100'
			    });
		    $( "#idVisaIssuedDate" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true, //this option for allowing user to select from year range
			      yearRange: '1960:2100'
			    });
		    /* $( "#idVisaExpiryDate" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true, //this option for allowing user to select from year range
			      yearRange: '1960:2100'
			    }); */
		    $( "#idIssuedDate" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true, //this option for allowing user to select from year range
			      yearRange: '1960:2100'
			    });
		    $( "#idExpiryDate" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true, //this option for allowing user to select from year range
			      yearRange: '1960:2100'
			    });
		    $( "#idRecievedDate" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true, //this option for allowing user to select from year range
			      yearRange: '1960:2100'
			    });
		    $( "#idDob" ).datepicker({
			      changeMonth: true,//this option for allowing user to select month
			      changeYear: true, //this option for allowing user to select from year range
			      yearRange: '1960:2100'
			    });
		  }

		);
  </script>
 <!-- End Date Picker  -->
 
<script>

function successMessage() {
	document.getElementById("idSuccessMessage").style.display = "inline";
}
 function save() {
	alert("Customer Created Successfully");
	 window.location.href = "<s:url value="CustomerRegSave"/>"; 
}
</script>

</head>
<body>
<%String customerBranch=(String)session.getAttribute("branchCode");
%>
	<form name="formHome" id="formHomeId" method="post" action="CustomerRegSave">
		<div align="center">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr bgcolor="#FFFFFF" height="25">
					<td colspan="3" width="50%" bgcolor="#FFFFFF"><b> <font
							face="Calibri" size="2">&nbsp;</font><font face="Calibri">&nbsp;</font></b><font
						face="Calibri" color="#003399"><s:text
								name="global.lbl.new.customer.registration" /></font> <font size="2"
						color="#595959" face="Calibri">(PACS > Masters)</font></td>
					<td colspan="3" width="50%" bgcolor="#FFFFFF">
						
					</td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td colspan="6" width="100%">
						<p align="center" style="display: none" id="idSuccessMessage">
					</td>
				</tr>

			</table>
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								id="basicInfo" onclick="toggleTable('basicTbl');" href="#"><s:text
										name="global.lbl.basic.information" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>
		<!-- BASIC INFORMATION -->
		<div id="basicTbl" style="display: block">

			<table width="100%" align="center" cellpadding="0" cellspacing="0">

				<tr bgcolor="#FFFFFF">

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.customer.branch" />&nbsp;</b></font>
					</td>
			
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerBranch" value="<%=customerBranch %>"   readonly="readonly" id="idCustomerBranch" class="smallTxtLeftAlign">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.customer.id" />&nbsp;</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerCode" id="idCustomerCode"
						class="mediumTxtLeftAlign">

					</td>

				</tr>

				<tr bgcolor="#F4F4F4">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"> <b><s:text
									name="global.lbl.customer.name" /></b>
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							 <option value=""><s:text name="global.val.select" /></option>
							<c:forEach items="${customerSalutation123}" var="customerSalutation1">
								<option value="${customerSalutation1.key}">${customerSalutation1.value}</option>
							</c:forEach> 
					</select>&nbsp; <input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign" id="idCustomerFName"> <input
						type="text" name="customerMName" size="10"
						class="mediumTxtLeftAlign" id="idCustomerMName"> <input
						type="text" name="customerLName" size="10"
						class="mediumTxtLeftAlign" id="idCustomerLName">
					</td>
				</tr>

				<tr bgcolor="#F4F4F4">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.gender" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type=radio name="customerGender" id="idCustomerGender"
						class="radiobutton" value="M" checked><font face="Calibri"
						size="2"><s:text name="global.lbl.male" />&nbsp;</font> <input
						type=radio name="customerGender" id="idCustomerGender"
						class="radiobutton" value="F"><font face="Calibri"
						size="2"><s:text name="global.lbl.female" />&nbsp;</font>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.customer.dob" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<!-- <input type="text" name="customerDOB" id="idCustomerDOB" /> -->
						<font face="Calibri" size="2">
						<input id="idCustomerDOB" type="text" name="customerDOB" placeholder="dd/mm/yyyy" class="mediumTxtLeftAlign"></font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.marital.status" /></b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" name="custMaritalStatus" class="mediumselect"
						id="idCustMaritalStatus">
							<option value=""><s:text name="global.val.select" /></option>
							<c:forEach items="${maritalStatusBean.values}"
								var="maritalStatus">
								<option value="${maritalStatus}">${maritalStatus}</option>
							</c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.customer.type" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select id="idCustomerTypeCode" name="customerTypeCode"
						class="mediumselect">
							<option value=""><s:text name="global.val.select" /></option>
							<c:forEach items="${customerTypeCod}"
								var="customerTypeCod">
								<option value="${customerTypeCod.key}">${customerTypeCod.value}</option>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.nationality" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" name="nationality" class="mediumselect"
						id="idNationality">
							<option value="">Select...</option>
							<c:forEach items="${nationalityBean.values}" var="nationality">
								<option value="${nationality}">${nationality}</option>
							</c:forEach>
					</select>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.customer.since" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><input type="text" name="customerSince" id="idCustomerSince" placeholder="dd/mm/yyyy" class="mediumTxtLeftAlign"></font>
					</td>

				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.no.of.children" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="noOfChildren" id="idNoOfChildren"
						class="smallTxtLeftAlign" type="text" placeholder="0">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.relationship.officer" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="relationshipOfficer" id="idRelationshipOfficer"
						class="largeTxtLeftAlign" type="text">
					</td>


				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.caste" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" name="customerCaste" class="mediumselect"
						id="idCustomerCaste">
						<option value="">Select...</option>
							<c:forEach items="${customerCaste123}"
								var="customerCaste">
								<option value="${customerCaste.key}">${customerCaste.value}</option>
							</c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.caste.category" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" name="customerCasteCategory"
						id="idCustomerCasteCategory" class="mediumselect">
							<option value="">Select...</option>
							<c:forEach items="${customerCasteCategory123}"
								var="customerCasteCategory">
								<option value="${customerCasteCategory.key}">${customerCasteCategory.value}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.additional.information" />:&nbsp;
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="custAdditionalInfo" size="60"
						id="idCustAdditionalInfo" class="largeTxtLeftAlign" type="text">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.KYC.type" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" name="KYCType" class="mediumselect"
						id="idKYCType">

							<option value="">Select...</option>
							<c:forEach items="${kycType}"
								var="kycType">
								<option value="${kycType.key}">${kycType.value}</option>
							</c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.HNW.category" />:&nbsp;
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="HNWCategory" size="20" id="idHNWCategory"
						class="mediumTxtLeftAlign" type="text">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.father.spouse.name" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="fatherSpouseName" id="idFatherSpouseName"
						class="largeTxtLeftAlign" type="text">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.customer.registration" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="customerRegNo" id="idCustomerRegNo"
						class="mediumTxtLeftAlign" type="text">
					</td> 
				</tr>
			</table>

		</div>

	 	<hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								id="miscInfo" onclick="toggleTable('miscTbl');" href="#"><s:text
										name="global.lbl.MISC.details" /></a>
						</b></font>

					</td>
				</tr>
			</table>
		</div>
		<!-- MISC DETAILS -->
		<div id="miscTbl" style="display: none">

			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.transaction.freeze" />:
						</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri"> <input type="radio" value="true"
							class="radiobutton" name="transactionFreeze"
							id="idTransactionFreeze"></font><font size="2"><s:text
								name="global.lbl.yes" /> </font><input type="radio" value="false"
						class="radiobutton" name="transactionFreeze"
						id="idTransactionFreeze"><font size="2"><s:text
								name="global.lbl.no" /> </font>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.transaction.freeze.reason" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="transactionFreezeReason"
						id="idTransactionFreezeReason" class="largeTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.special.instructions" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="specialInstructions" size="30" type="text"
						id="idSpecialInstructions" class="largeTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.NPA.rating" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="NPARating" class="mediumTxtLeftAlign"
						id="idNPARating">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.NPA.reason" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="NPAReason" class="largeTxtLeftAlign"
						id="idNPAReason">
					</td>
				</tr>
			</table>


		</div>

	 <hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('adhocTbl');" href="#"><s:text
										name="global.lbl.adhoc.details" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- ADHOC DETAILS -->
		<div id="adhocTbl" style="display: none">

			<table width="100%" align="center" cellpadding="0" cellspacing="0">

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.qualifications" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="qualifications" size="20" type="text"
						id="idQualifications" class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.religion" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="religion" size="20" type="text" id="idReligion"
						class="mediumTxtLeftAlign">
					</td>

				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.blood.group" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="bloodGroup" size="20" type="text" id="idBloodGroup"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.residence.type" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="residenceType" size="20" type="text"
						id="idResidenceType" class="mediumTxtLeftAlign">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.number.of.dependants" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="numberOfDependants" size="20" type="text"
						id="idNumberOfDependants" class="smallTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.introducer.YN" />:
						</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri"><input type="radio" value="true"
							class="radiobutton" name="introducerYN" id="idIntroducerYN"></font><font
						size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" value="false" class="radiobutton" id="idIntroducerYN"
						name="introducerYN"><font size="2"><s:text
								name="global.lbl.no" /> </font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.introducer.number" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="introducerNumber" size="20" type="text"
						id="idIntroducerNumber" class="mediumTxtLeftAlign">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.PEP.YN" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri"> <input type="radio" value="true"
							class="radiobutton" name="PEPYN" id="idPEPYN"></font><font
						size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" value="false" class="radiobutton" id="idPEPYN"
						name="PEPYN"><font size="2"><s:text
								name="global.lbl.no" /> </font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.AML.Rating" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="AMLRating" size="20" type="text" id="idAMLRating"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.TDS.reason" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="TDSReason" size="20" type="text" id="idTDSReason"
						class="largeTxtLeftAlign">
					</td>

				</tr>
			</table>
		</div>
	 <hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('personalTbl');" href="#"><s:text
										name="global.lbl.personal.details" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- PERSONAL DETAILS -->
		<div id="personalTbl" style="display: none">

			<table width="100%" align="center" cellpadding="0" cellspacing="0">

				<tr bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.customer.category" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" id="idCustomerCategory" name="customerCategory"
						class="mediumselect">
							<option value="">Select...</option>
							<c:forEach items="${customerCategory123}"
								var="customerCategory">
								<option value="${customerCategory.key}">${customerCategory.value}</option>
							</c:forEach>

					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.member.type" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="memberType" class="mediumselect" id="idMemberType">
							<option value="">Select...</option>
							<c:forEach items="${memberType123}"
								var="memberType">
								<option value="${memberType.key}">${memberType.value}</option>
							</c:forEach>

					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.member.number" />:
						</b></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="memberNumber" size="20" type="text"
						id="idMemberNumber" class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
				</tr>
				<!-- RESIDENTIAL DETAILS -->
				<tr>
					<td><font face="Calibri" size="2"></font><font><b><u><s:text
										name="global.lbl.residential.details" /></u></b></font></td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.resident.YN" />:
						</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri"> <input type="radio" value="true"
							class="radiobutton" id="idResidentYN" name="residentYN"></font><font
						size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" value="false" class="radiobutton" name="residentYN"
						id="idResidentYN"><font size="2"><s:text
								name="global.lbl.no" /> </font>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.residential.status" /></b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" name="residentialStatus" id="idResidentialStatus"
						class="mediumselect">
							<option value="">Select...</option>
							<c:forEach items="${nationalityBean.values}" var="nationality">
								<option value="${nationality}">${nationality}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.residence.country" />:
						</b></font>
					</td>

					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						 <select name="residentCountry" id="idResidentCountry"
						class="mediumselect">
							<c:forEach var="countryMst" items="${countries1}">
								<option value="${countryMst.id}">${countryMst.countryCode}-${countryMst.countryName}</option>
							</c:forEach>
					</select> 
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
				</tr>
				<!-- NRI/FOREIGNER DETAILS -->
				<tr>
					<td><font face="Calibri" size="2"></font><font><b><u><s:text
										name="global.lbl.NRI.foreigner.details" /></u></b></font></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.passport.number" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="passportNumber" size="20" type="text"
						id="idPassportNumber" class="mediumTxtLeftAlign">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.issued.by.country" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						 <%-- <select  name="issuedByCountry"
						id="idIssuedByCountry" class="mediumselect">
							<c:forEach var="countryMst" items="${countries2}">
								<option value="${countryMst.id}">${countryMst.countryCode}-${countryMst.countryName}</option>
							</c:forEach>
					</select>  --%>
					<select  name="issuedByCountry"
						id="idIssuedByCountry" class="mediumselect">
							<c:forEach var="countryMst" items="${countries1}">
								<option value="${countryMst.id}">${countryMst.countryCode}-${countryMst.countryName}</option>
							</c:forEach>
					</select> 
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.issued.date" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<!-- <input type="text" name="passportIssuedDate" id="idPassportIssuedDate" /> -->
						<font face="Calibri" size="2"><input id="idPassportIssuedDate" type="text" name="passportIssuedDate" placeholder="dd/mm/yyyy" class="mediumTxtLeftAlign"></font>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.expiry.date" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<!-- <input type="text" name="passportExpiryDate" id="idPassportExpiryDate" /> -->
						<font face="Calibri" size="2"><input id="idPassportExpiryDate" type="text" name="passportExpiryDate" placeholder="dd/mm/yyyy" class="mediumTxtLeftAlign"></font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.visa.type" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="visaType" id="idVisaType" class="mediumselect">
						     <option> select...</option>
							<c:forEach var="custIntMap" items="${visaType123}">
                           <option value="${custIntMap.key}">${custIntMap.value}</option>
                            </c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.visa.number" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="visaNumber" size="20" type="text" id="idVisaNumber"
						class="mediumTxtLeftAlign">
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.visa.issued.date" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<!-- <input type="text" name="visaIssuedDate" id="idVisaIssuedDate" /> -->
						<font face="Calibri" size="2"><input id="idVisaIssuedDate" type="text" name="visaIssuedDate" placeholder="dd/mm/yyyy" class="mediumTxtLeftAlign"></font>
					</td>
				
				</tr>

			</table>
		</div>
 
		<hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('taxDtlsTbl');" href="#"><s:text
										name="global.lbl.tax.details" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- TAX DETAILS -->
		<div id="taxDtlsTbl" style="display: none">
			<table width="100%" align="left" cellpadding="0" cellspacing="0">
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.TDS.YN" />:
						</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri"> <input type="radio" value="true"
							class="radiobutton" name="TDSYN" id="idTDSYN"></font><font
						size="2"><s:text name="global.lbl.yes" /> </font><input
						type="radio" value="false" class="radiobutton" id="idTDSYN"
						name="TDSYN"><font size="2"><s:text
								name="global.lbl.no" /> </font>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.TDS.percentage" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="TDSPercentage" size="20" type="text"
						id="idTDSPercentage" class="mediumTxtLeftAlign">
					</td>
				</tr>
				<tr></tr>
			</table>
		</div><br/><br/>
 
		<hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('addressTbl');" href="#"><s:text
										name="global.lbl.address.details" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- ADDRESS DETAILS -->
		<div id="addressTbl" style="display: none">
			<table id="idTBLookuplist1" width="100%" align="left" cellpadding="1"
				cellspacing="1">
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.address.type" />:
						</b></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<select size="1" id="idCustAddressType"
						name="custAddressType" class="mediumselect">
							 <option value=""><s:text name="global.val.select" /></option>
							<c:forEach items="${addressType}" var="addressType">
								<option value="${addressType.key}">${addressType.value}</option>
							</c:forEach> 
					</select>
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.address" />:&nbsp;</b></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input id="idCustAddress1" name="custAddress1" size="15"
						type="text" class="mediumTxtLeftAlign"> <input
						name="custAddress2" size="15" id="idCustAddress2"
						class="mediumTxtLeftAlign"> <input name="custAddress3"
						size="15" type="text" id="idCustAddress3"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.country" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<%-- <select name="country1" id="idCountry1" class="mediumselect">
							<!-- name="selected record" -->
							<c:forEach var="countryMst" items="${countries3}">
								<option value="${countryMst.id}">${countryMst.countryCode}-${countryMst.countryName}</option>
							</c:forEach>
					</select> --%>
					<select  name="country1"
						id="idCountry1" class="mediumselect">
							<c:forEach var="countryMst" items="${countries1}">
								<option value="${countryMst.countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
							</c:forEach>
					</select> 
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.state" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="state1" id="idStates1" class="mediumselect">
							<!-- name="selected record" -->
							<c:forEach var="stateMst" items="${states1}">
								<option value="${stateMst.stateCode}">${stateMst.stateCode}-${stateMst.stateName}</option>
							</c:forEach>
					</select>
					</td>


				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.village" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="village1" id="idVillages1" class="mediumselect">
							<!-- name="selected record" -->
							<c:forEach var="villageMst" items="${villages1}">
								<option value="${villageMst.villageCode}">${villageMst.villageCode}-${villageMst.villageName}</option>
							</c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.municipality" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="municipality1" id="idMunicipalities1"
						class="mediumselect">
							<c:forEach var="municipality" items="${municipalities1}">
								<option value="${municipality.municipalityCode}">${municipality.municipalityCode}-${municipality.municipalityName}</option>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr>


					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.district.city" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="district1" id="idDistrictCity1"
						class="mediumselect">
							<c:forEach var="districtMst" items="${districts1}">
								<option value="${districtMst.districtCode}">${districtMst.districtCode}-${districtMst.districtName}</option>
							</c:forEach>
					</select>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.pincode" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="pinCode" size="20" type="text" id="idCustPinCode"
						class="mediumTxtLeftAlign">
					</td>
				</tr>
			</table>
			<br>
			<table width="100%" align="left" cellpadding="1" cellspacing="1">
				<tr>
					<td align="center"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value=" <s:text name="global.btn.add"/> "
						id="idAdd" class="button" onclick="add();"> &nbsp; <input
						type="button" value=" <s:text name="global.btn.update"/> "
						id="idUpdate" class="button" onclick="update();">&nbsp; <input
						type="button" value=" <s:text name="global.btn.clear"/> "
						id="idClear" class="button" onclick="clearing();">
					</td>
				</tr>
			</table>
			<table id="tblData" width="100%" cellpadding="0" cellspacing="1"
				align="center">
				<tr bgcolor="#C4C4FF">
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.address.type" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.Address" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.village" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.state" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.municipality" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.country" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.district.city" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.pincode" /></b></font></td>

					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.action" /></b></font></td>
				</tr>
			</table>
		</div>

		<hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('assetTbl');" href="#"><s:text
										name="global.lbl.asset.details" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- ASSET DETAILS -->
		<div id="assetTbl" style="display: none">
			<table id="idTBLookuplist3" width="100%" height="26" cellpadding="0"
				cellspacing="1">

				<tr valign="middle">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.registration" /> #:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="regNumber" size="25" id="idRegNumber"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.plot" /></b> #:</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="plotNumber" size="25" id="idPlotNumber"
						class="mediumTxtLeftAlign">
					</td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.address" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input id="idAssetAddress1" name="assetAddress1" size="20"
						type="text" class="mediumTxtLeftAlign"> <input
						name="assetAddress2" size="20" id="idAssetAddress2"
						class="mediumTxtLeftAlign"> <input name="assetAddress3"
						size="20" type="text" id="idAssetAddress3"
						class="mediumTxtLeftAlign">
					</td>

				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.state" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<%-- <select name="state2" id="idStates2" class="mediumselect">
							<c:forEach var="stateMst" items="${states2}">
								<option value="${stateMst.id}">${stateMst.stateCode}-${stateMst.stateName}</option>
							</c:forEach>
					</select> --%>
					<select name="state2" id="idStates2" class="mediumselect">
							<c:forEach var="stateMst" items="${states1}">
								<option value="${stateMst.stateCode}">${stateMst.stateCode}-${stateMst.stateName}</option>
							</c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.village" />:
						</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						
                    <select name="village2" id="idVillages2" class="mediumselect">
							<!-- name="selected record" -->
							<c:forEach var="villageMst" items="${villages1}">
								<option value="${villageMst.villageCode}">${villageMst.villageCode}-${villageMst.villageName}</option>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.municipality" />:
						</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="municipality2" id="idMunicipalities2"
						class="mediumselect">
							<!-- name="selected record" -->
							<c:forEach var="municipality" items="${municipalities1}">
								<option value="${municipality.municipalityCode}">${municipality.municipalityCode}-${municipality.municipalityName}</option>
							</c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.district.city" />: </b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="district2" id="idDistrictCity2"
						class="mediumselect">
							<!-- name="selected record" -->
							<c:forEach var="districtMst" items="${districts1}">
								<option value="${districtMst.districtCode}">${districtMst.districtCode}-${districtMst.districtName}</option>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr valign="middle">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.area" /></b> (<s:text name="global.lbl.acre" />):</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="areaSize" size="15" id="idAreaSize"
						class="mediumTxtRightAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.rate" /></b>(<s:text name="global.lbl.INR" />):</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="areaRate" size="20" id="idAreaRate"
						class="mediumTxtRightAlign">
					</td>
				</tr>
				<tr valign="middle">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.approx.value" /></b> (<s:text
								name="global.lbl.INR" />):</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="approxMonetaryValue" size="20"
						id="idApproxMonetaryValue" class="mediumTxtRightAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.remarks" /></b>:</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="remarks1" size="30" id="idRemarks1"
						class="mediumTxtLeftAlign">
					</td>
				</tr>
				<tr valign="middle">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.o/s.loan" /> </b>(<s:text
								name="global.lbl.if.any" />):</font>
					</td>
										
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;

						<font face="Calibri"> 
						<input type="radio" value="true" id="idOsLoanY"	name="osLoanYN" tabindex="9" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font>
						<input	type="radio" id="idOsLoanN" name="osLoanYN" value="false" tabindex="9" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>
					
					
					
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.o/s.amount" /> </b>(<s:text name="global.lbl.INR" />):</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input id="idOsAmount" name="osAmount" class="mediumTxtRightAlign">
					</td>
				</tr>

			</table>
			<br>
			<table width="100%" cellpadding="0" cellspacing="1">
				<tr height="25">
					<td width="30%" align="center"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value=" <s:text name="global.btn.add"/> "
						id="idAdd1" class="button" onclick="add1();"> &nbsp; <input
						type="button" value=" <s:text name="global.btn.update"/> "
						id="idUpdate1" class="button" onclick="update1();">&nbsp;
						<input type="button" value=" <s:text name="global.btn.clear"/> "
						id="idClear1" class="button" onclick="clearing1();">
					</td>
				</tr>
			</table>
			<br>
			<table id="tblData1" width="100%" cellspacing="1" cellpadding="0">
				<tr bgcolor="" height="25">
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.registration" /> #
						</b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.plot" /> #
						</b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.address" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.village.code" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.taluka" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.district.city" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.state" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.area" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.rate" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.approx.value" /> (<s:text
									name="global.lbl.INR" />)
						</b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.remarks" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.o/s.loan" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.o/s.amount" /></b></font></td>
					<td width="6.25%" bgcolor="#9999FF"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.action" /></b></font></td>
				</tr>
			</table>

		</div>

		<hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('contactTbl');" href="#"><s:text
										name="global.lbl.contact.details" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- CONTACT DETAILS -->
		<div id="contactTbl" style="display: none">
			<table id="idTBLookuplist2" width="100%" height="26" cellpadding="0"
				cellspacing="1" align="left">
				<tr bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.residence.phone" />:&nbsp;</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="residencePhone"
						class="mediumTxtLeftAlign" id="idResidencePhone">
					</td>


					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.mobile.number" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="2"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input id="idMobile1" name="mobile1" size="20" type="text"
						class="mediumTxtLeftAlign"> <input id="idMobile2"
						name="mobile2" size="20" type="text" class="mediumTxtLeftAlign">
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.email.id" />:
						</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input id="idEmailId1" name="emailId1" size="30" type="text"
						class="largeTxtLeftAlign"> <input id="idEmailId2"
						name="emailId2" size="30" type="text" class="largeTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.office.phone" />:
						</b></font>
					</td>
					<td colspan="1" width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="1"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input id="idOfficePhone1" name="officePhone1" size="20"
						type="text" class="mediumTxtLeftAlign"> <input
						id="idOfficePhone2" name="officePhone2" size="20" type="text"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.fax.no" />:
						</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="1"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input id="idFaxNo" name="faxNo" size="20" type="text"
						class="mediumTxtLeftAlign">
				</tr>
				
			</table>
		</div><br/><br/><br/><br/>

	 <hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('busiDtlsTbl');" href="#"><s:text
										name="global.lbl.business.details" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- BUSINESS DETAILS -->
		<div id="busiDtlsTbl" style="display: none">

			<table id="idTBLookuplist4" width="100%" height="26" cellpadding="0"
				cellspacing="1">

				<%--  <tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.business.id" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="2"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="businessId" id="idBusinessId"
						class="mediumTxtLeftAlign">
					</td>
				</tr> --%> 
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.number.of.staff" /> #:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="2"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="noOfStaff" size="30" type="text" id="idNoOfStaff"
						class="mediumTxtRightAlign">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.registration.code" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="2"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="regCode" size="30" type="text" id="idRegCode"
						class="mediumTxtLeftAlign">
					</td>

				</tr>
			</table>
			<br>
			<table width="100%" cellpadding="0" cellspacing="1">
				<tr>
					<td width="30%" align="center"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value=" <s:text name="global.btn.add"/> "
						id="idAdd2" class="button" onclick="add2();"> &nbsp; <input
						type="button" value=" <s:text name="global.btn.update"/> "
						id="idUpdate2" class="button" onclick="update2();">&nbsp;
						<input type="button" value=" <s:text name="global.btn.clear"/> "
						id="idClear2" class="button" onclick="clearing2();">
					</td>
				</tr>
			</table>
			<br>
			<table id="tblData2" width="100%" cellspacing="1" cellpadding="0">
				<tr>
					<%-- <td width="25%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b><s:text name="global.lbl.business.id" /></b></font></td> --%>
					<td width="33.3%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b><s:text name="global.lbl.no.of.staff" /></b></font></td>
					<td width="33.3%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b><s:text name="global.lbl.registration.code" />
						</b></font></td>
					<td width="33.3%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b><s:text name="global.lbl.action" /></b></font></td>
				</tr>
			</table>

		</div>
 
		<hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('emplTbl');" href="#"><s:text
										name="global.lbl.employment.details" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- EMPLOYMENT DETAILS -->
		<div id="emplTbl" style="display: none">

			<table id="idTBLookuplist5" cellpadding="0" cellspacing="1">
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.profession.type" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" id="idProfessionType" name="professionType"
						class="mediumselect">
							<option value="">Select...</option>
							<c:forEach items="${professionType121}"
								var="professionType">
								<option value="${professionType.key}">${professionType.value}</option>
							</c:forEach>
					</select>
					</td>

				</tr>

				<tr bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.address" />:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input id="idEmpAddress1" name="empAddress1" size="15" type="text"
						class="largeTxtLeftAlign"> <input name="empAddress2"
						size="15" id="idEmpAddress2" class="largeTxtLeftAlign"> <input
						name="empAddress3" size="15" type="text" id="idEmpAddress3"
						class="largeTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.country" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						
				  <select name="country3" id="idCountry3" class="mediumselect">
							<!-- name="selected record" -->
							<c:forEach var="countryMst" items="${countries1}">
								<option value="${countryMst.countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
							</c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.state" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						
					<select name="state3" id="idStates3" class="mediumselect">
							<c:forEach var="stateMst" items="${states1}">
								<option value="${stateMst.stateCode}">${stateMst.stateCode}-${stateMst.stateName}</option>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr bgcolor="#FFFFFF">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.district.city" />:
						</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="district3" id="idDistrictCity3"
						class="mediumselect">
							<!-- name="selected record" -->
							<c:forEach var="districtMst" items="${districts1}">
								<option value="${districtMst.districtCode}">${districtMst.districtCode}-${districtMst.districtName}</option>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.employee.number" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="empNumber" size="20" type="text" id="idEmpNumber"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.designation" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="designation" size="20" type="text" id="idDesignation"
						class="mediumTxtLeftAlign">
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.department" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="department" size="20" type="text" id="idDepartment"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.years.in.service" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="yearsInService" size="20" type="text"
						id="idYearsInService" class="smallTxtLeftAlign">
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.DOR" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="DOR" size="20" type="text" id="idDOR"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.annual.income" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="annualIncome" size="20" type="text"
						id="idAnnualIncome" class="mediumTxtLeftAlign">
					</td>
				</tr>

				<tr>
					<td><u><b><s:text
									name="global.lbl.other.bank.accounts" /></b></u>:</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.account.type" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select name="accountType" id="idAccountType" class="mediumselect">
							<option value="">Select...</option>
							<c:forEach items="${accountType123}"
								var="accountType123">
								<option value="${accountType123.key}">${accountType123.value}</option>
							</c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.bank.code" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="bankCode" size="20" type="text" id="idBankCode"
						class="mediumTxtLeftAlign">
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.bank.name" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="bankName" size="20" type="text" id="idBankName"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b> <s:text
									name="global.lbl.account.number" />:
						</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="accountNumber" size="20" type="text"
						id="idAccountNumber" class="mediumTxtLeftAlign">
					</td>
				</tr>
			</table>
			<br>
			<table width="100%" cellpadding="0" cellspacing="1">
				<tr height="25">
					<td width="30%" align="center"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value=" <s:text name="global.btn.add"/> "
						id="idAdd3" class="button" onclick="add3();"> &nbsp; <input
						type="button" value=" <s:text name="global.btn.update"/> "
						id="idUpdate3" class="button" onclick="update3();">&nbsp;
						<input type="button" value=" <s:text name="global.btn.clear"/> "
						id="idClear3" class="button" onclick="clearing3();">
					</td>
				</tr>
			</table>
			<table id="tblData3" width="100%" cellpadding="0" cellspacing="1">
				<tr height="25" bgcolor="#C4C4FF">
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.profession.type" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.address" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.district.city" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.state" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.country" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.employee.number" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.department" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.DOR" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.annual.income" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.account.type" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.bank.code" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.bank.name" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.account.number" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.years.in.service" /></b></font></td>
					<td width="5.55%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.designation" /></b></font></td>
					<td width="12.69%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b><s:text
									name="global.lbl.action" /></b></font></td>
				</tr>

			</table>

		</div> 

		<hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('KYCDocsTbl');" href="#"><s:text
										name="global.lbl.KYC.docs" /></a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- KYC DOCS DETAILS -->
		<div id="KYCDocsTbl" style="display: none">
			<table id="idTBLookuplist6" width="100%" height="26" cellpadding="0"
				cellspacing="1">

				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><u><s:text
										name="global.lbl.proof.type" /></u>:</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select class="mediumselect" name="proofType" id="idProofType">
						<option value="">Select...</option>
							<c:forEach items="${proofType}"
								var="proofType">
								<option value="${proofType.key}">${proofType.value}</option>
							</c:forEach>
					</select>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.KYC.type" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" name="KYCType1" class="mediumselect"
						id="idKYCType1">
							<option value="">Select...</option>
							<c:forEach items="${kycType}"
								var="kycType">
								<option value="${kycType.key}">${kycType.value}</option>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.issued.by" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="issuedBy" size="30" type="text" id="idIssuedBy"
						class="largeTxtLeftAlign">
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.issued.date" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<!-- <input type="text" name="issuedDate" id="idIssuedDate" class="mediumTxtLeftAlign" /> -->
							<font face="Calibri" size="2"><input id="idIssuedDate" type="text" name="issuedDate" placeholder="dd/mm/yyyy" class="mediumTxtLeftAlign"></font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.expiry.date" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<!-- <input type="text" name="expiryDate" id="idExpiryDate" class="mediumTxtLeftAlign" /> -->
						<font face="Calibri" size="2"><input id="idExpiryDate" type="text" name="expiryDate" placeholder="dd/mm/yyyy" class="mediumTxtLeftAlign"></font>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.recieved.date" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<!-- <input type="text" name="recievedDate" id="idRecievedDate" class="mediumTxtLeftAlign"/> -->
						<font face="Calibri" size="2"><input id="idRecievedDate" type="text" name="recievedDate" placeholder="dd/mm/yyyy" class="mediumTxtLeftAlign"></font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.remarks" /> #:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="remarks" size="30" type="text" id="idRemarks"
						class="largeTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.id.number" /> #:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="idNumber" size="30" type="text" id="idIdNumber"
						class="largeTxtLeftAlign">
					</td>
				</tr>
			</table>
			<br>
			<table width="100%" cellpadding="0" cellspacing="1">
				<tr height="25">
					<td width="30%" align="center"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value=" <s:text name="global.btn.add"/> "
						id="idAdd4" class="button" onclick="add4();"> &nbsp; <input
						type="button" value=" <s:text name="global.btn.update"/> "
						id="idUpdate4" class="button" onclick="update4();">&nbsp;
						<input type="button" value=" <s:text name="global.btn.clear"/> "
						id="idClear4" class="button" onclick="clearing4();">
					</td>
				</tr>
			</table>
			<table id="tblData4" width="100%" cellspacing="1" cellpadding="0">
				<tr>
					<td width="11.11%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.proof.type" /></b></font></td>
					<td width="11.11%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.KYC.type" /></b></font></td>

					<td width="11.11%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.id.number" /></b></font></td>
					<td width="11.11%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.issued.date" /></b></font></td>
					<td width="11.11%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.expiry.date" />
						</b></font></td>
					<td width="11.11%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.issued.by" /></b></font></td>
					<td width="11.11%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text
									name="global.lbl.recieved.date" /></b></font></td>
					<td width="11.11%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.remarks" /></b></font></td>
					<td width="11.11%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.action" /></b></font></td>
				</tr>

			</table>
		</div>
 
		<hr color="#COCOFF">
		<div align="center">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								onclick="toggleTable('KYCFamilyTbl');" href="#">KYC Family
									Details</a>
						</b></font>
					</td>
				</tr>
			</table>
		</div>

		<!-- KYC FAMILY DETAILS -->
		<div id="KYCFamilyTbl" style="display: none">
			<table id="idTBLookuplist6" width="100%" height="26" cellpadding="0"
				cellspacing="1">

				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.family.member.name" />:&nbsp;</b></font>
					</td>
					<td width="25%" style="border-bottom: 1px dotted #C0C0C0"><input
						type="text" name="familyMemberName" id="idFamilyMemberName"
						size="30" class="largeTxtLeftAlign"></td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.relationship" />:&nbsp;</b></font>
					</td>
					<td width="25%" style="border-bottom: 1px dotted #C0C0C0"><input
						name="relationship1" size="30" type="text" id="idRelationship1"
						class="mediumTxtLeftAlign"></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.gender" />:&nbsp;</b></font>
					</td>
					<td width="25%" style="border-bottom: 1px dotted #C0C0C0"><input
						type="radio" value="Male" class="radiobutton" id="idGender1M"
						name="gender"><font face="Calibri" size="2"><s:text
								name="global.lbl.male" /></font>&nbsp;&nbsp; <input type="radio"
						value="Female" class="radiobutton" id="idGender1F" name="gender"><font
						face="Calibri" size="2"><s:text name="global.lbl.female" /></font>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.dob" />:&nbsp;</b></font>
					</td>
					<td bgcolor="#FFFFFF" width="25%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<!-- <input type="text" name="dob" id="idDob" class="mediumTxtLeftAlign" /> -->
						<font face="Calibri" size="2"><input id="idDob" type="text" name="dob" placeholder="dd/mm/yyyy" class="mediumTxtLeftAlign"></font>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.profession" />:&nbsp;</b></font>
					</td>
					<td width="25%" style="border-bottom: 1px dotted #C0C0C0"><input
						type="text" name="profession" size="20" id="idProfession"
						class="mediumTxtLeftAlign"></td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.education" />:&nbsp;</b></font>
					</td>
					<td width="25%" style="border-bottom: 1px dotted #C0C0C0"><input
						type="text" name="education" size="20" id="idEducation"
						class="mediumTxtLeftAlign"></td>
				</tr>
			</table>
			<br>
			<table width="100%" cellpadding="0" cellspacing="1">
				<tr height="25">
					<td width="30%" align="center"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value=" <s:text name="global.btn.add"/> "
						id="idAdd5" class="button" onclick="add5();"> &nbsp; <input
						type="button" value=" <s:text name="global.btn.update"/> "
						id="idUpdate5" class="button" onclick="update5();">&nbsp;
						<input type="button" value=" <s:text name="global.btn.clear"/> "
						id="idClear5" class="button" onclick="clearing5();">
					</td>
				</tr>
			</table>
			<table id="tblData5" width="100%" cellspacing="1" cellpadding="0">
				<tr height="20">
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text
									name="global.lbl.family.member.name" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text
									name="global.lbl.relationship" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.gender" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text
									name="global.lbl.date.of.birth" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.profession" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.education" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.action" /></b></font></td>
				</tr>
			</table>
		</div>
 
 		<br>
		<div id="saveBtnDiv" style="display: block">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="35" bgcolor="#COCOFF">
					<td align="center"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<!-- <input type="submit" name="btnSubmit" value="Save"  class="smallbtn" onclick="save();"/> -->
						<input type="submit" name="btnSubmit" value="Save" class="smallbtn">&nbsp;&nbsp;
						<input type="reset" name="btnClear" value="Clear" class="smallbtn">	<!-- onclick="save();" -->
					</td>
				</tr>
			</table>
		</div>
		<input type="hidden" value="mlValue" name="mlValue"> <input
			type="hidden" value="mlValue1" name="mlValue1"> <input
			type="hidden" value="mlValue2" name="mlValue2"> <input
			type="hidden" value="mlValue3" name="mlValue3"> <input
			type="hidden" value="mlValue4" name="mlValue4"><input
			type="hidden" value="mlValue5" name="mlValue5">
			  <s:hidden name="mlvToken" id="idmlvToken"/>
	</form>
</body>
</html>