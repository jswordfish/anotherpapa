<%@page import="com.infrasofttech.utils.MENUACTIONSTATUS"%>
<%@page import="com.infrasofttech.domain.entities.RoleMenuActionAccess"%>
<%@page import="com.infrasofttech.domain.entities.AppConfig"%>
<%@page import="com.infrasofttech.domain.entities.BranchMst"%>
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
	function addAppConfig(){
		document.forms["appConfigForm"].action = "appConfigCRUD.action";
		document.forms["appConfigForm"].submit();
	}
	
	function disabledAppConfig(){
		document.forms["appConfigForm"].action = "appConfigViewDisable.action";
		document.forms["appConfigForm"].submit();
	}	
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
	
	<form name="appConfigForm" >
		<input type="hidden" name="branchCode" value="-1">		
		<input type="hidden" name="mode" value="CREATE">
		
		<% RoleMenuActionAccess roleMenuActionAccess = (RoleMenuActionAccess) session.getAttribute("roleMenuActionAccess"); %>
		<% if(null != roleMenuActionAccess)
		if(roleMenuActionAccess.getCreateAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%>
		<button type="button" class="btn btn-primary" onClick="addAppConfig();"><s:text name="global.btn.add.application.configuration" /></button>&nbsp;
		<button type="button" class="btn btn-primary" onClick="disabledAppConfig();"><s:text name="global.btn.show.disabled.application.configuration" /></button>
	</form>
	
    <table class="table">
        <thead>
            <tr>
               <th><s:text name="global.lbl.branch.code" /></th>
                <th><s:text name="global.lbl.effective.from.date" /></th>
				<th><s:text name="global.lbl.effective.till.date" /></th>				
				<th><s:text name="global.lbl.action" /></th>
            </tr>
        </thead>
		
		<%
			List<AppConfig> appConfigs = (List<AppConfig>) request.getAttribute("appConfigs");
		if(null == appConfigs || appConfigs.size()==0){ %>
        	<tr class="active"><td colspan="7">
				No Configuration, Add new Application Configuration.
			</td></tr>
			<%	}else{
		%>
     <tbody>
		<%
			for(AppConfig appConfig : appConfigs) {
		%>
      	<tr class="active">
      		<td><%= appConfig.getBranchCode() %></td>
      		<td><%= appConfig.getEffFromDate() %></td>
              <td><%= appConfig.getEffToDate() %></td>                                   
		
		<td><%if(null != roleMenuActionAccess)
			if(roleMenuActionAccess.getUpdateAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%>
			<a href="appConfigCRUD.action?branchCode=<%= appConfig.getBranchCode() %>&mode=UPDATE">Edit</a>
			<% } %> <%  if(null != roleMenuActionAccess)
 					if(roleMenuActionAccess.getDisableAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%>   
			<a href="appConfigDisable.action?branchCode=<%= appConfig.getBranchCode() %>&mode=DISABLE">Disable</a>
			<% } %>  
		</td>
		<td style="visibility:hidden; "><%= appConfig.getSetNo() %></td>
          </tr>
          <%}
		}//end of for loop
	}//End of else
	%>
       </tbody>
    </table>
</div>
</body>
</html>