<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/stylesheet.css" />" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<style>
</style>
<script language="javascript">

	var i;
	function startUp() {

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


	
	
	$(document).ready(function(){
		$("#tblData1").hide();
	  $("#idAdd1").click(function(){
	    $("#tblData1").show();
	  });
	});
	
	
	function add() {
	
		//alert("inside add");
		var table = document.getElementById("tblData2");

		//Find a <table> element with id="myTable":

		// Create an empty <tr> element and add it to the 1st position of the table:
		var row = table.insertRow(1);

		// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idLanguage").value;
		cell2.innerHTML = document.getElementById("idCode").value;
		cell3.innerHTML = document.getElementById("idDisplay").value;
		cell4.innerHTML = '<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

		clearing();
		var tableid = "tblData2";
		var tbl = document.getElementById(tableid);
		var tableValues = getMLValues(tableid);
		//alert("tableValues..."+tableValues);
		var MlVal = getMultiArrayStringMargin(tableValues);
		//alert("MlVal....."+MlVal);
		document.forms["idfrmLookupValue"].mlValue.value = MlVal;
		//alert("document.forms[0].mlValue.value..."+document.forms["idfrmLookupValue"].mlValue.value);
	}
	
	function clearing() {
		//alert("inside clearing");
		document.getElementById("idLanguage").value='';
		document.getElementById("idCode").value='';
		document.getElementById("idDisplay").value='';
		}
	
	
	
	
	function deleteRow(row) {
		i = row.parentNode.parentNode.rowIndex;
		document.getElementById('tblData2').deleteRow(i);

	}
	
	function cancel() {
		window.location.href = "<s:url value=""/>";
	}

	
	function getMLValues(tableid)   
	{
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
		
		var str = '';
		for (var i =0; i<multiValues.length; i++)
		{ 
			
			var rowVal = multiValues[i];
		
			for (var j =0; j <rowVal.length;j++)
			{
				//alert("rowVal[j]).."+(rowVal[j].split("~")));
			     var sely=(rowVal[j]).split("~");
			  // alert("sely  ..."+sely);
				str = str+sely[0]+'~'; 
			}
			str = str + '!';		
		}
		//alert("getMultiArrayStringMargin..."+str);
		return str;
	} 
	
	function pickDestination()
	{
	 //alert("inside pickDestination "); 
	   var a = document.pressed;
	  //alert("document.pressed"+document.pressed);
	   //alert("value of a"+a); 
	   if( a == "VIEW"){
		//alert("inside a");   
		document.getElementById("idfrmLookupValue").action ="LookupValueView";
	   //	alert("value of action>>>>"+document.getElementById("idfrmLookupValue").action); 
	    document.forms["idfrmLookupValue"].submit();  
	   	return true;
	   }
	   else if(a == "SAVE"){
		//alert("inside a else"); 
		document.getElementById("idfrmLookupValue").action ="LookupValueSave";
	 	//alert("value of action>>>>"+document.getElementById("idfrmLookupValue").action); 
		document.forms["idfrmLookupValue"].submit();  
		return true;
	   }
	   
	}
	
	
</script>
</head>
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


	<div id="errors"></div>
		<div align="center">
		<font face="Calibri" size="2" color="#FF0000"><b><s:property value="errMsg" /></b></font>
	</div>
	
	
	
		<form name="frmLookupValue" id="idfrmLookupValue" method="POST" action="" onsubmit="return pickDestination();">
		
		<div><input type="hidden" name="vToken"></div>
		<div id="idPageTitle" class="pageTitle" style="display:block" align="left">&nbsp;<s:text name="global.lbl.lookup.value"></s:text></div>
		<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
		<div  id="idErrTbl"  class="errorDiv" style="display:none">
			<p id="el">
			</p>
			<p id="e2">
			</p>
		</div>
		
			<table id="idTBLookup" width="100%" cellpadding="0" cellspacing="0">
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
						<select size="1" id="idlookUp" name="lookupCodes1">
						<option value="">Select...</option>
						<c:forEach var="lookupCodes" items="${lookupCodes1}">
								<option value="${lookupCodes.id}">${lookupCodes.lookupCode}-${lookupCodes.lookupCodeDesc}</option>
							</c:forEach>
						</select> 
					
					</td>
					
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;&nbsp;<font face="Calibri" size="2"></font>
					</td>
					
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;&nbsp;<font face="Calibri" size="2"></font>
					</td>
					</tr>
					
			</table>
			<table width="100%">
			<tr>
				<td width="100%" bgcolor="#FFFFFF" valign="middle" align="center"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
					<input type="button" tabindex="1"
					value=" <s:text name="global.btn.add"/> " id="idAdd1"  class="smallbtn"/> &nbsp;
					<input type="submit" name="submitData" value="<s:text name="global.btn.view"/>" onclick="document.pressed=this.value" class="smallbtn"/>
				</td>
					
			</tr>
				</table>


		<div id="tblData1" >
		<table>
			<tr>
				<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#CCCCFF" valign="middle" width="20%"><font
						face="Calibri" size="2">&nbsp;&nbsp;<s:text
								name="global.lbl.lookup.details" />&nbsp;
					</font></td>
					<td
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%" >&nbsp;&nbsp;
						<select size="1" id="idLanguage" name="languageMsts1">
						<option value="">Select...</option>
						<c:forEach var="language" items="${languageMsts1}">
								<option value="${language.languageCode}">${language.languageCode}-${language.languageName}</option>
							</c:forEach>
						</select> 
					&nbsp;&nbsp;
						<input type="text" name="code" id="idCode" size="40" >&nbsp;&nbsp;
						<input type="text" name="display" id="idDisplay" size="40">
						 <input type="button"
						value=" <s:text name="global.btn.update"/> " id="idAdd"
						class="button" onclick="add();" >
					</td>
	
				</tr>
			</table>	
				
<BR>
<BR>

			<!-- List table -->
			<table  id="tblData2" width="100%">
				<tr>
					<td height="15" bgcolor="#CCCCFF" align="left"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="global.lbl.language" /></font></b></td>
					<td height="15" bgcolor="#CCCCFF" align="left"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="global.lbl.lookup.value.code" /></font></b></td>
					<td height="15" bgcolor="#CCCCFF"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="global.lbl.lookup.display.value" /></font></b></td>
					<td height="15" bgcolor="#CCCCFF" align="left"
						style="border-bottom: 1px dotted #C0C0C0"><b><font
							face="Calibri" size="2"><s:text name="Action" /></font></b></td>
				</tr>
				</table>
				
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				<BR>
				
				<table width="100%">
				<tr>
					<td width="100%" bgcolor="#CCCCFF" valign="middle" align="center"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;">&nbsp;
					<input type="submit" name="submitData" value="<s:text name="global.btn.save"/>" onclick="document.pressed=this.value" class="smallbtn"/>
				</td>
					
				</tr>
				</table>
				
			
		</div>

			<input type="hidden" value="mlValue" name="mlValue">
		</form>

	</div>
	
	<%-- <script type="text/javascript">
		new FormValidator(
				'frmLookupValue',

				[ {
					name : 'lookupCodes1',
					display : 'Lookup Code',
					rules : 'required'
				}, {
					name : 'languageMsts1',
					display : 'Language',
					rules : 'required'
				}, {
					name : 'code',
					display : 'LookupValue Code',
					rules : 'required'
				}, {
					name : 'display',
					display : 'LookupDisplay',
					rules : 'required'
				}, {
					name : 'moduleType',
					display : 'Module Type',
					rules : 'required'
				},  ],

				function(errors, evt) {

					if (errors.length > 0) {

						var errorString = '';
						document.getElementById("idErrTbl").style.display = "inline";
						for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
							errorString += errors[i].message + '<br />';

						}
						//	alert("js error"+errorString);
						document.getElementById("el").innerHTML = errorString;

					}
				});
	</script> --%>
	
	
	
</body>

</html>