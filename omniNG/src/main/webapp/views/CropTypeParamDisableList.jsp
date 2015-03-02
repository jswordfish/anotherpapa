<%@page import="com.infrasofttech.utils.MENUACTIONSTATUS"%>
<%@page import="com.infrasofttech.domain.entities.RoleMenuActionAccess"%>
<%@page import="com.infrasofttech.domain.entities.CropTypeParam"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	
	
	
<script src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
    
	
	<style type="text/css">
		.bs-example{
			margin: 20px;
		}
	</style>

	<script>
	
	function showEnabledEnable(){
		document.forms["omniForm"].action = "cropTypeList.action";
		document.forms["omniForm"].submit();
	}	
	</script>


  </head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
<br>
	<div id="result" class="container">
	
	<form name="omniForm" method="POST">
	
		<input type="hidden" name="cropType" value="-1">
		<input type="hidden" name="fromDate" value="-1">
		<input type="hidden" name="mode" value="CREATE">
		<%String menuCode= (String)request.getAttribute("menuCode");
	request.setAttribute("menuCode", menuCode);
	
	RoleMenuActionAccess roleMenuActionAccess = (RoleMenuActionAccess) session.getAttribute("roleMenuActionAccess");
	%>
	
		<button type="button" class="btn btn-primary" onClick="showEnabledEnable();"><s:text name="global.btn.enable.crop.type"/></button>
	</form>
	
    <table class="table">
        <thead>
            <tr>
				<th><s:text name="global.val.crop.type"/></th>
             	<th><s:text name="global.lbl.from.date"/></th> 
             	<th><s:text name="global.lbl.to.date"/></th>
             	<th><s:text name="global.lbl.amount"/></th>             		 
				<th><s:text name="global.lbl.due.date"/></th>				
				<th><s:text name="global.lbl.action"/></th>
            </tr>
        </thead>
		
		<%
		List<CropTypeParam> cropTypeList = (List<CropTypeParam>) request.getAttribute("cropTypeParams");
			if(null == cropTypeList || cropTypeList.size()==0){ %>
        	<tr class="active"><td colspan="6">
				No Crop Type Available.
			</td></tr>
			<%	}else{
		%>
        <tbody>
			<%
				for(CropTypeParam cropType : cropTypeList) {
			%>
        	<tr class="active">
                <td><%= cropType.getCropType()%></td>
                <td><%= cropType.getFromDate()%></td>
                <td><%= cropType.getToDate()%></td>
                <td><%= cropType.getCurrencyCode()%> - <%=cropType.getAmmount()%></td>
				<td><%= cropType.getMonth()%> - <%= cropType.getYear()%></td>
				
				<td><%
				if(null != roleMenuActionAccess)
				if(roleMenuActionAccess.getUpdateAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%>
				<a href="cropTypeEnable.action?cropType=<%= cropType.getCropType()%>&fromDate=<%= cropType.getFromDate() %>&mode=ENABLE"><s:text name="global.lbl.enable"/> </a>
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



