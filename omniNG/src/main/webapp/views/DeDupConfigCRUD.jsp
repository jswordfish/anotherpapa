<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.DeDupConfig"%>
<%@page import="java.util.*"%>
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
	function backToList(){
		document.forms["omniDeDupConfigForm"].action = "HomePage.action";
		document.forms["omniDeDupConfigForm"].submit();
	}
	
	</script>
	
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
<form id="omniDeDupConfigForm" name="omniDeDupConfigForm" method="POST" action="deDupConfigSave">
<%
	String mode = (String)request.getAttribute("mode");
	System.out.println("Product JSP mode:"+mode);
	
	
	Map<String, String> deDup1 = new HashMap<String, String>();
	
	deDup1 = (Map<String, String>)request.getAttribute("deDup");
	if(deDup1 == null){ deDup1 = new HashMap<String, String>(); }

		
	DeDupConfig deDupConfig = (DeDupConfig)request.getAttribute("deDupConfig");
	
	
%>
<div id="result" class="container">
<input type="hidden" name="mode" value="<%= mode %>">
<table class="table table-condensed">


<tr class="active">
	
	<td class="col-md-1">
	<table class="table">
							<thead>
								<tr>
									<th class="col-md-1">Reference Document</th>
									<th class="col-md-1" >Sequence Number of Validation</th>
									<th class="col-md-1" >Mandatory</th>
								</tr>
							</thead>
	
	<tbody>
	<tr class="active">
	<td class="col-md-1">
		<select id="refDoc" name="refDoc">
			<option value="-1" SELECTED>select...</option>
			<% for(Map.Entry<String, String> entry : deDup1.entrySet()) { 
					if(null != deDupConfig.getRefDoc() &&
							deDupConfig.getRefDoc().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" ><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	
	<td class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="seqNumVal" name="seqNumVal" type="text" maxlength="2" style="width: 30px" /></td>
				
	<td class="col-md-1">
	<% if(null != deDupConfig.getMandatoryYN()){ %>
		<input  type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}else{ %>
		<input type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}%>
	</td>
	
</tr>
<tr>
<td class="col-md-1">
		<select id="refDoc" name="refDoc">
			<option value="-1" SELECTED>select...</option>
			<% for(Map.Entry<String, String> entry : deDup1.entrySet()) { 
					if(null != deDupConfig.getRefDoc() &&
							deDupConfig.getRefDoc().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" ><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	
	<td class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="seqNumVal" name="seqNumVal" type="text" maxlength="2" style="width: 30px"/></td>
				
	<td class="col-md-1">
	<% if(null != deDupConfig.getMandatoryYN()){ %>
		<input  type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}else{ %>
		<input type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}%>
	</td>
	
</tr>
<tr>
<td class="col-md-1">
		<select id="refDoc" name="refDoc">
			<option value="-1" SELECTED>select...</option>
			<% for(Map.Entry<String, String> entry : deDup1.entrySet()) { 
					if(null != deDupConfig.getRefDoc() &&
							deDupConfig.getRefDoc().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" ><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	
	<td class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="seqNumVal" name="seqNumVal" type="text" maxlength="2" style="width: 30px" /></td>
				
	<td class="col-md-1">
	<% if(null != deDupConfig.getMandatoryYN()){ %>
		<input  type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}else{ %>
		<input type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}%>
	</td>
	
</tr>
<tr>
<td class="col-md-1">
		<select id="refDoc" name="refDoc">
			<option value="-1" SELECTED>select...</option>
			<% for(Map.Entry<String, String> entry : deDup1.entrySet()) { 
					if(null != deDupConfig.getRefDoc() &&
							deDupConfig.getRefDoc().equalsIgnoreCase(entry.getKey())) { 
			%>	
				<option value="<%=entry.getKey()%>" ><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	
	<td class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="seqNumVal" name="seqNumVal" type="text" maxlength="2" style="width: 30px" /></td>
				
	<td class="col-md-1">
	<% if(null != deDupConfig.getMandatoryYN()){ %>
		<input  type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}else{ %>
		<input type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}%>
	</td>
	
</tr>
<tr>
<td class="col-md-1">
		<select id="refDoc" name="refDoc">
			<option value="-1" SELECTED>select...</option>
			<% for(Map.Entry<String, String> entry : deDup1.entrySet()) { 
					if(null != deDupConfig.getRefDoc() &&
							deDupConfig.getRefDoc().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" ><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	
	<td class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="seqNumVal" name="seqNumVal" type="text" maxlength="2" style="width: 30px" /></td>
				
	<td class="col-md-1">
	<% if(null != deDupConfig.getMandatoryYN()){ %>
		<input  type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}else{ %>
		<input type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}%>
	</td>
	
</tr>
<tr>
<td class="col-md-1">
		<select id="refDoc" name="refDoc">
			<option value="-1" SELECTED>select...</option>
			<% for(Map.Entry<String, String> entry : deDup1.entrySet()) { 
					if(null != deDupConfig.getRefDoc() &&
							deDupConfig.getRefDoc().equalsIgnoreCase(entry.getKey())) { 
			%>
				<option value="<%=entry.getKey()%>" ><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	
	<td class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="seqNumVal" name="seqNumVal" type="text" maxlength="2" style="width: 30px" /></td>
				
	<td class="col-md-1">
	<% if(null != deDupConfig.getMandatoryYN()){ %>
		<input  type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}else{ %>
		<input type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}%>
	</td>
	
</tr>
<tr>
<td class="col-md-1">
		<select id="refDoc" name="refDoc">
			<option value="-1" SELECTED>select...</option>
			<% for(Map.Entry<String, String> entry : deDup1.entrySet()) { 
					if(null != deDupConfig.getRefDoc() &&
							deDupConfig.getRefDoc().equalsIgnoreCase(entry.getKey())) { 
			%>
				
				<option value="<%=entry.getKey()%>" ><%=entry.getValue() %></option>
			<%		} else { %>
				<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			<%		} 			
				} 
			%>
		</select>
	</td>
	
	<td class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="seqNumVal" name="seqNumVal" type="text" maxlength="2" style="width: 30px" /></td>
				
	<td class="col-md-1">
	<% if(null != deDupConfig.getMandatoryYN()){ %>
		<input  type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}else{ %>
		<input type="checkbox" name="mandatoryYN" id="mandatoryYN" >
	<%	}%>
	</td>
	
</tr>
</tbody>
</table>
</td>
</tr>
<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="Save" value="Save">			
			<input type="button" name="List" value="Back to List" onClick="backToList();">
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
