<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.GLMst"%>
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
	
	
	
	function goToGLList(){
		document.forms["omniGLForm"].action = "GLMstList.action";	
		document.forms["omniGLForm"].submit();
	}
	
	</script>
	

  </head>
 
<body>
<form id="omniGLForm" method="POST" action="GLMstSave">
<%
	String mode = (String)request.getAttribute("mode");
	System.out.println("GL JSP mode:"+mode);
	
	Map<String, String> currencies = new HashMap<String, String>();
	Map<String, String> glType = new HashMap<String, String>();
	Map<String, String> intExt = new HashMap<String, String>();
	Map<String, String> financialYear = new HashMap<String, String>();

	currencies = (Map<String, String>)request.getAttribute("currencies");
	if(currencies == null){ currencies = new HashMap<String, String>(); }
	
	glType = (Map<String, String>)request.getAttribute("glType");
	if(glType == null){ glType = new HashMap<String, String>(); }
	
	intExt = (Map<String, String>)request.getAttribute("intExt");
	if(intExt == null){ intExt = new HashMap<String, String>(); }
	
	financialYear = (Map<String, String>)request.getAttribute("financialYear");
	if(financialYear == null){ financialYear = new HashMap<String, String>(); }

	
	
	GLMst glMst = (GLMst)request.getAttribute("glMst");
%>
<div id="result" class="container">
<input type="hidden" name="mode" value="<%= mode %>">
<table class="table table-condensed">
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.gl.code" /></td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input id="glCode" name="glCode" type="text"  value=""/><span class="el3" id="el3"> </span></td>
	<%	}else{%>
			<td class="col-md-1"><input readonly id="glCode" name="glCode" type="text"  value="<%= glMst.getGlCode() %>"/></td>
	<%	}%>
	<td class="col-md-1"><s:text name="global.lbl.gl.name" /></td>
	<td class="col-md-1"><input id="glName" name="glName" type="text" 
				value="<%=glMst.getGlName() %>" /></td>
</tr>
<tr class="active">
	<td class="col-md-1">Currency:</td>
	<td class="col-md-1">
		 <select id="currencyCode" name="currencyCode">
			<% for(Map.Entry<String, String> entry : currencies.entrySet()) { 
					if(null != glMst.getCurrencyCode() &&
							glMst.getCurrencyCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select> 
	</td>
	<td class="col-md-1"><s:text name="global.lbl.gl.category" /></td>
	<td class="col-md-1">
		<select id="glCategory" name="glCategory">
			<% for(Map.Entry<String, String> entry : intExt.entrySet()) { 
					if(null != glMst.getGlCategory()&&
							glMst.getGlCategory().equalsIgnoreCase(entry.getKey())) { 
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
	<td class="col-md-1"><s:text name="global.lbl.gl.type" /></td>
	<td class="col-md-1">
		<select id="glType" name="glType">
			<% for(Map.Entry<String, String> entry : glType.entrySet()) { 
					if(null != glMst.getGlType() &&
							glMst.getGlType().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.financial.year" /></td>
	<td class="col-md-1">
		<select id="fyCode" name="fyCode" >
		
			<% for(Map.Entry<String, String> entry : financialYear.entrySet()) { 
					if(null != glMst.getFyCode() &&
							glMst.getFyCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select><span class="el3" id="el3"></span>
	</td></tr>

<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="" value="<s:text name="global.btn.save" />">
			<!-- <input type="reset" name="Clear" value="Clear"> -->
	<input type="button" name="" value="<s:text name="global.btn.back.to.list" />" onClick="javascript:goToGLList();">

	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
