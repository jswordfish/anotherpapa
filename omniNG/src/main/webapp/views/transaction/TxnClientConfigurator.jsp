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
	/***   add script***/
	function open1(){
		document.getElementById("mainId").style.display = "block";
	}
	
	function callTxnList(){
	var action = "txnSaveOrUpdateScreenMapper?onlyList=yes";
	document.location.href=action;
	}
	
	function addRow(type){
		
		var modules = document.getElementById("modules");
		if(modules.options[modules.selectedIndex] == null){
			alert(" Select a Module");
			return;
		}
		var moduleId = modules.options[modules.selectedIndex].value;
		var moduleName = modules.options[modules.selectedIndex].text;
				
		var branches = document.getElementById("branches");
		if(branches.options[branches.selectedIndex] == null){
			alert(" Select a Branch");
			return;
		}
		var branchId = branches.options[branches.selectedIndex].value;
		var branchName=branches.options[branches.selectedIndex].text;
		
		var products = document.getElementById("products");
		if(products.options[products.selectedIndex] == null){
			alert(" Select a Product");
			return;
		}
		var productId = products.options[products.selectedIndex].value;
		var productName=products.options[products.selectedIndex].text;
		
		var activities = document.getElementById("activities");
		if(activities.options[activities.selectedIndex] == null){
			alert(" Select an Activity");
			return;
		}
		var activityId = activities.options[activities.selectedIndex].value;
		var activityName = activities.options[activities.selectedIndex].text;
				
		var strutsUrl = "txnAddRow.action?moduleCode="+moduleId+"&branchCode="+branchId+"&productCode="+productId+"&activityCode="+activityId+"&screenType="+type;
		
		//alert(strutsUrl);
		
		var names = "&moduleName="+moduleName+"&branchName="+branchName+"&productName="+productName+"&activityName="+activityName;
		document.location.href=strutsUrl+names;
	}
</script>

</head>

<body>
	<form id="idForm" method="POST" action="txnSaveOrUpdateScreenMapper.action">
	
		<div id="idPageTitle" class="pageTitle" style="display:block">&nbsp;Transaction Screen Configurator</div>
		<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
		<div  id="idErrTbl"  class="errorDiv" style="display:none">
			<p id="el">
			</p>
		</div>
		<div>
		<%
			Map<String, String> modules = new HashMap<String, String>();
			Map<String, String> products = new HashMap<String, String>();
			Map<String, String> activities = new HashMap<String, String>();
			Map<String, String> branches = new HashMap<String, String>();
			modules = (Map<String, String>)request.getAttribute("modules");
				if(modules == null){
					modules = new HashMap<String, String>();
				}
			products = (Map<String, String>)request.getAttribute("products");
				if(products == null){
					products = new HashMap<String, String>();
				}
			activities = (Map<String, String>)request.getAttribute("activities");
				if(activities == null){
					activities = new HashMap<String, String>();
				}
			branches = (Map<String, String>)request.getAttribute("branches");
				if(branches == null){
					branches = new HashMap<String, String>();
				}
			
			
			ScreenMapper screenMapper = (ScreenMapper)session.getAttribute("screenMapper");
				if(screenMapper == null){
					screenMapper = new ScreenMapper();
					screenMapper.setModuleCode("");
					screenMapper.setProductCode("");
					screenMapper.setActivityCode("");
					screenMapper.setBranchCode("");
					Screen tScreen = new Screen();
					tScreen.setScreenType(ScreenType.TRANSACTION);
					Screen bScreen = new Screen();
					bScreen.setScreenType(ScreenType.BALANCE);
					Screen iScreen = new Screen();
					iScreen.setScreenType(ScreenType.INFO);
					screenMapper.setTransactionScreen(tScreen);
					screenMapper.setInfoScreen(iScreen);
					screenMapper.setBalancesScreen(bScreen);
				}
			request.getSession().setAttribute("screenMapper", screenMapper);
			
			List<ScreenElement> fields = (List<ScreenElement>) session.getAttribute("fields");
				if(fields == null){
					fields = new ArrayList<ScreenElement>();
					
				}
				
			String edit = (String)request.getAttribute("edit");
			boolean edt = false;
			if(edit != null && edit.equals("yes")){
				edt = true;
			}
		%>
		
			
			<table width="50%">
				<tr valign="top">
					<td width="10%"><font face=Calibri size="3"><b>Module:</b></font></td>
					<td width="23%">
						<select id="modules" name="modules" <% if(edt) {%> disabled <% } %>>
							<% for(Map.Entry<String, String> entry : modules.entrySet()) { %>
								<option value=<%=entry.getKey() %> <% if(screenMapper.getModuleCode().equals(entry.getKey())) {%> selected <%} %> ><%=entry.getValue() %></option>
							<% } %>
						</select>&nbsp;
					</td>
					<td colspan=4 width="67%"></td>
				</tr>
				<tr valign="top">
					<td width="10%"><font face=Calibri size="3"><b>Branches:</b></font></td>
					<td width="23%">
						<select id="branches" name="branches" <% if(edt) {%> disabled <% } %> size=4>
							<% for(Map.Entry<String, String> entry : branches.entrySet()) { %>
								<option value=<%=entry.getKey() %> <% if(screenMapper.getBranchCode().equals(entry.getKey())) {%> selected <%} %> ><%=entry.getValue() %>  </option>
							<% } %>
						</select>&nbsp;
					</td>
					<td width="10%"><font face=Calibri size="3"><b>Products:</b></font></td>
					<td width="23%">
						<select id="products" name="products" <% if(edt) {%> disabled <% } %> size=4>
							<% for(Map.Entry<String, String> entry : products.entrySet()) { %>
								<option value="<%=entry.getKey() %>" <% if(screenMapper.getProductCode().equals(entry.getKey())) {%> selected <%} %> > <%=entry.getValue() %>  </option>
							<% } %>
						</select>&nbsp;
					</td>
					<td width="10%"><font face=Calibri size="3"><b>Activities:</b></font></td>
					<td width="24%">
						<select id="activities" name="activities" <% if(edt) {%> disabled <% } %> size=4>
							<% for(Map.Entry<String, String> entry : activities.entrySet()) { %>
								<option value=<%=entry.getKey() %> <% if(screenMapper.getActivityCode().equals(entry.getKey())) {%> selected <%} %> > <%=entry.getValue() %> </option>
							<% } %>
						</select>&nbsp;
					</td>
				</tr>
			</table>
		</div>
			<hr>
		<div id="txnScr" style="display:block">
			<table><tr><td>
				<font face=Calibri size="3"><b>Configure Screen Elements - TRANSACTION SCREEN</b></font>
			&nbsp;<input type="button" value="ADD" class="smallbtn" onClick="addRow('txn')">
			</td></tr></table>
			<table class="table">
        
		
		
        <tbody>
			 <thead>
        	<tr>
                <th><font face=Calibri size="3"><b>Row #</b></font></th>
                <th><font face=Calibri size="3"><b>Column 1</b></font></th>
                <th><font face=Calibri size="3"><b>Column 2</b></font></th>
                <th><font face=Calibri size="3"><b>Action</b></font></th>
				
            </tr>
			</thead>
			<%
				int count = 0;
				for(ScreenRow row: screenMapper.getTransactionScreen().getRows()){
				row.setRownum(count + 1);
				ScreenElement ele1 = new ScreenElement();
				ScreenElement ele2 = new ScreenElement();
					if(row.getScreenElements().size() == 2){
						ele1 = row.getScreenElements().get(0);
						ele2 = row.getScreenElements().get(1);
					}
			%>
			<tr>
					<td><input type="text" size="5" class="smallTxtLeftAlign" value="<%= row.getRownum() %>" disabled></td>
					<td><select id="firstTxn<%= count%>"  name="firstTxn<%= count%>">
					<% for(ScreenElement field: fields) {
						
					%>
							<option value=<%= field.getName() %> <% if(ele1.getName().equals(field.getName())) { %> selected <%} %>> <%=field.getDisplayName() %> </option>
							<%} %>
						</select>
					</td>
					<td><select id="secondTxn<%= count%>"  name="secondTxn<%= count%>">
							<% for(ScreenElement field: fields) {%>
							<option value=<%= field.getName() %>  <% if(ele2.getName().equals(field.getName())) { %> selected <% } %>> <%=field.getDisplayName() %> </option>
							<%} %>
						</select>
						
					</td>
					<td><a href="txnDeleteRow.action?rowNum=<%= row.getRownum()%>&type=txn">Delete Row</a></td>
				</tr>
           <%
		   count ++;
				}
		   
           %>
        </tbody>
    </table>
			
		</div>
		<hr>
		<div id="infoScr" style="display:block">
			<table><tr><td>
				<font face=Calibri size="3"><b>Configure Screen Elements - INFORMATION SCREEN</b></font>
			&nbsp;<input type="button" value="ADD" class="smallbtn" onClick="addRow('info')">
			</td></tr></table>
			<table class="table">
        
		
		
        <tbody>
			 <thead>
        	<tr>
                <th><font face=Calibri size="3"><b>Row #</b></font></th>
                <th><font face=Calibri size="3"><b>Column 1</b></font></th>
                <th><font face=Calibri size="3"><b>Column 2</b></font></th>
                <th><font face=Calibri size="3"><b>Action</b></font></th>
				
            </tr>
			</thead>
			<%
			int c1 = 0;
				for(ScreenRow row: screenMapper.getInfoScreen().getRows()){
				row.setRownum(c1 + 1);
				ScreenElement ele1 = new ScreenElement();
				ScreenElement ele2 = new ScreenElement();
				if(row.getScreenElements().size() == 2){
					ele1 = row.getScreenElements().get(0);
					ele2 = row.getScreenElements().get(1);
				}
			%>
			<tr>
					<td><input type="text" size="5" class="smallTxtLeftAlign" value="<%= row.getRownum() %>" disabled></td>
					<td><select id="firstInfo<%= c1%>"  name="firstInfo<%= c1%>">
					<% for(ScreenElement field: fields) {%>
							<option value=<%= field.getName() %> <% if(ele1.getName().equals(field.getName())) { %> selected <%} %>> <%=field.getDisplayName() %> </option>
							<%} %>
						</select>
					</td>
					<td><select id="secondInfo<%= c1%>"  name="secondInfo<%= c1%>">
							<% for(ScreenElement field: fields) {%>
							<option value=<%= field.getName() %> <% if(ele2.getName().equals(field.getName())) { %> selected <%} %>> <%=field.getDisplayName() %> </option>
							<%} %>
						</select>
						
					</td>
					<td><a href="txnDeleteRow.action?rowNum=<%= row.getRownum()%>&type=info">Delete Row</a></td>
				</tr>
           <%
			c1 ++;
				}
				c1 = 0;
           %>
        </tbody>
    </table>
			
		</div>
		<hr>
		<div id="balScr" style="display:block">
			<table><tr><td>
				<font face=Calibri size="3"><b>Configure Screen Elements - BALANCE SCREEN</b></font>
			&nbsp;<input type="button" value="ADD" class="smallbtn" onClick="addRow('balance')">
			</td></tr></table>
			<table class="table">
        
		
		
        <tbody>
			 <thead>
        	<tr>
                <th><font face=Calibri size="3"><b>Row #</b></font></th>
                <th><font face=Calibri size="3"><b>Column 1</b></font></th>
                <th><font face=Calibri size="3"><b>Column 2</b></font></th>
                <th><font face=Calibri size="3"><b>Action</b></font></th>
				
            </tr>
			</thead>
			<%
			int c2 = 0;
				for(ScreenRow row: screenMapper.getBalancesScreen().getRows()){
				row.setRownum(c2 + 1);
				ScreenElement ele1 = new ScreenElement();
				ScreenElement ele2 = new ScreenElement();
				if(row.getScreenElements().size() == 2){
					ele1 = row.getScreenElements().get(0);
					ele2 = row.getScreenElements().get(1);
				}
			%>
			<tr>
					<td><input type="text" size="5" class="smallTxtLeftAlign" value="<%= row.getRownum() %>" disabled></td>
					<td><select id="firstBal<%= c2%>"  name="firstBal<%= c2%>">
					<% for(ScreenElement field: fields) {%>
							<option value=<%= field.getName() %> <% if(ele1.getName().equals(field.getName())) { %> selected <%} %>> <%=field.getDisplayName() %> </option>
							<%} %>
						</select>
					</td>
					<td><select id="secondBal<%= c2%>"  name="secondBal<%= c2%>">
							<% for(ScreenElement field: fields) {%>
							<option value=<%= field.getName() %> <% if(ele2.getName().equals(field.getName())) { %> selected <%} %>> <%=field.getDisplayName() %> </option>
							<%} %>
						</select>
						
					</td>
					<td><a href="txnDeleteRow.action?rowNum=<%= row.getRownum()%>&type=balance">Delete Row</a></td>
				</tr>
           <%
				c2++;
				}
				c2 = 0;
           %>
        </tbody>
    </table>
		</div>
		<br>
		<table>
			<tr class="active">
				<td colspan="4" width="100%" height="25" align="center">
						<button type="submit" class="btn btn-primary" onClick="callTxnSave();">Save</button>
						&nbsp;
						<button type="button" class="btn btn-primary" onClick="callTxnList();">Back to List</button>
				</td>
			</tr>
		</table>		
	</form>
	
	<%-- <script type="text/javascript">
		/* 	new FormValidator(
					'frmLogin',
					[ {
						name : 'brCode',
						display : 'branch code',
						rules : 'required|numeric'
					}, {
						name : 'loginId',
						display : 'Login Id',
						rules : 'required|alpha_numeric|min_length[4]'
					},],
					function(errors, evt) {

						if (errors.length > 0) {
							var errorString = '';
							document.getElementById("idErrTbl").style.display = "inline";
							for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
								errorString += errors[i].message + '<br />';
							}

							el.innerHTML = errorString;
						}
					}); */
	</script> --%>

</body>
</html>