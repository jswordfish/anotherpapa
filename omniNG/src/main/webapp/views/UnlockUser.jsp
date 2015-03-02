<!DOCTYPE html>
<%@page import="com.infrasofttech.domain.entities.UserMst"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.*"%>
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
		function validateInput(){
			var unlockUserLoginId = document.getElementById("unlockUserLoginId").value;
			
			if(unlockUserLoginId.length > 0){
				return true;
			}else{
				alert("Please enter Login Id!!!");
				return false;
			}
		}
	</script>
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

<form id="omniUserUnlockForm" method="POST" action="unlockUserSave">
<div id="result" class="container">

<font face="calibri" size="2" color="#FF0000"><%= request.getAttribute("errMsg") %></font>
<br>
<table class="table table-condensed" width="100%">
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.login.id" /></td>
	<td class="col-md-1"><input id="unlockUserLoginId" name="unlockUserLoginId" type="text" value=""/></td>
	<td class="col-md-1">&nbsp;</td>
	<td class="col-md-1">&nbsp;</td>
</tr>
<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="" value="<s:text name="global.btn.unlock" />" onClick="return validateInput();">
			<input type="reset" name="Clear" value="<s:text name="global.btn.clear" />">
	</td>
</tr>
</table>
</div>
</form>
</div>
	
</body>
</html>