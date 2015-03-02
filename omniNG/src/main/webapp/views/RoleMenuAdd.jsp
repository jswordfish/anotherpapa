<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.RoleMenuActionAccess"%>
<%@page import="com.infrasofttech.omning.utils.SpringUtil"%>
<%@page import="com.infrasofttech.omning.services.RoleMenuActionAccessService"%>
<%@page import="com.infrasofttech.utils.MENUACTIONSTATUS"%>
<%@page import="com.infrasofttech.domain.entities.RoleMst"%>
<%@page import="com.infrasofttech.domain.entities.MenuMst"%>
<%@page import="com.infrasofttech.domain.entities.Address"%>
<%@page import="com.infrasofttech.domain.entities.UserMst"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
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

  </head>

<body>



<%

	RoleMst role = (RoleMst) request.getAttribute("role");
	session.setAttribute("role", role);
	
%>



<div id="top" class="container">
<table class="table table-condensed" width="100%">
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.role.code"/></td>
	<td class="col-md-1"><input value=<%= role.getRoleCode() %> 
					readonly id="roleCode" name="roleCode" type="text"  /></td>
	<td class="col-md-1"><s:text name="global.lbl.role.name"/></td>
	<td class="col-md-1"><input value=<%= role.getRoleName() %> 
					readonly id="roleName" name="roleName" type="text"  /></td>
</tr>


</table>
</div>

Menu Mapping <br>
<div id="menus" class="container">
	
	 <form action="addMenuToRoleAction">
    <table class="table">
        <thead>
            <tr>
					<th><s:text name="global.lbl.menu.name" /></th>
					<th><s:text name="global.lbl.create" /></th>
					<th><s:text name="global.lbl.update" /></th>
					<th><s:text name="global.lbl.delete" /></th>
					<th><s:text name="global.lbl.view" /></th>
					<th><s:text name="global.lbl.search" /></th>
					<th><s:text name="global.lbl.enable" /></th>
					<th><s:text name="global.lbl.disable.role.checkbox" /></th>
					
            </tr>
        </thead>
		
		<%
			List<MenuMst> menus = (List<MenuMst>) request.getAttribute("menus");
			session.setAttribute("numOfMenus", menus.size());
			RoleMenuActionAccessService menuActionAccessService = (RoleMenuActionAccessService) SpringUtil.getSpringUtil().getService("roleMenuActionAccessService");
		
		%>
        <tbody>
       
			<%
			int count = 0;	
			for(MenuMst menu : menus) {
				RoleMenuActionAccess roleMenu = menuActionAccessService.getRoleMenuActionAccess(role.getTenantId(), role.getRoleCode(), menu.getMenuCode());
				if(roleMenu == null){
					roleMenu = new RoleMenuActionAccess();
				}
			%>
			
			
        	<tr class="active">
                <td><input type="hidden" name="menuCode<%= count %>" value ="<%= menu.getMenuCode() %>"  />
					<%= menu.getMenuCode() %></td>
                <td>
                <input type="checkbox" name="menu<%= count %>" value="CreateAction" <% if(roleMenu.getCreateAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> checked <% } %> />
				</td>
                 <td>
               <input type="checkbox" name="menu<%= count %>" value="UpdateAction" <% if(roleMenu.getUpdateAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> checked <% } %> />
				</td>
                 <td>
               <input type="checkbox" name="menu<%= count %>" value="DeleteAction" <% if(roleMenu.getDeleteAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> checked <% } %> />
				</td>
				<td>
                <input type="checkbox" name="menu<%= count %>" value="ViewAction" <% if(roleMenu.getViewAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> checked <% } %> />
				</td>
                 <td>
               <input type="checkbox" name="menu<%= count %>" value="SearchAction" <% if(roleMenu.getSearchAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> checked <% } %>  />
				</td>
				<td>
				 <input type="checkbox" name="menu<%= count %>" value="EnableAction" <% if(roleMenu.getEnableAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> checked <% } %> />
				</td>
				<td>
                <input type="checkbox" name="menu<%= count %>" value="DisableAction" <% if(roleMenu.getDisableAction().getCode().equals(MENUACTIONSTATUS.ACTIVE.getCode())) {%> checked <% } %> />
				</td>
           </tr>
            <%
            	count++;
				}
			%>
			 
        </tbody>
         
    </table>
	<button type="submit" class="btn btn-primary"><s:text name="global.val.save.pref" /></button>
			</form>
</div>


	
</body>
</html>
