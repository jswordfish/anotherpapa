<%@page import="com.infrasofttech.domain.entities.transaction.runtime.ScreenTransaction"%>
<%@page import="com.infrasofttech.utils.MENUACTIONSTATUS"%>
<%@page import="com.infrasofttech.domain.entities.transaction.*"%>

<%@page import="java.util.List"%>
<%@page import="com.infrasofttech.domain.entities.*"%>

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
//List<ScreenTransaction> transactions  = (List<ScreenTransaction>) request.getAttribute("transactions");
ScreenTransaction screenTransaction = (ScreenTransaction) request.getAttribute("screenTransaction");
ScreenMapper screenMapper = (ScreenMapper) request.getAttribute("screenMapper");
String url1 = "transaction.action?id="+screenMapper.getId()+"&transId="+screenTransaction.getTransactionNumber();
String url2 = "transaction.action?id="+screenMapper.getId();
%>
<br>
	<div id="result" class="container">
	
	<div class="btn-group">
    <a class="btn btn-mini btn-success" href=<%= url1%> >Add New Voucher to existing Transaction SetNo</a>&nbsp;&nbsp;
	
    <a class="btn btn-mini btn-success" href=<%= url2%> >Add New Voucher to New Transaction</a>&nbsp;&nbsp;
</div>
		
	
    <table class="table">
        <thead>
            <tr>
			   <th>Serial</th>
			   <th>Branch Name</th>
			   <th>Module Name</th>
			   <th>Product Name</th>
			   <th>Activity Name</th>
			   <th>Transaction/Set Number</th>
			   <th>Voucher/Scroll Number</th>
			   <th>Voucher Book Type </th>
			   
			   
			   
            </tr>
        </thead>
		
		
		
		<%
			
		
			if(null == screenTransaction.getVouchers() || screenTransaction.getVouchers().size()==0){ %>
        	<tr class="active"><td colspan="7">
				No Records to display
			</td></tr>
			<%	}else{
			%>
        <tbody>
		
			
		
			<%
			int count = 0;
				for(VoucherMst voucher : screenTransaction.getVouchers()) {
			%>
        	<tr class="active">
                <td><%= (++count) %></td>
                <td><%= screenTransaction.getBranchName() %></td>
                <td><%= screenTransaction.getModuleName() %></td>
                <td><%= screenTransaction.getProductName()%></td>
				<td><%= screenTransaction.getActivityName() %></td>
				<td><%= screenTransaction.getTransactionNumber()%></td>
				<td><%= voucher.getScrollNo()%> </td>
				<td><%= voucher.getBookType()%></td>
				
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