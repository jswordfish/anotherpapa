<%@page import="com.infrasofttech.dto.BranchMst"%>
<%@page import="com.infrasofttech.services.BranchMstServiceImpl"%>
<%@page import="com.infrasofttech.services.AuthEventServiceImpl"%>
<%@page import="com.infrasofttech.dto.AuthEvent"%>
<%@page import="com.infrasofttech.dto.AuthMatrix"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script language="javascript">
	var i;
	var j = 1;
	var count1 = 1;
	var count2 = 1;
	var newCount;
	function disable() {
		if (count1 >= 1) {
			document.getElementById("idAdd").disabled = true;
		}
		count1++;
	}
	function disableSave() {
		document.getElementById("idSave").disabled = true;
	}

	function view() {
		window.location.href = "<s:url value="AuthMatrixMgmt"/>";
	}

	function disableAuthBy() {
		var mode = document.getElementById("idAuthMode").value;
		if (mode == "SELF") {
			document.getElementById("idAuthBy").disabled = true;
		} else {
			document.getElementById("idAuthBy").disabled = false;
		}
	}

	function enable() {
		document.getElementById("idSave").disabled = false;
	}

	function add() {
		/* document.getElementById("idClear").disabled = false;
		document.getElementById("idUpdate").disabled = false; */
		var table = document.getElementById("tblData1");
		//Find a <table> element with id="myTable":

		// Create an empty <tr> element and add it to the 1st position of the table:
		var row = table.insertRow(1);

		// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		var cell6 = row.insertCell(5);
		var cell7 = row.insertCell(6);
		// Add some text to the new cells:
		cell1.innerHTML = '<select name="basedOnCode" id="idBasedOnCode" tabindex="2"><c:forEach var="authSlab" items="${authMatrixSlabs1}"><option value="${authSlab.basedOnCode}">${authSlab.basedOnCode}</option>	</c:forEach></select>';
		cell2.innerHTML = '<input type="text" id="idFromRange" name="fromRange" tabindex="3"/>';
		cell3.innerHTML = '<input type="text" name="toRange" id="idToRange" tabindex="4"/>';
		cell4.innerHTML = '<select  name="authType"  tabindex="5" id="idAuthType"><c:forEach var="authSlabs" items="${authMatrixSlabs1}"><option value="${authSlabs.authType}">${authSlabs.authType}</option></c:forEach></select>';
		cell5.innerHTML = '<select  name="authMode" id="idAuthMode" onchange="disableAuthBy();" tabindex="6" headerValue="MULTI"><c:forEach var="authSlabs" items="${authMatrixSlabs1}"><option value="${authSlabs.authMode}">${authSlabs.authMode}</option></c:forEach></select>';
		cell6.innerHTML = '<input type="text"  id="idAuthBy" class="input" name="countOfAuthorizers" tabindex="7"><a href="#" onclick="dynamicAddAutoDelete();">DEF</a> ';
		cell7.innerHTML = '<input type="button" id="idDel" tabindex="1" class="smallbtn" value ="DEL" onclick="deleteRow(this);"/> ';

		cell1.style.width = '1%';
		cell2.style.width = '1%';
		cell3.style.width = '1%';
		cell4.style.width = '1%';
		cell5.style.width = '2%';
		cell6.style.width = '2%';
		cell7.style.width = '1%';
		j++;
	}

	function dynamicAddAutoDelete() {
		var table = document.getElementById("tblData2");
		var mlNo = document.getElementById("idAuthBy").value;
		alert("MLNO:" + mlNo);
		alert("value of j is:" + j);
		if (count1 > 1) {
			//table.innerHTML = "";
			count2 = 0;
			//alert("after delete " + count2 + " row");
		}
		for (var i = mlNo; i >= 1; i--) {
			alert("role" + i);
			//alert("inside for loop....");
			var row = table.insertRow(0);
			var cell1 = row.insertCell(0);
			cell1.innerHTML = 'Rank:'
					+ i
					+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Roles:<select multiple="multiple" name="role'+i+'" id="idRole'+i+'" ><c:forEach var="roles" items="${roleMsts1}"><option value="${roles.roleCode}">${roles.roleName}</option></c:forEach></select>';
			count2++;
		}
		count2;
		//alert("row count " + count2);
		count1++;
	}

	function deleteRow(row) {
		i = row.parentNode.parentNode.rowIndex;
		document.getElementById('tblData1').deleteRow(i);
	}

	function list() {
		document.getElementById("idList").action = "AuthMatrixMgmt";
	}

	//Ajax to save Data of authmatrixslab
	$(document).ready(function() {
		$('#idSave').click(function(e) {
			e.preventDefault();
			var basedOnCode = $("#idBasedOnCode").val();
			var fromRange = $("#idFromRange").val();
			var toRange = $("#idToRange").val();
			var authType = $("#idAuthType").val();
			var authMode = $("#idAuthMode").val();
			var authBy = $("#idAuthBy").val();
			var roles = new Array();
			for (var i = 1; i <= authBy; i++) {
				alert("authBy:" + i);
				var temp = $('#idRole' + i).val();
				roles.push(temp);
				alert("roles" + i + "::" + temp);
			}

			$.ajax({
				url : "AuthMatrixSlabSave",
				data : {
					'basedOnCode' : basedOnCode,
					'fromRange' : fromRange,
					'toRange' : toRange,
					'authType' : authType,
					'authMode' : authMode,
					'authBy' : authBy,
					'roles' : roles

				},
				type : "post",
				cache : false,
				success : function(data) {
					$("#idBasedOnCode").prop("disabled", "disabled");
					$("#idFromRange").prop("readonly", "readonly");
					$("#idToRange").prop("readonly", "readonly");
					$("#idAuthType").prop("disabled", "disabled");
					$("#idAuthMode").prop("disabled", "disabled");
					$("#idAuthBy").prop("readonly", "readonly");

					for (var i = 1; i <= authBy; i++) {
						$('#idRole' + i).prop("disabled", "disabled");
					}

					$("#idErrMsg").show();
					$("#idErrMsg").fadeOut(7200);
					$("#idSave").prop("disabled", true);
					$("#idAdd").prop("disabled", false);

				}
			});
		});
	});
</script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/stylesheet.css" />">
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/AuthMatrixMgmtSave.js"></script>
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="disableSave();">
	<form name="authMatrixSlabSave" id="formHomeId"
		action="AuthMatrixSlabSave" method="post">
		<div>
			<input type="hidden" name="vToken">
		</div>
		<div id="idPageTitle" class="pageTitle" style="display: block">
			&nbsp;
			<s:text name="global.title.auth.matrix.slab"></s:text>
		</div>
		<div id="idErrMsg" class="errorDiv" style="display: none"
			align="center">
			<s:text name="errMsg">
				<font color="darkGreen" size="2">Record Saved Successfully!</font>
			</s:text>
		</div>
		<div id="idErrTbl" class="errorDiv" style="display: none">
			<p id="el"></p>
		</div>

		<table>
			<tr>
				<td width="100%"></td>
			</tr>
		</table>
		<%-- <s:hidden name="authMatrix" /> --%>
		<!--  <input type="hidden" name="authMatrix"/> -->
		<input type="hidden" name="authMatrixSlabs1" id="idAuthEventSlabList" />
		<input type="hidden" name="roleMsts1" id="IdRolesList" /> <input
			type="hidden" name="srNo" id="IdRolesList" />
		<!-- <br><font face="verdana" size="2"><div id="message"></div></font> -->
		<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
			<tr height="35" bgcolor="#0000FF">
				<td width="25%" valign="middle" colspan="4" bgcolor="#0000FF"
					valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
					face="Calibri" size="2" color="#FFFFFF"></font>
				</td>

			</tr>
			<tr>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px dotted #C0C0C0; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<font face="Calibri" size="2"><s:text
							name="global.lbl.event" />&nbsp;</font>
				</td>
				<%
					AuthEvent authEvent = new AuthEvent();
					AuthEventServiceImpl authEventServiceImpl = new AuthEventServiceImpl();

					String authEvents = request.getParameter("authEvents");
					Long id = Long.parseLong(authEvents);
					authEvent = authEventServiceImpl.getListByid(id);
				%>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<select size="1" name="authEvents" id="selected record"
					style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
						<option selected="selected" disabled="disabled"><%=authEvent.getAuthEventCode()%>:<%=authEvent.getAuthEventName()%></option>
				</select>
				</td>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
					face="Calibri" size="2">&nbsp;<s:text name="global.lbl.name" />&nbsp;
				</font></td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<input type="text" tabindex="2" name="authMatrixName"
					value="<%=request.getParameter("authMatrixName")%>"
					readonly="readonly" size="30"
					style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" />
				</td>
			</tr>
			<tr>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<font face="Calibri" size="2"><s:text
							name="global.lbl.branches" /></font>
				</td>

				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<select multiple="multiple" name="branch" size="5"
					disabled="disabled">
						<c:forEach var="branch" items="${branchMsts}">
							<option value="${branch.id}">${branch.branchCode}:
								${branch.branchName}</option>
						</c:forEach>
				</select>
				</td>

				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
					face="Calibri" size="2">&nbsp;<s:text
							name="global.lbl.currency" />&nbsp;
				</font></td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<select multiple="multiple" name="currency" size="5"
					disabled="disabled">
						<c:forEach var="currency" items="${currencyMsts}">
							<option value="${currency.id}">${currency.currencyISOCode}:${currency.currencyName}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<font face="Calibri" size="2"><s:text
							name="global.lbl.eff.from" />&nbsp;</font>
				</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<input type="text" name="effFromDate"
					value="<%=request.getParameter("effFromDate")%>"
					readonly="readonly" id="idEffFrom" tabindex="18" />
				</td>
				<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
					<font face="Calibri" size="2">&nbsp;&nbsp;<s:text
							name="global.lbl.eff.till" />&nbsp;
				</font>
				</td>
				<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
					style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
					<input type="text" name="effTillDate" class="mediumTxtLeftAlign"
					value="<%=request.getParameter("effTillDate")%>"
					readonly="readonly" id="idEffTill" tabindex="18" />
				</td>
			</tr>

		</table>

		<table width="100%" cellpadding="0" cellspacing="1">
			<tr height="25">
				<td width="30%" align="center"
					style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					<input type="button" tabindex="1" class="smallbtn"
					value=" <s:text name="global.btn.add"/> " id="idAdd" class="button"
					onclick="add();disable();enable();" /> &nbsp;
				</td>
			</tr>
		</table>
		<!-- List table -->

		<div id="idDiv"
			style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
			<input type="hidden" id="crw" />

			<!-- List table -->
			<table class="entry" id="tblData1" width="100%">

				<tr>
					<td height="15" bgcolor="#CCCCFF" align="left"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="BasedOn" /></font></b></td>
					<td height="15" bgcolor="#CCCCFF" align="left"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="From" /></font></b></td>
					<td height="15" bgcolor="#CCCCFF"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="To" /></font></b></td>
					<td height="15" bgcolor="#CCCCFF" align="left"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="Type" /></font></b></td>
					<td height="10" bgcolor="#CCCCFF" align="left"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="Mode" /></font></b></td>
					<td height="15" bgcolor="#CCCCFF" align="left"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="AuthBy" /></font></b></td>
					<td height="15" bgcolor="#CCCCFF" align="left"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="Action" /></font></b></td>
				</tr>

			</table>
			<table id="tblData2" align="center">
			</table>
			<table align="center">
				<tr class="trList">
					<td><input type="submit"
						value="<s:text name="global.btn.save"/>" class="smallbtn"
						id="idSave" /></td>
					<td><input type="button"
						value="<s:text name="global.btn.view"/>"
						onclick="javasript:view();" class="smallbtn" /></td>
				</tr>
			</table>
		</div>
	</form>

	<script type="text/javascript">
		new FormValidator(
				'authMatrixSlabSave',
				[ {
					name : 'fromRange',
					display : 'FromRange',
					rules : 'required'
				}, {
					name : 'toRange',
					display : 'ToRange',
					rules : 'required'
				}, {
					name : 'authBy',
					display : 'AuthBy',
					rules : 'required'
				}, {
					name : 'role' + i + '',
					display : 'Role',
					rules : 'required'
				}, ],
				function(errors, evt) {

					if (errors.length > 0) {
						var errorString = '';
						document.getElementById("idErrTbl").style.display = "inline";
						for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
							errorString += errors[i].message + '<br />';
						}

						document.getElementById("el").innerHTML = errorString;
					}
				});
	</script>
</body>

</html>
