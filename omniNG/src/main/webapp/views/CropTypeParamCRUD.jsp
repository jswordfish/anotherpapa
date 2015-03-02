<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.CropTypeParam"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.*"%>
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
    <link rel="stylesheet" href="css/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	
  
    
<script type="text/javascript">
 	
  $(document).ready(
		  
		  /* This is the function that will get executed after the DOM is fully loaded */
		  function () {
		    $( "#fromDate" ).datepicker({
		      changeMonth: true,
		      changeYear: true,
		      yearRange: '1960:2100',
		      dateFormat:'yy-mm-dd'
		    });
		    $( "#toDate" ).datepicker({
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
		function validateInputDate(){
			var fromDate = document.getElementById("fromDate").value;
			var toDate = document.getElementById("toDate").value;
			
			if(toDate==fromDate && toDate>fromDate){
				return true;
			}else if(toDate<fromDate){
				alert("Todate Can not be less than from date!!!");
				return false;
			}
		}
	</script>
	
	<script>
	
	function goToGLList(){
		document.forms["omniGLForm"].action = "cropTypeList.action";	
		document.forms["omniGLForm"].submit();
	}	
	</script>
	

  </head>
 
<body>
<form id="omniGLForm" method="POST" action="cropTypeSave">
<%
	String mode = (String)request.getAttribute("mode");
	System.out.println("CropType JSP mode:"+mode);
	
	Map<String, String> currencies = new HashMap<String, String>();
	Map<String, String> cropType = new HashMap<String, String>();
	Map<String, String> amount = new HashMap<String, String>();
	Map<Integer, Integer> year = new HashMap<Integer, Integer>();
	Map<String, String> month = new HashMap<String, String>();

	currencies = (Map<String, String>)request.getAttribute("currencies");
	if(currencies == null){ currencies = new HashMap<String, String>(); }
	
	cropType = (Map<String, String>)request.getAttribute("cropType");
	if(cropType == null){ cropType = new HashMap<String, String>(); }
	
	amount = (Map<String, String>)request.getAttribute("amount");
	if(amount == null){ amount = new HashMap<String, String>(); }
	
	year = (Map<Integer, Integer>)request.getAttribute("year");
	if(year == null){ year = new HashMap<Integer, Integer>(); }

	month = (Map<String, String>)request.getAttribute("month");
	if(month == null){ month = new HashMap<String, String>(); }
	
	CropTypeParam cropTypeParam = (CropTypeParam)request.getAttribute("cropTypeParam");%>
	
	<div id="result" class="container">
	<input type="hidden" name="mode" value="<%= mode %>">
	
	
	
	<table class="table table-condensed">
	
	<tr class="active">
	
	<td class="col-md-1"><s:text name="global.val.crop.type"/> :</td>
	<td> <select id="cropType" name="cropType">
			<% for(Map.Entry<String, String> entry : cropType.entrySet()) { 
					if(null != cropTypeParam.getCropType() &&
							cropTypeParam.getCropType().equalsIgnoreCase(entry.getKey())) { 
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
		<td class="col-md-1"><s:text name="global.lbl.from.date"/> :</td>
		<%
			if (mode.equalsIgnoreCase("CREATE")) {
		%>

		<td class="col-md-1"><input id="fromDate"
			name="fromDate" type="text" value="" /></td>
		<%
			} else {
		%>

		<td class="col-md-1"><input id="fromDate"
			name="fromDate" type="text"
			value="<%=cropTypeParam.getFromDate()%>" /></td>
		<%
			}
		%>



		<td class="col-md-1"><s:text name="global.lbl.to.date"/> :</td>

		<%
			if (mode.equalsIgnoreCase("CREATE")) {
		%>

		<td class="col-md-1"><input id="toDate"
			name="toDate" type="text" value="" /></td>
		<%
			} else {
				if (null != cropTypeParam.getToDate()) {
		%>

		<td class="col-md-1"><input id="toDate"
			name="toDate" type="text"
			value="<%=cropTypeParam.getToDate()%>" /></td>
		<%
			} else {
		%>
		<td class="col-md-1"><input id="toDate"
			name="toDate" type="text" value="" /></td>

		<%
			}
			}
		%>
				</tr>
	
	
	
	<tr class="active">
	<td class="col-md-1"><s:text name="global.val.currency"/>:</td>
	<td class="col-md-1">
		 <select id="currencyCode" name="currencyCode">
			<% for(Map.Entry<String, String> entry : currencies.entrySet()) { 
					if(null != cropTypeParam.getCurrencyCode() &&
							cropTypeParam.getCurrencyCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select> 
	</td>
	<td class="col-md-1"><s:text name="global.lbl.amount"/>:</td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input  id="amount"  name="amount" type="text"  value=""/><span class="el3" id="el3"> </span></td>
	<%	}else{%>
			<td class="col-md-1"><input  id="amount" name="amount" type="text"  value="<%= cropTypeParam.getAmmount()%>"/></td>
	<%	}%>
	
	
</tr>

<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.month"/> :</td>
	<td class="col-md-1">
		<select id="month" name="month">
			<% for(Map.Entry<String, String> entry : month.entrySet()) { 
					if(null != cropTypeParam.getMonth() &&
							cropTypeParam.getMonth().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.year"/>:</td>
	<td class="col-md-1">
		<select id="year" name="year" >
		
			<% for(Map.Entry<Integer, Integer> entry : year.entrySet()) { 
					if(null != cropTypeParam.getYear()) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select><span class="el3" id="el3"></span>
	</td></tr>

<tr class="active"><!-- -->
	<td colspan="4" width="100%" height="25" align="center">
	<input type="submit" name="Save" value="<s:text name="global.lbl.save.update"/> " onClick="return validateInputDate();">
		
	<input type="button" name="List" value='<s:text name="global.btn.back.to.list"></s:text>' onClick="javascript:goToGLList();">

	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
