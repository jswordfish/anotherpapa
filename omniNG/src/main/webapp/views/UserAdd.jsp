<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.RoleMst"%>
<%@page import="com.infrasofttech.domain.entities.Address"%>
<%@page import="com.infrasofttech.domain.entities.UserMst"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Forms in Bootstrap - Demo</title>

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
	function checkLoginId() {
		var loginId = $('#loginId').val();

		//alert(loginId);
		$.post("verifyUser", {
			loginId : loginId
		}, function(result) {
			//if the result is 1 
		//	alert(result);
			$('#el3').html(result );
			
		});
		
	}
	
	
	function goToList(){
		document.forms["omniUserAddForm"].action = "userList.action";
		document.forms["omniUserAddForm"].submit();
		
		
	}
	
	</script>
	


  </head>
  

<body>
<div class="container">

<form id="omniUserAddForm" method="POST" action="userAddSave">
<%
	Map<String, String> salutations = new HashMap<String, String>();
	Map<String, String> userTypes = new HashMap<String, String>();
	Map<String, String> branches = new HashMap<String, String>();

	salutations = (Map<String, String>)request.getAttribute("salutations");
	userTypes = (Map<String, String>)request.getAttribute("userTypes");
	branches = (Map<String, String>)request.getAttribute("branches");
	if(salutations  == null){
		salutations = new HashMap<String, String>();
	}
	
	if(userTypes == null){
		userTypes = new HashMap<String, String>();
				
	}
	
	if(branches == null){
		branches = new HashMap<String, String>();
	}
	
	
	List<RoleMst> roles = (List<RoleMst>) request.getAttribute("roles");
	if(roles == null){
		roles = new ArrayList<RoleMst>();
	}
	
	String rCodes[] = new String[roles.size()];
	
	
	List<String> rC = new ArrayList<String>();
	Map<String, String> roleCodeValueMapper = new HashMap<String, String>();
		
		for(RoleMst role: roles){
			rC.add(role.getRoleCode());
			roleCodeValueMapper.put(role.getRoleCode(), role.getRoleName());
		}
		rCodes = rC.toArray(rCodes);
	
	
%>
<div id="result" class="container">
<table class="table table-condensed" width="100%">
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.login.id" /></td>
	<td class="col-md-1"><input id="loginId" name="loginId" type="text"  onkeyup="checkLoginId()" />
	&nbsp; 
	<span class="el3" id="el3"> </span></td>
	<td class="col-md-1"><s:text name="global.lbl.permission"/></td>
	<td class="col-md-1"><input id="permissionNo" name="permissionNo" type="text"  />
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.user.name" /></td>
	<td class="col-md-3" colspan="3">
		<select id="userSalutation" name="userSalutation">
			<% for(Map.Entry<String, String> entry : salutations.entrySet()) { %>
				<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<% } %>
		</select>&nbsp;
		<input id="userFName" name="userFName" type="text"  />&nbsp;
		<input id="userMName" name="userMName" type="text"  />&nbsp;
		<input id="userLName" name="userLName" type="text"  />&nbsp;
	</td>	
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.user.type" /></td>
	<td class="col-md-1">
		<select id="userType" name="userType">
			<% for(Map.Entry<String, String> entry : userTypes.entrySet()) { %>
				<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<% } %>
		</select>
	</td>
	<td class="col-md-1" rowspan="3" ><s:text name="global.lbl.map.branches" /></td>
	<td class="col-md-1" rowspan="3" >
		<select id="userBranchMap" name="userBranchMap" multiple="multiple" size="4">
			<% for(Map.Entry<String, String> entry : branches.entrySet()) { %>
				<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<% } %>
		</select>
	</td>
	
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.email" /></td>
	<td class="col-md-1"><input id="emailId" name="emailId" type="text" size="30" /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.display.name" /></td>
	<td class="col-md-1"><input id="userDisplayName" name="userDisplayName" type="text"  /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.select.role" /></td>
	<td><select id="roleCode" name="roleCode">
			<% for(String roleCode : rCodes) { 
			%>
				<option value=<%=roleCode %> ><%=roleCodeValueMapper.get(roleCode) %></option>
			<% 
				} 
			%>
		</select>&nbsp;</td>
	
</tr>
<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="Save" value="<s:text name="global.btn.save"/>">
			<!-- <input type="reset" name="Clear" value="Clear"> -->
			<input type="button" name="List" value="<s:text name="global.btn.back.to.list"/>" onClick="javascript:goToList();">
	</td>
</tr>
</table>
</div>
</form>
</div>
	
</body>
</html>