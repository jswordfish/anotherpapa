<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <jsp:useBean id="nationalityBean" class="com.infrasofttech.bean.NationalityBean" /> --%>
<!-- refer example for fetching drop downs from bean -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/stylesheet.css" />" />
<!-- for text-fields and labels -->
<link rel="stylesheet" href="<c:url value="/css/jquery-ui.css" />" />
<!-- for date  -->
<script src="validate.js" type="text/javascript"></script>
<!-- for front end validation -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<!-- All internal validations -->
<script language="javascript">


	 
	 function validateForm() {
		// alert("inside if validateForm");
		 
		 var roleCode = document.forms["frmEditRole"]["roleCode"].value;
		    if (roleCode == null || roleCode == "") {
		        alert("Role Code is Must");		       
		        return false;
		    }
		 
		var roleName= document.forms["frmEditRole"]["roleName"].value;
			if(roleName==null || roleName==""){
				alert("Role Name is must");				
				return false;
			}
		
		} 
	 
	 function startUp() {
			document.getElementById("idRoleCode").focus();
		}
</script>

</head>

<body onLoad="javascript:startUp();">
	<form id="omniform" name="frmEditRole" method="POST" action="RoleMenuMapUpdateAction" onsubmit="return validateForm()">
		<div><input type="hidden" name="vToken"><input type="hidden" name="id" value="<s:property value="roleMst.id"/>"></div>
		<div id="idPageTitle" class="pageTitle" style="display:block">&nbsp;<s:text name="global.pageTitle.rolemenu.add"></s:text></div>
		<div id="idErrMsg"  align="center"  style="display:block ; color: red; size:2 "><s:property value="errMsg"/></div>
		<div  id="idErrTbl"  class="errorDiv" style="display:none"><p id="el"></p></div>

		<div align="center">
		<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<font face="Calibri" size="2"><s:text
							name="global.lbl.role.code" /></font>
				</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
					<input type="text" name="roleCode" value="<s:property  value="roleMst.roleCode" />" readonly="readonly" id="idRoleCode" size="10" class="mediumTxtLeftAlign">
					
			
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					&nbsp;<font face="Calibri" size="2"><s:text
							name="global.lbl.role.name" /></font>
				</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
					<input type="text" name="roleName" value="<s:property  value="roleMst.roleName" />"  id="idRoleName" size="10" class="mediumTxtLeftAlign">
				</td>
				
			</tr>

		</table>
		<table width="100%">
			<tr height="25" bgcolor="#9999FF">
				<td width="100%" align="left"
					style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;
					padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					<input name="editRoleName" type="submit" value="<s:text name="global.btn.edit.map.menu.access"/>" class="bigbtn" >
				</td>
			</tr>
		</table>
		</div>
	</form>


</body>
</html>