<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.RoleMst"%>
<%@page import="com.infrasofttech.domain.entities.UserBranchMap"%>
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
		

		function goToList(){
			document.forms["omniUserEditForm"].action = "userList.action";
			document.forms["omniUserEditForm"].submit();
			
			
		}
	</script>
	
<script src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>
    
	
	<style type="text/css">
		.bs-example{
			margin: 20px;
		}
	</style>

  </head>
  
<%--   <% --%>
<!-- // 	UserMst user = (UserMst) request.getAttribute("user"); -->
<!-- //   	Address a1 = new Address(); -->
<!-- //   	a1.setAddress1("111"); -->
<!-- //   	a1.setCityId(2L); -->
<!-- //   	user.getAddresses().add(a1); -->
<!-- //   	request.setAttribute("user", user); -->
<%--   %> --%>
<body>
<div class="container">

<form id="omniUserEditForm" method="POST" action="userEditUpdate">
<%
	Map<String, String> salutations = new HashMap<String, String>();
	Map<String, String> userTypes = new HashMap<String, String>();
	Map<String, String> branches = new HashMap<String, String>();

	salutations = (Map<String, String>)request.getAttribute("salutations");
	userTypes = (Map<String, String>)request.getAttribute("userTypes");
	branches = (Map<String, String>)request.getAttribute("branches");
	
	Set<String> branchCodes =branches.keySet();
	String bCodes[] = new String[branchCodes.size()];
	bCodes = branchCodes.toArray(bCodes);
	
	if(salutations  == null){
		salutations = new HashMap<String, String>();
	}
	
	if(userTypes == null){
		userTypes = new HashMap<String, String>();
				
	}
	
	if(branches == null){
		branches = new HashMap<String, String>();
	}
	
	Map<String,Boolean> userBranchPrefs = new HashMap<String,Boolean>();

	UserMst user = (UserMst) request.getAttribute("user");
	Collection<UserBranchMap> userBranches = user.getUserBranchMaps();
	List<String> uBs = new ArrayList<String>();
	Iterator<UserBranchMap> itr = userBranches.iterator();
		while(itr.hasNext()){
			UserBranchMap branchMap = itr.next();
			uBs.add(branchMap.getBranchCode());
			userBranchPrefs.put(branchMap.getBranchCode(), true);
		}
	String uBs1[] = new String[uBs.size()];
	uBs1 = uBs.toArray(uBs1);
	
	
	List<RoleMst> roles = (List<RoleMst>) request.getAttribute("roles");
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
	<td class="col-md-1"><input value="<%=user.getLoginId() %>" id="loginId" name="loginId" type="text" readonly /></td>
	<td class="col-md-1"><s:text name="global.lbl.permission"/></td>
	<td class="col-md-1"><input value="<%=user.getPermissionNo() %>" id="permissionNo" name="permissionNo" type="text"  /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.user.name" /></td>
	<td class="col-md-3" colspan="3">
		<select id="userSalutation" name="userSalutation">
			<% for(Map.Entry<String, String> entry : salutations.entrySet()) { 
					if(user.getUserSalutation().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value=<%=entry.getKey() %> SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>&nbsp;
		<input value="<%=user.getUserFName() %>" id="userFName" name="userFName" type="text"  />&nbsp;
		<input value="<%=user.getUserMName() %>" id="userMName" name="userMName" type="text"  />&nbsp;
		<input value="<%=user.getUserLName() %>" id="userLName" name="userLName" type="text"  />&nbsp;
	</td>	
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.user.type" /></td>
	<td class="col-md-1">
		<select id="userType" name="userType">
			<% for(Map.Entry<String, String> entry : userTypes.entrySet()) { 
					if(user.getUserTypeCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value=<%=entry.getKey()%> SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1" rowspan="3" ><s:text name="global.lbl.map.branches" /></td>
	<td class="col-md-1" rowspan="3" >
		<select id="userBranchMap" name="userBranchMap" multiple="multiple" size="4">
			<% for(String bCode: bCodes) { 
					
						if((userBranchPrefs.get(bCode)!=null) && (userBranchPrefs.get(bCode))) { 
				%>
					<option value=<%=bCode %> SELECTED><%=branches.get(bCode) %></option>
				<%		} else { %>
					<option value=<%=bCode %>><%=branches.get(bCode)%></option>
				<%		} 
					
				} 
			%>
		</select>
	</td>
	
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.email" /></td>
	<td class="col-md-1"><input value=<%=user.getEmailId() %> id="emailId" name="emailId" type="text" size="30" /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.display.name" /></td>
	<td class="col-md-1"><input value=<%=user.getUserDisplayName() %> id="userDisplayName" name="userDisplayName" type="text"  /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.select.role" /></td>
	<td><select id="roleCode" name="roleCode">
			<% for(String roleCode : rCodes) { 
					if(user.getRoleCode().equalsIgnoreCase(roleCode)) { 
			%>
				<option value=<%=roleCode %> SELECTED><%=roleCodeValueMapper.get(roleCode) %></option>
			<%		} else { %>
				<option value=<%=roleCode %>><%=roleCodeValueMapper.get(roleCode)%></option>
			<%		} 			
				} 
			%>
		</select>&nbsp;</td>
	
</tr>
<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="Save"  value="<s:text name="global.lbl.update"/>">
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