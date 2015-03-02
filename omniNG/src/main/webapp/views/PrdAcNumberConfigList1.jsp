<%@page import="com.infrasofttech.domain.entities.PrdAcNumberConfig"%>
<%@page import="com.infrasofttech.domain.entities.BranchMst"%>
<%@page import="com.infrasofttech.domain.entities.UserMst"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

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

  </head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
<br>
	<div id="result" class="container">
	
	<form action="PrdAcNumberConfigCURD.action">
		<input type="hidden" name="productCode" value="-1">
		<input type="hidden" name="moduleCode" value="-1">
		<input type="hidden" name="mode" value="CREATE">
		<button type="submit" class="btn btn-primary">Add A/C NumberConfig</button>
	</form>
	
    <table class="table">
        <thead>
            <tr>
                <th>Product Code</th>
                <th>Module Code</th>
                <th>A/C Number Separator</th>
                <th>Total A/c Length</th>
				<th>Effective From Date</th>
				<th>Effective Till Date</th>
				<th>Action</th>
            </tr>
        </thead>
		
		<%
			List<PrdAcNumberConfig> prdAcNumberConfigs = (List<PrdAcNumberConfig>) request.getAttribute("prdAcNumberConfigs");
		%>
        <tbody>
			<%
				for(PrdAcNumberConfig prdAcNumberConfig : prdAcNumberConfigs) {
			%>
        	<tr class="active">
        	    <td><%= prdAcNumberConfig.getProductCode() %></td>
                <td><%= prdAcNumberConfig.getModuleCode()%></td>
                <td><%= prdAcNumberConfig.getSepr() %></td>
				<td><%= prdAcNumberConfig.getTotalAccountLen() %></td>
				<td><%= prdAcNumberConfig.getEffFromDate() %></td>
				<td><%= prdAcNumberConfig.getEffTillDate() %></td>
				<td><a href="PrdAcNumberConfigCURD.action?productCode=<%= prdAcNumberConfig.getProductCode() %>&moduleCode=<%= prdAcNumberConfig.getModuleCode() %>&mode=UPDATE">Edit</a>   
					<a href="PrdAcNumberConfigCURD.action?productCode=<%= prdAcNumberConfig.getProductCode() %>&moduleCode=<%= prdAcNumberConfig.getModuleCode() %>&mode=DISABLE">Disable</a>  
				</td>
            </tr>
            <%
				}
			%>
        </tbody>
    </table>
</div>
</body>
</html>