<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.infrasofttech.domain.entities.PrdAcNumberConfig"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css1/bootstrap.min.css">
     <link rel="stylesheet" href="css/jquery-ui.css">
 <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
     <script type="text/javascript" src="js/jquery-ui.js"></script>
      <script type="text/javascript" src="js/PrdAcNumberConfig.js"></script>
       <script type="text/javascript" src="js/validate.js"></script>
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
    
   
     
  

<script language="javascript">
	function startUp() {
  
  
	         }		 
	function goToList()
	{
		document.forms["topForm"].action = "prdAcConfigList.action";
		document.forms["topForm"].submit();
	}
	
	$(document).ready(

			/* This is the function that will get executed after the DOM is fully loaded */
			function() {
				$("#effFromDate").datepicker({
					changeMonth : true,//this option for allowing user to select month
					changeYear : true,//this option for allowing user to select from year range
				    dateFormat : 'yy-mm-dd',//this option for allowing user to select format
					duration : 'fast',
					yearRange : '1960:2099'
				});
				$("#effTillDate").datepicker({
					changeMonth : true,//this option for allowing user to select month
					changeYear : true,//this option for allowing user to select from year range
					dateFormat : 'yy-mm-dd',
					duration : 'fast',
					yearRange : '1960:2099'
				});
			}

			);
	
		
	</script>

	<script type="text/javascript">
	
	$(document).ready(function() {

		$('#idModuleCode').change(function(event) {
			var module = $("select#idModuleCode").val();
			var select = $('#idProduct');
			
			if(module == null || module ==''){
				select.find('option').remove();
				$('<option>').val('').text("Select..").appendTo(select);
				
			}
			$.getJSON('moduleBasedProduct', {
				moduleCode : module
			}, function(jsonResponse) {

				select.find('option').remove();
				$('<option>').val('').text("Select..").appendTo(select);
				$.each(jsonResponse, function(key, value) {
					
					$('<option>').val(key).text(value).appendTo(select);
				}

				);

			});
		}).change();
	});
	
	
	
	</script>
	
	

	  

	
<script src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
    
	
	<style type="text/css">
		.bs-example{
			margin: 20px;
		}
	</style>

  </head>
  

<body onLoad="javascript:startUp();">
<form id="omniProductForm" name="topForm" method="POST" action="PrdAcNumberSave" onsubmit="return validate(this);">
          


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

	  	
     	
		<div align="left">
		   <div align="left" id="idErrTbl" class="errorDiv">
			<p id="el" style="color: #FF0040" align="left"></p>			
			<p id="error" style="color: #FF0040" align="left"></p>			
		  </div> 
		<table class="table table-condensed">
		
		<tr class="active">
	
	<td class="col-md-1"><s:text name="global.lbl.module.code" /></td>
	<td class="col-md-1">
		<select id="idModuleCode" name="moduleCode">
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
	<td class="col-md-1"><s:text name="global.lbl.product.code" /></td>
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
	<td class="col-md-1"><s:text name="global.lbl.a/c.number.seperator" /></td>
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
	<td class="col-md-1"><s:text name="global.lbl.total.a/c.length" /></td>
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
	<td width="30%" class="col-md-1"><s:text name="global.lbl.branch" /></td>
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
	
	<td width="30%" class="col-md-1"><s:text name="global.lbl.currency" /></td>
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
	
	<td width="30%" class="col-md-1"><s:text name="global.lbl.product" /></td>
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
	<td width="30%" class="col-md-1"><s:text name="global.lbl.customer" /></td>
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
	<td width="30%" class="col-md-1"><s:text name="global.lbl.account" /></td>
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
	<td width="30%" class="col-md-1"><s:text name="global.lbl.sub.account" /></td>
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
	<td class="col-md-1"><s:text name="global.lbl.effective.from.date" /></td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="effFromDate" name="effFromDate" type="text" /></td>
	<%	}else{%>
			<td class="col-md-1"><input  id="effFromDate" name="effFromDate" type="text"  value="<%= prdAcNumberConfig.getEffFromDate() %>"/></td>
	<%	}%>
	<td class="col-md-1"><s:text name="global.lbl.effective.till.date" /></td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="effTillDate" name="effTillDate" type="text" /></td>
	<%	}else{%>
			<td class="col-md-1"><input  id="effTillDate" name="effTillDate" type="text"  value="<%= prdAcNumberConfig.getEffTillDate() %>"/></td>
	<%	}%>
</tr>
		<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="Save" value="<s:text name="global.btn.save" />">
			<input type="reset" name="Clear" value="<s:text name="global.btn.clear" />">
			<input type="button" name="List" value="<s:text name="global.btn.back.to.list" />" onclick="javasript:goToList()">
	</td>
</tr>
		</table>
			</div>

</div>
</form>
	<script type="text/javascript">
	new FormValidator(
				'topForm',
				[   {
					name : 'moduleCode',
					display : 'ModuleCode',
					rules : 'required'
				},{
					name : 'totalAccountLen',
					display : 'Total Account Length',
					rules : 'required|numeric|max_length[2]'
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
				},{
					name : 'effFromDate',
					display : 'From Date',
					rules : 'required'
				},   {
					name : 'productCode',
					display : 'productCode',
					rules : 'required'
				},     ],
				
			    
				function(errors, evt) {
					

					if (errors.length > 0) {
					
						var errorString = '';
					  document.getElementById("idErrTbl").style.display = "inline";
						for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
							errorString += errors[i].message + '<br />';
							
						}


					document.getElementById("el").innerHTML = errorString;
						
					}
				}); 
	 	</script>
</body>
</html>
