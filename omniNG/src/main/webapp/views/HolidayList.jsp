<%@page import="com.infrasofttech.domain.entities.HolidayMst"%>
<%@page import="com.infrasofttech.utils.MENUACTIONSTATUS"%>
<%@page import="com.infrasofttech.domain.entities.RoleMenuActionAccess"%>
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
	function callAdd(){
		document.forms["holidayListForm"].action = "holidayCRUD.action";
		document.forms["holidayListForm"].submit();
	}
	function callViewDisabled(){
		document.forms["holidayListForm"].action = "showHolidayDisable.action";
		document.forms["holidayListForm"].submit();
	}	
	</script>
	
	
	

  </head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
<br>
	<div id="result" class="container">
	
	<form  name="holidayListForm" method="post">
	<%RoleMenuActionAccess roleMenuActionAccess = (RoleMenuActionAccess) session.getAttribute("roleMenuActionAccess"); %>
		<input type="hidden" name="holidayCode" value="-1">
		<input type="hidden" name="mode" value="CREATE">
			<%
if(null != roleMenuActionAccess)
	if(roleMenuActionAccess.getCreateAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> 
		<button type="button" class="btn btn-primary"  onClick="callAdd();"><s:text name="global.btn.add.holiday" /></button>
		<% } %>
		&nbsp;
		<button type="button" class="btn btn-primary" onClick="callViewDisabled();"><s:text name="global.btn.show.disabled.holidays" /></button>
	</form>
	
    <table class="table">
        <thead>
            <tr>
				<th><s:text name="global.lbl.holiday.code" /></th>            
                <th><s:text name="global.lbl.holiday.date" /></th>
				<th><s:text name="global.lbl.holiday.description" /></th>
				<th><s:text name="global.lbl.action" /></th>
            </tr>
        </thead>
		
		<%
			List<HolidayMst> holidays = (List<HolidayMst>) request.getAttribute("holidays");
		
		%>
        <tbody>
			<%
				for(HolidayMst holiday : holidays) {
			%>
        	<tr class="active">
                <td><%= holiday.getHolidayCode() %></td>
                <td><%= holiday.getHolidayDate() %></td>
				<td><%= holiday.getHolidayDesc() %></td>
				<td>
				<%
				if(null != roleMenuActionAccess)
				if(roleMenuActionAccess.getUpdateAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> 	
				<a href="holidayCRUD.action?holidayCode=<%= holiday.getHolidayCode() %>&holidayDate=<%=holiday.getHolidayDate() %>&mode=UPDATE"><s:text name="global.ref.edit" /></a> 
				<% } %>  
				
				<%
    			if(null != roleMenuActionAccess)
   				if(roleMenuActionAccess.getDisableAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> 				
					<a href="holidayDisable.action?holidayCode=<%= holiday.getHolidayCode() %>&holidayDate=<%=holiday.getHolidayDate() %>&mode=DISABLE"><s:text name="global.ref.disable" /></a>  
				<%} %>
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