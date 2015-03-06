<%@page import="com.infrasofttech.domain.entities.transaction.Screen"%>
<%@page import="com.infrasofttech.domain.entities.transaction.ScreenRow"%>
<%@page import="com.infrasofttech.domain.entities.transaction.ScreenElement"%>
<%@page import="com.infrasofttech.domain.entities.transaction.ScreenMapper"%>

<%@page import="com.infrasofttech.domain.entities.transaction.*"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.infrasofttech.domain.entities.ActivityMst"%>
<%@page import="com.infrasofttech.domain.entities.ProductMst"%>
<%@page import="com.infrasofttech.domain.entities.BranchMst"%>
<%@page import="com.infrasofttech.domain.entities.ModuleMst"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

<body>
	<form id="idForm" method="POST" action="txnSaveOrUpdateScreenMapper.action">

	<div class="col-xs-8">
<h2 class="sub-header">Transactions</h2>
  <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="col-md-2">#</th>
                  <th class="col-md-2">Header</th>
                  <th class="col-md-2">Header</th>
				  <th class="col-md-2">Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="col-md-2">1,001</td>
                  <td class="col-md-2">1,001</td>
                  <td class="col-md-2">1,001</td>
				  <td class="col-md-2">1,001</td>
                </tr>
                
              </tbody>
            </table>
          </div>
</div>
  <div class="col-xs-2">
          <h2 class="sub-header">Information</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="col-md-1">#</th>
                  <th class="col-md-1">Header</th>
                  
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="col-md-1">1,001</td>
                  <td class="col-md-1">1,001</td>
                  
                </tr>
                
              </tbody>
            </table></div>
	</div>
			
			<table class="table">
				<thead>
					<tr>
					   <th>Bal1</th>
					   <th>Bal2</th>
					   <th>Bal3</th>
					   <th>Bal4</th>
					</tr>
				</thead>
				<tbody>
                <tr>
                  <td class="col-md-1">1,001</td>
                  <td class="col-md-2">1,001</td>
                  <td class="col-md-3">1,001</td>
				  <td class="col-md-3">1,001</td>
                </tr>
                
              </tbody>
            </table>
	
	</form>
	
	

</body>
</html>