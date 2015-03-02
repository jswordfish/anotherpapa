<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="nationalityBean" class="com.infrasofttech.bean.NationalityBean" />
<jsp:useBean id="maritalStatusBean" class="com.infrasofttech.bean.MaritalStatusBean" />
<jsp:useBean id="addressTypeBean" class="com.infrasofttech.bean.AddressTypeBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<link href="../menucss/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>

<script>

function toggleTable(tblName){
	
	if(tblName=="basicTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";

		}
	if(tblName=="miscTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "block";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idTransactionFreeze").focus();
		
		}
	if(tblName=="adhocTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "block";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idQualifications").focus();

		}
	if(tblName=="personalTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "block";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idCustomerCategory").focus();
		}
	if(tblName=="taxDtlsTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "block";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idTDSYN").focus();

		}
	if(tblName=="addressTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "block";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idCustAddressType").focus();

		}
	if(tblName=="assetTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "block";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idRegNumber").focus();

		}
	if(tblName=="contactTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "block";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idResidencePhone").focus();

		}
	if(tblName=="busiDtlsTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "block";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idBusinessId").focus();

		}
	if(tblName=="emplTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "block";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idProfessionType").focus();

		}
	if(tblName=="KYCDocsTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "block";
		document.getElementById("KYCFamilyTbl").style.display = "none";
		document.getElementById("idProofType").focus();

		}
	if(tblName=="KYCFamilyTbl"){
		document.getElementById("basicTbl").style.display = "block";
		document.getElementById("miscTbl").style.display = "none";
		document.getElementById("adhocTbl").style.display = "none";
		document.getElementById("personalTbl").style.display = "none";
		document.getElementById("taxDtlsTbl").style.display = "none";
		document.getElementById("addressTbl").style.display = "none";
		document.getElementById("assetTbl").style.display = "none";
		document.getElementById("contactTbl").style.display = "none";
		document.getElementById("busiDtlsTbl").style.display = "none";
		document.getElementById("emplTbl").style.display = "none";
		document.getElementById("KYCDocsTbl").style.display = "none";
		document.getElementById("KYCFamilyTbl").style.display = "block";
		document.getElementById("idFamilyMemberName").focus();

		}
}

/*Dynamic lines for ADDRESS DETAILS  */

function add() {
	document.getElementById("idClear").disabled = false;
	document.getElementById("idUpdate").disabled = false;
	var table = document.getElementById("tblData");

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

	cell1.innerHTML = document.getElementById("idCustAddressType").value;
	cell2.innerHTML = document.getElementById("idCustAddress1").value;
	cell3.innerHTML = document.getElementById("idCustAddress2").value;
	cell4.innerHTML = document.getElementById("idCustAddress3").value;
	cell5.innerHTML = document.getElementById("idVillages1").value;
	cell6.innerHTML = document.getElementById("idStates1").value;
	cell7.innerHTML = document.getElementById("idMunicipalities1").value;
	cell8.innerHTML = document.getElementById("idCountry1").value;
	cell9.innerHTML = document.getElementById("idDistrictCity1").value;
	cell10.innerHTML = document.getElementById("idCustPinCode").value;

	cell11.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

	clearing();
	var tableid = "tblData";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	//alert("tableValues..."+tableValues);
	var MlVal = getMultiArrayStringMargin(tableValues);
	//alert("MlVal....."+MlVal);
	document.forms[0].mlValue.value = MlVal;
	alert("document.forms[0].mlValue.value..."
			+ document.forms[0].mlValue.value);
}

function edit(row) {
	document.getElementById("idUpdate").disabled = false;
	document.getElementById("idClear").disabled = false;
	document.getElementById("idAdd").disabled = true;
	document.getElementById("idDel").disabled = true;

	var table = document.getElementById("tblData");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idCustAddressType = a.cells[0].innerHTML;
	var idCustAddress1 = a.cells[1].innerHTML;
	var idCustAddress2 = a.cells[2].innerHTML;
	var idCustAddress3 = a.cells[3].innerHTML;
	var idVillages1 = a.cells[4].innerHTML;
	var idStates1 = a.cells[5].innerHTML;
	var idMunicipalities1 = a.cells[6].innerHTML;
	var idCountry1 = a.cells[7].innerHTML;
	var idDistrictCity1 = a.cells[8].innerHTML;
	var idCustPinCode = a.cells[9].innerHTML;

	document.getElementById("idCustAddressType").value = idCustAddressType;
	document.getElementById("idCustAddress1").value = idCustAddress1;
	document.getElementById("idCustAddress2").value = idCustAddress2;
	document.getElementById("idCustAddress3").value = idCustAddress3;
	document.getElementById("idVillages1").value = idVillages1;
	document.getElementById("idStates1").value = idStates1;
	document.getElementById("idMunicipalities1").value = idMunicipalities1;
	document.getElementById("idCountry1").value = idCountry1;
	document.getElementById("idDistrictCity1").value = idDistrictCity1;
	document.getElementById("idCustPinCode").value = idCustPinCode;

}
function update() {

	//i = row.parentNode.parentNode.rowIndex;

	var table = document.getElementById("tblData");
	var e = table.rows[i];
	e.cells[0].innerHTML = document.getElementById("idCustAddressType").value;
	e.cells[1].innerHTML = document.getElementById("idCustAddress1").value;
	e.cells[2].innerHTML = document.getElementById("idCustAddress2").value;
	e.cells[3].innerHTML = document.getElementById("idCustAddress3").value;
	e.cells[4].innerHTML = document.getElementById("idVillages1").value;
	e.cells[5].innerHTML = document.getElementById("idStates1").value;
	e.cells[6].innerHTML = document.getElementById("idMunicipalities1").value;
	e.cells[7].innerHTML = document.getElementById("idCountry1").value;
	e.cells[8].innerHTML = document.getElementById("idDistrictCity1").value;
	e.cells[9].innerHTML = document.getElementById("idCustPinCode").value;

	document.getElementById("idUpdate").disabled = true;
	document.getElementById("idAdd").disabled = false;
	document.getElementById("idDel").disabled = false;

	clearing();
	var tableid = "tblData";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms[0].mlValue.value = MlVal;
}
function clearing() {

	/*  document.getElementById("formHomeId").reset();  */
	document.getElementById("idCustAddressType").value = '';
	document.getElementById("idCustAddress1").value = '';
	document.getElementById("idCustAddress2").value = '';
	document.getElementById("idCustAddress3").value = '';
	document.getElementById("idVillages1").value = '';
	document.getElementById("idDistrictCity1").value = '';
	document.getElementById("idStates1").value = '';
	document.getElementById("idCountry1").value = '';
	document.getElementById("idMunicipalities1").value = '';
	document.getElementById("idCustPinCode").value = '';
	document.getElementById("idUpdate").disabled = true;
	document.getElementById("idAdd").disabled = false;
	document.getElementById("idDel").disabled = false;
}
function deleteRow(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData').deleteRow(i);

}
/* Dynamic lines for ASSET DETAILS */
function add1() {
	document.getElementById("idClear1").disabled = false;
	document.getElementById("idUpdate1").disabled = false;
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
	var cell8 = row.insertCell(7);
	var cell9 = row.insertCell(8);
	var cell10 = row.insertCell(9);
	var cell11 = row.insertCell(10);
	var cell12 = row.insertCell(11);
	var cell13 = row.insertCell(12);
	var cell14 = row.insertCell(13);
	var cell15 = row.insertCell(14);
	
	// Add some text to the new cells:

	cell1.innerHTML = document.getElementById("idRegNumber").value;
	cell2.innerHTML = document.getElementById("idPlotNumber").value;
	cell3.innerHTML = document.getElementById("idAssetAddress1").value;
	cell4.innerHTML = document.getElementById("idAssetAddress2").value;
	cell5.innerHTML = document.getElementById("idAssetAddress3").value;
	cell6.innerHTML = document.getElementById("idVillages2").value;
	cell7.innerHTML = document.getElementById("idMunicipalities2").value;
	cell8.innerHTML = document.getElementById("idDistrictCity2").value;
	cell9.innerHTML = document.getElementById("idStates2").value;
	cell10.innerHTML = document.getElementById("idAreaSize").value;
	cell11.innerHTML = document.getElementById("idAreaRate").value;
	cell12.innerHTML = document.getElementById("idApproxMonetaryValue").value;
	cell13.innerHTML = document.getElementById("idRemarks1").value;
	cell14.innerHTML = document.getElementById("idOsLoanYN").value;
	cell15.innerHTML = document.getElementById("idOsAmount").value;
	cell16.innerHTML = '<input type="button" id="idEdit1" class="smallbtn" value ="EDIT" onclick="edit1(this);"> &nbsp;&nbsp;<input type="button" id="idDel1" class="smallbtn" value ="DEL" onclick="deleteRow1(this);"> ';

	clearing1();
	var tableid = "tblData1";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	//alert("tableValues..."+tableValues);
	var MlVal = getMultiArrayStringMargin(tableValues);
	//alert("MlVal....."+MlVal);
	document.forms[0].mlValue1.value = MlVal;
	alert("document.forms[0].mlValue1.value..."
			+ document.forms[0].mlValue1.value);
}
function clearing1() {

	/*  document.getElementById("formHomeId").reset();  */
	document.getElementById("idRegNumber").value = '';
	document.getElementById("idPlotNumber").value = '';
	document.getElementById("idAssetAddress1").value = '';
	document.getElementById("idAssetAddress2").value = '';
	document.getElementById("idAssetAddress3").value = '';
	document.getElementById("idVillages2").value = '';
	document.getElementById("idDistrictCity2").value = '';
	document.getElementById("idAreaSize").value = '';
	document.getElementById("idAreaRate").value = '';
	document.getElementById("idApproxMonetaryValue").value = '';
	document.getElementById("idOsAmount").value = '';
	document.getElementById("idOsLoanYN").value = '';
	document.getElementById("idRemarks1").value = '';
	document.getElementById("idMunicipalities2").value = '';
	document.getElementById("idStates2").value = '';
	document.getElementById("idUpdate1").disabled = true;
	document.getElementById("idAdd1").disabled = false;
	document.getElementById("idDel1").disabled = false;
}
function deleteRow1(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData1').deleteRow(i);

}

function edit1(row) {
	document.getElementById("idUpdate1").disabled = false;
	document.getElementById("idClear1").disabled = false;
	document.getElementById("idAdd1").disabled = true;
	document.getElementById("idDel1").disabled = true;

	var table = document.getElementById("tblData1");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idRegNumber = a.cells[0].innerHTML;
	var idPlotNumber = a.cells[1].innerHTML;
	var idAssetAddress1 = a.cells[2].innerHTML;
	var idAssetAddress2 = a.cells[3].innerHTML;
	var idAssetAddress3 = a.cells[4].innerHTML;
	var idVillages2 = a.cells[5].innerHTML;
	var idMunicipalities2 = a.cells[6].innerHTML;
	var idDistrictCity2 = a.cells[7].innerHTML;
	var idStates2 = a.cells[8].innerHTML;
	var idAreaSize = a.cells[9].innerHTML;
	var idAreaRate = a.cells[10].innerHTML;
	var idApproxMonetaryValue = a.cells[11].innerHTML;
	var idRemarks1 = a.cells[12].innerHTML;
	var idOsLoanYN = a.cells[13].innerHTML;
	var idOsAmount = a.cells[14].innerHTML;

	document.getElementById("idRegNumber").value = idRegNumber;
	document.getElementById("idPlotNumber").value = idPlotNumber;
	document.getElementById("idAssetAddress1").value = idAssetAddress1;
	document.getElementById("idAssetAddress1").value = idAssetAddress2;
	document.getElementById("idAssetAddress1").value = idAssetAddress3;
	document.getElementById("idVillages2").value = idVillages2;
	document.getElementById("idMunicipalities2").value = idMunicipalities2;
	document.getElementById("idDistrictCity2").value = idDistrictCity2;
	document.getElementById("idStates2").value = idStates2;
	document.getElementById("idAreaSize").value = idAreaSize;
	document.getElementById("idAreaRate").value = idAreaRate;
	document.getElementById("idApproxMonetaryValue").value = idApproxMonetaryValue;
	document.getElementById("idRemarks1").value = idRemarks1;
	document.getElementById("idOsLoanYN").value = idOsLoanYN;
	document.getElementById("idOsAmount").value = idOsAmount;
}
function update1() {

	//i = row.parentNode.parentNode.rowIndex;

	var table = document.getElementById("tblData1");
	var e = table.rows[i];
	e.cells[0].innerHTML = document.getElementById("idRegNumber").value;
	e.cells[1].innerHTML = document.getElementById("idPlotNumber").value;
	e.cells[2].innerHTML = document.getElementById("idAssetAddress1").value;
	e.cells[3].innerHTML = document.getElementById("idAssetAddress2").value;
	e.cells[4].innerHTML = document.getElementById("idAssetAddress3").value;
	e.cells[5].innerHTML = document.getElementById("idVillages2").value;
	e.cells[6].innerHTML = document.getElementById("idMunicipalities2").value;
	e.cells[7].innerHTML = document.getElementById("idDistrictCity2").value;
	e.cells[8].innerHTML = document.getElementById("idStates2").value;
	e.cells[9].innerHTML = document.getElementById("idArea").value;
	e.cells[10].innerHTML = document.getElementById("idRate").value;
	e.cells[11].innerHTML = document.getElementById("idApproxMonetaryvalue").value;
	e.cells[12].innerHTML = document.getElementById("idRemarks").value;
	e.cells[13].innerHTML = document.getElementById("idLoanIfany").value;
	e.cells[14].innerHTML = document.getElementById("idLoanAmount").value;

	document.getElementById("idUpdate1").disabled = true;
	document.getElementById("idAdd1").disabled = false;
	document.getElementById("idDel1").disabled = false;

	clearing1();
	var tableid = "tblData1";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms[0].mlValue1.value = MlVal;
}
/*Dynamic lines for BUSINESS DETAILS */
function add2() {
	document.getElementById("idClear2").disabled = false;
	document.getElementById("idUpdate2").disabled = false;
	var table = document.getElementById("tblData2");

	//Find a <table> element with id="myTable":

	// Create an empty <tr> element and add it to the 1st position of the table:
	var row = table.insertRow(1);

	// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	// Add some text to the new cells:

	cell1.innerHTML = document.getElementById("idBusinessId").value;
	cell2.innerHTML = document.getElementById("idNoOfStaff").value;
	cell3.innerHTML = document.getElementById("idRegCode").value;
	cell4.innerHTML = '<input type="button" id="idEdit2" class="smallbtn" value ="EDIT" onclick="edit2(this);"> &nbsp;&nbsp;<input type="button" id="idDel2" class="smallbtn" value ="DEL" onclick="deleteRow2(this);"> ';

	clearing2();
	var tableid = "tblData2";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	//alert("tableValues..."+tableValues);
	var MlVal = getMultiArrayStringMargin(tableValues);
	//alert("MlVal....."+MlVal);
	document.forms[0].mlValue2.value = MlVal;
	alert("document.forms[0].mlValue2.value..."
			+ document.forms[0].mlValue2.value);
}
function clearing2() {

	/*  document.getElementById("formHomeId").reset();  */
	document.getElementById("idBusinessId").value = '';
	document.getElementById("idNoOfStaff").value = '';
	document.getElementById("idRegCode").value = '';
	

	/*  document.getElementById('idCategory').value=''; */

	document.getElementById("idUpdate2").disabled = true;
	document.getElementById("idAdd2").disabled = false;
	document.getElementById("idDel2").disabled = false;
}
function deleteRow2(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData2').deleteRow(i);

}

function edit2(row) {
	document.getElementById("idUpdate2").disabled = false;
	document.getElementById("idClear2").disabled = false;
	document.getElementById("idAdd2").disabled = true;
	document.getElementById("idDel2").disabled = true;

	var table = document.getElementById("tblData2");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idBusinessId = a.cells[0].innerHTML;
	var idNoOfStaff = a.cells[1].innerHTML;
	var idRegCode = a.cells[2].innerHTML;
	
	document.getElementById("idBusinessId").value = idBusinessId;
	document.getElementById("idNoOfStaff").value = idNoOfStaff;
	document.getElementById("idRegCode").value = idRegCode;
	
}
function update2() {

	//i = row.parentNode.parentNode.rowIndex;

	var table = document.getElementById("tblData2");
	var e = table.rows[i];
	e.cells[0].innerHTML = document.getElementById("idBusinessId").value;
	e.cells[1].innerHTML = document.getElementById("idNoOfStaff").value;
	e.cells[2].innerHTML = document.getElementById("idRegCode").value;
	
	document.getElementById("idUpdate2").disabled = true;
	document.getElementById("idAdd2").disabled = false;
	document.getElementById("idDel2").disabled = false;

	clearing2();
	var tableid = "tblData2";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms[0].mlValue2.value = MlVal;
}

/* Dynamic lines for EMPLOYMENT DETAILS */

function add3() {
	document.getElementById("idClear3").disabled = false;
	document.getElementById("idUpdate3").disabled = false;
	var table = document.getElementById("tblData3");

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
	var cell12 = row.insertCell(11);
	var cell13 = row.insertCell(12);
	var cell14 = row.insertCell(13);
	var cell15 = row.insertCell(14);
	var cell16 = row.insertCell(15);
	var cell17 = row.insertCell(16);
	

	// Add some text to the new cells:

	cell1.innerHTML = document.getElementById("idProfessionType").value;
	cell2.innerHTML = document.getElementById("idEmpAddress1").value;
	cell3.innerHTML = document.getElementById("idEmpAddress2").value;
	cell4.innerHTML = document.getElementById("idEmpAddress3").value;
	cell5.innerHTML = document.getElementById("idStates3").value;
	cell6.innerHTML = document.getElementById("idCountry3").value;
	cell7.innerHTML = document.getElementById("idDistrictCity3").value;
	cell8.innerHTML = document.getElementById("idEmpNumber").value;
	cell9.innerHTML = document.getElementById("idDepartment").value;
	cell10.innerHTML = document.getElementById("idDOR").value;
	cell11.innerHTML = document.getElementById("idAnnualIncome").value;
	cell12.innerHTML = document.getElementById("idAccountType").value;
	cell13.innerHTML = document.getElementById("idBankCode").value;
	cell14.innerHTML = document.getElementById("idBankName").value;
	cell15.innerHTML = document.getElementById("idAccountNumber").value;
	cell16.innerHTML = document.getElementById("idYearsInService").value;
	cell17.innerHTML = document.getElementById("idDesignation").value;
	cell18.innerHTML = '<input type="button" id="idEdit3" class="smallbtn" value ="EDIT" onclick="edit3(this);"> &nbsp;&nbsp;<input type="button" id="idDel3" class="smallbtn" value ="DEL" onclick="deleteRow3(this);"> ';

	clearing3();
	var tableid = "tblData3";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	//alert("tableValues..."+tableValues);
	var MlVal = getMultiArrayStringMargin(tableValues);
	//alert("MlVal....."+MlVal);
	document.forms[0].mlValue3.value = MlVal;
	alert("document.forms[0].mlValue3.value..."
			+ document.forms[0].mlValue3.value);
}
function clearing3() {

	/*  document.getElementById("formHomeId").reset();  */
	document.getElementById("idProfessionType").value = '';
	document.getElementById("idEmpAddress1").value = '';
	document.getElementById("idEmpAddress2").value = '';
	document.getElementById("idEmpAddress3").value = '';
	document.getElementById("idStates3").value = '';
	document.getElementById("idCountry3").value = '';
	document.getElementById("idDistrictCity3").value = '';
	document.getElementById("idEmpNumber").value = '';
	document.getElementById("idDepartment").value = '';
	document.getElementById("idDOR").value = '';
	document.getElementById("idAnnualIncome").value = '';
	document.getElementById("idAccountType").value = '';
	document.getElementById("idBankCode").value = '';
	document.getElementById("idBankName").value = '';
	document.getElementById("idAccountNumber").value = '';
	document.getElementById("idYearsInService").value = '';
	document.getElementById("idDesignation").value = '';
	document.getElementById("idUpdate3").disabled = true;
	document.getElementById("idAdd3").disabled = false;
	document.getElementById("idDel3").disabled = false;
}
function deleteRow3(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData3').deleteRow(i);

}

function edit3(row) {
	document.getElementById("idUpdate3").disabled = false;
	document.getElementById("idClear3").disabled = false;
	document.getElementById("idAdd3").disabled = true;
	document.getElementById("idDel3").disabled = true;

	var table = document.getElementById("tblData3");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idProfessionType = a.cells[0].innerHTML;
	var idEmpAddress1 = a.cells[1].innerHTML;
	var idEmpAddress2 = a.cells[2].innerHTML;
	var idEmpAddress3 = a.cells[3].innerHTML;
	var idStates3 = a.cells[4].innerHTML;
	var idCountry3 = a.cells[5].innerHTML;
	var idDistrictCity3 = a.cells[6].innerHTML;
	var idEmpNumber = a.cells[7].innerHTML;
	var idDepartment = a.cells[8].innerHTML;
	var idDOR = a.cells[9].innerHTML;
	var idAccountType = a.cells[10].innerHTML;
	var idBankCode = a.cells[11].innerHTML;
	var idBankName = a.cells[12].innerHTML;
	var idAccountNumber = a.cells[13].innerHTML;
	var idYearsInService = a.cells[14].innerHTML;
	var idDesignation = a.cells[15].innerHTML;
	var idAnnualIncome = a.cells[16].innerHTML;
	

	document.getElementById("idProfessionType").value = idProfessionType;
	document.getElementById("idEmpAddress1").value = idEmpAddress1;
	document.getElementById("idEmpAddress2").value = idEmpAddress2;
	document.getElementById("idEmpAddress3").value = idEmpAddress3;
	document.getElementById("idStates3").value = idStates3;
	document.getElementById("idCountry3").value = idCountry3;
	document.getElementById("idDistrictCity3").value = idDistrictCity3;
	document.getElementById("idEmpNumber").value = idEmpNumber;
	document.getElementById("idDepartment").value = idDepartment;
	document.getElementById("idDOR").value = idDOR;
	document.getElementById("idAccountType").value = idAccountType;
	document.getElementById("idBankCode").value = idBankCode;
	document.getElementById("idBankName").value = idBankName;
	document.getElementById("idAccountNumber").value = idAccountNumber ;
	document.getElementById("idYearsInService").value = idYearsInService;
	document.getElementById("idDesignation").value = idDesignation;
	document.getElementById("idAnnualIncome").value = idAnnualIncome;

}
function update3() {

	//i = row.parentNode.parentNode.rowIndex;

	var table = document.getElementById("tblData3");
	var e = table.rows[i];
	e.cells[0].innerHTML = document.getElementById("idProfessionType").value;
	e.cells[1].innerHTML = document.getElementById("idEmpAddress1").value;
	e.cells[2].innerHTML = document.getElementById("idEmpAddress2").value;
	e.cells[3].innerHTML = document.getElementById("idEmpAddress3").value;
	e.cells[4].innerHTML = document.getElementById("idStates3").value;
	e.cells[5].innerHTML = document.getElementById("idCountry3").value;
	e.cells[6].innerHTML = document.getElementById("idDistrictCity3").value;
	e.cells[7].innerHTML = document.getElementById("idEmpNumber").value;
	e.cells[8].innerHTML = document.getElementById("idDepartment").value;
	e.cells[9].innerHTML = document.getElementById("idDOR").value;
	e.cells[10].innerHTML = document.getElementById("idAccountType").value;
	e.cells[11].innerHTML = document.getElementById("idBankCode").value;
	e.cells[12].innerHTML = document.getElementById("idBankName").value;
	e.cells[13].innerHTML = document.getElementById("idAccountNumber").value;
	e.cells[14].innerHTML = document.getElementById("idYearsInService").value;
	e.cells[15].innerHTML = document.getElementById("idDesignation").value;
	e.cells[16].innerHTML = document.getElementById("idAnnualIncome").value;

	document.getElementById("idUpdate3").disabled = true;
	document.getElementById("idAdd3").disabled = false;
	document.getElementById("idDel3").disabled = false;

	clearing3();
	var tableid = "tblData3";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms[0].mlValue3.value = MlVal;
}
/* For KYC DOC Details */

function add4() {
	document.getElementById("idClear4").disabled = false;
	document.getElementById("idUpdate4").disabled = false;
	var table = document.getElementById("tblData4");

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

	// Add some text to the new cells:

	cell1.innerHTML = document.getElementById("idKYCType").value;
	cell2.innerHTML = document.getElementById("idProofType").value;
	cell3.innerHTML = document.getElementById("idNumber").value;
	cell4.innerHTML = document.getElementById("idIssuedDate").value;
	cell5.innerHTML = document.getElementById("idExpiryDate").value;
	cell6.innerHTML = document.getElementById("idIssuedBy").value;
	cell7.innerHTML = document.getElementById("idRecievedDate").value;
	cell8.innerHTML = document.getElementById("idRemarks").value;
	cell9.innerHTML = '<input type="button" id="idEdit4" class="smallbtn" value ="EDIT" onclick="edit4(this);"> &nbsp;&nbsp;<input type="button" id="idDel4" class="smallbtn" value ="DEL" onclick="deleteRow4(this);"> ';

	clearing4();
	var tableid = "tblData4";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	//alert("tableValues..."+tableValues);
	var MlVal = getMultiArrayStringMargin(tableValues);
	//alert("MlVal....."+MlVal);
	document.forms[0].mlValue4.value = MlVal;
	alert("document.forms[0].mlValue4.value..."
			+ document.forms[0].mlValue4.value);
}
function clearing4() {

	document.getElementById("idKYCType").value = '';
	document.getElementById("idProofType").value = '';
	document.getElementById("idNumber").value = '';
	document.getElementById("idIssuedDate").value = '';
	document.getElementById("idExpiryDate").value = '';
	document.getElementById("idIssuedBy").value = '';
	document.getElementById("idRecievedDate").value = '';
	document.getElementById("idRemarks").value = '';


	document.getElementById("idUpdate4").disabled = true;
	document.getElementById("idAdd4").disabled = false;
	document.getElementById("idDel4").disabled = false;
}
function deleteRow4(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData4').deleteRow(i);

}

function edit4(row) {
	document.getElementById("idUpdate4").disabled = false;
	document.getElementById("idClear4").disabled = false;
	document.getElementById("idAdd4").disabled = true;
	document.getElementById("idDel4").disabled = true;

	var table = document.getElementById("tblData4");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idKYCType = a.cells[0].innerHTML;
	var idProofType = a.cells[1].innerHTML;
	var idNumber = a.cells[2].innerHTML;
	var idIssuedDate = a.cells[3].innerHTML;
	var idExpiryDate = a.cells[4].innerHTML;
	var idIssuedBy = a.cells[5].innerHTML;
	var idRecievedDate = a.cells[6].innerHTML;
	var idRemarks = a.cells[7].innerHTML;

	document.getElementById("idKYCType").value = idKYCType;
	document.getElementById("idProofType").value = idProofType;
	document.getElementById("idNumber").value = idNumber;
	document.getElementById("idIssuedDate").value = idIssuedDate;
	document.getElementById("idExpiryDate").value = idExpiryDate;
	document.getElementById("idIssuedBy").value = idIssuedBy;
	document.getElementById("idRecievedDate").value = idRecievedDate;
	document.getElementById("idRemarks").value = idRemarks;

}
function update4() {

	//i = row.parentNode.parentNode.rowIndex;

	var table = document.getElementById("tblData4");
	var e = table.rows[i];
	e.cells[0].innerHTML = document.getElementById("idKYCType").value;
	e.cells[1].innerHTML = document.getElementById("idProofType").value;
	e.cells[2].innerHTML = document.getElementById("idNumber").value;
	e.cells[3].innerHTML = document.getElementById("idIssuedDate").value;
	e.cells[4].innerHTML = document.getElementById("idExpiryDate").value;
	e.cells[5].innerHTML = document.getElementById("idIssuedBy").value;
	e.cells[6].innerHTML = document.getElementById("idRecievedDate").value;
	e.cells[7].innerHTML = document.getElementById("idRemarks").value;

	document.getElementById("idUpdate4").disabled = true;
	document.getElementById("idAdd4").disabled = false;
	document.getElementById("idDel4").disabled = false;

	clearing4();
	var tableid = "tblData4";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms[0].mlValue4.value = MlVal;
}




/* For KYC FAMILY DETAILS */

function add5() {
	document.getElementById("idClear5").disabled = false;
	document.getElementById("idUpdate5").disabled = false;
	var table = document.getElementById("tblData5");

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

	// Add some text to the new cells:

	cell1.innerHTML = document.getElementById("idFamilyMemberName").value;
	cell2.innerHTML = document.getElementById("idRelationship1").value;
	cell3.innerHTML = document.getElementById("idGender1").value;
	cell4.innerHTML = document.getElementById("idDob").value;
	cell5.innerHTML = document.getElementById("idProfession").value;
	cell6.innerHTML = document.getElementById("idEducation").value;
	cell7.innerHTML = '<input type="button" id="idEdit5" class="smallbtn" value ="EDIT" onclick="edit5(this);"> &nbsp;&nbsp;<input type="button" id="idDel5" class="smallbtn" value ="DEL" onclick="deleteRow5(this);"> ';

	clearing5();
	var tableid = "tblData5";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	//alert("tableValues..."+tableValues);
	var MlVal = getMultiArrayStringMargin(tableValues);
	//alert("MlVal....."+MlVal);
	document.forms[0].mlValue5.value = MlVal;
	alert("document.forms[0].mlValue5.value..."
			+ document.forms[0].mlValue5.value);
}
function clearing5() {

	document.getElementById("idFamilyMemberName").value = '';
	document.getElementById("idRelationship1").value = '';
	document.getElementById("idGender1").value = '';
	document.getElementById("idDob").value = '';
	document.getElementById("idProfession").value = '';
	document.getElementById("idEducation").value = '';

	document.getElementById("idUpdate5").disabled = true;
	document.getElementById("idAdd5").disabled = false;
	document.getElementById("idDel5").disabled = false;
}
function deleteRow5(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData5').deleteRow(i);

}

function edit5(row) {
	document.getElementById("idUpdate5").disabled = false;
	document.getElementById("idClear5").disabled = false;
	document.getElementById("idAdd5").disabled = true;
	document.getElementById("idDel5").disabled = true;

	var table = document.getElementById("tblData5");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idFamilyMemberName = a.cells[0].innerHTML;
	var idRelationship1 = a.cells[1].innerHTML;
	var idGender1 = a.cells[2].innerHTML;
	var idDob = a.cells[3].innerHTML;
	var idProfession = a.cells[4].innerHTML;
	var idEducation = a.cells[5].innerHTML;

	document.getElementById("idFamilyMemberName").value = idFamilyMemberName;
	document.getElementById("idRelationship1").value = idRelationship1;
	document.getElementById("idGender1").value = idGender1;
	document.getElementById("idDob").value = idDob;
	document.getElementById("idProfession").value = idProfession;
	document.getElementById("idEducation").value = idEducation;

}
function update5() {

	//i = row.parentNode.parentNode.rowIndex;

	var table = document.getElementById("tblData5");
	var e = table.rows[i];
	e.cells[0].innerHTML = document.getElementById("idFamilyMemberName").value;
	e.cells[1].innerHTML = document.getElementById("idRelationship1").value;
	e.cells[2].innerHTML = document.getElementById("idGender1").value;
	e.cells[3].innerHTML = document.getElementById("idDob").value;
	e.cells[4].innerHTML = document.getElementById("idProfession").value;
	e.cells[5].innerHTML = document.getElementById("idEducation").value;

	document.getElementById("idUpdate5").disabled = true;
	document.getElementById("idAdd5").disabled = false;
	document.getElementById("idDel5").disabled = false;

	clearing5();
	var tableid = "tblData5";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms[0].mlValue5.value = MlVal;
}

/* END OF ALL THE CUSTOMER DETAILS */	

function getMLValues(tableid) {
	var tableValues = new Array();

	var tbl = document.getElementById(tableid);
	for (var i = 1; i < tbl.rows.length; i++) {
		var rowValues = getRowValues(tbl.rows[i]);
		//alert("rowValues--"+rowValues);
		tableValues[tableValues.length] = rowValues;
		//alert("in side tableValues--"+tableValues);
	}
	return tableValues;
}
function getRowValues(row) {
	var rowValues = new Array();
	var tds = row.getElementsByTagName("td");
	//alert("tds..."+tds);
	var fld = " ";
	//alert(tds.length-1);
	for (var r = 0; r < tds.length - 1; r++) {
		if (tds[r].hasChildNodes())
			fld = tds[r].firstChild.nodeValue;

		else
			fld = " ";
		//alert("fld..."+fld);
		rowValues[rowValues.length] = fld;
	}
	return rowValues;
}

function getMultiArrayStringMargin(multiValues) {

	var str = '';
	for (var i = 0; i < multiValues.length; i++) {

		var rowVal = multiValues[i];

		for (var j = 0; j < rowVal.length; j++) {
			//alert("rowVal[j]).."+(rowVal[j].split("~")));
			var sely = (rowVal[j]).split("~");
			// alert("sely  ..."+sely);
			str = str + sely[0] + '~';
		}
		str = str + '!';
	}
	//alert("getMultiArrayStringMargin..."+str);
	return str;
}


function successMessage() {
	document.getElementById("idSuccessMessage").style.display = "inline";
}
function save() {
	alert("Member Created Successfully");
	window.location.href = "<s:url value="MemberRegistrationSave"/>";
}
</script>
</head>
<body>
<form name="formHome" id="formHomeId" method="post" action="MemberRegistrationSave">
<div align="center">
				<table width="100%" cellpadding="0" cellspacing="0">
				<tr bgcolor="#FFFFFF" height="25">
					<td colspan="3" width="50%" bgcolor="#FFFFFF"><b> <font
							face="Calibri" size="2">&nbsp;</font><font face="Calibri">&nbsp;</font></b><font
						face="Calibri" color="#003399"><s:text
								name="global.lbl.new.customer.registration" /></font> <font size="2"
						color="#595959" face="Calibri">(PACS &gt; Masters)</font></td>
					<td colspan="3" width="50%" bgcolor="#FFFFFF">
						<p align="right">
							<b> <font face="Calibri" size="2" color="#595959"> </font> <font
								face="Calibri" size="2" color="#003399"> 
							</font></b><font face="Calibri" size="2" color="#003399"> <b>Talegaon
									Primary Agriculture Credit Society&nbsp;&nbsp;</b></font>
					</td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td colspan="6" width="100%">
						<p align="center" style="display: none" id="idSuccessMessage">
					</td>
					</tr>
	
				</table>
	<table width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #000000; border-right-width: 1px solid #FF0000; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a id="basicInfo" onclick="toggleTable('basicTbl');" href="#"><s:text name="global.lbl.basic.information" /></a>
			</b></font>
		</td>
	</tr></table>
</div>
<!-- BASIC INFORMATION -->
<div id="basicTbl" style="display:block">

							<table width="100%" align="center" cellpadding="0" cellspacing="0">
									
									<tr bgcolor="#FFFFFF">
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text name="global.lbl.customer.branch" />&nbsp;</b></font></td>
										
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="text" name="customerBranch" readonly="readonly" id="idCustomerBranch"
											class="smallTxtLeftAlign">
										</td>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text name="global.lbl.customer.id" />&nbsp;</b></font></td>
										
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="text" name="customerCode" id="idCustomerCode"
											class="mediumTxtLeftAlign">
											
										</td>
										
									</tr>
	
									<tr bgcolor="#F4F4F4">
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2">
											<b><s:text name="global.lbl.customer.name" /></b> </font>
										</td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="3"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<select size="1" name="customerSalutation" id="idCustomerName" class="mediumselect">
												<option value="select"><s:text
														name="global.val.select" /></option>
												<option value="mr"><s:text name="global.val.mr" /></option>
												<option value="ms"><s:text name="global.val.ms" /></option>
												<option value="mrs"><s:text name="global.val.mrs" /></option>
												<option value="dr"><s:text name="global.val.dr" /></option>
										</select>&nbsp; <input type="text" name="customerFName" size="10"
											class="mediumTxtLeftAlign" id="idCustomerFName"> <input type="text"
											name="customerMName" size="10" class="mediumTxtLeftAlign" id="idCustomerMName">
											<input type="text" name="customerLName" size="10"
											class="mediumTxtLeftAlign" id="idCustomerLName"></td>
									</tr>
	
									<tr bgcolor="#F4F4F4">
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.gender" />&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type=radio name="customerGender" id="idCustomerGender" class="radiobutton"
											value="M" checked><font face="Calibri" size="2"><s:text
													name="global.lbl.male" />&nbsp;</font> <input type=radio
											name="customerGender" id="idCustomerGender" class="radiobutton" value="F"><font
											face="Calibri" size="2"><s:text
													name="global.lbl.female" />&nbsp;</font>
										</td>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.customer.dob" />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<sx:datetimepicker name="customerDOB" id="idCustomerDOB"
												displayFormat="dd-MM-yyyy" />
										</td></tr>
										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
													name="global.lbl.marital.status" /></b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" name="custMaritalStatus" class="mediumselect" id="idCustMaritalStatus">
												<option value=""><s:text name="global.val.select" /></option>
												<c:forEach items="${maritalStatusBean.values}"
													var="maritalStatus">
													<option value="${maritalStatus}">${maritalStatus}</option>
												</c:forEach>
										</select>
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.customer.type" />&nbsp;</b></font></td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select id="idCustomerType" name="customerTypeCode" class="mediumselect">
												
												<option>customerType1</option>
												<option>customerType2</option>
										</select>
										</td>
									</tr>
	
									<tr>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.nationality" />&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" name="nationality" class="mediumselect" id="idNationality">
												<option value="">Select...</option>
												<c:forEach items="${nationalityBean.values}"
													var="nationality">
													<option value="${nationality}">${nationality}</option>
												</c:forEach>
										</select>
										</td>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.customer.since" />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<sx:datetimepicker name="customerSince" id="idCustomerSince"
												displayFormat="dd-MM-yyyy" />
										</td>

										</tr>
										
										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.no.of.children" />:&nbsp;</b></font>
										</td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="noOfChildren" id="idNoOfChildren"
											class="smallTxtLeftAlign" type="text">
										</td>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.relationship.officer" />:&nbsp;</b></font>
										</td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<input name="relationshipOfficer" id="idRelationshipOfficer"
											class="mediumTxtLeftAlign" type="text">
										</td>
	
										
									</tr>
	
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.caste" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" name="customerCaste" class="mediumselect" id="idCustomerCaste">
												<option value="select"><s:text
														name="global.val.select" /></option>
												<option value="enmum.caste1"><s:text
														name="global.val.caste1" /></option>
												<option value="enum.caste2" selected><s:text
														name="global.val.caste2" /></option>
										</select>
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.caste.category" />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" name="customerCasteCategory" id="idCustomerCasteCategory"
											class="mediumselect">
												<option value="select"><s:text
														name="global.val.select" />.
												</option>
												<option value="category1"><s:text
														name="global.val.category1" /></option>
												<option value="category2" selected><s:text
														name="global.val.category2" /></option>
										</select>
										</td>
										</tr>
										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.additional.information" />:&nbsp;
											</b></font>
										</td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="3"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="custAdditionalInfo" size="60" id="idCustAdditionalInfo"
											class="largeTxtLeftAlign" type="text">
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.KYC.type" />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" name="KYCType" class="mediumselect" id="idKYCType">
	
												<option value="enmum.caste1"><s:text
														name="global.val.E-KYC" /></option>
												<option value="enum.caste2" selected><s:text
														name="global.val.General" /></option>
										</select>
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.HNW.category" />:&nbsp;
											</b></font>
										</td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="HNWCategory" size="20" id="idHNWCategory"
											class="largeTxtLeftAlign" type="text">
										</td>
									</tr>
									<tr>
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.father.spouse.name" />:&nbsp;</b></font>
										</td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="fatherSpouseName" id="idFatherSpouseName"
											class="mediumTxtLeftAlign" type="text">
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.customer.registration" />:&nbsp;</b></font>
										</td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="customerRegNo" id="idCustomerRegNo"
											class="mediumTxtLeftAlign" type="text">
										</td>
									</tr>
								</table>
							
</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a id="miscInfo" onclick="toggleTable('miscTbl');" href="#"><s:text
													name="global.lbl.MISC.details" /></a>
			</b></font>
			
		</td>
	</tr></table>
</div>
<!-- MISC DETAILS -->
<div id="miscTbl" style="display:none">

									<table width="100%" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text name="global.lbl.transaction.freeze" />:</b></font></td>
										
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<font face="Calibri"> <input type="radio" value="true"
												class="radiobutton" name="transactionFreeze" id="idTransactionFreeze"></font><font
											size="2"><s:text name="global.lbl.yes" />
										</font><input type="radio" value="false" class="radiobutton"
											name="transactionFreeze" id="idTransactionFreeze"><font size="2"><s:text
													name="global.lbl.no" />
										</font>
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.transaction.freeze.reason" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="text" name="transactionFreezeReason" id="idTransactionFreezeReason"
											class="largeTxtLeftAlign"></td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.special.instructions" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="specialInstructions" size="30" type="text"
											id="idSpecialInstructions" class="largeTxtLeftAlign">
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.NPA.rating" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="text" name="NPARating" class="mediumTxtLeftAlign" id="idNPARating">
										</td>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.NPA.reason" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="text" name="NPAReason" class="largeTxtLeftAlign" id="idNPAReason"></td>
									</tr>
								</table>
							

</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('adhocTbl');" href="#"><s:text
													name="global.lbl.adhoc.details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- ADHOC DETAILS -->
<div id="adhocTbl" style="display:none">

							<table width="100%" align="center" cellpadding="0" cellspacing="0">
									
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.qualifications" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="qualifications" size="20" type="text"
											id="idQualifications" class="mediumTxtLeftAlign">
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.religion" />:
											</b></font></td>
									<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="religion" size="20" type="text"
											id="idReligion" class="mediumTxtLeftAlign">
										</td>
	
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.blood.group" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="bloodGroup" size="20" type="text"
											id="idBloodGroup" class="mediumTxtLeftAlign">
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.residence.type" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="residenceType" size="20" type="text"
											id="idResidenceType" class="mediumTxtLeftAlign">
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.number.of.dependants" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="numberOfDependants" size="20" type="text"
											id="idNumberOfDependants" class="mediumTxtLeftAlign">
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.introducer.YN" />:
											</b></font></td>
	
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri"><input type="radio" value="true"
												class="radiobutton" name="introducerYN" id="idIntroducerYN"></font><font
											size="2"><s:text name="global.lbl.yes" />
										</font><input type="radio" value="false" class="radiobutton" id="idIntroducerYN"
											name="introducerYN"><font size="2"><s:text
													name="global.lbl.no" />
										</font>
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.introducer.number" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="introducerNumber" size="20" type="text"
											id="idIntroducerNumber" class="mediumTxtLeftAlign">
										</td>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.PEP.YN" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<font face="Calibri"> <input type="radio" value="true"
												class="radiobutton" name="PEPYN" id="idPEPYN"></font><font size="2"><s:text
													name="global.lbl.yes" />
										</font><input type="radio" value="false" class="radiobutton" id="idPEPYN"
											name="PEPYN"><font size="2"><s:text
													name="global.lbl.no" />
										</font>
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.AML.Rating" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="AMLRating" size="20" type="text"
											id="idAMLRating" class="mediumTxtLeftAlign">
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.TDS.reason" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="TDSReason" size="20" type="text"
											id="idTDSReason" class="largeTxtLeftAlign">
										</td>
	
									</tr></table>
</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('personalTbl');" href="#"><s:text
													name="global.lbl.personal.details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- PERSONAL DETAILS -->
<div id="personalTbl" style="display:none">

							<table width="100%" align="center" cellpadding="0" cellspacing="0">
									
									<tr bgcolor="#FFFFFF">
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.customer.category" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" id="idCustomerCategory" name="customerCategory"
											class="mediumselect">
												<option>General</option>
												<option>Staff</option>
												<option>Pensioner</option>
												<option>Trust/Society</option>
												<option>Others</option>
	
										</select>
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.member.type" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select name="memberType" class="mediumselect" id="idMemberType">
												<option>Regular</option>
												<option>Nominal</option>
										</select>
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.member.number" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="memberNumber" size="20" type="text"
											id="idMemberNumber" class="largeTxtLeftAlign">
										</td>
									</tr>
<!-- RESIDENTIAL DETAILS -->									
									<tr>
										<td><font face="Calibri" size="2"></font><font
											><b><u><s:text
													name="global.lbl.residential.details" /></u></b></font></td>
									</tr>
	
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.resident.YN" />:
											</b></font></td>
	
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<font face="Calibri"> <input type="radio" value="true"
												class="radiobutton" id="idResidentYN" name="residentYN"></font><font size="2"><s:text
													name="global.lbl.yes" />
										</font><input type="radio" value="false" class="radiobutton"
											name="residentYN" id="idResidentYN"><font size="2"><s:text
													name="global.lbl.no" />
										</font>
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.residential.status" /></b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" name="residentialStatus" id="idResidentialStatus" class="mediumselect">
												<option value="">Select...</option>
												<c:forEach items="${nationalityBean.values}"
													var="nationality">
													<option value="${nationality}">${nationality}</option>
												</c:forEach>
										</select>
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.residence.country" />:
											</b></font></td>
	
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select name="residentCountry" 
											id="idResidentCountry" class="mediumselect">
												<!-- name="selected record" -->
												<c:forEach var="countryMst" items="${countries2}">
													<option value="${countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
												</c:forEach></select>
										</td>
									</tr>
<!-- NRI/FOREIGNER DETAILS -->
									<tr>
										<td><font face="Calibri" size="2"></font><font
											><b><u><s:text
													name="global.lbl.NRI.foreigner.details" /></u></b></font></td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.passport.number" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="passportNumber" size="20" type="text"
											id="idPassportNumber" class="largeTxtLeftAlign">
										</td>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.issued.by.country" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select id="selected record" name="issuedByCountry"
											id="idIssuedByCountry" class="mediumselect">
												<!-- name="selected record" -->
												<c:forEach var="countryMst" items="${countries3}">
													<option value="${countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
												</c:forEach>
										</select>
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.issued.date" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<sx:datetimepicker name="passportIssuedDate"
												id="idPassportIssuedDate" displayFormat="dd-MM-yyyy" />
										</td>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.expiry.date" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<sx:datetimepicker name="passportExpiryDate"
												id="idPassportExpiryDate" displayFormat="dd-MM-yyyy" />
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.visa.type" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select name="visaType" id="idVisaType" class="mediumselect">
												<option>Business Visa</option>
												<option>Working Visa</option>
										</select>
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.visa.number" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="visaNumber" size="20" type="text"
											id="idVisaNumber" class="mediumTxtLeftAlign">
										</td>
									</tr>
	
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.visa.issued.date" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
												<sx:datetimepicker name="visaIssuedDate" id="idVisaIssuedDate"
												displayFormat="dd-MM-yyyy" />
										</td>
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.visa.expiry.date" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<sx:datetimepicker name="visaExpiryDate" id="idVisaExpiryDate"
												displayFormat="dd-MM-yyyy" />
										</td>
									</tr>
	
								</table>
</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('taxDtlsTbl');" href="#"><s:text
													name="global.lbl.tax.details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- TAX DETAILS -->
<div id="taxDtlsTbl" style="display:none">
									<table width="100%" align="left" cellpadding="0" cellspacing="0">
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.TDS.YN" />:
											</b></font></td>
	
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<font face="Calibri"> <input type="radio" value="true"
												class="radiobutton" name="TDSYN" id="idTDSYN"></font><font size="2"><s:text
													name="global.lbl.yes" />
										</font><input type="radio" value="false" class="radiobutton" id="idTDSYN"
											name="TDSYN"><font size="2"><s:text
													name="global.lbl.no" />
										</font>
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.TDS.percentage" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="TDSPercentage" size="20" type="text"
											id="idTDSPercentage" class="mediumTxtLeftAlign">
										</td>
									</tr>
									</table>
</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('addressTbl');" href="#"><s:text
										name="global.lbl.address.details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- ADDRESS DETAILS -->
<div id="addressTbl" style="display:none">
			<table id="idTBLookuplist1" width="100%" align="left" cellpadding="1" cellspacing="1">
						<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.address.type"  />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											&nbsp;<select size="1" id="idCustAddressType" name="custAddressType"
											class="mediumselect">
												<option value="select"><s:text
														name="global.val.select" /></option>
												<c:forEach items="${addressTypeBean.values}"
													var="addressType">
													<option value="${addressType}">${addressType}</option>
												</c:forEach>
										</select>
										</td></tr>
										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.address" />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="3"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input id="idCustAddress1" name="custAddress1" size="15"
											type="text" class="mediumTxtLeftAlign">
											<input name="custAddress2" size="15" id="idCustAddress2"
											class="mediumTxtLeftAlign">
											<input name="custAddress3" size="15" type="text"
											id="idCustAddress3" class="mediumTxtLeftAlign">
										</td>
									</tr>
									<tr>
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.country"  />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select name="countries1" id="idCountry1" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="countryMst" items="${countries1}" >
									<option value="${countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
								</c:forEach>
								</select> 
										</td>
										
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.state"  />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<select name="states1" id="idStates1" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="stateMst" items="${states1}" >
									<option value="${stateCode}">${stateMst.stateCode}-${stateMst.stateName}</option>
								</c:forEach>
								</select> 
										</td>
	
										
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.village" />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<select name="villages1" id="idVillages1" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="villageMst" items="${villages1}" >
									<option value="${villageCode}">${villageMst.villageCode}-${villageMst.villageName}</option>
								</c:forEach>
								</select> 
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.municipality" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											&nbsp;<select name="municipalities1" id="idMunicipalities1" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="municipality" items="${municipalities1}" >
									<option value="${municipalityCode}">${municipality.municipalityCode}-${municipality.municipalityName}</option>
								</c:forEach>
								</select> 
										</td>
									</tr>
	
									<tr>
										
	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.district.city" />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select name="districts1" id="idDistrictCity1" class="mediumselect"><!-- name="selected record" -->
										<c:forEach var="districtMst" items="${districts1}" >
											<option value="${districtCode}">${districtMst.districtCode}-${districtMst.districtName}</option>
										</c:forEach>
										</select> 
										</td>
										
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.pincode" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="pinCode" size="20" type="text" id="idCustPinCode"
											class="smallTxtLeftAlign">
										</td>
									</tr>
									</table><br>
										<table width="100%" align="left" cellpadding="1" cellspacing="1">
										<tr>
										<td align="center"
											style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
											<input type="button"
											value=" <s:text name="global.btn.add"/> " id="idAdd"
											class="button" onclick="add();"> &nbsp; <input
											type="button" value=" <s:text name="global.btn.update"/> "
											id="idUpdate" class="button" onclick="update();">&nbsp;
											<input type="button"
											value=" <s:text name="global.btn.clear"/> " id="idClear"
											class="button" onclick="clearing();">
										</td>
									</tr></table>
									<br>
								<table id="tblData" width="100%" cellpadding="0" cellspacing="1" align="center">
									<tr bgcolor="#C4C4FF" >
										<td width="9.09%" align="center"
										style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.address.type" /></b></font></td>
										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.Address" /></b></font></td>
										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.village" /></b></font></td>
										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.state" /></b></font></td>
										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.municipality" /></b></font></td>
										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.country" /></b></font></td>
										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.district.city" /></b></font></td>
										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.pincode" /></b></font></td>

										<td width="9.09%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.action" /></b></font></td>
									</tr>
								</table>
								
</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('assetTbl');" href="#"><s:text
										name="global.lbl.asset.details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- ASSET DETAILS -->
<div id="assetTbl" style="display:none">
				<table id="idTBLookuplist3" width="100%" height="26" cellpadding="0" cellspacing="1">
							
								<tr valign="middle">
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
													name="global.lbl.registration" /> #:</b></font></td>
									<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="text" name="regNumber" size="25"
										id="idRegNumber" class="mediumTxtLeftAlign">
									</td>
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text name="global.lbl.plot" /></b>
											#:</font></td>
									<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="text" name="plotNumber" size="25" id="idPlotNumber"
										class="mediumTxtLeftAlign">
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.address" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="3"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input id="idAssetAddress1" name="assetAddress1" size="20"
											type="text" class="largeTxtLeftAlign">
											<input name="assetAddress2" size="20" id="idAssetAddress2"
											class="largeTxtLeftAlign">
											<input name="assetAddress3" size="20" type="text"
											id="idAssetAddress3" class="largeTxtLeftAlign">
										</td>
										
										</tr>
										
										<tr>
										 <td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.state" />:
											</b></font></td> 
											<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
 										<select id="selected record" name="states2" id="idStates2" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="stateMst" items="${states2}" >
									<option value="${stateCode}">${stateMst.stateCode}-${stateMst.stateName}</option>
								</c:forEach>
								</select> 
 									</td> 
 									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.village" />:
											</b></font></td> 
											
											<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
 										<select id="selected record" name="villages2" id="idVillages2" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="villageMst" items="${villages2}" >
									<option value="${villageCode}">${villageMst.villageCode}-${villageMst.villageName}</option>
								</c:forEach>
								</select> 
 									</td>   
										</tr>
										
										<tr>
										 <td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.municipality" />:
											</b></font></td> 	
						
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
 										<select id="selected record" name="municipalities2" id="idMunicipalities2" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="municipality" items="${municipalities2}" >
									<option value="${municipalityCode}">${municipality.municipalityCode}-${municipality.municipalityName}</option>
								</c:forEach>
								</select> 
 									</td>  
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.district.city" />:
											</b></font></td> 
										
								<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
 										<select id="selected record" name="districts2" id="idDistrictCity2" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="districtMst" items="${districts2}" >
									<option value="${districtCode}">${districtMst.districtCode}-${districtMst.districtName}</option>
								</c:forEach>
								</select> 
 									</td> </tr>
								
								<tr valign="middle">
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text name="global.lbl.area" /></b>
											(<s:text name="global.lbl.acre" />):</font></td>
									<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="areaSize" size="15" id="idAreaSize"
										class="mediumTxtLeftAlign">
									</td>
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text name="global.lbl.rate" /></b>(<s:text
												name="global.lbl.INR" />):</font></td>
									<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<input name="areaRate" size="20" id="idAreaRate"
										class="smallTxtLeftAlign">
									</td>
								</tr>
								<tr valign="middle">
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
												name="global.lbl.approx.value" /></b> (<s:text
												name="global.lbl.INR" />):</font></td>
									<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="approxMonetaryValue" size="20"
										id="idApproxMonetaryValue" class="smallTxtLeftAlign">
									</td>
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
												name="global.lbl.remarks" /></b>:</font></td>
								<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="remarks1" size="30" id="idRemarks1"
										class="mediumTxtLeftAlign">
									</td>
								</tr>
								<tr valign="middle">
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
												name="global.lbl.o/s.loan" /> </b>(<s:text
												name="global.lbl.if.any" />):</font></td>
									<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri"> <input type="radio" value="true"
												class="radiobutton" name="osLoanYN"></font><font
											size="2"><s:text name="global.lbl.yes" />
										</font><input type="radio" value="false" class="radiobutton"
											name="osLoanYN"><font size="2"><s:text
													name="global.lbl.no" />
										</font>
									</td>
									<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
												name="global.lbl.o/s.amount" /> </b>(<s:text
												name="global.lbl.INR" />):</font></td>
									<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<input id="idOsAmount" name="osAmount"
										class="mediumTxtLeftAlign">
									</td>
								</tr>

							</table>
							<br>
							<table width="100%" cellpadding="0" cellspacing="1">
								<tr height="25">
									<td width="30%" align="center"
										style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
										<input type="button" value=" <s:text name="global.btn.add"/> "
										id="idAdd1" class="button" onclick="add1();"> &nbsp; <input
										type="button" value=" <s:text name="global.btn.update"/> "
										id="idUpdate1" class="button" onclick="update1();">&nbsp;
										<input type="button"
										value=" <s:text name="global.btn.clear"/> " id="idClear1"
										class="button" onclick="clearing1();">
									</td>
								</tr>
							</table>
									<br>
								<table id="tblData1" width="100%" cellspacing="1"
									cellpadding="0">
									<tr bgcolor="" height="25">
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.registration" /> #</b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.plot" /> #</b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.address" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.village.code" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.taluka" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.district.city" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.state" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.area" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.rate" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.approx.value" /> (<s:text
											name="global.lbl.INR" />)</b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.remarks" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.o/s.loan" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.o/s.amount" /></b></font></td>
										<td width="6.25%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
											name="global.lbl.action" /></b></font></td>
									</tr>
								</table>
							
</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('contactTbl');" href="#"><s:text
										name="global.lbl.contact.details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- CONTACT DETAILS -->
<div id="contactTbl" style="display:none">
					<table id="idTBLookuplist2" width="100%" height="26" cellpadding="0" cellspacing="1" align="left">
									<tr bgcolor="#FFFFFF">
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.residence.phone" />:&nbsp;</b></font></td>
														
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input type="text" name="residencePhone" class="mediumTxtLeftAlign" id="idResidencePhone">
										</td>
										
									
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.mobile.number" />:&nbsp;</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="2"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input id="idMobile1" name="mobile1" size="20" type="text" class="mediumTxtLeftAlign">
											<input id="idMobile2" name="mobile2" size="20" type="text" class="mediumTxtLeftAlign">
										</td></tr>

										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.email.id" />:
											</b></font></td> 
											
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="2"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
 										<input id="idEmailId1" name="emailId1" size="30" type="text" class="largeTxtLeftAlign">
 										<input id="idEmailId2" name="emailId2" size="30" type="text" class="largeTxtLeftAlign"> 
 										</td>  
										</tr>
		
										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.office.phone" />:
											</b></font></td> 
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="1"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<input id="idOfficePhone1" name="officePhone1" size="20" type="text" class="mediumTxtLeftAlign">
 										<input id="idOfficePhone2" name="officePhone2" size="20" type="text" class="mediumTxtLeftAlign"> 
	 									</td>  
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.fax.no" />:
											</b></font></td> 	
						
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="2"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
	 									<input id="idFaxNo" name="faxNo" size="20" type="text" class="mediumTxtLeftAlign">
 										</tr>
								</table>
</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('busiDtlsTbl');" href="#"><s:text
										name="global.lbl.business.details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- BUSINESS DETAILS -->
<div id="busiDtlsTbl" style="display:none">

					<table id="idTBLookuplist4" width="100%" height="26" cellpadding="0" cellspacing="1">
							
									<tr>
										
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.business.id" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="2"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
	 									<input type="text" name="businessId"  id="idBusinessId" class="mediumTxtLeftAlign">
										</td>
									</tr>
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.number.of.staff" /> #:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="2"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="noOfStaff" size="30" type="text"
											id="idNoOfStaff" class="mediumTxtLeftAlign">
										</td>
										
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.registration.code" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" colspan="2"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="regCode" size="30" type="text"
											id="idRegCode" class="mediumTxtLeftAlign">
										</td>
									
									</tr>
									</table>
									<br>
								<table width="100%" cellpadding="0" cellspacing="1">
									<tr>
										<td width="30%" align="center"
											style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
											<input type="button"
											value=" <s:text name="global.btn.add"/> " id="idAdd2"
											class="button" onclick="add2();"> &nbsp; <input
											type="button" value=" <s:text name="global.btn.update"/> "
											id="idUpdate2" class="button" onclick="update2();">&nbsp;
											<input type="button"
											value=" <s:text name="global.btn.clear"/> " id="idClear2"
											class="button" onclick="clearing2();">
										</td>
									</tr>
								</table><br>
								<table id="tblData2" width="100%" cellspacing="1" cellpadding="0">
									<tr>
										<td width="25%" style="border-bottom: 1px dotted #C0C0C0" align="center"
											bgcolor="#8A8AFF"><font face="Calibri" size="2"><b><s:text
														name="global.lbl.business.id" /></b></font></td>
										<td width="25%" style="border-bottom: 1px dotted #C0C0C0" align="center"
											bgcolor="#8A8AFF"><font face="Calibri" size="2"><b><s:text
														name="global.lbl.no.of.staff" /></b></font></td>
										<td width="25%" style="border-bottom: 1px dotted #C0C0C0" align="center"
											bgcolor="#8A8AFF"><font face="Calibri" size="2"><b><s:text
														name="global.lbl.registration.code" />
											</b></font></td>
										<td width="25%" style="border-bottom: 1px dotted #C0C0C0" align="center"
											bgcolor="#8A8AFF"><font face="Calibri" size="2"><b><s:text
														name="global.lbl.action" /></b></font></td>
									</tr>
								</table>

</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('emplTbl');" href="#"><s:text
										name="global.lbl.employment.details" /></a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- EMPLOYMENT DETAILS -->
<div id="emplTbl" style="display:none">
				
							<table id="idTBLookuplist5" cellpadding="0" cellspacing="1">
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.profession.type" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" id="idProfessionType" name="professionType"
											class="mediumselect">
												<option>Profession1</option>
												<option>Profession2</option>
										</select>
										</td>
										
									</tr>

									<tr bgcolor="#FFFFFF">
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
														name="global.lbl.address" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input id="idEmpAddress1" name="empAddress1" size="15"
											type="text" class="largeTxtLeftAlign">
											<input name="empAddress2" size="15" id="idEmpAddress2"
											class="largeTxtLeftAlign">
											<input name="empAddress3" size="15" type="text"
											id="idEmpAddress3" class="largeTxtLeftAlign">
										</td>
										  
									</tr>
									
									<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
											name="global.lbl.country" />:</b></font></td> 
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
 											<select name="countries3" id="idCountry3" class="mediumselect"><!-- name="selected record" -->
											<c:forEach var="countryMst" items="${countries3}" >
											<option value="${countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
											</c:forEach>
											</select> 
 										</td>  	
 										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.state" />:</b></font></td> 
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
 											<select name="states3" id="idStates3" class="mediumselect"><!-- name="selected record" -->
											<c:forEach var="stateMst" items="${states3}" >
											<option value="${stateCode}">${stateMst.stateCode}-${stateMst.stateName}</option>
											</c:forEach>
											</select> 
 										</td>	
									</tr>
									
									<tr bgcolor="#FFFFFF">
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.district.city" />:
											</b></font></td> 
										
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
 										<select name="districts3" id="idDistrictCity3" class="mediumselect"><!-- name="selected record" -->
										<c:forEach var="districtMst" items="${districts3}" >
										<option value="${districtCode}">${districtMst.districtCode}-${districtMst.districtName}</option>
										</c:forEach>
										</select> 
 										</td>  
										</tr>
										
									<tr>	
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
											name="global.lbl.employee.number" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="empNumber" size="20" type="text" id="idEmpNumber"
											class="smallTxtLeftAlign"></td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
											name="global.lbl.designation" />:</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="designation" size="20" type="text" id="idDesignation"
											class="smallTxtLeftAlign">
										</td>
										</tr>
										
										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.department" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="department" size="20" type="text" id="idDepartment"
											class="smallTxtLeftAlign">
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.years.in.service" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="yearsInService" size="20" type="text" id="idYearsInService"
											class="smallTxtLeftAlign">
										</td>
										</tr>
										
										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.DOR" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="DOR" size="20" type="text" id="idDOR"
											class="smallTxtLeftAlign">
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.annual.income" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="annualIncome" size="20" type="text" id="idAnnualIncome"
											class="smallTxtLeftAlign">
										</td>
										</tr>
										
<tr>
<td><u><b><s:text name="global.lbl.other.bank.accounts" /></b></u>:</td>
</tr>
										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.account.type" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select name="accountType" id="idAccountType" class="mediumselect">
											<option>Account Type1</option>
											<option>Account Type2</option>
											<option>Account Type3</option>
											</select>
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.bank.code" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="bankCode" size="20" type="text" id="idBankCode"
											class="smallTxtLeftAlign">
										</td>
										</tr>
									
										<tr>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.bank.name" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="bankName" size="20" type="text" id="idBankName"
											class="smallTxtLeftAlign">
										</td>
										<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b> <s:text
														name="global.lbl.account.number" />:
											</b></font></td>
										<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="accountNumber" size="20" type="text" id="idAccountNumber"
											class="smallTxtLeftAlign">
										</td>
									</tr>
									</table>
								<br>
									<table width="100%" cellpadding="0" cellspacing="1">
									<tr height="25">
										<td width="30%" align="center"
											style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
											<input type="button"
											value=" <s:text name="global.btn.add"/> " id="idAdd3"
											class="button" onclick="add3();"> &nbsp; <input
											type="button" value=" <s:text name="global.btn.update"/> "
											id="idUpdate3" class="button" onclick="update3();">&nbsp;
											<input type="button"
											value=" <s:text name="global.btn.clear"/> " id="idClear3"
											class="button" onclick="clearing3();">
										</td>
									</tr>
								</table>
								<table id="tblData3" width="100%" cellpadding="0" cellspacing="1">
									<tr height="25" bgcolor="#C4C4FF">
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.profession.type" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.employer.number" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.department" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.designation" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.address" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.district.city" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.state" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.country" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.years.in.service" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.annual.income" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.DOR" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.account.type" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.bank.code" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.bank.name" /></b></font></td>
										<td width="5.55%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.account.number" /></b></font></td>
										<td width="12.69%" align="center"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
											name="global.lbl.action" /></b></font></td>
									</tr>
									
									</table>
									
</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('KYCDocsTbl');" href="#"><s:text
										name="global.lbl.KYC.docs" /></a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- KYC DOCS DETAILS -->
<div id="KYCDocsTbl" style="display:none">
							<table id="idTBLookuplist6" width="100%" height="26" cellpadding="0" cellspacing="1">
							
											<tr>
												
											<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><u><s:text
																name="global.lbl.proof.type" /></u>:</b></font></td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select class="mediumselect" name="proofType" id="idProofType">
												<option>PAN</option>
												<option>Passport</option>
												<option>Electricty Bill</option>
												<option>Aadhar Card</option>
												</select>
											</td>
											
											<%-- <td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
												name="global.lbl.KYC.type" />:&nbsp;</b></font></td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<select size="1" name="KYCType" class="mediumselect" id="idKYCType">
												<option value="enmum.caste1"><s:text
														name="global.val.E-KYC" /></option>
												<option value="enum.caste2" selected><s:text
														name="global.val.General" /></option>
												</select>
											</td> --%>
											<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.id.number" /> #:&nbsp;</b></font></td>
											<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="idNumber" size="30" type="text"
													id="idIdNumber" class="mediumTxtLeftAlign"></td>
											</tr>
												
											<tr>
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.issued.by" />:&nbsp;</b></font></td>
												<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="issuedBy" size="30" type="text"
													id="idIssuedBy" class="mediumTxtLeftAlign">
												</td>
											
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.issued.date" />:&nbsp;</b></font></td>
												<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<sx:datetimepicker name="issuedDate" id="idIssuedDate"
														displayFormat="dd-MM-yyyy" />
												</td>
												</tr>
											<tr>
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.expiry.date" />:&nbsp;</b></font></td>
												<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<sx:datetimepicker name="expiryDate" id="idExpiryDate"
														displayFormat="dd-MM-yyyy" />
												</td>
											
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.recieved.date" />:&nbsp;</b></font></td>
												<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<sx:datetimepicker name="recievedDate" id="idRecievedDate"
														displayFormat="dd-MM-yyyy" />
												</td>
												</tr>
												<tr>
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.remarks" /> #:&nbsp;</b></font></td>
												<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left" 
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
											<input name="remarks" size="30" type="text"
													id="idRemarks" class="largeTxtLeftAlign">
												</td>
												</tr>
										</table>
											<br>
										<table width="100%" cellpadding="0" cellspacing="1">
											<tr height="25">
												<td width="30%" align="center"
													style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
													<input type="button"
													value=" <s:text name="global.btn.add"/> " id="idAdd4"
													class="button" onclick="add4();"> &nbsp; <input
													type="button" value=" <s:text name="global.btn.update"/> "
													id="idUpdate4" class="button" onclick="update4();">&nbsp;
													<input type="button"
													value=" <s:text name="global.btn.clear"/> " id="idClear4"
													class="button" onclick="clearing4();">
												</td>
											</tr>
										</table>
										<table id="tblData4" width="100%" cellspacing="1"
											cellpadding="0">
											<tr>
												<td width="12.5%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.proof.type" /></b></font></td>
												<td width="12.5%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.id.number" /></b></font></td>
												<td width="12.5%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.issued.date" /></b></font></td>
												<td width="12.5%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.expiry.date" /> #
													</b></font></td>
												<td width="12.5%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.issued.by" /></b></font></td>
												<td width="12.5%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.recieved.date" /></b></font></td>
												<td width="12.5%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.remarks" /></b></font></td>
												<td width="12.5%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.action" /></b></font></td>
											</tr>
											
										</table>
</div>

<hr color="#COCOFF">
<div align="center">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="25" bgcolor="#EEEEFF">
		<td align="left" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<font face="Calibri" size="3"><b>&nbsp;&nbsp;
				<a onclick="toggleTable('KYCFamilyTbl');" href="#">KYC Family Details</a>
			</b></font>
		</td>
	</tr></table>
</div>

<!-- KYC FAMILY DETAILS -->
<div id="KYCFamilyTbl" style="display:none">
<table id="idTBLookuplist6" width="100%" height="26" cellpadding="0" cellspacing="1">

											<tr>
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.family.member.name" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
												<input type="text" name="familyMemberName"
													id="idFamilyMemberName" size="30"
													class="mediumTxtLeftAlign"></td>
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.relationship" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
												<input name="relationship1" size="30" type="text"
													id="idRelationship1" class="mediumTxtLeftAlign"></td>
											</tr>
											<tr>
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.gender" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input type="radio" value="Male" class="radiobutton"
													id="idGender1" name="gender"><font face="Calibri"
													size="2"><s:text name="global.lbl.male" /></font>&nbsp;&nbsp;
													<input type="radio" value="Female" class="radiobutton"
													id="idGender1" name="gender"><font face="Calibri"
													size="2"><s:text name="global.lbl.female" /></font>
												</td>
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.dob" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<sx:datetimepicker name="dob" id="idDob"
														displayFormat="dd-MM-yyyy" />
												</td>
											</tr>
											<tr>
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.profession" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input type="text" name="profession" size="20"
													id="idProfession" class="mediumTxtLeftAlign">
												</td>
												<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri" size="2"><b><s:text
																name="global.lbl.education" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input type="text" name="education" size="20"
													id="idEducation" class="mediumTxtLeftAlign">
												</td>
											</tr>
										</table><br>
										<table width="100%" cellpadding="0" cellspacing="1">
											<tr height="25">
												<td width="30%" align="center"
													style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
													<input type="button"
													value=" <s:text name="global.btn.add"/> " id="idAdd5"
													class="button" onclick="add5();"> &nbsp; <input
													type="button" value=" <s:text name="global.btn.update"/> "
													id="idUpdate5" class="button" onclick="update5();">&nbsp;
													<input type="button"
													value=" <s:text name="global.btn.clear"/> " id="idClear5"
													class="button" onclick="clearing5();">
												</td>
											</tr>
										</table>
										<table id="tblData5" width="100%" cellspacing="1"
											cellpadding="0">
											<tr height="20">
												<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.family.member.name" /></b></font></td>
												<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.relationship" /></b></font></td>
												<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.gender" /></b></font></td>
												<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.date.of.birth" /></b></font></td>
												<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.profession" /></b></font></td>
												<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.education" /></b></font></td>
												<td width="14.28%" style="border-bottom: 1px dotted #C0C0C0" align="center"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.action" /></b></font></td>
											</tr>
										</table>
</div>

<br>
<div id="saveBtnDiv" style="display:block">
	<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr height="35" bgcolor="#COCOFF">
		<td align="center" style="border-left-width: 1px solid #C0C0C0; border-right-width: 1px solid #C0C0C0; 
								border-top-width: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0">
			<input type="submit" name="btnSubmit" value="Save" />&nbsp;&nbsp;<input type="reset" name="btnClear" value="Clear" />
		</td>
	</tr></table>
</div>
<input type="hidden" value="mlValue" name="mlValue"> <input
				type="hidden" value="mlValue1" name="mlValue1"> <input
				type="hidden" value="mlValue2" name="mlValue2"> <input
				type="hidden" value="mlValue3" name="mlValue3"> <input
				type="hidden" value="mlValue4" name="mlValue4"><input
				type="hidden" value="mlValue5" name="mlValue5">
</form>
</body>
</html>