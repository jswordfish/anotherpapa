<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.AppConfig"%>
<%@page import="java.util.*"%>

<%@ taglib prefix="s" uri="/struts-tags"%>


 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
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
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="js1/jquery.min.js"></script>
        
    <script src="js1/bootstrap.min.js"></script>
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    
    <style class="cp-pen-styles">label{margin-left: 20px;}
		#datepicker{width:180px; margin: 0 20px 20px 20px;}
		#datepicker > span:hover{cursor: pointer;}
	</style>
	
	<script>
	function backToList(){
		document.forms["appConfigForm"].action = "appConfigBackToList.action";
		document.forms["appConfigForm"].submit();
	}
	
	</script>

	<script lang="javascript">
		function startUp() { 
	                  }
</script>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
 <script type="text/javascript">
  $(document).ready(
		  
		  /* This is the function that will get executed after the DOM is fully loaded */
		  function () {
		    $( "#ideffFromDate" ).datepicker({
		      changeMonth: true,
		      changeYear: true,
		      yearRange: '1960:2100',
		      dateFormat:'yy-mm-dd'
		    });
		    $( "#idEffToDate" ).datepicker({
			      changeMonth: true,
			      changeYear: true,
			      yearRange: '1960:2100',
			      dateFormat:'yy-mm-dd'
			    });
		  }

	);
  </script>
<script src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
    
	
	<style type="text/css">
		.bs-example{
			margin: 20px;
		}
	</style>
<script>
	$(document).ready(
			function() {
			var data = [];
				<c:forEach  var="branch" items="${appConfigs}">
				data.push('<c:out value="${branch.branchCode}"/>');
				</c:forEach>
				for (var i = 0; i < data.length; i++) {
					$('#idBranchCode option').map(function() {
						if ($(this).val() == data[i])
							return this;
					}).attr('selected', 'selected');
				}
			});
</script> 

  </head>
  

<body onLoad="javascript:startUp();">
<form id="omniProductForm" method="POST" name="appConfigForm" action="appConfigSave">
<%
	String mode = (String)request.getAttribute("mode");
	System.out.println("AppConfig JSP mode:"+mode);
	
	Map<String, String> branches = new HashMap<String, String>();
	Map<String, String> dateFormat = new HashMap<String, String>();
	Map<String, String> decimalFormat = new HashMap<String, String>();
	Map<String, String> digitSeparator = new HashMap<String, String>();
	Map<String, String> amountFormat = new HashMap<String, String>();
	Map<String, String> numberFormat = new HashMap<String, String>();
	Map<String, String> customerIdLenTypeCode = new HashMap<String, String>();
	Map<String, String> customerIdGenType = new HashMap<String, String>();
	Map<String, String> effFromDate = new HashMap<String, String>();
	Map<String, String> effToDate = new HashMap<String, String>();

	
	branches = (Map<String, String>)request.getAttribute("branches");
	if(branches == null){ branches = new HashMap<String, String>(); }
	
	dateFormat = (Map<String, String>)request.getAttribute("dateFormat");
	if(dateFormat == null){ dateFormat = new HashMap<String, String>(); }
	
	decimalFormat = (Map<String, String>)request.getAttribute("decimalFormat");
	if(decimalFormat == null){ decimalFormat = new HashMap<String, String>(); }
	
	digitSeparator = (Map<String, String>)request.getAttribute("digitSeparator");
	if(digitSeparator == null){ digitSeparator = new HashMap<String, String>(); }

	amountFormat = (Map<String, String>)request.getAttribute("amountFormat");
	if(amountFormat == null){ amountFormat = new HashMap<String, String>(); }
	
	numberFormat = (Map<String, String>)request.getAttribute("numberFormat");
	if(numberFormat == null){ numberFormat = new HashMap<String, String>(); }

	customerIdLenTypeCode = (Map<String, String>)request.getAttribute("customerIdLenTypeCode");
	if(customerIdLenTypeCode == null){ customerIdLenTypeCode = new HashMap<String, String>(); }
	
	
	customerIdGenType = (Map<String, String>)request.getAttribute("customerIdGenType");
	if(customerIdGenType == null){ customerIdGenType = new HashMap<String, String>(); }

	
	effFromDate = (Map<String, String>)request.getAttribute("effFromDate");
	if(effFromDate == null){ effFromDate = new HashMap<String, String>(); }
	
	
	effToDate = (Map<String, String>)request.getAttribute("effToDate");
	if(effToDate == null){ effToDate = new HashMap<String, String>(); }
	
	AppConfig appConfig = (AppConfig)request.getAttribute("appConfig");
%>
<div id="result" class="container">
<input type="hidden" name="mode" value="<%= mode %>">
<table class="table table-condensed">


<tr  class="active">	
	<td class="col-md-1"><s:text name="global.lbl.branches" /></td>
	
	<td class="col-md-1">
		<select id="idBranchCode" name="branchCode" multiple="multiple">
			<% for(Map.Entry<String, String> entry : branches.entrySet()) { 
				
			%>							
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
		<%} %>
		</select>
	</td>

</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.date.format" /></td>
	<td class="col-md-1">
		<select id="dateFormat" name="dateFormat">
			<% for(Map.Entry<String, String> entry : dateFormat.entrySet()) { 
					if(null != appConfig.getDateFormatStr() &&
							appConfig.getDateFormatStr().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.decimal.format" /></td>
	<td class="col-md-1">
		<select id="decimalFormat" name="decimalFormat">
			<% for(Map.Entry<String, String> entry : decimalFormat.entrySet()) { 
					if(null != appConfig.getDecimalCharacter() &&
							appConfig.getDecimalCharacter().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.digit.seperator" /></td>
	<td class="col-md-1">
		<select id="digitSeparator" name="digitSeparator">
			<% for(Map.Entry<String, String> entry : digitSeparator.entrySet()) { 
					if(null != appConfig.getDigitSeparator() &&
							appConfig.getDigitSeparator().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.amount.format" /></td>
	<td class="col-md-1">
		<select id="amountFormat" name="amountFormat">
			<% for(Map.Entry<String, String> entry : amountFormat.entrySet()) { 
					if(null != appConfig.getAmountFormatStr() &&
							appConfig.getAmountFormatStr().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.number.format" /></td>
	<td class="col-md-1">
		<select id="numberFormat" name="numberFormat">
			<% for(Map.Entry<String, String> entry : numberFormat.entrySet()) { 
					if(null != appConfig.getNumberFormatStr() &&
							appConfig.getNumberFormatStr().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.customer.id.length" /></td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="customerIdLen" name="customerIdLen" type="text"  value="<%= appConfig.getCustomerIdLen() %>"/></td>
	<%	}else{%>
			<td class="col-md-1"><input id="customerIdLen" name="customerIdLen" type="text"  value="<%= appConfig.getCustomerIdLen() %>"/></td>
	<%	}%>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.customer.id.length.typecode" /></td>
	<td class="col-md-1">
		<select id="customerIdLenTypeCode" name="customerIdLenTypeCode">
			<% for(Map.Entry<String, String> entry : customerIdLenTypeCode.entrySet()) { 
					if(null != appConfig.getCustomerIdLenTypeCode() &&
							appConfig.getCustomerIdLenTypeCode().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.customer.id.generate.type" /></td>
	<td class="col-md-1">
		<select id="customerId" name="customerId">
			<% for(Map.Entry<String, String> entry : customerIdGenType.entrySet()) { 
					if(null != appConfig.getCustomerIdGenType() &&
							appConfig.getCustomerIdGenType().equalsIgnoreCase(entry.getKey())) { 
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

			<td class="col-md-1"><s:text name="global.lbl.effective.from.date" /></td>
					<%
						if (mode.equalsIgnoreCase("CREATE")) {
					%>

					<td class="col-md-1"><input id="ideffFromDate"
						name="effFromDate" type="text" value="" /></td>
					<%
						} else {
					%>

					<td class="col-md-1"><input id="ideffFromDate"
						name="effFromDate" type="text"
						value="<%=appConfig.getEffFromDate()%>" /></td>
					<%
						}
					%>

	
</tr>
	

			<tr class="active">
	
					<td class="col-md-1"><s:text name="global.lbl.effective.till.date" /></td>

					<%
						if (mode.equalsIgnoreCase("CREATE")) {
					%>

					<td class="col-md-1"><input id="idEffToDate"
						name="effToDate" type="text" value="" /></td>
					<%
						} else {
							if (null != appConfig.getEffToDate()) {
					%>

					<td class="col-md-1"><input id="idEffToDate"
						name="effToDate" type="text"
						value="<%=appConfig.getEffToDate()%>" /></td>
					<%
						} else {
					%>
					<td class="col-md-1"><input id="effToDate"
						name="effToDate" type="text" value="" /></td>

					<%
						}
						}
					%>

	
</tr>


<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="" value="<s:text name="global.btn.save" />">			
			<input type="button" name="" value="<s:text name="global.btn.back.to.list" />" onClick="backToList();">
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
