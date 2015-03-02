<%@page import="com.infrasofttech.utils.MENUACTIONSTATUS"%>
<%@page import="com.infrasofttech.domain.entities.RoleMenuActionAccess"%>
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
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
<br>
	<div id="result" class="container">
	
	<form name="topForm">
	<%String menuCode= (String)request.getAttribute("menuCode");
	request.setAttribute("menuCode", menuCode);
	List<UserMst> users = (List<UserMst>) request.getAttribute("users");
	RoleMenuActionAccess roleMenuActionAccess = (RoleMenuActionAccess) session.getAttribute("roleMenuActionAccess");
	%>
	<%
if(null != roleMenuActionAccess)
	if(roleMenuActionAccess.getCreateAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> 
		<button type="button" class="btn btn-primary" onClick="callAdd();"><s:text name="global.lbl.user.add"/></button>
		<% } %>
		&nbsp;
		<button type="button" class="btn btn-primary" onClick="callViewDisabled();"><s:text name="global.lbl.disabled.users"/></button>
	</form>
	
    <table class="table">
        <thead>
            <tr>
			   <th><s:text name="global.val.login.id" /></th>
			   <th><s:text name="global.val.user.name" /></th>
			   <th><s:text name="global.lbl.user.type" /></th>
			   <th><s:text name="global.lbl.base.branch" /></th>
			   <th><s:text name="global.lbl.permission.no" /></th>
			   <th><s:text name="global.lbl.contact.details" /></th>
			   <th><s:text name="global.lbl.action" /></th>
            </tr>
        </thead>
		
		<%
			
		
			if(null == users || users.size()==0){ %>
        	<tr class="active"><td colspan="7">
				No Records to display
			</td></tr>
			<%	}else{
		%>
        <tbody>
			<%
				for(UserMst user : users) {
			%>
        	<tr class="active">
                <td><%= user.getLoginId() %></td>
                <td><%= user.getUserFName() %></td>
                <td><%= user.getUserTypeCode() %></td>
                <td><%= user.getUserBaseBranchCode()%></td>
				<td><%= user.getPermissionNo() %></td>
				<td><%= user.getEmailId() %></td>
				<td><%
				if(null != roleMenuActionAccess)
				if(roleMenuActionAccess.getUpdateAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%>
				<a href="userEdit.action?loginId=<%= user.getLoginId() %>"><s:text name="global.lbl.edit" /></a>   
					<% } %>
					<%
    if(null != roleMenuActionAccess)
   if(roleMenuActionAccess.getDisableAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> 				
					
					<a href="userDisable.action?loginId=<%= user.getLoginId() %>"><s:text name="global.lbl.disable" /></a>  
					
					<% } %>
				</td>
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