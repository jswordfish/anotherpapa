<%@page import="com.infrasofttech.domain.entities.transaction.Screen"%>
<%@page import="com.infrasofttech.domain.entities.transaction.ScreenRow"%>
<%@page import="com.infrasofttech.domain.entities.transaction.ScreenElement"%>
<%@page import="com.infrasofttech.domain.entities.transaction.*"%>

<%@page import="com.infrasofttech.domain.entities.transaction.*"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.infrasofttech.domain.entities.ActivityMst"%>
<%@page import="com.infrasofttech.domain.entities.ProductMst"%>
<%@page import="com.infrasofttech.domain.entities.BranchMst"%>
<%@page import="com.infrasofttech.domain.entities.ModuleMst"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.infrasofttech.omning.action.transaction.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <jsp:useBean id="nationalityBean" class="com.infrasofttech.bean.NationalityBean" /> --%> <!-- refer example for fetching drop downs from bean -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
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
    
    
	
<script src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
    
	
	<style type="text/css">
		.bs-example{
			margin: 20px;
		}
	</style>

<!-- All internal validations -->
<script language="javascript">
	
</script>

</head>
<%
ScreenMapper screenMapper = (ScreenMapper)session.getAttribute("screenMapper");
Screen txScreen = screenMapper.getTransactionScreen();
Screen infoScreen = screenMapper.getInfoScreen();
Screen balScreen = screenMapper.getBalancesScreen();

String tenantId = (String)request.getSession().getAttribute("tenantCode");
String	languageCode = (String)request.getSession().getAttribute("languageCode");

%>
<body>
	<form id="idForm" method="POST" action="saveTransaction.action">
	<div class="row">
	<div class="col-xs-8">
		<div class="page-header">
		   <h3>Transaction</h3>
		</div>

  <div class="table-responsive">
            <table class="table table-striped">
              
              <tbody>
			 <% for(ScreenRow row: txScreen.getRows()){
			 %>
				<tr>
				<%
					int count = 0;
					for(ScreenElement ele: row.getScreenElements()){
				%>	
			
			  
                
                  <td class="col-md-2"><%= ele.getName() %></td>
                  <td class="col-md-2">
				  <% if(ele.getScreenUIType().getVal().equals(ScreenUIType.TEXT.getVal())){  %>
				  <input type="text" size="5" class="smallTxtLeftAlign" value="" id="Txn<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>"  name= "Txn<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>">
				  <% } else if(ele.getScreenUIType().getVal().equals(ScreenUIType.TEXTAREA.getVal())){ %>
				  <textarea class="form-control" rows="3" id="Txn<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>"  name= "Txn<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>"></textarea>
				  <% } else { 
				  String code = ele.getLookupCode();
				  List<String> values = new ArrayList<String>();
					if(code != null && code.trim().length() > 0){
						values = TransctionUtil.getLookupValues(tenantId, languageCode, code);
					}
				  %>
				  
				  <select class="form-control" id="Txn<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>"  name= "Txn<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>">
				  <% for(String value : values){ %>
					<option value="<%= value %>" > <%= value %> </option>
				  <% } %>	
				  </select>
				  <%count ++;
				  } %>
				  </td>
                <% } %>  
                </tr>
              <% } %>
			  <tr>
			  <td class="col-md-2"><button type="submit" class="btn btn-default">Create Record</button></td>
			  </tr>
              </tbody>
            </table>
          </div>
</div>
</div>
<div class="row">
  <div class="col-xs-4">
		<div class="page-header">
		   <h3>Information</h3>
		</div>
          <div class="table-responsive">
            <table class="table table-striped">
             <tbody>
			 <% for(ScreenRow row: infoScreen.getRows()){
			 %>
				<tr>
				<%
					int count = 0;
					for(ScreenElement ele: row.getScreenElements()){
				%>	
			
			  
                
                  <td class="col-md-2"><%= ele.getName() %></td>
                  <td class="col-md-2">
				  <% if(ele.getScreenUIType().getVal().equals(ScreenUIType.TEXT.getVal())){  %>
				  <input type="text" size="5" class="smallTxtLeftAlign" value="">
				  <% } else if(ele.getScreenUIType().getVal().equals(ScreenUIType.TEXTAREA.getVal())){ %>
				  <textarea class="form-control" rows="3" id="comment"></textarea>
				  <% } else { 
				  String code = ele.getLookupCode();
				  List<String> values = new ArrayList<String>();
					if(code != null && code.trim().length() > 0){
						values = TransctionUtil.getLookupValues(tenantId, languageCode, code);
					}
				  %>
				  
				  <select class="form-control" id="Info<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>"  name= "Txn<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>">
				  <% for(String value : values){ %>
					<option value="<%= value %>" > <%= value %> </option>
				  <% } %>	
				  </select>
				  <%count ++;
				  } %>
				  </td>
                <% } %>  
                </tr>
              <% } %>
              </tbody>
            </table></div>
	</div>

  <div class="col-xs-4">
         <div class="page-header">
		   <h3>Balance</h3>
		</div>

          <div class="table-responsive">
	<table class="table">
				
				<tbody>
			 <% for(ScreenRow row: balScreen.getRows()){
			 %>
				<tr>
				<%
					int count = 0;
					for(ScreenElement ele: row.getScreenElements()){
				%>	
			
			  
                
                  <td class="col-md-2"><%= ele.getName() %></td>
                  <td class="col-md-2">
				  <% if(ele.getScreenUIType().getVal().equals(ScreenUIType.TEXT.getVal())){  %>
				  <input type="text" size="5" class="smallTxtLeftAlign" value="">
				  <% } else if(ele.getScreenUIType().getVal().equals(ScreenUIType.TEXTAREA.getVal())){ %>
				  <textarea class="form-control" rows="3" id="comment"></textarea>
				  <% } else { 
				  String code = ele.getLookupCode();
				  List<String> values = new ArrayList<String>();
					if(code != null && code.trim().length() > 0){
						values = TransctionUtil.getLookupValues(tenantId, languageCode, code);
					}
				  %>
				  
				  <select class="form-control" id="Bal<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>"  name= "Txn<%= ele.getName() %>Row<%= row.getId() %>Col<%= count %>">
				  <% for(String value : values){ %>
					<option value="<%= value %>" > <%= value %> </option>
				  <% } %>	
				  </select>
				  <%count ++;
				  } %>
				  </td>
                <% } %>  
                </tr>
              <% } %>
              </tbody>
            </table></div>
	</div>
			
	
	</form>
	
	

</body>
</html>