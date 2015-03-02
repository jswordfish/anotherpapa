<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <jsp:useBean id="nationalityBean" class="com.infrasofttech.bean.NationalityBean" /> --%>
<!-- refer example for fetching drop downs from bean -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/stylesheet.css" />" />
<!-- for text-fields and labels -->
<link rel="stylesheet" href="<c:url value="/css/jquery-ui.css" />" />
<!-- for date  -->
<script src="/js/validate.js" type="text/javascript"></script>
<!-- for front end validation -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
	<script src="js/CustomerReg.js"></script>
<!-- All internal validations -->
<script language="javascript">
	/***   add script***/
</script>

</head>

<body>
	<form id="idForm?" method="POST" action="???">
		<div>
			<input type="hidden" name="vToken">
		</div>
		<div id="idPageTitle" class="pageTitle" style="display: block">
			&nbsp;
			<s:text name="global.pageTitle.LoanAcParamAdd"></s:text>
		</div>
		<div id="idErrMsg" class="errorDiv" style="display: none">
			<s:text name="errMsg"></s:text>
		</div>
		<div id="idErrTbl" class="errorDiv" style="display: none">
			<p id="el"></p>
		</div>


		<div align="center">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr bgcolor="#FFFFFF" height="25">
					<td colspan="3" width="50%" bgcolor="#FFFFFF"><b> <font
							face="Calibri" size="2">&nbsp;</font><font face="Calibri">&nbsp;</font></b><font
						face="Calibri" color="#003399"><s:text
								name="global.lbl.new.customer.registration" /></font> <font size="2"
						color="#595959" face="Calibri">(PACS &gt; Masters)</font></td>
					<td colspan="3" width="50%" bgcolor="#FFFFFF">
						<p align="right">
							<b> <font face="Calibri" size="2" color="#595959"> </font> <font
								face="Calibri" size="2" color="#003399"> </font></b><font
								face="Calibri" size="2" color="#003399"> <b>Talegaon
									Primary Agriculture Credit Society&nbsp;&nbsp;</b></font>
					</td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td colspan="6" width="100%">
						<p align="center" style="display: none" id="idSuccessMessage">
					</td>
				</tr>

			</table>
		</div>
		
		
		
		
		
		
		
		
		

		<!-- BASIC INFORMATION START-->
		<div id="idMainDiv" style="display: block">

			<table ID="idBasicTbl" width="100%" cellpadding="0" cellspacing="0">
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
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr bgcolor="#F4F4F4">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.branch.code" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>

				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.loan.params.product" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>
				</tr>
				<tr bgcolor="#F4F4F4">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.loan.params.loantype" /></font>
					</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>
					
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.equaled.y/n" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type=radio name="customerGender" id="idCustomerGender"
						class="radiobutton" value="M" checked><font face="Calibri"
						size="2"><s:text name="global.lbl.yes" />&nbsp;</font> <input
						type=radio name="customerGender" id="idCustomerGender"
						class="radiobutton" value="F"><font face="Calibri"
						size="2"><s:text name="global.lbl.no" />&nbsp;</font>
					</td>
				
				</tr>
				<tr bgcolor="#F4F4F4">
				
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.loan.params.InterestApplicationFrequency" /></font>
					</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>
					
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.funded.y/n" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type=radio name="customerGender" id="idCustomerGender"
						class="radiobutton" value="M" checked><font face="Calibri"
						size="2"><s:text name="global.lbl.yes" />&nbsp;</font> <input
						type=radio name="customerGender" id="idCustomerGender"
						class="radiobutton" value="F"><font face="Calibri"
						size="2"><s:text name="global.lbl.no" />&nbsp;</font>
					</td>
				</tr>
				<tr bgcolor="#FFFFFF">

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.GraceDaysInstallment" />&nbsp;</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input name="custAdditionalInfo" size="60"
						id="idCustAdditionalInfo" class="largeTxtLeftAlign" type="text">
					</td>
						<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.loan.params.productcalculationtype" /></font>
					</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="7"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>
					</tr>
					<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.HolidayPeriod" />:&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<select size="1" name="KYCType" class="mediumselect"
						id="idKYCType">

							<option><s:text
									name="global.val.E-KYC" /></option>
							<option selected><s:text
									name="global.val.General" /></option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.DefaultTransferBatch" />&nbsp;</b></font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign" id="idCustomerFName"> <input
						type="text" name="customerMName" size="10"
						class="mediumTxtLeftAlign" id="idCustomerMName">
					</td>
				</tr>
				<tr bgcolor="#FFFFFF">
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.MinimumTerm" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign" id="idCustomerFName"> 
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.MaximumTerm" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign" id="idCustomerFName"> 
					</td>
					
					</tr>
				<tr bgcolor="#FFFFFF">
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.MinimumAmount" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign"  placeholder="0.00" id="idCustomerFName"> 
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.MaximumAmount"  />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign" id="idCustomerFName" placeholder="0.00" > 
					</td>
					
					</tr>
					<tr bgcolor="#FFFFFF">
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.gracedaysinterest" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign"   id="idCustomerFName"> 
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.loan.params.roundOff" /></font>
					</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="7"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>
					</tr>
					<tr bgcolor="#FFFFFF">
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.mindaysforinterest" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign"   id="idCustomerFName"> 
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.penalinterestrate" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign" placeholder="0.000000"  id="idCustomerFName">&nbsp;% 
					</td>
				<tr bgcolor="#FFFFFF">
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.maxpenalinterestrate" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign" placeholder="0.000000"  id="idCustomerFName">&nbsp;% 
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.interesttax" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign" placeholder="0.000000"  id="idCustomerFName">&nbsp;% 
					</td>
					<tr>
					<tr bgcolor="#FFFFFF">
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.NonperformingAccountpenalRate" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type="text" name="customerFName" size="10"
						class="mediumTxtLeftAlign" placeholder="0.000000"  id="idCustomerFName">&nbsp;% 
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.loan.params.interestChargeType" /></font>
					</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="7"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>
					<tr>
			</table>

		</div>
		<div id="idMainDiv" style="display: block">
			<table>


			</table>
		</div>
		<!-- BASIC INFORMATION END-->




























		<!-- ACCOUNTING PARAMETER START-->
		<div id="miscTbl" style="display: block">
			<table id="idAccTbl1" width="100%" cellpadding="0" cellspacing="0">
				<tr height="25" bgcolor="#EEEEFF">
					<td align="left"
						style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<font face="Calibri" size="3"><b>&nbsp;&nbsp; <a
								id="basicInfo" onclick="toggleTable('idAccTbl2');" href="#"><s:text
										name="global.lbl.basic.information" /></a>
						</b></font>
					</td>
				</tr>
			</table>
			<table id="idAccTbl2" style="display: none" width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr bgcolor="#F4F4F4">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.branch.code" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>

				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.loan.params.product" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>
				</tr>
				<tr bgcolor="#F4F4F4">
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.loan.params.loantype" /></font>
					</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						colspan="3"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><select size="1" name="customerSalutation" id="idCustomerName"
						class="mediumselect">
							<option value="select"><s:text name="global.val.select" /></option>
							<option value="mr"></option>
							<option value="ms"></option>
							<option value="mrs"></option>
							<option value="dr"></option>
					</select></td>
					
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><b><s:text
									name="global.lbl.loan.params.equaled y/n" />&nbsp;</b></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<input type=radio name="customerGender" id="idCustomerGender"
						class="radiobutton" value="M" checked><font face="Calibri"
						size="2"><s:text name="global.lbl.yes" />&nbsp;</font> <input
						type=radio name="customerGender" id="idCustomerGender"
						class="radiobutton" value="F"><font face="Calibri"
						size="2"><s:text name="global.lbl.no" />&nbsp;</font>
					</td>
				
				</tr>

			</table>



		</div>
		<!-- ACCOUNTING PARAMETER END-->

		<!-- OTHERS PARAMETERS START-->

		<div>
			<table id="idOtherTbl" width="100%" cellpadding="0" cellspacing="0">
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
			<table>




			</table>




		</div>

		<!-- OTHERS PARAMETERS START-->

		<!-- NON PERFORMING ACCOUNT PARAMETERS START-->

		<div>
			<table id="idNPATbl" width="100%" cellpadding="0" cellspacing="0">
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
			<table id="idNPAParams" width="100%" cellpadding="0" cellspacing="0">
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
			<table>




			</table>




		</div>

		<!-- OTHERS PARAMETERS START-->



	</form>
	<%-- <script type="text/javascript">
		/* 	new FormValidator(
					'frmLogin',
					[ {
						name : 'brCode',
						display : 'branch code',
						rules : 'required|numeric'
					}, {
						name : 'loginId',
						display : 'Login Id',
						rules : 'required|alpha_numeric|min_length[4]'
					},],
					function(errors, evt) {

						if (errors.length > 0) {
							var errorString = '';
							document.getElementById("idErrTbl").style.display = "inline";
							for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
								errorString += errors[i].message + '<br />';
							}

							el.innerHTML = errorString;
						}
					}); */
	</script> --%>

</body>
</html>