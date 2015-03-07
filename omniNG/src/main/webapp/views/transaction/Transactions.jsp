<%@page import="com.infrasofttech.utils.MENUACTIONSTATUS"%>
<%@page import="com.infrasofttech.domain.entities.transaction.*"%>

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
    
    
	
<script src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
    
	
	<style type="text/css">
		.bs-example{
			margin: 20px;
		}
	</style>

	<script>
	function callAdd(){
		document.forms["topForm"].action = "userAdd.action";
		document.forms["topForm"].submit();
	}
	function callViewDisabled(){
		document.forms["topForm"].action = "showDisable.action";
		document.forms["topForm"].submit();
	}	
	</script>


  </head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0">

<%
List<ScreenTransaction> transactions  = (List<ScreenTransaction>) request.getAttribute("transactions");

%>
<br>
	<div id="result" class="container">
	
	<form name="topForm" action = "txn.action">
	<div class="btn-group">
    <a class="btn btn-mini btn-success" href="txn.action">Add Transaction Screen Configuration</a>&nbsp;&nbsp;
	
    <a class="btn btn-mini btn-success" href="screenElementList.action">Go To Screen Element Configuration</a>&nbsp;&nbsp;
   
    
</div>
		</form>
	
    <table class="table">
        <thead>
            <tr>
			   <th>Serial</th>
			   <th>Branch Name</th>
			   <th>Module Name</th>
			   <th>Product Name</th>
			   <th>Activity Name</th>
			   <th>Transaction Number</th>
			   <th>View (Read Only)</th>
			   
			   
			   
            </tr>
        </thead>
		
		
		
		<%
			
		
			if(null == transactions || transactions.size()==0){ %>
        	<tr class="active"><td colspan="7">
				No Records to display
			</td></tr>
			<%	}else{
			%>
        <tbody>
		
			
		
			<%
			int count = 0;
				for(ScreenTransaction transaction : transactions) {
			%>
        	<tr class="active">
                <td><%= (++count) %></td>
                <td><%= transaction.getBranchName() %></td>
                <td><%= transaction.getModuleName() %></td>
                <td><%= transaction.getProductName()%></td>
				<td><%= transaction.getActivityName() %></td>
				<td><%= transaction.getTransactionNumber()%></td>
				<td><a href="#">View (Not yet)</a></td>
				
            </tr>
            <%
				}  // END OF FOR LOOP - users
				
				} // END OF ELSE
			%>
        </tbody>
    </table>
</div>
</body>
</html>