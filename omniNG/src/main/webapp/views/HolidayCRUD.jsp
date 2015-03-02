<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.HolidayMst"%>
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
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
	
	<script>
		$(function () {
		    $('#datepicker').datepicker({
		        autoclose: true,
		        todayHighlight: true
		    }).datepicker('update', new Date());
		    ;
		});
		
	
	</script>
	<script>
	function goToList(){
		document.forms["omniHolidayForm"].action = "holidayList.action";
		document.forms["omniHolidayForm"].submit();
	}	
	</script>
	 <script type="text/javascript">
  $(document).ready(
		  
		  /* This is the function that will get executed after the DOM is fully loaded */
		  function () {
		    $( "#holidayDate" ).datepicker({
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

  </head>
  

<body>
<form id="omniHolidayForm" method="POST" action="holidaySave">
<%
	String mode = (String)request.getAttribute("mode");
	System.out.println("Product JSP mode:"+mode);
	
	
	
	HolidayMst holiday = (HolidayMst)request.getAttribute("holiday");
%>
<div id="result" class="container">
<input type="hidden" name="mode" value="<%= mode %>">
<table class="table table-condensed">
<tr class="active">
	
	<td class="col-md-1"><s:text name="global.lbl.holiday.date" /></td>
	<td class="col-md-1"><input id="holidayDate" name="holidayDate"  placeholder="yyyy/mm/dd" type="text" 
				value="<%= holiday.getHolidayDate() %>" /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.holiday.code" /></td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="holidayCode" name="holidayCode" type="text"  value="<%= holiday.getHolidayCode() %>"/></td>
	<%	}else{%>
			<td class="col-md-1"><input readonly id="holidayCode" name="holidayCode" type="text"  value="<%= holiday.getHolidayCode() %>"/></td>
	<%	}%>
	
	<td class="col-md-1"><s:text name="global.lbl.holiday.description" /></td>
	<td class="col-md-1"><input id="holidayDesc" name="holidayDesc" type="text" 
				value="<%= holiday.getHolidayDesc() %>" /></td>
</tr>

<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="" value="<s:text name="global.btn.save" />">
			<input type="reset" name="" value="<s:text name="global.btn.clear" />">
			<input type="button" name="" value="<s:text name="global.btn.back.to.list" />" onClick="javascript:goToList();">
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
