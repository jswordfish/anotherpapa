<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script src="js/Hashing.js"></script>
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

function startUp() {
	document.getElementById("idPwd").focus();
}

function getHashedPwd(){
	var pwd = document.getElementById("uiPwd").value ;
	var hashedSaltPwd = "<%= request.getAttribute("hPwdSalt") %>";

	var hPwd = hashedPwdSHA512(pwd);
	var fullPwd = hPwd+hashedSaltPwd;
	document.getElementById('idPwd').value = fullPwd;
	return true;
}

function  pwdCheck(){
	if(document.getElementById("uiPwd").value == "" )
	{
		document.getElementById("uiPwd").focus();
		alert("Password CANNOT be blank");
	}else{
		var pwd = document.getElementById("uiPwd").value ;
		
		var hPwd = hashedPwdSHA512(pwd);
//		var hPwd = pwd;
		
		var hashedSaltPwd = "<%= request.getAttribute("hPwdSalt") %>";
		var fullPwd = hPwd + hashedSaltPwd;
		document.getElementById('uiPwd').value = fullPwd;
	}
}

</script>
</head>
<body onLoad="startUp();">
<div class="container">

<form name="frmPwd" id="omniform" method="POST" action="ValidateLoginPwd">
	
<div id="result" class="container">

<font face="calibri" size="2" color="#FF0000"><%= request.getAttribute("errMsg") %></font>
<br>
<table class="table table-condensed" width="100%">
<tr class="active">
				<td colspan="2" width="100%" align="center" style="">
				    <font face="Calibri" size="2" color="#0000AA">
				    	<b>&nbsp;
						    <s:text name="global.lbl.welcome" />&nbsp;
						    	<%= request.getSession().getAttribute("userDisplayName") %>&nbsp;@&nbsp;
								<%= request.getSession().getAttribute("branchName") %>
						    <%
						    	String hPwd = (String)request.getAttribute("hPwd");
						    	String hPwdSalt = (String)request.getAttribute("hPwdSalt");
						    %>
						    <input type="hidden" id="hPwd" name="hPwd" value="<%= hPwd %>">
						    <input type="hidden" id="hPwdSalt" name="hPwdSalt" value="<%= hPwdSalt %>">
						 </b>
					</font>
				</td>
			</tr>
			<tr height="10" valign="bottom" bgcolor="#FFFFFF">
				<td colspan="2" width="100%">
					<!-- BLANK LINE -->
				</td>
			</tr>
			<tr class="active">
 				<td class="col-md-1"><s:text name="global.lbl.password" /></td>
				 <td class="col-md-1">
					<input type="password" name="uiPwd" id="uiPwd"   />
				</td>
			</tr>
            <tr class="active">
                <td class="col-md-1">
                   &nbsp;
               </td>
               
               <td class="col-md-1">
                  <input type="submit" value="Login" onClick="pwdCheck();">
               </td>
            </tr>
			<tr height="10" valign="bottom" bgcolor="#FFFFFF">
				<td colspan="2" width="100%">
					<!-- BLANK LINE -->
				</td>
			</tr>
		</table>
	</div>
</form>
</div>

</body>
</html>