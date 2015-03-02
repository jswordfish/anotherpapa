<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/css/stylesheet.css" />" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/UserAdd1.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script language="javascript">
function startUp(){
	
	document.getElementById("idBranches1").focus();
	
}

function validate1(){
	//alert("in validate::");
	new FormValidator(
			'userAdd1',
			[   {
				name : 'branches1',
				display : 'Branches',
				rules : 'required'
			},{
				name : 'roles1',
				display : 'Roles',
				rules : 'required'
			},  
			{
				name : 'nextPwdChgOn',
				display : 'Next Password Change Date',
				rules : 'required'
			}, ],
			
		    
			function(errors, evt) {
				
//alert("in erroe function");
				if (errors.length > 0) {
				
					var errorString = '';
				  document.getElementById("idErrTbl").style.display = "inline";
					for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
						errorString += errors[i].message + '<br />';
						
					}
				//	alert("js error"+errorString);
				document.getElementById("el").innerHTML = errorString;
				document.getElementById("mlValue").value="";
					
				}
			});
		
		
		addTables1();
		
		
		
	//	alert("end of  validate");
		
		

 }
	

function addTables1(){
	//loadScript("validate.js", myPrettyCode);
	//alert("inside addtables");


	
var tableid = "tblData";
//alert("value of tableid"+tableid);
var tbl = document.getElementById(tableid);
//alert("value of tbl"+tbl);
var tableValues = getMLValues(tableid);

//alert("tableValues..." + tableValues);
var MlVal = getMultiArrayStringMargin(tableValues);
//alert("MlVal....." + MlVal);
document.getElementById("mlValue").value = MlVal;

//document.forms["omniform"].submit();
}</script>
<script language="javascript">
$(document).ready(function() {

	
	$('#datepicker').change(function(e){
	   var dtVal=$('#datepicker').val();
	   if(!ValidateDate(dtVal))
	   {
      $('#idErrTbl').css({"display":"inline"});
      $('#el').html("Effective From Date format should be mm/dd/yyyy");
      $('#datepicker').focus();
	    return false;
	     e.preventDefault();
	   }
	   else
	   {
	   $('#idErrTbl').css({"display":"none"});
	   }
	   
	   });
	

	$('#datepicker2').change(function(e){
		   var dtVal=$('#datepicker2').val();
		   if(!ValidateDate(dtVal))
		   {
	      $('#idErrTbl').css({"display":"inline"});
	      $('#el').html("Effective Till Date format should be mm/dd/yyyy");
	      $('#datepicker2').focus();
		    return false;
		     e.preventDefault();
		   }
		   else
			   {
			   $('#idErrTbl').css({"display":"none"});
			   }
		   
		   });
	

	});


	function ValidateDate(dtValue)
	{
	var dtRegex = new RegExp(/\b\d{1,2}[\/]\d{1,2}[\/]\d{4}\b/);
	return dtRegex.test(dtValue);
	}
</script>

<!-- Start Date Picker  -->
  <script type="text/javascript">
  $(document).ready(
		  
		  /* This is the function that will get executed after the DOM is fully loaded */
		  function () {
		    $( "#idnextPwdChgOn" ).datepicker({
		      changeMonth: true,//this option for allowing user to select month
		      changeYear: true //this option for allowing user to select from year range
		    });
		   
		  }

		);
  </script>
 <!-- End Date Picker  -->
 

</head>

<body onLoad="javascript:startUp();">
	<form  name="userAdd1"method="POST" action="userAddSave" id="omniform">
	<input type="hidden" value="mlValue" name="mlValue" id="mlValue">
	
	<table><tr ><td width="100%"></td></tr></table>
		<div><input type="hidden" name="vToken"></div>
		<div id="idPageTitle" class="pageTitle" style="display:block">&nbsp;<s:text name="global.pageTitle.user.add1"></s:text></div>
		<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
		<div  id="idErrTbl"  class="errorDiv" style="display:none">
			<p id="el" align="left">
			</p>
		</div>
		
	<table><tr ><td width="100%"></td></tr></table>
		<div>
			<table width="100%">
			<tr>
				  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.base.branch" /></font></td>
							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							 <select id="idBranches1" name="userBaseBranchCode" tabindex="1" >
								<c:forEach var="branchMst" items="${branches}" >
									<option value="${branchMst.branchCode}">${branchMst.branchCode}-${branchMst.branchName}</option>
								</c:forEach>
								</select> </td>
								<td width="20%"></td>
								<td width="30%"></td>
						</tr>
			<tr>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
						face="Calibri" size="2" ><s:text
								name="global.lbl.forced.password.change" /></font></td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
						<font face="Calibri"> 
						<input value="true" tabindex="2" name="forcePwdChgYN" checked type="radio" class="radiobutton">
						</font><font size="2">
						<s:text name="global.lbl.yes" />
						</font><input name="forcePwdChgYN" tabindex="3" value="false" type="radio" class="radiobutton"><font
						size="2"> <s:text name="global.lbl.no" /></font>
					</td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.period.in.days" /></font></td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
						<input tabindex="4" name="forcePwdChgDays"  class="smallTxtRightAlign" value="7" type="text" >
					</td>
				</tr>
				<tr>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.forced.minimum.login.frequency" /></font>
					</td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
						<font face="Calibri"> 
							<input value="true" tabindex="5" name="forceMinLoginFreqYN" checked type="radio" class="radiobutton">
						</font><font size="2"><s:text name="global.lbl.yes" /></font> 
						<input name="forceMinLoginFreqYN" value="false" tabindex="6" type="radio" class="radiobutton">
						<font size="2"><s:text name="global.lbl.no" /></font>
					</td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="top" width="20%"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.period.in.days" />&nbsp;
					</font></td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="top" width="30%"><input
						tabindex="7" name="forceMinLoginFreqDays" class="smallTxtRightAlign"
						value="7" type="text"></td>
				</tr>
				<tr>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.max.consecutive.bad.logins.day" /></font></td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
						<input tabindex="8" name="maxConseBadLoginPerDay" class="smallTxtRightAlign"
						value="3" type="text">&nbsp;
					</td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.last.successful.login.on" /></font></td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%"><input
						tabindex="9" id="idLastSuccessfulLoginDateTime" readonly="readonly"
						name="lastSuccessfulLoginDateTime" size="15" value="" class="mediumTxtLeftAlign"
						type="text">&nbsp;
					</td>
				</tr>
				<tr>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.previous.password.changed.on" /></font></td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
						<input tabindex="10" id="idPrevPwdChgOn" name="prevPwdChgOn" readonly="readonly"
						size="15" value="" class="mediumTxtLeftAlign"
						type="text">
					</td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.next.password.change.on" /></font></td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
						
						<font face="Calibri" size="2"><input id="idnextPwdChgOn" type="text" name="nextPwdChgOn"  placeholder="dd/mm/yyyy" size="15"></font>
					</td>
				</tr>
				<tr>
				  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.map.branches" /></font></td>
							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							 <select id="idBranches" name="branches1" tabindex="12" >
							<!--  <option value="">Select...</option> -->
								<c:forEach var="branchMst" items="${branches}" >
									<option value="${branchMst.id}}">${branchMst.branchCode}-${branchMst.branchName}</option>
								</c:forEach>
								</select> </td>
						
								  <td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.map.roles" /></font></td>
							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
							style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
							<select id="idRoles" name="roles1" multiple="multiple" class="multiSelect" tabindex="13" >
							<!-- <option value="">Select...</option> -->
								<c:forEach var="roleMst" items="${roles1}" >
									<option value="${roles1}}">${roleMst.roleCode}-${roleMst.roleName}</option>
								</c:forEach>
								</select></td></tr>
			</table>
			</div>
			<table>
					<tr height="10">
						<td><font face="Calibri" size="1pt"></font></td>
					</tr>
				</table>

				<table width="100%" cellpadding="0" cellspacing="1">
					<tr height="25">
						<td width="30%" align="center"
							style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
							<input type="button" value=" <s:text name="global.btn.add"/> "
							id="idAdd" class="button" onclick="add();" tabindex="14" > &nbsp; <input
							type="button" value=" <s:text name="global.btn.update"/> "
							id="idUpdate" class="button" onclick="update();" tabindex="15" >&nbsp; <input
							type="button" value=" <s:text name="global.btn.clear"/> "
							id="idClear" class="button" onclick="clearing();" tabindex="16" >
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td><font face="Calibri" size="1pt"></font></td>
					</tr>
				</table>
			
				<table id="tblData" width="100%" cellpadding="0" cellspacing="1">

						<tr>

							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="global.lbl.mapped.branches" /></font></b>&nbsp;</td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="global.lbl.mapped.roles" /></font></b>&nbsp;</td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Action" /></font></b></td>
						</tr>
		</table>
	

		<table cellpadding="0" cellspacing="0" width="100%">
			<tr height="25" bgcolor="#9999FF">
				<td
					style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
					align="left" width="20%">&nbsp;</td>
				<td
					style="border-top: 1px solid #000080; border-bottom: 1px solid #000080; adding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
					align="right" width="30%">&nbsp; <input
					value="<s:text name="global.btn.save"/>" onclick="validate1()"
					class="button"
					type="submit" tabindex="17" >
				</td>
				<td
					style="border-top: 1px solid #000080; border-bottom: 1px solid #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
					align="left" width="20%">&nbsp; <input
					value="<s:text name="global.btn.cancel"/>" class="button"
					onclick="javascript:cancel();" type="reset" tabindex="18">
				</td>
				<td
					style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
					align="left" width="30%">&nbsp;</td>
			</tr>
		</table>
		
	</form>
</body>
</html>