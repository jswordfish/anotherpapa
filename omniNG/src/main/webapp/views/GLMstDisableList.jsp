<%@page import="com.infrasofttech.utils.MENUACTIONSTATUS"%>
<%@page import="com.infrasofttech.domain.entities.RoleMenuActionAccess"%>
<%@page import="com.infrasofttech.domain.entities.GLMst"%>
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
	
	function callViewActive(){
		document.forms["omniForm"].action = "GLMstList.action";
		document.forms["omniForm"].submit();
	}	
	</script>


  </head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
<br>
	<div id="result" class="container">
	
	<form name="omniForm" method="POST">
	
		<input type="hidden" name="glCode" value="-1">
		
		&nbsp;
		<button type="button" class="btn btn-primary" onClick="callViewActive();"><s:text name="global.btn.show.enabled.gl" /></button>
	</form>
	
    <table class="table">
        <thead>
            <tr>
						<th><s:text name="global.lbl.gl.code" /></th>
             		  <th><s:text name="global.lbl.gl.name" /></th>
             		  <th><s:text name="global.lbl.gl.type" /></th>
             		  <th><s:text name="global.lbl.currency" /></th>
					<th><s:text name="global.lbl.gl.category" /></th>
					<th><s:text name="global.lbl.financial.year" /></th>
					<th><s:text name="global.lbl.action" /></th>
            </tr>
        </thead>
		
		<%
			List<GLMst> glList = (List<GLMst>) request.getAttribute("glList");
		RoleMenuActionAccess roleMenuActionAccess = (RoleMenuActionAccess) session.getAttribute("roleMenuActionAccess");
			if(null == glList || glList.size()==0){ %>
        	<tr class="active"><td colspan="7">
				No Records to display
			</td></tr>
			<%	}else{
		%>
        <tbody>
			<%
				for(GLMst glMst : glList) {
			%>
        	<tr class="active">
                <td><%= glMst.getGlCode() %></td>
                <td><%= glMst.getGlName() %></td>
                <td><%= glMst.getGlType()%></td>
                <td><%= glMst.getCurrencyCode()%></td>
				<td><%= glMst.getGlCategory() %></td>
				<td><%= glMst.getFyCode()%></td>
				<td>	<%
    if(null != roleMenuActionAccess)
   if(roleMenuActionAccess.getDisableAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%>
   <a href="GLMstEnable.action?glCode=<%= glMst.getGlCode() %>&fyCode=<%=glMst.getFyCode()%>"><s:text name="global.ref.enable" /></a>
   <%} %>  
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



