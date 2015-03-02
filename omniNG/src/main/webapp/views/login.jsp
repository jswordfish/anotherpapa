<%@page import="com.infrasofttech.domain.entities.LanguageMst"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/stylesheet.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="validate.js"></script>

<script>
function startUp(){
//	ConcurrentLoginFunction();

	document.getElementById("idBranchCode").focus();
}
</script>
<%-- <script>
function ConcurrentLoginFunction() {
    var x= "Concurrent Logins NOT Allowed!";
    if(simulationInfos.innerHTML==x){
    if (confirm("Do you want kill previous session?") == true) {
    	window.location.href = "<s:url value="LogoutPage"/>";
    } else {
       return true;
    }
    }else return true;
}
</script> --%>
</head>

<body bgcolor="#F5F5F3" topmargin="0" leftmargin="0" onLoad="javascript:startUp();">
<form name="frmLogin" id="omniform" method="POST" action="ValidateLoginUser">
<%
	String errMsg = (String)request.getAttribute("errMsg");
	if(null==errMsg) {errMsg="";}
%>
	<br>
	<div id="errors"></div>
	<div align="center">
		<font face="Calibri" size="3" color="#FF0000"><b>
			<span id="simulationInfos"><%= errMsg %></span>
		</b></font>
	</div>
	<div align="center">

	<table id="idErrTbl" style="display: none">
		<tr>
			<td valign="middle" align="left" bgcolor="#FFAAAA"><font
					face="Calibri" size="3" color="#000000"></font>
			</td>
		</tr>
	</table>

	<table width="350" cellspacing="0">
		<tr>
			<td>
				<table width="350" cellspacing="0" border="0">
						
					<tr height="5" bgcolor="#FFFFFF">
						<td colspan="2" width="100%" align="right">&nbsp;</td>
					</tr>

					<tr height="25">
						<td width="100" align="right"><label class="label"><s:text name="global.lbl.tenant" />&nbsp;:&nbsp;</label></td>
						<td width="250" align="left">
							<%= request.getSession().getAttribute("tenantName") %>
						</td>
					</tr>
					<tr height="25">
						<td width="100" align="right"><label class="label"><s:text
									name="global.lbl.branch.code" />&nbsp;:&nbsp;</label></td>
						<td width="250" align="left"><input name="branchCode"
							id="idBranchCode" class="largeTxtLeftAlign" /></td>
					</tr>
					<tr height="25">
						<td width="100" align="right">
						<label class="label"><s:text name="global.lbl.login.id" />&nbsp;:&nbsp;</label>
						</td>
						<td width="250" align="left"><input name="loginId"
							id="idLoginId" class="largeTxtLeftAlign" />
							<input type="hidden" name="tenantCode" id="tenantCode" 
									value="<%= request.getSession().getAttribute("tenantCode") %>" >
							<input type="hidden" name="tenantGrpCode" id="tenantGrpCode" 
									value="<%= request.getSession().getAttribute("tenantGrpCode") %>" >
						</td>
					</tr>
					<tr height="25">
						<td width="100" align="right"><label class="label">&nbsp;
						</label></td>
						<td width="250" align="left">
							<input type="submit"	class="button" value="<s:text name="global.btn.continue"/>" />
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr height="5">
						<td width="100" align="right"><label class="label"><s:text name="global.lbl.language" /></label>&nbsp;:&nbsp;</td>
						<td width="250" align="left">
							<!-- name="selected record" -->
							<%
								List<LanguageMst> languages = (List<LanguageMst> )session.getAttribute("languages");
							%>						
								<select id="languageCode" name="languageCode" class="mediumselect"> 
							<%	for(LanguageMst language: languages){
							%>	
									<option value="<%= language.getLanguageCode() %>">
										<%= language.getLanguageName() %>
									</option>
							<%
								}  // END OF FOR LOOP
							%>
								</select>
						</td>
					</tr>
					
					<tr height="5">
						<td width="100" align="right"><label class="label"></label></td>
						<td width="250" align="left"></td>
						<td></td>
					</tr>
					<tr height="25" valign="middle">
						<td width="100" align="right"><label class="label">
								&nbsp;
						</label></td>
						<td width="250" align="left" valign="top">
							
						</td>
						<td>&nbsp;
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br><br><br><br><br><br><br>
	<table height="40" width="100%"><tr>
	<td width="100%" align ="right">
		<img alt="logo" src="media/logo/infrasofttech_logo.jpg"  
			  alt="InfrasoftTech" style="border-width:0px;">
	</td></tr>
	</table>
	<!-- <img alt="Search" src="media/icons/search.png" width="16" height="16"> -->
		</div>
		
	<%-- 	<script type="text/javascript"> --%>
	<!-- // 		new FormValidator( -->
	<!-- // 				'frmLogin', -->
	<!-- // 				[ { -->
	<!-- // 					name : 'branchCode', -->
	<!-- // 					display : 'branch code', -->
	<!-- // 					rules : 'required|numeric' -->
	<!-- // 				}, { -->
	<!-- // 					name : 'loginId', -->
	<!-- // 					display : 'Login Id', -->
	<!-- // 					rules : 'required|alpha_numeric|min_length[4]' -->
	<!-- // 				},], -->
	<!-- // 				function(errors, evt) { -->
	
	<!-- // 					if (errors.length > 0) { -->
	<!-- // 						var errorString = ''; -->
	<!-- // 						document.getElementById("idErrTbl").style.display = "inline"; -->
	<!-- // 						for (var i = 0, errorLength = errors.length; i < errorLength; i++) { -->
	<!-- // 							errorString += errors[i].message + '<br />'; -->
	<!-- // 						} -->
	
	<!-- // 						el.innerHTML = errorString; -->
	<!-- // 					} -->
	<!-- // 				}); -->
	<%-- 	</script> --%>
</form>
</body>
</html>
