<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<link href="../menucss/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>
<style>
</style>
<sx:head />
 <script src="js/PrdAcBasicDtlsAdd.js"></script>
 
 <script>
 
 function toggleTable(tblName){
	 
	 if(tblName=="idBasicDtlsDiv"){		
			document.getElementById("idBasicDtlsDiv").style.display = "block";
			document.getElementById("idPrdAcHolderDiv").style.display = "none";
			document.getElementById("idPrdAcAddressDiv").style.display = "none";
			document.getElementById("idPrdAcNomineeNmDiv").style.display = "none";						
			}
	 if(tblName=="idPrdAcHolderDiv"){		
			document.getElementById("idBasicDtlsDiv").style.display = "block";
			document.getElementById("idPrdAcHolderDiv").style.display = "inline";
			document.getElementById("idPrdAcAddressDiv").style.display = "none";
			document.getElementById("idPrdAcNomineeNmDiv").style.display = "none";						
			}
	 if(tblName=="idPrdAcAddressDiv"){		
			document.getElementById("idBasicDtlsDiv").style.display = "block";
			document.getElementById("idPrdAcHolderDiv").style.display = "none";
			document.getElementById("idPrdAcAddressDiv").style.display = "inline";
			document.getElementById("idPrdAcNomineeNmDiv").style.display = "none";						
			}
	 if(tblName=="idPrdAcNomineeNmDiv"){		
			document.getElementById("idBasicDtlsDiv").style.display = "none";
			document.getElementById("idPrdAcHolderDiv").style.display = "none";
			document.getElementById("idPrdAcAddressDiv").style.display = "none";
			document.getElementById("idPrdAcNomineeNmDiv").style.display = "inline";						
			}
 }
 
function startUp(){
	
	document.getElementById("idPrdAcHolderDiv").style.display = "none";
	document.getElementById("idPrdAcAddressDiv").style.display = "none";
	document.getElementById("idPrdAcNomineeNmDiv").style.display = "none";
}

function save() {
	alert("save Function");
	//window.location.href = "<s:url value="CustomerRegSave"/>";
	document.getElementById("idAcHldDiv").style.display = "inline";
	document.getElementById("idPrdAcAddressDiv").style.display = "none";
	document.getElementById("idPrdAcNomineeNmDiv").style.display = "none";
	
}



/* Dynamic lines for ADDRESS DETAILS */  

function add() {
	document.getElementById("idClearAddress").disabled = false;
	document.getElementById("idUpdateAddress").disabled = false;
	var table = document.getElementById("idAddTblData");

	//	alert("document.getElementById(idVillages1).value..."+document.getElementById("idVillages1").value);
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
	var cell8 = row.insertCell(7);
	var cell9 = row.insertCell(8);
	var cell10 = row.insertCell(9);
	var cell11 = row.insertCell(10);

	// Add some text to the new cells:

	cell1.innerHTML = document.getElementById("idAddressTypePrdAcc").value;
	cell2.innerHTML = document.getElementById("idPrdAccAddress1").value;
	cell3.innerHTML = document.getElementById("idPrdAccAddress2").value;
	cell4.innerHTML = document.getElementById("idPrdAccAddress3").value;
	cell5.innerHTML = document.getElementById("idVillagesPrdAcc").value;
	cell6.innerHTML = document.getElementById("idStatePrdAcc").value;
	cell7.innerHTML = document.getElementById("idMunicipalityPrdAcc").value;
	cell8.innerHTML = document.getElementById("idCountryPrdAcc").value;
	cell9.innerHTML = document.getElementById("idDistrictPrdAcc").value;
	cell10.innerHTML = document.getElementById("idPinCodePrdAcc").value;
	cell11.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

	clearing();
	var tableid = "idAddTblData";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	alert("tableValues..."+tableValues);
	var MlVal = getMultiArrayStringMargin(tableValues);
	alert("MlVal....."+MlVal);
	document.forms["idPrdAcBsicdtlAddForm"].mlVlaueAddress.value = MlVal;
	alert("document.forms].mlVlaueAddress.value..."
			+ document.forms["idPrdAcBsicdtlAddForm"].mlVlaueAddress.value);
}
function edit(row) {
	document.getElementById("idUpdate").disabled = false;
	document.getElementById("idClearNominee").disabled = false;
	document.getElementById("idAdd").disabled = true;
	document.getElementById("idDel").disabled = true;

	var table = document.getElementById("idAddTblData");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idAddressTypePrdAcc = a.cells[0].innerHTML;
	var idPrdAccAddress1 = a.cells[1].innerHTML;
	var idPrdAccAddress2 = a.cells[2].innerHTML;
	var idPrdAccAddress3 = a.cells[3].innerHTML;
	var idVillagesPrdAcc = a.cells[4].innerHTML;
	var idStatePrdAcc = a.cells[5].innerHTML;
	var idMunicipalityPrdAcc = a.cells[6].innerHTML;
	var idCountryPrdAcc = a.cells[7].innerHTML;
	var idDistrictPrdAcc = a.cells[8].innerHTML;
	var idPinCodePrdAcc = a.cells[9].innerHTML;

	document.getElementById("idAddressTypePrdAcc").value = idAddressTypePrdAcc;
	document.getElementById("idPrdAccAddress1").value = idPrdAccAddress1;
	document.getElementById("idPrdAccAddress2").value = idPrdAccAddress2;
	document.getElementById("idPrdAccAddress3").value = idPrdAccAddress3;
	document.getElementById("idVillagesPrdAcc").value = idVillagesPrdAcc;
	document.getElementById("idStatePrdAcc").value = idStatePrdAcc;
	document.getElementById("idMunicipalityPrdAcc").value = idMunicipalityPrdAcc;
	document.getElementById("idCountryPrdAcc").value = idCountryPrdAcc;
	document.getElementById("idDistrictPrdAcc").value = idDistrictPrdAcc;
	document.getElementById("idPinCodePrdAcc").value = idPinCodePrdAcc;

}

function update() {

	//i = row.parentNode.parentNode.rowIndex;

	var table = document.getElementById("idAddTblData");
	var e = table.rows[i];
	e.cells[0].innerHTML = document.getElementById("idAddressTypePrdAcc").value;
	e.cells[1].innerHTML = document.getElementById("idPrdAccAddress1").value;
	e.cells[2].innerHTML = document.getElementById("idPrdAccAddress2").value;
	e.cells[3].innerHTML = document.getElementById("idPrdAccAddress3").value;
	e.cells[4].innerHTML = document.getElementById("idVillagesPrdAcc").value;
	e.cells[5].innerHTML = document.getElementById("idStatePrdAcc").value;
	e.cells[6].innerHTML = document.getElementById("idMunicipalityPrdAcc").value;
	e.cells[7].innerHTML = document.getElementById("idCountryPrdAcc").value;
	e.cells[8].innerHTML = document.getElementById("idDistrictPrdAcc").value;
	e.cells[9].innerHTML = document.getElementById("idPinCodePrdAcc").value;

	document.getElementById("idUpdate").disabled = true;
	document.getElementById("idAdd").disabled = false;
	document.getElementById("idDel").disabled = false;

	clearing();
	var tableid = "idAddTblData";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	alert(MlVal);
	document.forms["idPrdAcBsicdtlAddForm"].mlVlaueAddress.value = MlVal;
	alert(document.forms["idPrdAcBsicdtlAddForm"].mlVlaueAddress.value);
	
}

function clearing() {

	/*  document.getElementById("idPrdAcBsicdtlAddForm").reset();  */
	document.getElementById("idAddressTypePrdAcc").value = '';
	document.getElementById("idPrdAccAddress1").value = '';
	document.getElementById("idPrdAccAddress2").value = '';
	document.getElementById("idPrdAccAddress3").value = '';
	document.getElementById("idVillagesPrdAcc").value = '';
	document.getElementById("idStatePrdAcc").value = '';
	document.getElementById("idMunicipalityPrdAcc").value = '';
	document.getElementById("idCountryPrdAcc").value = '';
	document.getElementById("idMunicipalities1").value = '';
	document.getElementById("idDistrictPrdAcc").value = '';
	document.getElementById("idUpdate").disabled = true;
	document.getElementById("idAdd").disabled = false;
	document.getElementById("idDel").disabled = false;
}

function deleteRow(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('idAddTblData').deleteRow(i);

}

function getMLValues(idAddTblData) {
	var tableValues = new Array();

	var tbl = document.getElementById(idAddTblData);
	for (var i = 1; i < tbl.rows.length; i++) {
		var rowValues = getRowValues(tbl.rows[i]);
		//alert("rowValues--"+rowValues);
		tableValues[tableValues.length] = rowValues;
		//alert("in side tableValues--"+tableValues);
	}
	return tableValues;
}


/* Details Of Nominee */

function addNominee() {
	alert("Add Nominee");
	document.getElementById("idClearNominee").disabled = false;
	document.getElementById("idUpdateNominee").disabled = false;
	var table = document.getElementById("idTblNomineeData");

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
	
	alert("Nominee");
	cell1.innerHTML =  document.getElementById("idDateOfNomination").value;
	cell2.innerHTML =  document.getElementById("idRelationshipNominee").value;
	cell3.innerHTML =  document.getElementById("idNomineeName").value;
	cell4.innerHTML = document.getElementById("idEmailOfNominee").value;
	cell5.innerHTML =  document.getElementById("idDateOfBirthNominee").value;
	
	if (document.getElementById('idNomineeMinorY').checked) {
		cell6.innerHTML = document.getElementById("idNomineeMinorY").value;
		}
	else if(document.getElementById('idNomineeMinorN').checked){
		cell6.innerHTML = document.getElementById("idNomineeMinorN").value;
	}else {
	
		cell6.innerHTML = '';
	}
	
	cell7.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="editNominee(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRowNominee(this);"> ';
	alert("Nominee Testing");
	/* clearingHolderDtls(); */
	/* var tableid = "idTblNomineeData";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	
	var MlVal = getMultiArrayStringMargin(tableValues);
	alert("MlVal....."+MlVal);
	document.forms["idPrdAcBsicdtlAddForm"].mlValueNominee.value = MlVal;
	
	alert("document.forms[0].mlValueNominee.value..."	+ document.forms["idPrdAcBsicdtlAddForm"].mlValueNominee.value); */
	
}
function deleteRowNominee(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('idTblNomineeData').deleteRow(i);

}
function clearingNominee() {

	document.getElementById("idDateOfNomination").value = '';
	document.getElementById("idRelationshipNominee").value = '';	
	document.getElementById("idNomineeName").value = '';
	document.getElementById("idEmailOfNominee").value = '';
	document.getElementById("idDateOfBirthNominee").value = '';
	
	document.getElementById("idUpdateNominee").disabled = true;
	document.getElementById("idAddNominee").disabled = false;
	document.getElementById("idDelNominee").disabled = false;
}

function editNominee(row) {
	document.getElementById("idUpdateNominee").disabled = false;
	document.getElementById("idClearNominee").disabled = false;
	document.getElementById("idAddNominee").disabled = true;
	document.getElementById("idDelNominee").disabled = true;

	var table = document.getElementById("idTblNomineeData");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idNomineeName = a.cells[0].innerHTML;
	var idRelationshipNominee = a.cells[1].innerHTML;
	var idNomineeMinorY = a.cells[2].innerHTML;
	var idDateOfBirthNominee = a.cells[3].innerHTML;
	var idEmailOfNominee = a.cells[4].innerHTML;
	

	document.getElementById("idDateOfBirthNominee").value = idDateOfBirthNominee;
	document.getElementById("idRelationshipNominee").value = idRelationshipNominee;
	document.getElementById("idNomineeMinorY").value = idNomineeMinorY;
	document.getElementById("idNomineeName").value = idNomineeName;
	document.getElementById("idEmailOfNominee").value = idEmailOfNominee;
	

}
function updateNominee() {

	//i = row.parentNode.parentNode.rowIndex;

	var table = document.getElementById("idTblNomineeData");
	var e = table.rows[i];
	e.cells[0].innerHTML = document.getElementById("idDateOfBirthNominee").value;
	e.cells[1].innerHTML = document.getElementById("idRelationshipNominee").value;
	e.cells[2].innerHTML = document.getElementById("idNomineeMinorY").value;
	e.cells[3].innerHTML = document.getElementById("idNomineeName").value;
	e.cells[4].innerHTML = document.getElementById("idEmailOfNominee").value;
	e.cells[5].innerHTML = document.getElementById("idDateOfBirthNominee").value;

	document.getElementById("idUpdateNominee").disabled = true;
	document.getElementById("idAddNominee").disabled = false;
	document.getElementById("idDelNominee").disabled = false;

	clearingNominee();
	var tableid = "idTblNomineeData";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms[0].mlValueNominee.value = MlVal;
}




/*Dynamic lines for Account  Holder DETAILS */
 
function addHolderDtls() {
	document.getElementById("idClearHolderDtls").disabled = false;
	document.getElementById("idUpdateHolderDtls").disabled = false;
	var table = document.getElementById("idHolderTblData");

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
	var cell8 = row.insertCell(7);
	var cell9 = row.insertCell(8);
	var cell10 = row.insertCell(9);
	
	// Add some text to the new cells:


	cell1.innerHTML =  document.getElementById("idNameOfHolder").value;
	cell2.innerHTML =  document.getElementById("idHolder").value;
	cell3.innerHTML =  document.getElementById("idHolderTelephoneCode").value;
	cell4.innerHTML = document.getElementById("idHolderTelephoneNo").value;
	cell5.innerHTML =  document.getElementById("idEmailHolder").value;
	cell6.innerHTML = document.getElementById("idHolderDateBirth").value;
	cell7.innerHTML = document.getElementById("idNoOfHolder").value;
	
	if (document.getElementById('idGenderHolderM').checked) {
		cell8.innerHTML = document.getElementById("idGenderHolderM").value;
		}
	else if(document.getElementById('idGenderHolderF').checked){
		cell8.innerHTML = document.getElementById("idGenderHolderF").value;
	}else {
	
		cell8.innerHTML = '';
	}
	cell9.innerHTML = document.getElementById("idHolderAddress").value;
	cell10.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="editHolderDtls(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRowHolderDtls(this);"> ';

	clearingHolderDtls();
	var tableid = "idHolderTblData";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	
	var MlVal = getMultiArrayStringMargin(tableValues);
	alert("MlVal....."+MlVal);
	document.forms["idPrdAcBsicdtlAddForm"].mlValueHolderDtls.value = MlVal;
	
	alert("document.forms[0].mlValueHolderDtls.value..."	+ document.forms["idPrdAcBsicdtlAddForm"].mlValueHolderDtls.value);
	

}
function clearingHolderDtls() {

	
	document.getElementById("idNameOfHolder").value = '';
	document.getElementById("idHolder").value = '';
	document.getElementById("idHolderTelephoneCode").value = '';
	document.getElementById("idHolderTelephoneNo").value = '';
	document.getElementById("idEmailHolder").value = '';
	document.getElementById("idHolderDateBirth").value = '';	
	document.getElementById("idNoOfHolder").value = '';
	document.getElementById("idEmailHolder").value = '';
	document.getElementById("idHolderDateBirth").value = '';
	document.getElementById("idNoOfHolder").value = '';	
	document.getElementById("idHolderAddress").value = '';
	document.getElementById("idUpdateHolderDtls").disabled = true;
	document.getElementById("idAddHolderDtls").disabled = false;
	document.getElementById("idDelHolderDtls").disabled = false;
}
function deleteRowHolderDtls(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('idHolderTblData').deleteRow(i);

}

function editHolderDtls(row) {
	document.getElementById("idUpdateHolderDtls").disabled = false;
	document.getElementById("idClearHolderDtls").disabled = false;
	document.getElementById("idAddHolderDtls").disabled = true;
	document.getElementById("idDelHolderDtls").disabled = true;

	var table = document.getElementById("idHolderTblData");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idNameOfHolder = a.cells[0].innerHTML;
	var idHolder = a.cells[1].innerHTML;
	var idHolderTelephoneCode = a.cells[2].innerHTML;
	var idHolderTelephoneNo = a.cells[3].innerHTML;
	var idEmailHolder = a.cells[4].innerHTML;
	var idHolderDateBirth = a.cells[5].innerHTML;
	var idNoOfHolder = a.cells[6].innerHTML;	
	var idGenderHolderM = a.cells[7].innerHTML;
	var idHolderAddress = a.cells[8].innerHTML;
	
	document.getElementById("idNameOfHolder").value = idNameOfHolder;
	document.getElementById("idHolder").value = idHolder;
	document.getElementById("idHolderTelephoneCode").value = idHolderTelephoneCode;
	document.getElementById("idHolderTelephoneNo").value = idHolderTelephoneNo;
	document.getElementById("idEmailHolder").value = idEmailHolder;
	document.getElementById("idHolderDateBirth").value = idHolderDateBirth;
	document.getElementById("idNoOfHolder").value = idNoOfHolder;
	document.getElementById("idGenderHolderM").value = idGenderHolderM;
	document.getElementById("idHolderAddress").value = idHolderAddress;
		
}
function updateHolderDtls() {

	alert("update Holder Details");

	var table = document.getElementById("idHolderTblData");
	var e = table.rows[i];
	
	e.cells[0].innerHTML = document.getElementById("idNameOfHolder").value;
	e.cells[1].innerHTML = document.getElementById("idHolder").value;
	e.cells[2].innerHTML = document.getElementById("idHolderTelephoneCode").value;
	e.cells[3].innerHTML = document.getElementById("idHolderTelephoneNo").value;
	e.cells[4].innerHTML = document.getElementById("idEmailHolder").value;
	e.cells[5].innerHTML = document.getElementById("idHolderDateBirth").value;
	e.cells[6].innerHTML = document.getElementById("idNoOfHolder").value;
	e.cells[7].innerHTML = document.getElementById("idGenderHolderM").value;
	e.cells[8].innerHTML = document.getElementById("idNoOfStaff").value;
	e.cells[9].innerHTML = document.getElementById("idRegCode").value;
	
	document.getElementById("idUpdateHolderDtls").disabled = true;
	document.getElementById("idAddHolderDtls").disabled = false;
	document.getElementById("idDelHolderDtls").disabled = false;

	clearingHolderDtls();
	var tableid = "idHolderTblData";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms[0].mlValueHolderDtls.value = MlVal;
}


function getMultiArrayStringMargin(multiValues)
{
	alert('in multiarraystring');
	//alert("multiValues.length....>>>>>"+multiValues.length);
	var str = '';
	for (var i =0; i<multiValues.length; i++)
	{ 
		
		var rowVal = multiValues[i];
	alert("rowVal"+rowVal);
	alert("rowVal.length>>>>>"+rowVal.length);
		for (var j =0; j<rowVal.length;j++)
		{
			//alert("rowVal[j]).."+(rowVal[j].split("~")));
		     var sely=(rowVal[j]).split("~");
		     
			str = str+sely[0]+'~';
			//alert(str);
		}
		str = str + '!';		
	}
	alert("getMultiArrayStringMargin..."+str);
	return str;
}
</script>
 
 
</head>
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	
	

	<div align="left">
		<font face=Calibri size="2"></font>
	</div>

	<form name="prdAcBsicdtlAddForm" id="idPrdAcBsicdtlAddForm" action="prdAcBasicDtls" >
		<input type="hidden" value="vToken">

	
		<!-- Product Account Basic Details -->
			<table>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
			
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a id="miscInfo" onclick="toggleTable('idBasicDtlsDiv');" href="#">
				<s:text name="Product Account Basic Details" /></a>
			</b></font>
			
		</td>
	</tr></table>
</div>
		
<!-- ACCOUNT BASIC DETAILS  -->		

<div id="idBasicDtlsDiv" style="display:block"
	style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	<table  width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td  width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				 style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
		<font face="Calibri" size="2"></font>
			</td>
		</tr>

		<tr>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> <s:text
					name="global.lbl.product" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<select id="idProduct" name="productName">
					<c:forEach var="product" items="${productName}">
						<option value="${product.id}">${product.productCode}:${product.productName}</option>
					</c:forEach>

			</select>
			
		</td>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> <s:text
					name="Account Base Branch" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			
			<select id="idAccBaseBranch" name="CustomerName">
					<c:forEach var="customer" items="${CustomerName}">
						<option value="${customer.id}">${customer.customerCode}:${customer.customerName}</option>
					</c:forEach>
			</select>
			
			
		</td>
	</tr>
		<tr>

		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> 
			<s:text name="Customer Type" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			
			<select id="idCustomerType" name="customerType">
			<c:forEach var="customer" items="${customerType}"> 
			<option value="${customer.id}">${customer.currencyISOCode} : ${customer.currencyName}</option>						
			</c:forEach>
			
		
			</select>
			
		</td>

		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> <s:text
					name="Customer " />&nbsp;
		</font>
		</td>
		<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
			colspan="3">&nbsp; <input type="text" name="eMail" size="30" class="largeTxtRightAlign">
		</td>
	</tr>
				<tr>

		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> <s:text
					name="Currency" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			
			<select id="idCurrency" name="currencyName">
				<c:forEach var="currency" items="${currencyName}"> 
					<option value="${currency.id}">${currency.currencyISOCode} : ${currency.currencyName}</option>						
				</c:forEach>					
			</select>
			
		</td>

		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> <s:text
					name="A/C Name " />&nbsp;
		</font>
		</td>
		<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
			colspan="3">&nbsp; <input type="text" name="accName" size="30" class="largeTxtRightAlign">
		</td>
	</tr>
		
	</table>
</div>

<table>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0">
	<tr height="25" bgcolor="#9999FF">
		<td width="20%" align="left"
			style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
		</td>
		<td width="30%" align="right"
			style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
			<input type="button" value="  <s:text name="global.btn.save" /> "
			class="button" onclick="javascript:save();">
		</td>
		<td width="20%" align="left"
			style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
			<input type="button" value="<s:text name="global.btn.cancel"/>"
			class="button" onclick="javascript:cancel();">
		</td>
		<td width="30%" align="left"
			style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
		</td>
	</tr>
</table>


<table>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>	

	
	<!-- Product Account Holder Details -->
	
<div id="idAcHldDiv" style="display:block">
	<table width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a id="basicInfo" onclick="toggleTable('idPrdAcHolderDiv');" href="#">
				<s:text name="Account Holders Details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>
	
	
<div id="idPrdAcHolderDiv" style="display:none" style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
			
<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td width="100%" bgcolor="#B3B3FF" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
			colspan="4" height="25">&nbsp; <font face="Calibri" size="2">
				<b> <s:text name="global.lbl.holder.details" />
			</b>
		</font>
		</td>
	</tr>

	<tr>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> 
			<s:text name="global.lbl.name.of.holder" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<input type="text" name="nmNameOfHolder" size="30" id="idNameOfHolder"
			class="mediumTxtRightAlign">
		</td>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> 
			<s:text name="global.lbl.holders" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<input type="text" id="idHolder" name="nmHolders" size="5"
			class="smallTxtRightAlign" value="2">&nbsp; <font
			face="Calibri" size="2"><u><b>
			<%-- <s:text name="global.lbl.add" /> --%></b></u> </font>
		</td>

	</tr>

	<tr>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2">
			<s:text	name="global.lbl.telephone" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<input type="text" id="idHolderTelephoneCode" name="nmHolderTelephoneCode" size="10"
			class="mediumTxtRightAlign"> 
			<input type="text" id="idHolderTelephoneNo" name="holderTelephoneNo" size="10" class="mediumTxtRightAlign">
		</td>
		<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			<font face="Calibri" size="2">&nbsp;
			<s:text name="global.lbl.email" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<input type="text"  id="idEmailHolder"   name="nmEMail" size="30"
			class="largeTxtRightAlign">
		</td>
	</tr>
	<tr>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> 
			<s:text name="global.lbl.date.of.birth" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<sx:datetimepicker id="idHolderDateBirth" name="nmHolderDateOfBirth"
				displayFormat="dd-MM-yyyy" />
		</td>

		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> 
			<s:text name="global.lbl.total.no.of.holders" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<input type="text" id="idNoOfHolder" name="noOfHolders" size="30"
			class="mediumTxtRightAlign">
		</td>

	</tr>
	<tr>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> 
 			<s:text name="global.lbl.gender" />
		</font>
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri"> <input type="radio" value="M"
				class="radiobutton" id="idGenderHolderM" name="gender" checked>
		</font> <font size="2"> <s:text name="global.lbl.male" />
		</font> <input type="radio" id="idGenderHolderF" name="gender" class="radiobutton" value="F">
			<font size="2"> <s:text name="global.lbl.female" />
		</font>
		</td>


		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
			<font face="Calibri" size="2"> 
			<s:text name="global.lbl.address" />
		</font>
		</td>
		<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
			colspan="3">&nbsp; <textarea id="idHolderAddress" name="holderAddress"></textarea>
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
			<input type="button" value=" <s:text name="global.btn.add"/> "
			id="idAddHolderDtls" class="button" onclick="addHolderDtls();"> &nbsp; 
			<input type="button" value=" <s:text name="global.btn.update"/> "
			id="idUpdateHolderDtls" class="button" onclick="updateHolderDtls();">&nbsp; 
			<input type="button" value=" <s:text name="global.btn.clear"/> "
			id="idClearHolderDtls" class="button" onclick="clearingHolderDtls();">
		</td>
	</tr>
</table>

<table id="idHolderTblData" width="100%" cellpadding="0" cellspacing="1"
				align="center">
				<tr bgcolor="#C4C4FF">
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text name="global.lbl.name.of.holder" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
					<s:text name="global.lbl.holders" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
					<s:text	name="global.lbl.telephone" /></b></font></td>
					
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text name="global.lbl.email" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text name="global.lbl.date.of.birth" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text name="global.lbl.total.no.of.holders" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2" color="#595959"><b>
						<s:text name="global.lbl.gender" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text name="global.lbl.address" /></b></font></td>
					
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.action" /></b></font></td>
				</tr>
			</table>
		
</div>
<table>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
	
		
<!-- Product Account Address Details -->

	
		
<div id="idAcAddDiv" style="display:block">
	<table width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a id="basicInfo" onclick="toggleTable('idPrdAcAddressDiv');" href="#">
				<s:text name="Address Details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>	
			
<div  id="idPrdAcAddressDiv" style="display:none"
		style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
		
<table width="100%" cellpadding="0" cellspacing="0" id="idAddressTbl">

	<tr>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			<font face="Calibri" size="2"><b> 
			<s:text	name="global.lbl.address.type" />:
			</b></font>
		</td>
		<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			&nbsp;<select size="1" id="idAddressTypePrdAcc"
			name="nmAddressTypePrdAcc" class="mediumselect">
				 <option value="01"><s:text name="global.val.select" /></option>
				<%--<c:forEach items="${addressTypeBean.values}" var="addressType">
					<option value="${addressTypeBean.id}">${addressType}</option>
				</c:forEach> --%>
		</select>
		</td>
		<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
		</td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
		</td>
			</tr>
	<tr>
	<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
		style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
		<font face="Calibri" size="2"> 
 		<s:text	name="global.lbl.address" />
	</font>
	</td>
	<td width="80%" bgcolor="#FFFFFF" valign="middle" align="left"
		style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
		colspan="3">
		<input type="text" name="nmPrdAccAddress1" id="idPrdAccAddress1" size="20"  tabindex="5" class="largeTxtLeftAlign" >
		<input type="text" name="nmPrdAccAddress2" id="idPrdAccAddress2" tabindex="6" >
		<input type="text" name="nmPrdAccAddress3" id="idPrdAccAddress3" tabindex="7">
	</td>

	</tr>
	<tr>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; 
			border-bottom: 1px dotted #C0C0C0">
			<font face="Calibri" size="2">
			<s:text name="global.lbl.village" />
			</font> <td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;
			border-bottom: 1px dotted #C0C0C0">
			<select size="1" name="nmVillagePrdAcc" id="idVillagesPrdAcc" tabindex="8"
			style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000;
			padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
			<c:forEach var="villages" items="${villageName}">
				<option value="${villages.villageCode}">${villages.villageCode}:${villages.villageName}</option>
			</c:forEach>
			</select>
		</td>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
			face="Calibri" size="2"><s:text
					name="global.lbl.municipality" /></font></td>

		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			<select size="1" name="nmMunicipalityPrdAcc" tabindex="9"
			id="idMunicipalityPrdAcc"
			style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<c:forEach var="municipality" items="${municipalityName}">
					<option value="${municipality.municipalityCode}">${municipality.municipalityCode}:${municipality.municipalityName}</option>
				</c:forEach>

		</select>
		</td>

	</tr>
	<tr>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			<font face="Calibri" size="2"><s:text
					name="global.lbl.district.city" /> </font>
		</td>

		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			<select size="1" name="nmDistrictPrdAcc" id="idDistrictPrdAcc" tabindex="10"
			style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<c:forEach var="district" items="${districtName}">
					<option value="${district.districtCode}">${district.districtCode}:${district.districtName}</option>
				</c:forEach>

		</select>
		</td>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			<font face="Calibri" size="2"><s:text
					name="global.lbl.state" /></font>
		</td>

		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			<select size="1" name="nmStatePrdAcc" id="idStatePrdAcc" tabindex="11"
			style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<c:forEach var="state" items="${stateName}">
					<option value="${state.stateCode}">${state.stateCode}:${state.stateName}</option>
				</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			<font face="Calibri" size="2"><s:text
					name="global.lbl.country" /></font>
		</td>

		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			<select size="1" name="nmCountryPrdAcc" id="idCountryPrdAcc" tabindex="12"
			style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<c:forEach var="country" items="${countryName}">
					<option value="${country.countryCode}">${country.countryCode}:${country.countryName}</option>
				</c:forEach>

		</select>
		</td>
		<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
			face="Calibri" size="2">
			<s:text name="global.lbl.pincode" /></font></td>
		<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
			style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><input
			type="text" tabindex="13" class="mediumTxtLeftAlign"
			id="idPinCodePrdAcc" name="nmPinCodePrdAcc" tabindex="11"></td>
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
					<input type="button" value=" <s:text name="global.btn.add"/> "
					id="idAddAddress" class="button" onclick="add();"> &nbsp;
					<input type="button" value=" <s:text name="global.btn.update"/> "
					id="idUpdateAddress" class="button" onclick="update();">&nbsp;
					<input type="button" value=" <s:text name="global.btn.clear"/> "
					id="idClearAddress" class="button" onclick="clearing();">
					</td>
				</tr>
			</table>
			
			
			<table id="idAddTblData" width="100%" cellpadding="0" cellspacing="1"
				align="center">
				<tr bgcolor="#C4C4FF">
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.address.type" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.Address" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.village" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.state" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.municipality" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.country" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.district.city" /></b></font></td>
					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.pincode" /></b></font></td>

					<td width="9.09%" align="center"
						style="border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2" color="#595959"><b>
						<s:text	name="global.lbl.action" /></b></font></td>
				</tr>
			</table>
			
			
		</div>
<table>
			<tr>
				<td>&nbsp;</td>
			</tr>
	</table>
		
<!-- Product Account Nominee Details -->



<div id="idAcNomineeDiv" style="display:inline">
	<table width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a id="basicInfo" onclick="toggleTable('idPrdAcNomineeNmDiv');" href="#">
				<s:text name="Nominee Details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>	
		
<div  id="idPrdAcNomineeNmDiv" style="display:inline" style="border: 1px solid #0000FF;	
			 padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	<table width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td width="100%" bgcolor="#B3B3FF" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				colspan="4" height="25">&nbsp; <font face="Calibri" size="2">
					<b> <s:text name="global.lbl.nominee.details" />
				</b>
			</font>
			</td>
		</tr>
		<tr>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text  name="global.lbl.date.of.nomination" />
			</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<sx:datetimepicker id="idDateOfNomination" name="dateOfNomination"	displayFormat="dd-MM-yyyy" />
			</td>

			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				 <s:text name="global.lbl.relationship" />
			</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<select size="1" name="relationshipWithNominee"
				class="mediumselect" id="idRelationshipNominee">
					<option value="1">1.FATHER</option>
					<option value="2">2.MOTHER</option>
					<option value="3">3.BROTHER</option>
					<option value="4">4.SISTER</option>
					<option value="5">5.HUSBAND</option>
					<option value="6">6.WIFE</option>
			</select>
			</td>
		</tr>
		<tr>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2"> 
				<s:text	name="global.lbl.name.of.nominee" />
			</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<input type="text" name="nameOfNominee" size="30"
				id="idNomineeName" class="mediumTxtRightAlign">
			</td>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text	name="global.lbl.address" />
			</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<textarea 	id="idAddressNominee" name="AddressOfNominee"></textarea>
			</td>

		</tr>
		<tr>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text name="global.lbl.village" /></font>
			</td>
			
			<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
			
			<select id="idVillage" name="villagenameName">
					<c:forEach var="product" items="${productName}">
						<option value="${product.id}">${product.productCode}:${product.productName}</option>
					</c:forEach>

			</select>

			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text name="global.lbl.municipality" /></font>
			</td>
			<td
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
				<select size="1" name="municipality" class="mediumselect" 
						style="font-family: Calibri; font-size: 10pt; width:200px">
					<option value="1">1.MUMBAI</option>
					<option value="2">2.NAVI MUMBAI</option>
					<option value="3">3.JALGAON</option>
					<option value="4">4.BHUSABAL</option>
			</select>
			</td>
		</tr>
		<tr>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text name="global.lbl.district.city" />
			</font>
			</td>
			<td
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
				
				<select size="1" name="district" class="mediumselect">
					<option value="1">1.THANE</option>
					<option value="2">2.INDORE</option>
					<option value="3">3.GWALIOR</option>
					<option value="4">4.UJJAIN</option>
			</select>
			</td>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text name="global.lbl.state" /></font>
			</td>
			<td
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
				<select size="1" name="state" class="mediumselect">
					<option value="1">1.MAHARASTRA</option>
					<option value="2">2.MADHYA PRADESH</option>
					<option value="3">3.ANDRA PRADESH</option>
					<option value="4">4.HIMACHAL PRADESH</option>
			</select>
			</td>
		</tr>
		<tr>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text name="global.lbl.country" /></font>
			</td>
			<td
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"
				align="left" bgcolor="#FFFFFF" valign="middle" width="30%">
				<select size="1" name="municipality" class="mediumselect">
					<option value="1">1.INDIA</option>
					<option value="2">2.ENGLAND</option>
					<option value="3">3.SOUTH AFRICA</option>
					<option value="4">4.AMERIACA</option>
			</select>
			</td>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
				face="Calibri" size="2">
				<s:text name="global.lbl.pincode" /></font></td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<input type="text" class="mediumTxtLeftAlign" name="pinCode"
				tabindex="11">
			</td>
		</tr>
		<tr>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text name="global.lbl.telephone" /></font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<input 	type="text" name="nomineeTelephoneCode" size="10"
				class="mediumTxtRightAlign">
				<input type="text" name="nomineeTelephoneNo" size="10" class="mediumTxtRightAlign"></td>
			<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text id="idEmailOfNominee"	name="global.lbl.email" />
			</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<input 	type="text" name="nomineeEMail" size="30"
				class="largeTxtRightAlign"></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text	name="global.lbl.date.of.birth" /></font></td>
			<td width="30%" align="left">
			<sx:datetimepicker 	id="idDateOfBirthNominee" name="nomineeDateOfBirth"
					displayFormat="dd-MM-yyyy" />
			</td>

			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text	name="global.lbl.is.nominee.minor" />?</font></td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri"> 
				<input type="radio" value="V9" id="idNomineeMinorY"	class="radiobutton" name="isNomineeMinor" checked>
			</font> <font size="2">
			 <s:text name="global.lbl.yes" />
			</font> <input type="radio" id="idNomineeMinorN" name="isNomineeMinor" class="radiobutton"
				value="V10"> <font size="2">
				 <s:text name="global.lbl.no" />
			</font>
			</td>

		</tr>
		<tr>

			<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text	name="global.lbl.minor.type" />
			</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<select size="1" id="idMinorTYpe" name="nmMinorType" class="mediumselect">
					<option value="1">1.LEGAL MINOR</option>
					<option value="2">2.NATURAL MINOR</option>
			</select>
			</td>
			<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text name="global.lbl.percentage.share" />(%)
			</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<input type="text" id="idPercentageShare" name="percentageShare"
				size="10" class="smallTxtRightAlign">
			</td>
		</tr>
		<tr>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				 <s:text name="global.lbl.gaurdian.of.minor.nominee" />
			</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<input type="text" name="guardianOfMinorNominee" size="30"
				class="mediumTxtRightAlign">
			</td>
			<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<font face="Calibri" size="2">
				<s:text name="global.lbl.remarks" />
			</font>
			</td>
			<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
				style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
				<input type="text" name="remarks" size="70"
				class="largeTxtRightAlign">
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
			<input type="button" value=" <s:text name="global.btn.add"/> "
			id="idAddNominee" class="button" onclick="addNominee();"> &nbsp; 
			<input type="button" value=" <s:text name="global.btn.update"/> "
			id="idUpdateNominee" class="button" onclick="updateNominee();">&nbsp;
			<input 	type="button" value=" <s:text name="global.btn.clear"/> "
			id="idClearNominee" class="button" onclick="clearingNominee();">
		</td>
	</tr>
</table>

<table id="idTblNomineeData" width="100%" cellspacing="1" cellpadding="0">
				<tr height="20">
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;
						<s:text name="global.lbl.date.of.nomination" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;
						<s:text name="global.lbl.relationship" /></b></font></td>
					
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;
						<s:text	name="global.lbl.name.of.nominee" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;
						<s:text	name="global.lbl.email" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.date.of.birth" /></b></font></td>
						<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;<s:text name="global.lbl.is.nominee.minor" /></b></font></td>
					<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0"
						align="center" bgcolor="#8A8AFF"><font face="Calibri"
						size="2"><b>&nbsp;
						<s:text name="global.lbl.action" /></b></font></td>
				</tr>
			</table>


</div>


<br>
		<div id="saveBtnDiv" style="display: block">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr height="35" bgcolor="#COCOFF">
					<td align="center"
						style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
						<!-- <input type="submit" name="btnSubmit" value="Save"  class="smallbtn" onclick="save();"/> -->
						<input type="submit" name="btnSubmit" value="Save" class="smallbtn">&nbsp;&nbsp;
						<input type="reset" name="btnClear" value="Clear" class="smallbtn">	<!-- onclick="save();" -->
					</td>
				</tr>
			</table>
		</div>
		<input type="hidden" value="mlVlaueAddress" name="mlVlaueAddress">
		<input type="hidden" value="mlValueNominee" name="mlValueNominee"> 
		<input type="hidden" value="mlValueHolderDtls" name="mlValueHolderDtls">
		<input	type="hidden" value="vToken" name="vToken">
			
</form>
</body>


</html>