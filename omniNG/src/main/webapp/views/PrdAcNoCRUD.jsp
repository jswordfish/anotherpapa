<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.PrdAcNoMst"%>
<%@page import="com.infrasofttech.domain.entities.ProductMst"%>
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
		function goToList()
		{
			document.forms["topForm"].action = "prdAcNoList.action";
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
<form id="omniProductForm" method="POST" action="prdAcNoSave" name="topForm">
<%
	String mode = (String)request.getAttribute("mode");
	System.out.println("PrdAcNo JSP mode:"+mode);
	
	Map<String, String> branches = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();
	Map<String, String> currencies = new HashMap<String, String>();
	Map<String, String> acType = new HashMap<String, String>();
	Map<String, String> modeOfOprn = new HashMap<String, String>();
	Map<String, String> acStatus = new HashMap<String, String>();
	Map<String, String> minorType = new HashMap<String, String>();
	Map<String, String> freezeType = new HashMap<String, String>();
	Map<String, String> memberType = new HashMap<String, String>();

	branches = (Map<String, String>)request.getAttribute("branches");
	if(branches == null){ branches = new HashMap<String, String>(); }
	modules = (Map<String, String>)request.getAttribute("modules");
	if(modules == null){ modules = new HashMap<String, String>(); }
	products = (Map<String, String>)request.getAttribute("products");
	if(products == null){ products = new HashMap<String, String>(); }
	currencies = (Map<String, String>)request.getAttribute("currencies");
	if(currencies == null){ currencies = new HashMap<String, String>(); }
	acType = (Map<String, String>)request.getAttribute("acType");
	if(acType == null){ acType = new HashMap<String, String>(); }
	modeOfOprn = (Map<String, String>)request.getAttribute("modeOfOprn");
	if(modeOfOprn == null){ modeOfOprn = new HashMap<String, String>(); }
	acStatus = (Map<String, String>)request.getAttribute("acStatus");
	if(acStatus == null){ acStatus = new HashMap<String, String>(); }
	minorType = (Map<String, String>)request.getAttribute("minorType");
	if(minorType == null){ minorType = new HashMap<String, String>(); }
	freezeType = (Map<String, String>)request.getAttribute("freezeType");
	if(freezeType == null){ freezeType = new HashMap<String, String>(); }
	memberType = (Map<String, String>)request.getAttribute("memberType");
	if(memberType == null){ memberType = new HashMap<String, String>(); }
	
	PrdAcNoMst prdAcNo = (PrdAcNoMst)request.getAttribute("prdAcNo");
%>
<div id="result" class="container">
<input type="hidden" name="mode" value="<%= mode %>">
<table class="table-condensed">
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.account.number" /></td>
	<%
		if(mode.equalsIgnoreCase("CREATE")){%>
			<td class="col-md-1"><input readonly id="accountNumber" name="accountNumber" 
				type="text"  value="<%= prdAcNo.getAccountNumber() %>"/></td>
	<%	}else{%>
			<td class="col-md-1"><input readonly id="accountNumber" name="accountNumber" 
				type="text"  value="<%= prdAcNo.getAccountNumber() %>"/></td>
	<%	}%>
	<td class="col-md-1"><s:text name="global.lbl.branch" /></td>
	<td class="col-md-1">
		<select id="branchCode" name="branchCode">
			<% for(Map.Entry<String, String> entry : branches.entrySet()) { 
					if(null != prdAcNo.getBranchCode() &&
							prdAcNo.getBranchCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.customer.number" /></td>
	<td class="col-md-1"><input id="customerNumber" name="customerNumber" 
				type="text"  value="<%= prdAcNo.getCustomerNumber() %>"/>
	</td>
	<td class="col-md-1">Customer Name:</td>
	<td class="col-md-1"><input id="customerName" name="customerName" 
				type="text"  value="<%= prdAcNo.getCustomerName() %>"/>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.module" /></td>
	<td class="col-md-1">
		<select id="moduleCode" name="moduleCode">
			<% for(Map.Entry<String, String> entry : modules.entrySet()) { 
					if(null != prdAcNo.getModuleCode() &&
							prdAcNo.getModuleCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.product" /></td>
	<td class="col-md-1">
		<select id="productCode" name="productCode">
			<% for(Map.Entry<String, String> entry : products.entrySet()) { 
					if(null != prdAcNo.getProductCode() &&
							prdAcNo.getProductCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.currency" /></td>
	<td class="col-md-1">
		<select id="currencyCode" name="currencyCode">
			<% for(Map.Entry<String, String> entry : currencies.entrySet()) { 
					if(null != prdAcNo.getCurrencyCode() &&
							prdAcNo.getCurrencyCode().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.account.type" /></td>
	<td class="col-md-1">
		<select id="acType" name="acType">
			<% for(Map.Entry<String, String> entry : acType.entrySet()) { 
					if(null != prdAcNo.getAccountType() &&
							prdAcNo.getAccountType().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.mode.of.operation" /></td>
	<td class="col-md-1">
		<select id="modeOfOprn" name="modeOfOprn">
			<% for(Map.Entry<String, String> entry : modeOfOprn.entrySet()) { 
					if(null != prdAcNo.getModeOfOperation() &&
							prdAcNo.getModeOfOperation().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.account.status" /></td>
	<td class="col-md-1">
		<select id="acStatus" name="acStatus">
			<% for(Map.Entry<String, String> entry : acStatus.entrySet()) { 
					if(null != prdAcNo.getAccountStatus() &&
							prdAcNo.getAccountStatus().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.minor.type" />:</td>
	<td class="col-md-1">
		<select id="minorType" name="minorType">
			<% for(Map.Entry<String, String> entry : minorType.entrySet()) { 
					if(null != prdAcNo.getMinorType() &&
							prdAcNo.getMinorType().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.document.file.number" /></td>
	<td class="col-md-1"><input id="docFileNo" name="docFileNo" 
				type="text"  value="<%= prdAcNo.getDocumentFileNumber() %>"/>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.freeze.type" /></td>
	<td class="col-md-1">
		<select id="freezeType" name="freezeType">
			<% for(Map.Entry<String, String> entry : freezeType.entrySet()) { 
					if(null != prdAcNo.getFreezeType() &&
							prdAcNo.getFreezeType().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.reason" /></td>
	<td class="col-md-1"><input id="reason" name="reason" 
				type="text"  value="<%= prdAcNo.getReason() %>"/>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.member.number" /></td>
	<td class="col-md-1"><input id="memberNo" name="memberNo" 
				type="text"  value="<%= prdAcNo.getMemberNumber() %>"/>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.member.type" /></td>
	<td class="col-md-1">
		<select id="memberType" name="memberType">
			<% for(Map.Entry<String, String> entry : memberType.entrySet()) { 
					if(null != prdAcNo.getMemberType() &&
							prdAcNo.getMemberType().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" SELECTED><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.additional.information1" /></td>
	<td class="col-md-1">
		<input id="additionalInfo1" name="additionalInfo1" 
				type="text"  value="<%= prdAcNo.getAdditionalInformation1() %>"/>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.additional.information2" />:</td>
	<td class="col-md-1">
		<input id="additionalInfo2" name="additionalInfo2" 
				type="text"  value="<%= prdAcNo.getAdditionalInformation2() %>"/>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.holder.name1" /></td>
	<td class="col-md-1">
		<input id="holder1Name" name="holder1Name" type="text"  value="<%= prdAcNo.getHolder1Name() %>"/>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.gender" /></td>
	<td class="col-md-1">
	<% if(null != prdAcNo.getHolder1Gender() && 
			prdAcNo.getHolder1Gender().equalsIgnoreCase("M")){ %>
		<input checked="checked" type="radio" name="genderHolder1" id="genderHolder1" value="M">&nbsp;Male
		<input type="radio" name="genderHolder1" id="genderHolder1" value="F">&nbsp;Female
	<%	}else{ %>
		<input type="radio" name="genderHolder1" id="genderHolder1" value="M">&nbsp;Male
		<input checked="checked" type="radio" name="genderHolder1" id="genderHolder1" value="F">&nbsp;Female
	<%	}%>
	</td>
</tr>


<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.holder.name2" /></td>
	<td class="col-md-1">
		<input id="holder2Name" name="holder2Name" type="text"  value="<%= prdAcNo.getHolder2Name() %>"/>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.gender" /></td>
	<td class="col-md-1">
	<% if(null != prdAcNo.getHolder2Gender() && 
			prdAcNo.getHolder2Gender().equalsIgnoreCase("M")){ %>
		<input checked="checked" type="radio" name="genderHolder2" id="genderHolder2" value="M">&nbsp;Male
		<input type="radio" name="genderHolder2" id="genderHolder2" value="F">&nbsp;Female
	<%	}else{ %>
		<input type="radio" name="genderHolder2" id="genderHolder2" value="M">&nbsp;Male
		<input checked="checked" type="radio" name="genderHolder2" id="genderHolder2" value="F">&nbsp;Female
	<%	}%>
	</td>
</tr>

<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.holder.name3" /></td>
	<td class="col-md-1">
		<input id="holder3Name" name="holder3Name" type="text"  value="<%= prdAcNo.getHolder3Name() %>"/>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.gender" /></td>
	<td class="col-md-1">
	<% if(null != prdAcNo.getHolder3Gender() && 
			prdAcNo.getHolder3Gender().equalsIgnoreCase("M")){ %>
		<input checked="checked" type="radio" name="genderHolder3" id="genderHolder3" value="M">&nbsp;Male
		<input type="radio" name="genderHolder3" id="genderHolder3" value="F">&nbsp;Female
	<%	}else{ %>
		<input type="radio" name="genderHolder3" id="genderHolder3" value="M">&nbsp;Male
		<input checked="checked" type="radio" name="genderHolder3" id="genderHolder3" value="F">&nbsp;Female
	<%	}%>
	</td>
</tr>

<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.nominee.name1" /></td>
	<td class="col-md-1">
		<input id="nominee1Name" name="nominee1Name" type="text"  value="<%= prdAcNo.getNominee1Name() %>"/>
	</td>
<td class="col-md-1"><s:text name="global.lbl.gender" /></td>
	<td class="col-md-1">
	<% if(null != prdAcNo.getNominee1Gender() && 
			prdAcNo.getNominee1Gender().equalsIgnoreCase("M")){ %>
		<input checked="checked" type="radio" name="genderNominee1" id="genderNominee1" value="M">&nbsp;Male
		<input type="radio" name="genderNominee1" id="genderNominee1" value="F">&nbsp;Female
	<%	}else{ %>
		<input type="radio" name="genderNominee1" id="genderNominee1" value="M">&nbsp;Male
		<input checked="checked" type="radio" name="genderNominee1" id="genderNominee1" value="F">&nbsp;Female
	<%	}%>
	</td>
</tr>

<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.nominee.name2" /></td>
	<td class="col-md-1">
		<input id="nominee2Name" name="nominee2Name" type="text"  value="<%= prdAcNo.getNominee2Name() %>"/>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.gender" /></td>
	<td class="col-md-1">
	<% if(null != prdAcNo.getNominee2Gender() && 
			prdAcNo.getNominee2Gender().equalsIgnoreCase("M")){ %>
		<input checked="checked" type="radio" name="genderNominee2" id="genderNominee2" value="M">&nbsp;Male
		<input type="radio" name="genderNominee2" id="genderNominee2" value="F">&nbsp;Female
	<%	}else{ %>
		<input type="radio" name="genderNominee2" id="genderNominee2" value="M">&nbsp;Male
		<input checked="checked" type="radio" name="genderNominee2" id="genderNominee2" value="F">&nbsp;Female
	<%	}%>
	</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.nominee.name3" /></td>
	<td class="col-md-1">
		<input id="nominee3Name" name="nominee3Name" type="text"  value="<%= prdAcNo.getNominee3Name() %>"/>
	</td>
	<td class="col-md-1"><s:text name="global.lbl.gender" /></td>
	<td class="col-md-1">
	<% if(null != prdAcNo.getNominee3Gender() && 
			prdAcNo.getNominee3Gender().equalsIgnoreCase("M")){ %>
		<input checked="checked" type="radio" name="genderNominee3" id="genderNominee3" value="M">&nbsp;Male
		<input type="radio" name="genderNominee3" id="genderNominee3" value="F">&nbsp;Female
	<%	}else{ %>
		<input type="radio" name="genderNominee3" id="genderNominee3" value="M">&nbsp;Male
		<input checked="checked" type="radio" name="genderNominee3" id="genderNominee3" value="F">&nbsp;Female
	<%	}%>
	</td>
</tr>
<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="" value="<s:text name="global.btn.save" />">
			<input type="reset" name="" value="<s:text name="global.btn.clear" />">
			<input type="button" name="" value="<s:text name="global.btn.back.to.list" />" onClick="javascript:goToList();">
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
