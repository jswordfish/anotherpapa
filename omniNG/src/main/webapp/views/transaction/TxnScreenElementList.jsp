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
List<ScreenElement> elements = (List<ScreenElement>) request.getAttribute("screenElements");

%>
<br>
	<div id="result" class="container">
	
	<form name="topForm" action = "screenElementAddUpdate.action">
	<div class="btn-group">
    <a class="btn btn-mini btn-success" href="screenElementAddUpdate.action">Add Screen Element Configuration</a>
   
</div>
		</form>
	
    <table class="table">
        <thead>
            <tr>
			   <th>Serial</th>
			   <th>Name</th>
			   <th>Display Name</th>
			   <th>Data Type</th>
			   <th>UI Type</th>
			   <th>Update</th>
			   <th>Delete</th>
			   
			   
            </tr>
        </thead>
		
		
		
		<%
			
		
			if(null == elements || elements.size()==0){ %>
        	<tr class="active"><td colspan="7">
				No Records to display
			</td></tr>
			<%	}else{
			%>
        <tbody>
		
			
		
			<%
			int count = 0;
				for(ScreenElement element : elements) {
			%>
        	<tr class="active">
                <td><%= (++count) %></td>
                <td><%= element.getName() %></td>
                <td><%= element.getDisplayName() %></td>
                <td><%= element.getScreenDataType().getVal()%></td>
				<td><%= element.getScreenUIType().getVal() %></td>
				<td><a href="txnEditScreenMapper.action?id=<%= element.getId()%>&type=info">Update</a></td>
				<td><a href="txnDeleteScreenMapper.action?id=<%= element.getId()%>&type=info">Delete</a></td>
				
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