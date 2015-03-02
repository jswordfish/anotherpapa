<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.BranchMst"%>
<%@page import="com.infrasofttech.domain.entities.Address"%>
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
	
	<script>
	
	function callBackToList(){
		document.forms["topForm"].action = "branchList.action";
		document.forms["topForm"].submit();
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
<form id="omniBranchAddForm" name="topForm" method="POST" action="branchAddSave">
<%
	Map<String, String> mapDays  = new HashMap<String, String>();
	Map<String, String> mapMonths  = new HashMap<String, String>();
	Map<String, String> mapBranchType = new HashMap<String, String>();
	Map<String, String> villages = new HashMap<String, String>();
	Map<String, String> districts = new HashMap<String, String>();
	Map<String, String> states = new HashMap<String, String>();
	Map<String, String> countries = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();

	mapBranchType = (Map<String, String>)request.getAttribute("mapBranchType");
	if(mapBranchType==null){
		System.out.println("mapBranchType>>>"+mapBranchType.size());
		mapBranchType=new HashMap<String, String>();
		}
	
	villages = (Map<String, String>)request.getAttribute("villages");
	if(villages==null){
		System.out.println("villages>>>"+villages.size());
		villages=new HashMap<String, String>();
		}
	
	districts = (Map<String, String>)request.getAttribute("districts");
	if(districts==null){
		System.out.println("districts>>>"+districts.size());
		districts=new HashMap<String, String>();
		}
	
	states = (Map<String, String>)request.getAttribute("states");
	if(states==null){
		System.out.println("states>>>"+states.size());
		states=new HashMap<String, String>();
		}
	
	countries = (Map<String, String>)request.getAttribute("countries");
	if(countries==null){
		System.out.println("countries>>>"+countries.size());
		countries=new HashMap<String, String>(); 
		}
	
	mapDays = (Map<String, String>)request.getAttribute("mapDays");
	if(mapDays==null){
		System.out.println("mapDays>>>"+mapDays.size());
		mapDays=new HashMap<String, String>();
		}
	
	mapMonths = (Map<String, String>)request.getAttribute("mapMonths");
	if(mapMonths==null){
		System.out.println("mapMonths>>>"+mapMonths.size());
		mapMonths=new HashMap<String, String>(); 
		}
	
	modules = (Map<String, String>)request.getAttribute("modules");
	if(modules==null){
		System.out.println("modules>>>"+modules.size());
		modules=new HashMap<String, String>();
		}
	
	//BranchMst branch = (BranchMst)request.getAttribute("branch");
%>
<div id="result" class="container">
<table class="table table-condensed">
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.branch.code" /></td>
	<td class="col-md-1"><input id="branchCode" name="branchCode" type="text"  value=""/></td>
	<td class="col-md-1"><s:text name="global.lbl.branch.ref.code" /> </td>
	<td class="col-md-1"><input id="branchRefCode" name="branchRefCode" type="text" value="" /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.branch.name" /></td>
	<td class="col-md-1"><input id="branchName" name="branchName" type="text"  value=""/></td>
	<td class="col-md-1"> <s:text name="global.lbl.branch.type" /></td>
	<td class="col-md-1">
		<select id="branchType" name="branchType">
			<% for(Map.Entry<String, String> entry : mapBranchType.entrySet()) { %>
					<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<% } %>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"> <s:text name="global.lbl.address" /></td>
	<td class="col-md-3" colspan="3">
		<input id="address1" name="address1" type="text" <%-- value="<%= branch.getAddress1() %>"  --%>/>&nbsp;
		<input id="address2" name="address2" type="text" <%-- value="<%= branch.getAddress2() %>" --%> />&nbsp;
		<input id="address3" name="address3" type="text" <%-- value="<%= branch.getAddress3() %>" --%> />&nbsp;
	</td>	
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.village" /></td>
	<td class="col-md-1">
		<select id="village" name="village">
			<% for(Map.Entry<String, String> entry : villages.entrySet()) { %>
				<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<% } %>
		</select>
		
		
	</td>
	<td class="col-md-1"><s:text name="global.lbl.district.city" /></td>
	<td class="col-md-1">
		<select id="district" name="district">
			<% for(Map.Entry<String, String> entry : districts.entrySet()) { %>
				<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<% } %>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.state" /></td>
	<td class="col-md-1">
		<select id="state" name="state">
			<% for(Map.Entry<String, String> entry : states.entrySet()) { %>
				<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<% } %>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.country" /></td>
	<td class="col-md-1">
		<select id="country" name="country">
			<% for(Map.Entry<String, String> entry : countries.entrySet()) { %>
				<option value=<%=entry.getKey() %>><%=entry.getValue() %></option>
			<% } %>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.postal.code" /></td>
	<td class="col-md-1"><input id="postalCode" name="postalCode" type="text"  <%-- value="<%= branch.getPostalCode() %>" --%> /></td>
	<td class="col-md-1"></td>
	<td class="col-md-1"></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.contact.person" /></td>
	<td class="col-md-1"><input id="contactPerson" name="contactPerson" type="text" <%--  value="<%= branch.getContactPerson() %>" --%> /></td>
	<td class="col-md-1"><s:text name="global.lbl.email" /></td>
	<td class="col-md-1"><input id="emailId" name="emailId" type="text"<%--  value="<%= branch.getEmailId() %>" --%> /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.telephone" /></td>
	<td class="col-md-1">
		<input id="tele1" name="tele1" type="text"  value=""  />
		<input id="tele2" name="tele2" type="text" value="" />
	</td>
	<td class="col-md-1"><s:text name="global.lbl.fax" /></td>
	<td class="col-md-1"><input id="faxNumber" name="faxNumber" type="text"<%--  value="<%= branch.getFaxNumber() %>" --%> /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.branch.days.from.day" /></td>
	<td class="col-md-1">
		<select id="fromDay" name="fromDay">
			<% for(Map.Entry<String, String> entry : mapDays.entrySet()) { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<% } %>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.branch.days.to.day" /></td>
	<td class="col-md-1">
		<select id="toDay" name="toDay">
			<% for(Map.Entry<String, String> entry : mapDays.entrySet()) { %>
				<option value="<%=entry.getKey() %>"><%= entry.getValue() %></option>
			<% } %>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.branch.days.from.time" /></td>
	<td class="col-md-1"><input id="branchFromTime" name="branchFromTime" type="text"  <%-- value="<%= branch.getBranchFromTime() %>" --%> /></td>
	<td class="col-md-1"><s:text name="global.lbl.branch.days.to.time" /></td>
	<td class="col-md-1"><input id="branchToTime" name="branchToTime" type="text" <%-- value="<%= branch.getBranchToTime() %>" --%> /></td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.financial.month.start" /></td>
	<td class="col-md-1">
		<select id="finMonthStart" name="finMonthStart">
			<% for(Map.Entry<String, String> entry : mapMonths.entrySet()) { %>
				<option value="<%=entry.getKey() %>"><%= entry.getValue() %></option>
			<% } %>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.financial.month.end" /></td>
	<td class="col-md-1">
		<select id="finMonthEnd" name="finMonthEnd">
			<% for(Map.Entry<String, String> entry : mapMonths.entrySet()) { %>
				<option value="<%=entry.getKey() %>"><%= entry.getValue() %></option>
			<% } %>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.weekly.offs.one" /></td>
	<td class="col-md-1">
		<select id="weeklyOff1" name="weeklyOff1">
			<% for(Map.Entry<String, String> entry : mapDays.entrySet()) { %>
				<option value="<%=entry.getKey() %>"><%= entry.getValue() %></option>
			<% } %>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.weekly.offs.two" /></td>
	<td class="col-md-1">
		<select id="weeklyOff2" name="weeklyOff2">
			<% for(Map.Entry<String, String> entry : mapDays.entrySet()) { %>
				<option value="<%=entry.getKey() %>"><%= entry.getValue() %></option>
			<% } %>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.weekly.half.offs1" /></td>
	<td class="col-md-1">
		<select id="halfOff1" name="halfOff1">
			<% for(Map.Entry<String, String> entry : mapDays.entrySet()) { %>
				<option value="<%=entry.getKey() %>"><%= entry.getValue() %></option>
			<% } %>
		</select>
	</td>
	<td rowspan="3" class="col-md-1"><s:text name="global.lbl.assign.modules" /></td>
	<td rowspan="3" class="col-md-1">
		<select id="moduleList" name="moduleList" multiple="multiple" size="4">
			<% for(Map.Entry<String, String> entry : modules.entrySet()) { %>
				<option value="<%=entry.getKey() %>"><%= entry.getValue() %></option>
			<% } %>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.weekly.half.offs2" /></td>
	<td class="col-md-1">
		<select id="halfOff2" name="halfOff2">
			<% for(Map.Entry<String, String> entry : mapDays.entrySet()) { %>
				<option value="<%=entry.getKey() %>"><%= entry.getValue() %></option>
			<% } %>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.non.working.half.offs" /></td>
	<td class="col-md-1">
		<input type="checkbox" id="nwhf" name="nwhf" value="1">&nbsp;1&nbsp;
		<input type="checkbox" id="nwhf" name="nwhf" value="2">&nbsp;2&nbsp;
		<input type="checkbox" id="nwhf" name="nwhf" value="3">&nbsp;3&nbsp;
		<input type="checkbox" id="nwhf" name="nwhf" value="4">&nbsp;4&nbsp;
		<input type="checkbox" id="nwhf" name="nwhf" value="5">&nbsp;5&nbsp;
	</td>
</tr>
<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="Save" value="<s:text name="global.btn.save"/>">
			<input type="button" name="List" value="<s:text name="global.btn.back.to.list"/>" onClick="callBackToList();">
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
