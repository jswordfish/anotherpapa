<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>

<head>

<link href="css/stylesheet.css" rel="stylesheet" />


<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="validate.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
	
</script>
<script type="text/javascript" src="functions.js"></script>

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<style>
</style>
<script language="javascript">
	var i;
	function startUp() {
	}
	function add() {
		alert("add funtion");
		
		/*  var x=document.getElementById("idPurposeCode");
		 alert("x.options.length..."+x.options.length);
		  for (var i = 0; i < x.options.length; i++) {
		     if(x.options[i].selected ==true){
		          alert("x.options[i].selected..."+x.options[i].value);
		      }
		  } */
		  var allSchools = [];
		  var s = document.getElementById("idPurposeCode");
		             alert("idPurposeCode lenght  " + s.options.length);
		             for (var i = 0; i < s.options.length; i++) {
		                 if (s.options[i].selected == true) {
		                     var schoolid = s.options[i].text;
		                    // var comma=schoolid.replace(",", " "); 

		                     alert(s.options[i].text);
		                         allSchools.push(schoolid);
		                 }
		           
		             }
		             
		             var purposeCodeIds = [];
		   		  var s = document.getElementById("idPurposeCode");
		   		             alert("idPurposeCode lenght  " + s.options.length);
		   		             for (var i = 0; i < s.options.length; i++) {
		   		                 if (s.options[i].selected == true) {
		   		                     var schoolid = s.options[i].value;
		   		                    // var comma=schoolid.replace(",", " "); 

		   		                     alert(s.options[i].text);
		   		                  purposeCodeIds.push(schoolid);
		   		                 }
		   		           
		   		             }
		alert(allSchools);
		document.getElementById("idClear").disabled = false;
		var table = document.getElementById("tblData");
		var row = table.insertRow(1);
		var sel = document.getElementById("idProdCode");
		var text = sel.options[sel.selectedIndex].text;
		var sel1 = document.getElementById("idPurposeCode");
		var text1 = sel1.options[sel.selectedIndex].text;
		

		
		var sel2 = document.getElementById("idProdCode");
		var productId = sel2.options[sel2.selectedIndex].value;
		
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		// Add some text to the new cells:

			cell1.innerHTML = productId;
			cell2.innerHTML = purposeCodeIds;
		cell3.innerHTML = text;
		//cell2.innerHTML = text1;
		cell4.innerHTML=allSchools;
		cell5.innerHTML = '<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

	
		clearing();
		var tableid = "tblData";
		alert("value of tableid"+tableid);
		var tbl = document.getElementById(tableid);
		alert("value of tbl"+tbl);
		var tableValues = getMLValues(tableid);
		
		alert("tableValues..."+tableValues);
		var MlVal=getMultiArrayStringMargin(tableValues);
		alert("MlVal....."+MlVal);
		document.forms[0].mlValue.value=MlVal;
		alert("document.forms[0].mlValue.value.  from add...."+document.forms[0].mlValue.value);
	}
	function deleteRow(row) {
		i = row.parentNode.parentNode.rowIndex;
		document.getElementById('tblData').deleteRow(i);
	}
	
	function clearing() {

		var sel = document.getElementById("idProdCode");
		var text = sel.options[sel.selectedIndex].text;
		var sel1 = document.getElementById("idPurposeCode");
		var text1 = sel1.options[sel.selectedIndex].text;
		sel.value === false;
		sel1.value === false;
	}

	function save() {
		
		//alert("in save");
		
		var tableid = "tblData";
		//alert("value of tableid"+tableid);
		var tbl = document.getElementById(tableid);
		//alert("value of tbl"+tbl);
		var tableValues = getMLValues(tableid);
		
		//alert("tableValues..."+tableValues);
		var MlVal=getMultiArrayStringMargin(tableValues);
		//alert("MlVal....."+MlVal);
		document.forms[0].mlValue.value=MlVal;
		alert("document.forms[0].mlValue.value..from save...."+document.forms[0].mlValue.value);
		document.forms["formHomeId"].submit();
	}

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
		alert("inside getRowValues");
		var rowValues = new Array();
		var colValues = new Array();
		var tds = row.getElementsByTagName("td");
		alert("tds.value is..."+tds.value);
		var fld =" ";
		//alert(tds.length-1);
		for (var r=0;r<tds.length-1 ;r++ )
		{
		
			if(tds[r].hasChildNodes()){
				var x=tds[r].firstChild.nodeValue;
				alert("x value is  .. "+x);
				if(x.options)
					alert("x.options  is "+x.options);
				/* if(x.length>1){
				 for (var i = 0; i < x.options.length; i++) {
					 alert("we are in for lop");
				     if(x.options[i].selected ==true){
				          alert("x.options[i].selected..."+x.options[i].selected);
				      }
				  }
				}else */
				fld = tds[r].firstChild.nodeValue;
			}
			else fld=" ";
			alert("fld..."+fld);
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
			   // alert("sely  ..."+sely);
				str = str+sely[0]+'~'; 
			}
			str = str + '!';		
		}
		//alert("getMultiArrayStringMargin..."+str);
		return str;
	}
	
</script>
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">
		<table id="idErrTbl" style="display: none">
			<tr>
				<td valign="middle" align="left" bgcolor="#FFAAAA"><font
					face="Calibri" size="3" color="#000000">
						<p id="el">Hi</p>
				</font></td>
			</tr>
		</table>

		<form name="formHome" id="formHomeId" action="AddPurposeCodeDetailsSave" method="post">

			<table id="idTblTitle"  width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text name="global.menu.purposeCodeDetails.master" /></font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri">&nbsp;<s:text
										name="global.lbl.branch.code" />: 02
							</font></b>
					</td>
				</tr>
			</table>
			<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
				<tr height="35" bgcolor="#0000FF">
					<td width="25%" valign="middle" colspan="4" bgcolor="#0000FF"
						valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2" color="#FFFFFF"><b>Talegaon
								Primary Agriculture Society</b></font>
					</td>
				</tr>
				<tr height="5%">
				
					
					<%-- <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
						&nbsp;&nbsp;
						<s:select label="global.lbl.product" multiple="true" name="products1" size="4" id="idProdCode"
								  list="products1" listKey="id" listValue="prodCode+'-'+prodName" emptyOption="false"
								  style="font-family: Calibri; font-size: 10pt; width:200px" />
					</td>
					<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
						align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
						&nbsp;&nbsp;
						<s:select  label="global.lbl.purpose" multiple="multiple" name="purposeCode1" size="10" id="idPurposeCode"
 								  list="purposeCode1" listKey="id" listValue="purposeCode+'-'+purposeDesc" emptyOption="false"
 								  style="font-family: Calibri; font-size: 10pt; width:200px" /> 
 								  
 								  <s:select list="purposeCode1" name="purposeCode1" id="idPurposeCode" multiple="true"   listKey="id" listValue="purposeCode+'-'+purposeDesc"></s:select>
					</td> --%>
					
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.product" />&nbsp;</font>
					</td>
					<td required width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="products1"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>-Select[1001]-</option>
							<option>-Select[1002]-</option>
							<option>-Select[1003]-</option>
							<option>-Select[1004]-</option>
					</select>
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.purpose" />&nbsp;</font>
					</td>
					<td required width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="purposeCode1"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<option>-Select[1001]-</option>
							<option>-Select[1002]-</option>
							<option>-Select[1003]-</option>
							<option>-Select[1004]-</option>
					</select>
					</td>
					
					
				</tr>
				
			
			</table>

	
				<table>
					<tr>
						<td><font face="Calibri" size="1pt"></font></td>
					</tr>
				</table>

				<table width="100%" cellpadding="0" cellspacing="1">
					<tr height="25">
						<td width="30%" align="center"
							style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
							<input type="submit" value=" <s:text name="global.btn.save"/> "
							class="button" tabindex="31" />&nbsp;
							<input type="button" value=" <s:text name="global.btn.add"/> "
							id="idAdd" class="button" onclick="add();"> &nbsp;  <input
							type="button" value=" <s:text name="global.btn.clear"/> "
							id="idClear" class="button" onclick="clearing();">&nbsp; 	
						</td>
					</tr>
				</table>

				<table>
					<tr>
						<td><font face="Calibri" size="1pt"></font></td>
					</tr>
				</table>
				<div>
					<input type="hidden" id="crw">

					<!-- List table -->
					<table id="tblData" width="100%" cellpadding="0" cellspacing="1">

						<tr>
						<td><input type="hidden"> </td>
                        <td><input type="hidden"> </td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Product" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Purpose" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Action" /></font></b></td>
						</tr>

					</table>
				</div>
			<input type="hidden" value="mlValue" name="mlValue">
		</form>

	</div>


</body>

</html>