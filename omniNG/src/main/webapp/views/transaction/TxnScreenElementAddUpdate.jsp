<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.transaction.ScreenUIType"%>
<%@page import="com.infrasofttech.domain.entities.transaction.ScreenDataType"%>
<%@page import="com.infrasofttech.domain.entities.transaction.ScreenElement"%>
<%@page import="com.infrasofttech.domain.entities.*"%>
<%@page import="com.infrasofttech.domain.entities.Address"%>
<%@page import="com.infrasofttech.domain.entities.UserMst"%>
<%@page import="java.util.*"%>
<%@page import="com.infrasofttech.omning.services.*"%>
<%@page import="com.infrasofttech.omning.utils.SpringUtil"%>
<%@page import="com.infrasofttech.domain.entities.transaction.runtime.*"%>
<%@page import="com.infrasofttech.omning.action.transaction.*"%>



<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Forms in Bootstrap - Demo</title>

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
	function checkLoginId() {
		var loginId = $('#loginId').val();

		//alert(loginId);
		$.post("verifyUser", {
			loginId : loginId
		}, function(result) {
			//if the result is 1 
		//	alert(result);
			$('#el3').html(result );
			
		});
		
	}
	
	
	function goToList(){
		document.forms["omniScreenElementForm"].action = "screenElementList.action";
		document.forms["omniScreenElementForm"].submit();
		
		
	}
	
	</script>
	


  </head>
  

<body>
<div class="container">

<form id="omniScreenElementForm" method="POST" action="screenElementSave">
<%
	ScreenElement screenElement = (ScreenElement) session.getAttribute("screenElement");
	LookupCodeService lookupService = (LookupCodeService)SpringUtil.getSpringUtil().getService("lookupCodeService");
	String tenantId = (String)request.getSession().getAttribute("tenantCode");
	List<LookupCode> codes = lookupService.getLookupCodeList(tenantId);
	
	List<String> voucherAttrs = VoucherMst.getAttrNames();
	List<String> D009622Attrs = D009622.getAttrNames();
	List<String> D030003Attrs = D030003.getAttrNames();
	
%>
<div id="result" class="container">
<table class="table table-condensed" width="100%">
<tr class="active">
	<td class="col-md-1">Screen Element Name</td>
	<td class="col-md-1"><input id="name" name="name" type="text" value="<%= screenElement.getName() %>" <% if(screenElement.getId() != null) { %> readOnly <%} %>/>
	&nbsp; 
	<span class="el3" id="el3"> </span></td>
	<td class="col-md-1">Display Name</td>
	<td class="col-md-1"><input id="displayName" name="displayName" type="text" value="<%= screenElement.getDisplayName() %>" />
</tr>
<tr class="active">
	<td class="col-md-1">Look Up Code</td>
	<td class="col-md-3" >
		
		<select id="lookupCode" name="lookupCode">
			<% for(LookupCode code : codes) { %>
				<option value="<%=code.getLookupCode() %>" <%if(code.getLookupCode().equals(screenElement.getLookupCode())) {%> selected <%} %>  >  <%=code.getLookupCode() %> </option>
			<% } %>
		</select>
	</td>	
	<td class="col-md-1">Data Type</td>
	<td class="col-md-1">
		<select id="data/type" name="dataType">
			<% for(ScreenDataType screenDataType : ScreenDataType.values()) { %>
				<option value="<%=screenDataType.getVal() %>" <%if(screenElement.getScreenDataType().getVal().equals(screenDataType.getVal())) {%> selected <%} %>  >  <%=screenDataType.getVal() %> </option>
			<% } %>
		</select>
	</td>	
</tr>
<tr class="active">
	<td class="col-md-1">Screen Element UI Type</td>
	<td class="col-md-1">
		<select id="uiType" name="uiType">
			<% for(ScreenUIType screenUIType : ScreenUIType.values()) { %>
				<option value="<%=screenUIType.getVal() %>" <%if(screenElement.getScreenUIType().getVal().equals(screenUIType.getVal())) {%> selected <%} %>  ><%=screenUIType.getVal() %></option>
			<% } %>
		</select>
	</td>
	
	<td class="col-md-1">Is Transactional or Derived Field</td>
	<td class="col-md-1">
		<select id="isTransactional" name="isTransactional">
			<option value="Transactional" <% if(!screenElement.getIsDerived() ) {%> selected <% } %>> Transactional </option>
			<option value="Derived" <% if(screenElement.getIsDerived() ) {%> selected <% } %>> Derived </option>
		</select>
	</td>
	
	
</tr>

<tr class="active">
	<td class="col-md-1">If transactional, Map to Voucher Attr</td>
	<td class="col-md-1">
		<select id="voucherAttr" name="voucherAttr">
			<% for(String  attr: voucherAttrs) { %>
				<option value="<%= attr %>" <%if(screenElement.getVoucherAttr().equals(attr)) {%> selected <%} %>  ><%=attr %></option>
			<% } %>
		</select>
	</td>
	
	<td class="col-md-1">Is Derived read from Source</td>
	<td class="col-md-1">
		<select id="derivdSource" name="derivdSource">
			<% for(String  attr: D009622Attrs) { %>
				<option value="D009622.<%= attr %>" <%if(screenElement.getSourceDerivedField().equals("D009622."+attr)) {%> selected <%} %>  >D009622.<%=attr %></option>
			<% } %>
			<% for(String  attr: D030003Attrs) { %>
				<option value="D030003.<%= attr %>" <%if(screenElement.getSourceDerivedField().equals("D030003."+attr)) {%> selected <%} %>  >D030003Attrs.<%=attr %></option>
			<% } %>
		</select>
	</td>
	
	
</tr>

<tr class="active">
	<td class="col-md-1">Derived Field Identifier</td>
	<td class="col-md-1">
	<input id="derivedFieldIdentifier" name="derivedFieldIdentifier" type="text" value="<%= screenElement.getDerivedFieldIdentifier() %>" >
	</td>
	
	
</tr>

<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="Save" value="Save Screen Element">
			<!-- <input type="reset" name="Clear" value="Clear"> -->
			<input type="button" name="List" value="Go To Screen Element List Page" onClick="javascript:goToList();">
	</td>
</tr>
</table>
</div>
</form>
</div>
	
</body>
</html>