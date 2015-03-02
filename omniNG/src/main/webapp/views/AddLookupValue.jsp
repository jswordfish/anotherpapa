<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<link href="../menucss/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>
<style>
</style>
<script language="javascript">

	var i;
	function startUp() {

		/* document.forms[0].mlValue.value=""; */
		//document.getElementById("idProductCode").focus();
		var table = document.getElementById("tblData");
		var numOfRows = table.rows.length;

		if (numOfRows == 1) {
			document.getElementById("idAdd").disabled = false;
			document.getElementById("idUpdate").disabled = true;
			document.getElementById("idClear").disabled = true;
		} else {

			document.getElementById("idUpdate").disabled = false;
			document.getElementById("idClear").disabled = false;
		}
	}

/* 	function view() {
		alert("inside view");
		document.forms["idfrmLookupValue"].submit();  
		window.location.href = "<s:url value="LookupValueView"/>";
	} */

	
	/* <input type="submit" name="action1" value="Invoke action 1" /> */
	
	/* function nullValidate() {

		alert("inside if nullValidate");
		view();
		
	} */

	function add() {
	
		alert("inside add");
		var table = document.getElementById("tblData");

		//Find a <table> element with id="myTable":

		// Create an empty <tr> element and add it to the 1st position of the table:
		var row = table.insertRow(1);

		// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idCode").value;
		cell2.innerHTML = document.getElementById("idDisplay").value;
		cell3.innerHTML = '<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

		//alert("value of idCode"+document.getElementById("idCode").value);
		//alert("value of idDisplay"+document.getElementById("idDisplay").value);
		//clearing();
		var tableid = "tblData";
		var tbl = document.getElementById(tableid);
		var tableValues = getMLValues(tableid);
		alert("tableValues..."+tableValues);
		var MlVal = getMultiArrayStringMargin(tableValues);
		alert("MlVal....."+MlVal);
		document.forms[0].mlValue.value = MlVal;
		alert("document.forms[0].mlValue.value..."+document.forms[0].mlValue.value);
	}
	function deleteRow(row) {
		i = row.parentNode.parentNode.rowIndex;
		document.getElementById('tblData').deleteRow(i);

	}
	/* function editbtn() {
	 edit(this);
	

	 } */
	
	

/* 	function clearing() {

	
		document.getElementById("idCategory").value = '';
		document.getElementById("idType").value = '';
		document.getElementById("idDescription").value = '';
		document.getElementById("idMinNum").value = '';
		document.getElementById("idMaxNum").value = '';

		
	} */

	/*  function save() {
		alert("inside save");
		var tableid = "tblData";
		var tbl = document.getElementById(tableid);
		var tableValues = getMLValues(tableid);
		var MlVal = getMultiArrayStringMargin(tableValues);
		document.forms["idfrmLookupValue"].mlValue.value = MlVal;

		document.forms["idfrmLookupValue"].submit();

		  window.location.href = "<s:url value="LookupValueSave"/>";   
	} 
 */
	function cancel() {
		window.location.href = "<s:url value=""/>";
	}

	
	function getMLValues(tableid)   
	{
		//alert("inside getMLValues");
		var tableValues = new Array();
		
		var tbl = document.getElementById(tableid);
		for (var i = 1; i < tbl.rows.length; i++) 
		{
			var rowValues = getRowValues(tbl.rows[i]);
			//alert("rowValues--"+rowValues);
			tableValues[tableValues.length] = rowValues;
			//alert("in side tableValues--"+tableValues);
		}
		return tableValues;
	}
	function getRowValues(row)
	{	
		//alert("inside getRowValues");
		var rowValues = new Array();
		var tds = row.getElementsByTagName("td");
		//alert("tds..."+tds);
		var fld =" ";
		//alert(tds.length-1);
		for (var r=0;r<tds.length-1 ;r++ )
		{
			if(tds[r].hasChildNodes())
				fld = tds[r].firstChild.nodeValue;
			
			else fld=" ";
			//alert("fld..."+fld);
				rowValues[rowValues.length] = fld;
		}
		return rowValues;
	}

	function getMultiArrayStringMargin(multiValues)
	{
		//alert("inside getMultiArrayStringMargin");
		var str = '';
		for (var i =0; i<multiValues.length; i++)
		{ 
			//alert("inside multiValues ");
			//alert("value of multiValues"+multiValues);
			var rowVal = multiValues[i];
		
			for (var j =0; j <rowVal.length;j++)
			{
				//alert("rowVal[j]).."+(rowVal[j].split("~")));
			     var sely=(rowVal[j]).split("~");
			  //  alert("sely  ..."+sely);
				str = str+sely[0]+'~'; 
			}
			str = str + '!';		
		}
		//alert("getMultiArrayStringMargin..."+str);
		return str;
	}
	
	
	function pickDestination()
	{
		/* alert("inside pickDestination "); */
	  //  var a = "/user/" + document.pressed;
	   var a = document.pressed;
	 /*   alert("document.pressed"+document.pressed);
	   alert("value of a"+a); */
	   if( a == "View"){
		alert("inside a");   
	   	//document.getElementById("idfrmLookupValue").action ="LookupValueView" + ".action";
		document.getElementById("idfrmLookupValue").action ="LookupValueView";
	 /*    alert("value of action>>>>"+document.getElementById("idfrmLookupValue").action); */
	    document.forms["idfrmLookupValue"].submit();  
	   	return true;
	   }
	   else if(a == "SAVE"){
		alert("inside a else"); 
		//document.getElementById("idfrmLookupValue").action ="LookupValueSave" + ".action";
		document.getElementById("idfrmLookupValue").action ="LookupValueSave";
	/* 	alert("value of action>>>>"+document.getElementById("idfrmLookupValue").action); */
		document.forms["idfrmLookupValue"].submit();  
		return true;
	   }
	   
	}
</script>
</head>
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">

<%

String code="";
String codeDesc="";
String codeType="";

codeType=(String)request.getAttribute("codeType");
//out.println(codeType);
code= (String)request.getAttribute("code");
//out.println(code);
codeDesc=(String)request.getAttribute("codeDesc");
//out.println(codeDesc);


%>
	<div id="errors"></div>
		<div align="center">
		<font face="Calibri" size="2" color="#FF0000"><b><s:property value="errMsg" /></b></font>
	</div>
	
		<form name="frmLookupValue" id="idfrmLookupValue" method="POST" action="#" onsubmit="return pickDestination();" >
			<s:hidden name="codeType" id="codeType" />
			<s:hidden name="code"  id="code" />
			<s:hidden name="codeDesc" id="codeDesc" /> 
			
			
			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td width="20%"><font face="Calibri" size="2" color="#CC0000">
							&nbsp;&nbsp;&nbsp;</font><font face="Calibri" color="#CC0000">
							LOOKUP VALUE </font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#000000">SUCCESS or FAILURE
							message with green or red background</font><font face="Calibri" size="2"
						color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri">&nbsp;<s:text
										name="global.lbl.branch.code" />&nbsp;: 02
							</font></b>
					</td>
				</tr>
			</table>
			<table id="idTBLookup" width="100%" cellpadding="0" cellspacing="0">
				<tr height="35" bgcolor="#0000FF">
					<td width="100%" valign="middle" colspan="4" bgcolor="#0000FF"
						valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2" color="#FFFFFF"><b>Talegaon
								Primary Agriculture Society</b></font>
					</td>
				</tr>

				<tr>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%"><font
						face="Calibri" size="2">&nbsp;&nbsp;<s:text
								name="global.lbl.lookup.code" />&nbsp;
					</font></td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">&nbsp;&nbsp;
						<%-- <select size="1" name="lookupCode" id="idlookUp"
							style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; 
										padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<c:forEach var="lookupCodes" items="${lookupCodes1}">
								<option value="${lookupCodes.lookupCode}">${lookupCodes.lookupCode}-${lookupCodes.lookupCodeDesc}</option>
							</c:forEach>
						</select> --%>
						<select size="1" id="idlookUp" name="lookupCodeData">
					<option selected="selected" value=<%=request.getAttribute("code")%> ><%=request.getAttribute("code")%>-<%=request.getAttribute("codeDesc")%></option>
						<c:forEach var="lookupCodes" items="${lookupCodes1}">
								
								<option value="${lookupCodes.lookupCode}">${lookupCodes.lookupCode}-${lookupCodes.lookupCodeDesc}</option>
								
							</c:forEach>
						</select>
					</td>
			
						<td>
						 <input type="submit" name="submitData" value="<s:text name="global.btn.view"/>" onclick="document.pressed=this.value"/>
   						 </td>
				</tr>


				<tr>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.code.type" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
						<input type="text" id="idCodeType"  size="40" readonly="readonly" value="<%=request.getAttribute("codeType")%>" >
					</td>
				</tr>

			
				<tr>
				<% if(codeType!=null && !codeType.equals("SYSTEM")) {%>
					
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0" >&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.values" />&nbsp;</font>
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="code" id="idCode" size="40" >
					</td>

					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" name="display" id="idDisplay" size="40">&nbsp;&nbsp;
						
					</td>

					 <td><input type="button"
						value=" <s:text name="global.btn.add"/> " id="idAdd"
						class="button" onclick="add();" ></td> <%} %>
				</tr>
				

				<div>
					<!-- <input type="hidden" id="crw"> -->

					<!-- List table -->
					<table id="tblData" width="100%" cellpadding="0" cellspacing="1">

						<tr>
							<!-- <td><input type="hidden"></td>
							<td><input type="hidden"></td> -->
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Code" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Display" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Action" /></font></b></td>
						</tr>

					</table>
				</div>

					
				<tr height="25" bgcolor="#9999FF">
				<% if(codeType!=null && !codeType.equals("SYSTEM")) {%>
					<td width="30%" align="center"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="submit" name="submitData" value="<s:text name="global.btn.save"/>" onclick="document.pressed=this.value"/>
						&nbsp;
					</td> <%} %>
				</tr>
				
				
			</table>


			<input type="hidden" value="mlValue" name="mlValue">
		</form>

	</div>
</body>

</html>