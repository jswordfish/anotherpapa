<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.ProductMst"%>
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
	function backToList(){
		document.forms["productForm"].action = "productBackToList.action";
		document.forms["productForm"].submit();
	}
	
	</script>
	
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

  </head>
  

<body>
<form id="omniProductForm" name="productForm" method="POST" action="productSave">
<%
	String mode = (String)request.getAttribute("mode");
	System.out.println("Product JSP mode:"+mode);
	
	Map<String, String> currencies = new HashMap<String, String>();
	Map<String, String> custInt = new HashMap<String, String>();
	Map<String, String> acOpenLvl = new HashMap<String, String>();
	Map<String, String> vcrEntryLvl = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	Map<String, String> depositTypes = new HashMap<String, String>();
	Map<String, String> assetLiability = new HashMap<String, String>();
	Map<String, String> finNonFin = new HashMap<String, String>();
	Map<String, String> condAssetGL = new HashMap<String, String>();
	Map<String, String> condLiabilityGL = new HashMap<String, String>();
	Map<String, String> reconTypes = new HashMap<String, String>();
	Map<String, String> prdStatus = new HashMap<String, String>();
	Map<String, String> generalLadgers = new HashMap<String, String>();
	
	generalLadgers = (Map<String, String>)request.getAttribute("generalLadgers");
	if(generalLadgers == null){ generalLadgers = new HashMap<String, String>(); }
	
	currencies = (Map<String, String>)request.getAttribute("currencies");
	if(currencies == null){ currencies = new HashMap<String, String>(); }
	
	custInt = (Map<String, String>)request.getAttribute("custInt");
	if(custInt == null){ custInt = new HashMap<String, String>(); }
	
	acOpenLvl = (Map<String, String>)request.getAttribute("acOpenLvl");
	if(acOpenLvl == null){ acOpenLvl = new HashMap<String, String>(); }

	vcrEntryLvl = (Map<String, String>)request.getAttribute("vcrEntryLvl");
	if(vcrEntryLvl == null){ vcrEntryLvl = new HashMap<String, String>(); }
	
	modules = (Map<String, String>)request.getAttribute("modules");
	if(modules == null){ modules = new HashMap<String, String>(); }

	depositTypes = (Map<String, String>)request.getAttribute("depositTypes");
	if(depositTypes == null){ depositTypes = new HashMap<String, String>(); }
	
	assetLiability = (Map<String, String>)request.getAttribute("assetLiability");
	if(assetLiability == null){ assetLiability = new HashMap<String, String>(); }

	finNonFin = (Map<String, String>)request.getAttribute("finNonFin");
	if(finNonFin == null){ finNonFin = new HashMap<String, String>(); }

	condAssetGL = (Map<String, String>)request.getAttribute("condAssetGL");
	if(condAssetGL == null){ condAssetGL = new HashMap<String, String>(); }

	condLiabilityGL = (Map<String, String>)request.getAttribute("condLiabilityGL");
	if(condLiabilityGL == null){ condLiabilityGL = new HashMap<String, String>(); }

	reconTypes = (Map<String, String>)request.getAttribute("reconTypes");
	if(reconTypes == null){ reconTypes = new HashMap<String, String>(); }
	
	prdStatus = (Map<String, String>)request.getAttribute("prdStatus");
	if(prdStatus == null){ prdStatus = new HashMap<String, String>(); }
	
	ProductMst product = (ProductMst)request.getAttribute("product");
	
	
%>
<div id="result" class="container">
<input type="hidden" name="mode" value="<%= mode %>">
<table class="table table-condensed">
<tr class="active">
	<td class="col-md-1"><s:text name="global.val.product.code" /></td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="productCode" name="productCode" type="text"  value="<%= product.getProductCode() %>"/></td>
	<%	}else{%>
			<td class="col-md-1"><input readonly id="productCode" name="productCode" type="text"  value="<%= product.getProductCode() %>"/></td>
	<%	}%>
	<td class="col-md-1"><s:text name="global.val.product.name" /></td>
	<td class="col-md-1"><input id="productName" name="productName" type="text" 
				value="<%= product.getProductName() %>" /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.currency" /></td>
	<td class="col-md-1">
		<select id="currencyCode" name="currencyCode">
			<% for(Map.Entry<String, String> entry : currencies.entrySet()) { 
					if(null != product.getCurrencyCode() &&
							product.getCurrencyCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.customer.internal" /></td>
	<td class="col-md-1">
		<select id="customerInternal" name="customerInternal">
			<% for(Map.Entry<String, String> entry : custInt.entrySet()) { 
					if(null != product.getCustomerInternal() &&
							product.getCustomerInternal().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.account.open.level" />:</td>
	<td class="col-md-1">
		<select id="vcrOpenLevel" name="vcrOpenLevel">
			<% for(Map.Entry<String, String> entry : acOpenLvl.entrySet()) { 
					if(null != product.getVcrOpenLevel() &&
							product.getVcrOpenLevel().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.voucher.entry.level" /></td>
	<td class="col-md-1">
		<select id="vcrEntryLevel" name="vcrEntryLevel">
			<% for(Map.Entry<String, String> entry : vcrEntryLvl.entrySet()) { 
					if(null != product.getVcrEntryLevel() &&
							product.getVcrEntryLevel().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.module.type" /></td>
	<td class="col-md-1">
		<select id="modules" name="modules">
			<% for(Map.Entry<String, String> entry : modules.entrySet()) { 
					if(null != product.getModuleCode() &&
							product.getModuleCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.type.of.deposit" /></td>
	<td class="col-md-1">
		<select id="typeOfDeposit" name="typeOfDeposit">
			<% for(Map.Entry<String, String> entry : depositTypes.entrySet()) { 
					if(null != product.getTypeOfDeposit() &&
							product.getTypeOfDeposit().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.auto.generate.ac" /></td>
	<td class="col-md-1">
	<% if(null != product.getAutoGenAcNoYN() && product.getAutoGenAcNoYN()==true){ %>
		<input checked="checked" type="radio" name="acNoAuto" id="acNoAuto" value="Y">&nbsp;Yes
		<input type="radio" name="acNoAuto" id="acNoAuto" value="N">&nbsp;No
	<%	}else{ %>
		<input type="radio" name="acNoAuto" id="acNoAuto" value="Y">&nbsp;Yes
		<input checked="checked" type="radio" name="acNoAuto" id="acNoAuto" value="N">&nbsp;No
	<%	}%>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.auto.generate.sub.ac" /></td>
	<td class="col-md-1">
	<% if(null != product.getAutoGenSubAcNoYN() && product.getAutoGenSubAcNoYN()==true){ %>
		<input checked="checked" type="radio" name="subAcNoAuto" id="subAcNoAuto" value="Y">&nbsp;Yes
		<input type="radio" name="subAcNoAuto" id="subAcNoAuto" value="N">&nbsp;No
	<%	}else{ %>
		<input type="radio" name="subAcNoAuto" id="subAcNoAuto" value="Y">&nbsp;Yes
		<input checked="checked" type="radio" name="subAcNoAuto" id="subAcNoAuto" value="N">&nbsp;No
	<%	}%>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.minimum.balance.cheque.book" /></td>
	<td class="col-md-1"><input id="minBalChqBk" name="minBalChqBk" type="text"  
				value="<%= product.getMinBalChqBook() %>"/></td>
	<td class="col-md-1"><s:text name="global.lbl.minimum.balance.non-cheque" /></td>
	<td class="col-md-1"><input id="minBalWOChqBk" name="minBalWOChqBk" type="text" 
				value="<%= product.getMinBalNonChqBook() %>" /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.asset.liability" /></td>
	<td class="col-md-1">
		<select id="assetLiability" name="assetLiability">
			<% for(Map.Entry<String, String> entry : assetLiability.entrySet()) { 
					if(null != product.getAssetLiability() &&
							product.getAssetLiability().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.financial.non-financial" /></td>
	<td class="col-md-1">
		<select id="finNonFin" name="finNonFin">
			<% for(Map.Entry<String, String> entry : finNonFin.entrySet()) { 
					if(null != product.getFinNonFin() &&
							product.getFinNonFin().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.conditional.asset.gl" /></td>
	<td class="col-md-1">
		<select id="assetGL" name="assetGL">
			<% for(Map.Entry<String, String> entry : condAssetGL.entrySet()) { 
					if(null != product.getConditionalAssetGL() &&
							product.getConditionalAssetGL().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.conditional.liability.gl" /></td>
	<td class="col-md-1">
		<select id="liabilityGL" name="liabilityGL">
			<% for(Map.Entry<String, String> entry : condLiabilityGL.entrySet()) { 
					if(null != product.getConditionalLiabilityGL() &&
							product.getConditionalLiabilityGL().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.reconciliation.type" /></td>
	<td class="col-md-1">
		<select id="reconType" name="reconType">
			<% for(Map.Entry<String, String> entry : reconTypes.entrySet()) { 
					if(null != product.getReconType() &&
							product.getReconType().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.product.status" /></td>
	<td class="col-md-1">
		<select id="productStatus" name="productStatus">
			<% for(Map.Entry<String, String> entry : condLiabilityGL.entrySet()) { 
					if(null != product.getPrdStatus() &&
							product.getPrdStatus().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.accrued" /></td>
	<td class="col-md-1">
	<% if(null != product.getAccruedYN() &&
			product.getAccruedYN()==true){ %>
		<input checked="checked" type="radio" name="accrued" id="accrued" value="Y">&nbsp;Yes
		<input type="radio" name="accrued" id="accrued" value="N">&nbsp;No
	<%	}else{ %>
		<input type="radio" name="accrued" id="accrued" value="Y">&nbsp;Yes
		<input checked="checked" type="radio" name="accrued" id="accrued" value="N">&nbsp;No
	<%	}%>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.general.ledger" /></td>
	<td class="col-md-1">
	<select id="generalLadger" name="generalLadger">
			<% for(Map.Entry<String, String> entry : generalLadgers.entrySet()) { 
					if(null != product.getGeneralLadger() &&
							product.getGeneralLadger().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.cash.dr" /></td>
	<td class="col-md-1">
	<% if(null != product.getCashDrYN() &&
			product.getCashDrYN()==true){ %>
		<input checked="checked" type="radio" name="cashDR" id="cashDR" value="Y">&nbsp;Yes
		<input type="radio" name="cashDR" id="cashDR" value="N">&nbsp;No
	<%	}else{ %>
		<input type="radio" name="cashDR" id="cashDR" value="Y">&nbsp;Yes
		<input checked="checked" type="radio" name="cashDR" id="cashDR" value="N">&nbsp;No
	<%	}%>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.cash.cr" /></td>
	<td class="col-md-1">
	<% if(null != product.getCashCrYN() &&
			product.getCashCrYN()==true){ %>
		<input checked="checked" type="radio" name="cashCR" id="cashCR" value="Y">&nbsp;Yes
		<input type="radio" name="cashCR" id="cashCR" value="N">&nbsp;No
	<%	}else{ %>
		<input type="radio" name="cashCR" id="cashCR" value="Y">&nbsp;Yes
		<input checked="checked" type="radio" name="cashCR" id="cashCR" value="N">&nbsp;No
	<%	}%>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.transfer.dr" /></td>
	<td class="col-md-1">
	<% if(null != product.getTransferDrYN() &&
			product.getTransferDrYN()==true){ %>
		<input checked="checked" type="radio" name="transferDR" id="transferDR" value="Y">&nbsp;Yes
		<input type="radio" name="transferDR" id="transferDR" value="N">&nbsp;No
	<%	}else{ %>
		<input type="radio" name="transferDR" id="transferDR" value="Y">&nbsp;Yes
		<input checked="checked" type="radio" name="transferDR" id="transferDR" value="N">&nbsp;No
	<%	}%>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.transfer.cr" /></td>
	<td class="col-md-1">
	<% if(null != product.getTransferCrYN() &&
			product.getTransferCrYN()==true){ %>
		<input checked="checked" type="radio" name="transferCR" id="transferCR" value="Y">&nbsp;Yes
		<input type="radio" name="transferCR" id="transferCR" value="N">&nbsp;No
	<%	}else{ %>
		<input type="radio" name="transferCR" id="transferCR" value="Y">&nbsp;Yes
		<input checked="checked" type="radio" name="transferCR" id="transferCR" value="N">&nbsp;No
	<%	}%>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.clearing.dr" /></td>
	<td class="col-md-1">
	<% if(null != product.getClearingDrYN() &&
			product.getClearingDrYN()==true){ %>
		<input checked="checked" type="radio" name="clearingDR" id="clearingDR" value="Y">&nbsp;Yes
		<input type="radio" name="clearingDR" id="clearingDR" value="N">&nbsp;No
	<%	}else{ %>
		<input type="radio" name="clearingDR" id="clearingDR" value="Y">&nbsp;Yes
		<input checked="checked" type="radio" name="clearingDR" id="clearingDR" value="N">&nbsp;No
	<%	}%>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.clearing.cr" /></td>
	<td class="col-md-1">
	<% if(null != product.getClearingCrYN() && 
			product.getClearingCrYN()==true){ %>
		<input checked="checked" type="radio" name="clearingCR" id="clearingCR" value="Y">&nbsp;Yes
		<input type="radio" name="clearingCR" id="clearingCR" value="N">&nbsp;No
	<%	}else{ %>
		<input type="radio" name="clearingCR" id="clearingCR" value="Y">&nbsp;Yes
		<input checked="checked" type="radio" name="clearingCR" id="clearingCR" value="N">&nbsp;No
	<%	}%>
	</td>
</tr>
<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="Save" value="<s:text name="global.btn.save"/>">			
			<input type="button" name="List"  value="<s:text name="global.btn.back.to.list"/>" onClick="backToList();">
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
