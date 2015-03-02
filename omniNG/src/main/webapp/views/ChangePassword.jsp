<!DOCTYPE html>
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
<script src="js/Hashing.js"></script>
	<script>
	
		function comparePwd(){
			var newPwd = document.getElementById("newPwd").value;
			var verifyPwd = document.getElementById("verifyPwd").value;
			if(newPwd == verifyPwd){
				if(getHashedPwd()){
					//alert("got Hashed");						
					return true;		
					}
			}else{
				alert("New Password and Verify Passwords do not match");
				return false;
			}
		}
		
		
		function getHashedPwd(){
	 		var oldPwd = document.getElementById("oldPwd").value ;
		    var newPwd = document.getElementById("newPwd").value ;
		    var verifyPwd = document.getElementById("verifyPwd").value ;
	 
		var hashedSalt = "<%=session.getAttribute("hashedSaltPwd")%>";
		//alert("hashedSalt::"+hashedSalt);
		//alert("oldPwd   ::"+oldPwd);
	//alert("newPwd   ::"+newPwd);
	//alert("verifyPwd   ::"+verifyPwd);
		var cP=	hashedPwdSHA512(oldPwd);
	 		//alert("cP : "+cP);
	 		document.getElementById('oldPwd').value =	cP+hashedSalt;
		var nP=	hashedPwdSHA512(newPwd);
			//alert("nP : "+nP);
			document.getElementById('newPwd').value =	nP+hashedSalt;
		var rP=	hashedPwdSHA512(verifyPwd);
			//alert("rP : "+rP);
			document.getElementById('verifyPwd').value =	rP+hashedSalt;
		return true;
		}
	</script>
  </head>
  

<body>
<div class="container">

<form id="omniUserChgPwdForm" method="POST" action="changePasswordSave">
<div id="result" class="container">

<font face="calibri" size="2" color="#FF0000"><%= request.getAttribute("errMsg") %></font>
<br>
<table class="table table-condensed" width="100%">
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.old.password" /></td>
	<td class="col-md-1"><input id="oldPwd" name="oldPwd" type="password" value=""/></td>
	<td class="col-md-1">&nbsp;</td>
	<td class="col-md-1">&nbsp;</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.new.password" /></td>
	<td class="col-md-1"><input id="newPwd" name="newPwd" type="password" value=""/></td>
	<td class="col-md-1">&nbsp;</td>
	<td class="col-md-1">&nbsp;</td>
</tr>
<tr class="active">
	<td class="col-md-1"><s:text name="global.lbl.verify.password" /></td>
	<td class="col-md-1"><input id="verifyPwd" name="verifyPwd" type="password" value=""/></td>
	<td class="col-md-1">&nbsp;</td>
	<td class="col-md-1">&nbsp;</td>
</tr>
<tr class="active">
	<td colspan="4" width="100%" height="25" align="center">
			<input type="submit" name="" value="<s:text name="global.btn.save" />" onClick="return comparePwd();">
			<input type="reset" name="" value="<s:text name="global.btn.clear" />">
	</td>
</tr>
</table>
</div>
</form>
</div>
	
</body>
</html>