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
<link rel="stylesheet" href="css/stylesheet.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/validate.js"></script>	
<script type="text/javascript" src="js/PrdAcNumberConfig.js"></script>

<title>Welcome to PACS</title>

<script language="javascript">
	function startUp() {
		document.getElementById("idProduct").focus();
	                  }
</script>


 
  <style>
  #mandatory{
  color: #FF0040;
  font-size: 10px;
  }

 </style>
 

</head>

<body onLoad="javascript:startUp();">
<form name="frmPrdAc" method="POST" action="PrdAcNumberSave" onsubmit="return validate(this);">
		<div><input type="hidden" name="vToken"></div>
	<div id="idPageTitle" class="pageTitle" style="display:block">&nbsp;<s:text name="global.lbl.PrdAcNoConfig" />
		
	</div>
	<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
	    	<div align="left" id="idErrTbl" class="errorDiv" style="display:none">
			<p id="el" style="color: #FF0040" align="left"></p>			
			<p id="error" style="color: #FF0040" align="left"></p>
			<p id="error2" style="color: #FF0040" align="left"></p>
		  </div>
     	
		<div align="left">
		
		<table width="100%" cellspacing = "0">
		<tr>
			<td width="20%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#CCCCFF" valign="middle" width="20%" >
				<font face="Calibri" size="2">&nbsp;&nbsp;<s:text name="global.lbl.product" />&nbsp;
				</font>	<span id="mandatory">*</span>
			</td>
			<td width="30%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%" >&nbsp;&nbsp;
				<font face="Calibri" size="2">
				<select  id="idProduct" name="product" tabindex="1">
						<option value=""><s:text name="global.lbl.select">...</s:text>
						</option>
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
				<select id="idProducts2" name="productCode" class="multiselect" multiple="multiple" tabindex="2">
		
					<c:forEach var="product" items="${products}">
						<option  value="${product.id}" style="font-face: Calibri;font-size: '2'">${product.productCode}:${product.productName}</option>
					</c:forEach>	
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
				<select id="separatorId" name="sepr" tabindex="3">
				<option value=""><s:text name="global.lbl.select">...</s:text></option>
 					<c:forEach var="sepr" items="${sepr}">
						<option  value="${sepr.key}" style="font-face: Calibri;font-size: '2'">${sepr.key}</option>
					</c:forEach>	
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
			<td width="20%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
			 <input tabindex="4" id="idTotalAc"  name="totalAccountLen" size="15"
				style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
				type="text" >
		   </td>
			<td width="20%"
				style="display:none; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0" align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
				face="Calibri" size="2"><s:text name="global.lbl.toal.sac.length" />&nbsp;</font>
			</td>
			<td width="20%"
				style="display:none; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#FFFFFF" valign="middle" width="80%">&nbsp;
				<input tabindex="5" id="idSubAccountAc" tabindex="5" name="totalSubAccountLen" size="15"
				style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
				type="text" >
			</td>
		</tr>
		
		<tr>
			<td width="100%" colspan="4">
			<table width="50%" border="1" cellspacing="0" cellpadding="0"><tr><td width="100%">
				<table width="100%" cellspacing="1" border="0">
					<tr bgcolor="#A0A0FF">
						<td width="10%" align="center"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.select"></s:text></font></td>
						<td width="30%" align="center"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.parameter"></s:text></font></td>
						<td width="30%" align="center"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.rank"></s:text></font></td>
						<td width="30%" align="center"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.length"></s:text></font></td>
					</tr>
					<tr>
						<td width="10%" 
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input tabindex="6" id="idBranch" type="checkbox" name="branchYN"></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.branch"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><input tabindex="7" type="text" id="idBranchRank" name="branchRank"  size="5"></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="8" id="idBranchLen" type="text" name="branchLen" size="5" value=""></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input tabindex="9" type="checkbox" name="currencyYN" id="idCurrency"></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.currency"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="10" type="text" id="idCurrencyRank" name="currencyRank" size="5"></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="11" id="idCurrencyLen" type="text" name="currencyLen" size="5"></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input tabindex="12" type="checkbox" name="customerYN" id="idCustomer"></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.customer"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="13" type="text" id="idCustomerRank" name="customerRank" size="5"></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="14" type="text" id="idCustomerLen" name="customerLen" size="5"></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input tabindex="15" type="checkbox" name="productYN" id="idProductYN"></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.product"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="16" type="text" id="idProductRank" name="productRank" size="5"></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="17" type="text" id="idProductLen" name="productLen" size="5"></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input tabindex="18" type="checkbox" name="accountYN" checked  disabled="disabled"></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.account"></s:text></font><span id='mandatory'>*</span></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="19" type="text" name="accountRank" size="5" ></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="20" type="text" id="idAccountLen" name="accountLen" size="5" ></font></td>
					</tr>				
					<tr>
						<td width="10%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<input tabindex="21" type="checkbox" name="subAccountYN" id="idSubAccount"></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<font face="Calibri" size="2"><s:text name="global.lbl.sub.account"></s:text></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="22" type="text" name="subAccountRank" id="idSubAccountRank" size="5"></font></td>
						<td width="30%"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
								<font face="Calibri" size="2"><input tabindex="23" type="text" id="idSubAccountLen" name="subAccountLen" size="5"></font></td>
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
				<font face="Calibri" size="2"><input tabindex="24" id="datepicker" type="text" name="fromDate" placeholder="dd-mm-yyyy" size="15"></font>
			</td>
			<td  width="20%" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
					align="left" bgcolor="#CCCCFF" valign="middle" width="20%">
				<font	face="Calibri" size="2">&nbsp;&nbsp;
				<s:text name="global.lbl.effective.tilldate" />&nbsp;
				</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" style="border-left-width: 1px; 
						border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2"><input tabindex="25" id="datepicker2" type="text" name="toDate" placeholder="dd-mm-yyyy" size="15"></font>
			</td>
		</tr>
		<tr>  <!-- BLANK LINE INTENTIONAL -->
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		</table>
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr height="25" bgcolor="#9999FF">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
							<input type="submit" value=" <s:text name="global.btn.save"/> "
						class="button" tabindex="26">
					</td>
					<td width="20%" align="left"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="button" value="<s:text name="global.btn.cancel"/>"
						class="button" onclick="cancel();" type="reset" tabindex="27">
					</td>
					<td width="30%" align="left"
						style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
				</tr>
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
				}, {
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
					rules : 'numeric|max_length[2]'
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
				},  {
					name : 'productCode',
					display : 'Select Product',
					rules : 'required'
				}, {
					name : 'fromDate',
					display : 'From Date',
					rules : 'required'
				},    ],
				
			    
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
					else
						{
						
						document.getElementById("el").innerHTML="";
						}
				}); 
	
	 	</script>

	 	
		
	
</body>

</html>