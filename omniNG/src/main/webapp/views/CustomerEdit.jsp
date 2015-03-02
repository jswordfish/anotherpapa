<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="nationalityBean"
	class="com.infrasofttech.bean.NationalityBean" />
<jsp:useBean id="maritalStatusBean"
	class="com.infrasofttech.bean.MaritalStatusBean" />
<jsp:useBean id="addressTypeBean"
	class="com.infrasofttech.bean.AddressTypeBean" />
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
function startUp1() {
	//alert("startUp is calling");
	
	basic1();
	//todo
}
function startUp2() {
	//alert("startUp is calling");
	
	basic2();
	//todo
}
function startUp3() {
	//alert("startUp is calling");
	
	basic3();
	//todo
}
function startUp4() {
	//alert("startUp is calling");
	
	basic4();
	//todo
}
function startUp5() {
	//alert("startUp is calling");
	
	basic5();
	//todo
}
function startUp6() {
	//alert("startUp is calling");
	
	basic6();
	//todo
}
function startUp7() {
	//alert("startUp is calling");
	
	basic7();
	//todo
}

	function basic1() {
		//alert("basic is loading");
		var elemt1 = document.getElementById("idTBLookuplist1");
	
		elemt1.style.display = "none";
	}

	function basic2() {
		//alert("basic is loading");
		var elemt2 = document.getElementById("idTBLookuplist2");

		elemt2.style.display = "none";
	}
	function basic3() {
		//alert("basic is loading");
		var elemt3 = document.getElementById("idTBLookuplist3");

		elemt3.style.display = "none";
	}
	function basic4() {
		//alert("basic is loading");
		var elemt4 = document.getElementById("idTBLookuplist4");
	
		elemt4.style.display = "none";
	}

	function basic5() {
		//alert("basic is loading");
		var elemt5 = document.getElementById("idTBLookuplist5");
	
		elemt5.style.display = "none";
	}

	function basic6() {
		//alert("basic is loading");
		var elemt6 = document.getElementById("idTBLookuplist6");
	
		elemt6.style.display = "none";
	}
	function basic7() {
		//alert("basic is loading");
		var elemt7 = document.getElementById("idTBLookuplist7");
	
		elemt7.style.display = "none";
	}

	function toggleTable1() {
		var elem1 = document.getElementById("idTBLookuplist1");

		var hide = elem1.style.display == "none";
		if (hide) {
			elem1.style.display = "table";
		} else {
			elem1.style.display = "none";
		}
	}
	function toggleTable2() {
		var elem2 = document.getElementById("idTBLookuplist2");

		var hide = elem2.style.display == "none";
		if (hide) {
			elem2.style.display = "table";
		} else {
			elem2.style.display = "none";
		}
	}
	function toggleTable3() {
		var elem3 = document.getElementById("idTBLookuplist3");

		var hide = elem3.style.display == "none";
		if (hide) {
			elem3.style.display = "table";
		} else {
			elem3.style.display = "none";
		}
	}
	function toggleTable4() {
		var elem4 = document.getElementById("idTBLookuplist4");

		var hide = elem4.style.display == "none";
		if (hide) {
			elem4.style.display = "table";
		} else {
			elem4.style.display = "none";
		}
	}

	function toggleTable5() {
		var elem5 = document.getElementById("idTBLookuplist5");

		var hide = elem5.style.display == "none";
		if (hide) {
			elem5.style.display = "table";
		} else {
			elem5.style.display = "none";
		}
	}

	function toggleTable6() {
		var elem6 = document.getElementById("idTBLookuplist6");

		var hide = elem6.style.display == "none";
		if (hide) {
			elem6.style.display = "table";
		} else {
			elem6.style.display = "none";
		}
	}
	function toggleTable7() {
		var elem7 = document.getElementById("idTBLookuplist7");

		var hide = elem7.style.display == "none";
		if (hide) {
			elem7.style.display = "table";
		} else {
			elem7.style.display = "none";
		}
	}


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
		var cell12 = row.insertCell(11);
		var cell13 = row.insertCell(12);

		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idAddressType").value;
		cell2.innerHTML = document.getElementById("idLocationId").value;
		cell3.innerHTML = document.getElementById("idLocationName").value;
		cell4.innerHTML = document.getElementById("idAddress").value;
		cell5.innerHTML = document.getElementById("idAddress1").value;
		cell6.innerHTML = document.getElementById("idAddress2").value;

		cell7.innerHTML = document.getElementById("idVillages1").value;
		cell8.innerHTML = document.getElementById("idStates1").value;
		cell9.innerHTML = document.getElementById("idMunicipalities1").value;
		cell10.innerHTML = document.getElementById("idCountry1").value;
		cell11.innerHTML = document.getElementById("idDistrictCity1").value;
		cell12.innerHTML = document.getElementById("idPincode").value;

		cell13.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

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
		var idAddressType = a.cells[0].innerHTML;
		var idLocationId = a.cells[1].innerHTML;
		var idLocationName = a.cells[2].innerHTML;
		var idAddress = a.cells[3].innerHTML;
		var idAddress1 = a.cells[4].innerHTML;
		var idAddress2 = a.cells[5].innerHTML;
		var idVillages1 = a.cells[6].innerHTML;
		var idStates1 = a.cells[7].innerHTML;
		var idMunicipalities1 = a.cells[8].innerHTML;
		var idCountry1 = a.cells[9].innerHTML;
		var idDistrictCity1 = a.cells[10].innerHTML;
		var idPincode = a.cells[11].innerHTML;

		document.getElementById("idAddressType").value = idAddressType;
		;
		document.getElementById("idLocationId").value = idLocationId;
		;
		document.getElementById("idLocationName").value = idLocationName;
		document.getElementById("idAddress").value = idAddress;
		document.getElementById("idAddress1").value = idAddress1;
		document.getElementById("idAddress2").value = idAddress2;

		document.getElementById("idVillages1").value = idVillages1;
		document.getElementById("idStates1").value = idStates1;
		document.getElementById("idMunicipalities1").value = idMunicipalities1;
		document.getElementById("idCountry1").value = idCountry1;
		document.getElementById("idDistrictCity1").value = idDistrictCity1;
		document.getElementById("idPincode").value = idPincode;

	}
	function update() {

		//i = row.parentNode.parentNode.rowIndex;

		var table = document.getElementById("tblData");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idAddressType").value;
		e.cells[1].innerHTML = document.getElementById("idLocationId").value;
		e.cells[2].innerHTML = document.getElementById("idLocationName").value;
		e.cells[3].innerHTML = document.getElementById("idAddress").value;
		e.cells[4].innerHTML = document.getElementById("idAddress1").value;
		e.cells[5].innerHTML = document.getElementById("idAddress2").value;
		e.cells[6].innerHTML = document.getElementById("idVillages1").value;
		e.cells[7].innerHTML = document.getElementById("idStates1").value;
		e.cells[8].innerHTML = document.getElementById("idMunicipalities1").value;
		e.cells[9].innerHTML = document.getElementById("idCountry1").value;
		e.cells[10].innerHTML = document.getElementById("idDistrictCity1").value;
		e.cells[11].innerHTML = document.getElementById("idPincode").value;

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
		document.getElementById("idAddressType").value = '';
		document.getElementById("idAddress").value = '';
		document.getElementById("idAddress1").value = '';
		document.getElementById("idAddress2").value = '';
		document.getElementById("idVillages1").value = '';
		document.getElementById("idDistrictCity1").value = '';
		document.getElementById("idStates1").value = '';
		document.getElementById("idCountry1").value = '';
		document.getElementById("idMunicipalities1").value = '';
		document.getElementById("idPincode").value = '';
		document.getElementById("idLocationId").value = '';
		document.getElementById("idLocationName").value = '';
		/*  document.getElementById('idCategory').value=''; */
		document.getElementById("idUpdate").disabled = true;
		document.getElementById("idAdd").disabled = false;
		document.getElementById("idDel").disabled = false;
	}
	function deleteRow(row) {
		i = row.parentNode.parentNode.rowIndex;
		document.getElementById('tblData').deleteRow(i);

	}
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
		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idRegistration").value;
		cell2.innerHTML = document.getElementById("idPlot").value;
		cell3.innerHTML = document.getElementById("idAddress3").value;
		cell4.innerHTML = document.getElementById("idVillages2").value;
		cell5.innerHTML = document.getElementById("idMunicipalities2").value;
		cell6.innerHTML = document.getElementById("idDistrictCity2").value;
		cell7.innerHTML = document.getElementById("idStates2").value;
		cell8.innerHTML = document.getElementById("idArea").value;
		cell9.innerHTML = document.getElementById("idRate").value;
		cell10.innerHTML = document.getElementById("idApproxMonetaryvalue").value;
		cell11.innerHTML = document.getElementById("idRemarks").value;
		cell12.innerHTML = document.getElementById("idLoanIfany").value;
		cell13.innerHTML = document.getElementById("idLoanAmount").value;
		cell14.innerHTML = '<input type="button" id="idEdit1" class="smallbtn" value ="EDIT" onclick="edit1(this);"> &nbsp;&nbsp;<input type="button" id="idDel1" class="smallbtn" value ="DEL" onclick="deleteRow1(this);"> ';

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
		document.getElementById("idRegistration").value = '';
		document.getElementById("idPlot").value = '';
		document.getElementById("idAddress3").value = '';
		document.getElementById("idVillages2").value = '';
		document.getElementById("idDistrictCity2").value = '';
		document.getElementById("idArea").value = '';
		document.getElementById("idRate").value = '';
		document.getElementById("idApproxMonetaryvalue").value = '';
		document.getElementById("idLoanAmount").value = '';
		document.getElementById("idLoanIfany").value = '';
		document.getElementById("idRemarks").value = '';
		document.getElementById("idMunicipalities2").value = '';
		document.getElementById("idStates2").value = '';
		/*  document.getElementById('idCategory').value=''; */

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
		var idRegistration = a.cells[0].innerHTML;
		var idPlot = a.cells[1].innerHTML;
		var idAddress3 = a.cells[2].innerHTML;
		var idVillages2 = a.cells[3].innerHTML;
		var idMunicipalities2 = a.cells[4].innerHTML;
		var idDistrictCity2 = a.cells[5].innerHTML;
		var idStates2 = a.cells[6].innerHTML;
		var idArea = a.cells[7].innerHTML;
		var idRate = a.cells[8].innerHTML;
		var idApproxMonetaryvalue = a.cells[9].innerHTML;
		var idRemarks = a.cells[10].innerHTML;
		var idLoanIfany = a.cells[11].innerHTML;
		var idLoanAmount = a.cells[12].innerHTML;

		document.getElementById("idRegistration").value = idRegistration;
		document.getElementById("idPlot").value = idPlot;
		document.getElementById("idAddress3").value = idAddress3;
		document.getElementById("idVillages2").value = idVillages2;
		document.getElementById("idMunicipalities2").value = idMunicipalities2;
		document.getElementById("idDistrictCity2").value = idDistrictCity2;
		document.getElementById("idStates2").value = idStates2;
		document.getElementById("idArea").value = idArea;
		document.getElementById("idRate").value = idRate;
		document.getElementById("idApproxMonetaryvalue").value = idApproxMonetaryvalue;
		document.getElementById("idRemarks").value = idRemarks;
		document.getElementById("idLoanIfany").value = idLoanIfany;
		document.getElementById("idLoanAmount").value = idLoanAmount;
	}
	function update1() {

		//i = row.parentNode.parentNode.rowIndex;

		var table = document.getElementById("tblData1");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idRegistration").value;
		e.cells[1].innerHTML = document.getElementById("idPlot").value;
		e.cells[2].innerHTML = document.getElementById("idAddress3").value;
		e.cells[3].innerHTML = document.getElementById("idVillages2").value;
		e.cells[4].innerHTML = document.getElementById("idMunicipalities2").value;
		e.cells[5].innerHTML = document.getElementById("idDistrictCity2").value;
		e.cells[6].innerHTML = document.getElementById("idStates2").value;
		e.cells[7].innerHTML = document.getElementById("idArea").value;
		e.cells[8].innerHTML = document.getElementById("idRate").value;
		e.cells[9].innerHTML = document.getElementById("idApproxMonetaryvalue").value;
		e.cells[10].innerHTML = document.getElementById("idRemarks").value;
		e.cells[11].innerHTML = document.getElementById("idLoanIfany").value;
		e.cells[12].innerHTML = document.getElementById("idLoanAmount").value;

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
	/*for nominee details  */
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

		cell1.innerHTML = document.getElementById("idNomineeName").value;
		cell2.innerHTML = document.getElementById("idNomineeName1").value;
		cell3.innerHTML = document.getElementById("idNomineeName2").value;
		cell4.innerHTML = document.getElementById("idAddress4").value;
		cell5.innerHTML = document.getElementById("idVillages3").value;
		cell6.innerHTML = document.getElementById("idMunicipalities3").value;
		cell7.innerHTML = document.getElementById("idDistrictCity3").value;
		cell8.innerHTML = document.getElementById("idStates3").value;
		cell9.innerHTML = document.getElementById("idGender").value;
		cell10.innerHTML = document.getElementById("idMaritalStatus").value;
		cell11.innerHTML = document.getElementById("idRelationship").value;
		cell12.innerHTML = document.getElementById("idNomineeShare").value;
		cell13.innerHTML = document.getElementById("idNominationDate").value;
		cell14.innerHTML = document.getElementById("idIsMinor").value;
		cell15.innerHTML = document.getElementById("idGuardianName").value;
		cell16.innerHTML = document.getElementById("idGuardianAddress").value;
		cell17.innerHTML = '<input type="button" id="idEdit2" class="smallbtn" value ="EDIT" onclick="edit2(this);"> &nbsp;&nbsp;<input type="button" id="idDel2" class="smallbtn" value ="DEL" onclick="deleteRow2(this);"> ';

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
		document.getElementById("idNomineeName").value = '';
		document.getElementById("idNomineeName1").value = '';
		document.getElementById("idNomineeName2").value = '';
		document.getElementById("idAddress4").value = '';
		document.getElementById("idVillages3").value = '';
		document.getElementById("idMunicipalities3").value = '';
		document.getElementById("idDistrictCity3").value = '';
		document.getElementById("idStates3").value = '';
		document.getElementById("idGender").value = '';
		document.getElementById("idMaritalStatus").value = '';
		document.getElementById("idRelationship").value = '';
		document.getElementById("idNomineeShare").value = '';
		document.getElementById("idNominationDate").value = '';
		document.getElementById("idIsMinor").value = '';
		document.getElementById("idGuardianName").value = '';
		document.getElementById("idGuardianAddress").value = '';

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
		var idNomineeName = a.cells[0].innerHTML;
		var idNomineeName1 = a.cells[1].innerHTML;
		var idNomineeName2 = a.cells[2].innerHTML;
		var idAddress4 = a.cells[3].innerHTML;
		var idVillages3 = a.cells[4].innerHTML;
		var idMunicipalities3 = a.cells[5].innerHTML;
		var idDistrictCity3 = a.cells[6].innerHTML;
		var idStates3 = a.cells[7].innerHTML;
		var idGender = a.cells[8].innerHTML;
		var idMaritalStatus = a.cells[9].innerHTML;
		var idRelationship = a.cells[10].innerHTML;
		var idNomineeShare = a.cells[11].innerHTML;
		var idNominationDate = a.cells[12].innerHTML;
		var idIsMinor = a.cells[13].innerHTML;
		var idGuardianName = a.cells[14].innerHTML;
		var idGuardianAddress = a.cells[15].innerHTML;

		document.getElementById("idNomineeName").value = idNomineeName;
		document.getElementById("idNomineeName1").value = idNomineeName1;
		document.getElementById("idNomineeName2").value = idNomineeName2;
		document.getElementById("idAddress4").value = idAddress4;
		document.getElementById("idVillages3").value = idVillages3;
		document.getElementById("idMunicipalities3").value = idMunicipalities3;
		document.getElementById("idDistrictCity3").value = idDistrictCity3;
		document.getElementById("idStates3").value = idStates3;
		document.getElementById("idGender").value = idGender;
		document.getElementById("idMaritalStatus").value = idMaritalStatus;
		document.getElementById("idRelationship").value = idRelationship;
		document.getElementById("idNomineeShare").value = idNomineeShare;
		document.getElementById("idNominationDate").value = idNominationDate;
		document.getElementById("idIsMinor").value = idIsMinor;
		document.getElementById("idGuardianName").value = idGuardianName;
		document.getElementById("idGuardianAddress").value = idGuardianAddress;

	}
	function update2() {

		//i = row.parentNode.parentNode.rowIndex;

		var table = document.getElementById("tblData2");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idNomineeName").value;
		e.cells[1].innerHTML = document.getElementById("idNomineeName1").value;
		e.cells[2].innerHTML = document.getElementById("idNomineeName2").value;
		e.cells[3].innerHTML = document.getElementById("idAddress4").value;
		e.cells[4].innerHTML = document.getElementById("idVillages3").value;
		e.cells[5].innerHTML = document.getElementById("idMunicipalities3").value;
		e.cells[6].innerHTML = document.getElementById("idDistrictCity3").value;
		e.cells[7].innerHTML = document.getElementById("idStates3").value;
		e.cells[8].innerHTML = document.getElementById("idGender").value;
		e.cells[9].innerHTML = document.getElementById("idMaritalStatus").value;
		e.cells[10].innerHTML = document.getElementById("idRelationship").value;
		e.cells[11].innerHTML = document.getElementById("idNomineeShare").value;
		e.cells[12].innerHTML = document.getElementById("idNominationDate").value;
		e.cells[13].innerHTML = document.getElementById("idIsMinor").value;
		e.cells[14].innerHTML = document.getElementById("idGuardianName").value;
		e.cells[15].innerHTML = document.getElementById("idGuardianAddress").value;

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

	/* For KYC Details */

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

		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idDocName").value;
		cell2.innerHTML = document.getElementById("idDocType").value;
		cell3.innerHTML = document.getElementById("idDocRefNo").value;
		cell4.innerHTML = document.getElementById("idIssuedBy").value;
		cell5.innerHTML = document.getElementById("idIssuedDate").value;
		cell6.innerHTML = document.getElementById("idExpiryDate").value;
		cell7.innerHTML = '<input type="button" id="idEdit3" class="smallbtn" value ="EDIT" onclick="edit3(this);"> &nbsp;&nbsp;<input type="button" id="idDel3" class="smallbtn" value ="DEL" onclick="deleteRow3(this);"> ';

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
		document.getElementById("idDocName").value = '';
		document.getElementById("idDocType").value = '';
		document.getElementById("idDocRefNo").value = '';
		document.getElementById("idIssuedBy").value = '';
		document.getElementById("idIssuedDate").value = '';
		document.getElementById("idExpiryDate").value = '';

		/*  document.getElementById('idCategory').value=''; */

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
		var idDocName = a.cells[0].innerHTML;
		var idDocType = a.cells[1].innerHTML;
		var idDocRefNo = a.cells[2].innerHTML;
		var idIssuedBy = a.cells[3].innerHTML;
		var idIssuedDate = a.cells[4].innerHTML;
		var idExpiryDate = a.cells[5].innerHTML;

		document.getElementById("idDocName").value = idDocName;
		document.getElementById("idDocType").value = idDocType;
		document.getElementById("idDocRefNo").value = idDocRefNo;
		document.getElementById("idIssuedBy").value = idIssuedBy;
		document.getElementById("idIssuedDate").value = idIssuedDate;
		document.getElementById("idExpiryDate").value = idExpiryDate;

	}
	function update3() {

		//i = row.parentNode.parentNode.rowIndex;

		var table = document.getElementById("tblData3");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idDocName").value;
		e.cells[1].innerHTML = document.getElementById("idDocType").value;
		e.cells[2].innerHTML = document.getElementById("idDocRefNo").value;
		e.cells[3].innerHTML = document.getElementById("idIssuedBy").value;
		e.cells[4].innerHTML = document.getElementById("idIssuedDate").value;
		e.cells[5].innerHTML = document.getElementById("idExpiryDate").value;

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
	/* For KYC Family Details */

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

		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idFamilyMemberName").value;
		cell2.innerHTML = document.getElementById("idRelationship1").value;
		cell3.innerHTML = document.getElementById("idGender1").value;
		cell4.innerHTML = document.getElementById("idDob").value;
		cell5.innerHTML = document.getElementById("idProfession").value;
		cell6.innerHTML = document.getElementById("idEducation").value;
		cell7.innerHTML = '<input type="button" id="idEdit4" class="smallbtn" value ="EDIT" onclick="edit4(this);"> &nbsp;&nbsp;<input type="button" id="idDel4" class="smallbtn" value ="DEL" onclick="deleteRow4(this);"> ';

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

		/*  document.getElementById("formHomeId").reset();  */
		document.getElementById("idFamilyMemberName").value = '';
		document.getElementById("idRelationship1").value = '';
		document.getElementById("idGender1").value = '';
		document.getElementById("idDob").value = '';
		document.getElementById("idProfession").value = '';
		document.getElementById("idEducation").value = '';

		/*  document.getElementById('idCategory').value=''; */

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
	function update4() {

		//i = row.parentNode.parentNode.rowIndex;

		var table = document.getElementById("tblData4");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idFamilyMemberName").value;
		e.cells[1].innerHTML = document.getElementById("idRelationship1").value;
		e.cells[2].innerHTML = document.getElementById("idGender1").value;
		e.cells[3].innerHTML = document.getElementById("idDob").value;
		e.cells[4].innerHTML = document.getElementById("idProfession").value;
		e.cells[5].innerHTML = document.getElementById("idEducation").value;

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
<sx:head />
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">
		<form name="formHome" id="formHomeId" method="post" action="MemberRegistrationSave">

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
								face="Calibri" size="2" color="#003399"> <s:text
										name="global.lbl.branch.code" />: 02
							</font></b><font face="Calibri" size="2" color="#003399">, <b>Talegaon
									Primary Agriculture Credit Society&nbsp;&nbsp;</b></font>
					</td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td colspan="6" width="100%">
						<p align="center" style="display: none" id="idSuccessMessage">
					</td>
				</tr>
				
			</table>
			<div align=justify id="idBasicInfo" style="display: none">
				<table width="100%" align="left" cellpadding="1" cellspacing="1">
					<tr height="100%">
						<td width="100%" height="100%"
							style="border-bottom-style: solid #000080; border-bottom-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<table width="100%" align="center" cellpadding="0"
								cellspacing="0">
								<tr height="10">
									<td><font face="Calibri" size="2">&nbsp;</font><font
										color="#0000FF"><s:text
												name="global.lbl.basic.information" /><b></b></font></td>
								</tr>
								<tr bgcolor="#FFFFFF">
									
									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2" color="#595959"><b><s:text
													name="global.lbl.customer.branch" />&nbsp;</b></font></td>
									<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="customerBranch" readonly="readonly" class="smallTxtLeftAlign">
									</td>
									
									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2" color="#595959"><b><s:text
													name="global.lbl.customer.id" />&nbsp;</b></font></td>
									<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="customerId" class="mediumTxtLeftAlign">
									</td>
									 <td width="15%" align="right" 
 										style="border-bottom: 1px dotted #C0C0C0"><font 
 										face="Calibri" size="2" color="#595959"><b><s:text 
 													name="global.lbl.customer.type" />&nbsp;</b></font></td> 
 									<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="customerType" ><!-- name="selected record" -->
								<c:forEach var="customerType" items="${customerTypes}" >
									<option value="${customerTypeCode}">${customerType.customerTypeCode}-${customerType.customerTypeDesc}</option>
								</c:forEach>
								</select> 
 									</td>
 									</tr>
 									
 									<tr bgcolor="#F4F4F4" align="center">
 												<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0" bgcolor="#FFFFFF">
										<b> <font face="Calibri" size="2" color="#595959"><s:text
													name="global.lbl.customer.name" /> </font></b>
									</td>
									<td width="84%" style="border-bottom: 1px dotted #C0C0C0"
										bgcolor="#FFFFFF" colspan="5"><select size="1"
										name="customerSalutation" class="mediumselect">
											<option value="select"><s:text
													name="global.val.select" /></option>
											<option value="mr"><s:text name="global.val.mr" /></option>
											<option value="ms"><s:text name="global.val.ms" /></option>
											<option value="mrs"><s:text name="global.val.mrs" /></option>
											<option value="dr"><s:text name="global.val.dr" /></option>
									</select>&nbsp; <input type="text" name="customerFName" size="20"
										class="mediumTxtLeftAlign"> <input type="text"
										name="customerMName" size="20" class="mediumTxtLeftAlign">
										<input type="text" name="customerLName" size="20"
										class="mediumTxtLeftAlign"></td>
									</tr>

								<tr bgcolor="#F4F4F4">
									<td width="15%" align="right"  
  										style="border-bottom: 1px dotted #C0C0C0"><font
  										face="Calibri" size="2" color="#595959"><b><s:text  
  													name="global.lbl.gender" />&nbsp;</b></font></td>  
  									<td width="10%" style="border-bottom: 1px dotted #C0C0C0">  
										<input type=radio name="customerGender" class="radiobutton" value="M" 
 										checked><font face="Calibri" size="2"><s:text  
												name="global.lbl.male" />&nbsp;</font> <input type=radio  
 										name="gender" class="radiobutton" value="F"><font  
 										face="Calibri" size="2"><s:text  
 											name="global.lbl.female" />&nbsp;</font>  
 									</td>
														
									 <td width="15%" align="right" 
 										style="border-bottom: 1px dotted #C0C0C0"><font
 										face="Calibri" size="2" color="#595959"><b><s:text 
 													name="global.lbl.customer.dob" />:&nbsp;</b></font></td> 
 									<td bgcolor="#FFFFFF" width="10%" 
 										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"> 
 										<sx:datetimepicker name="customerDOB" displayFormat="dd-MM-yyyy" /> 
 									</td> 
									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2" color="#595959"><s:text
												name="global.lbl.marital.status" /><b>&nbsp;</b></font></td>
									<td width="10%" style="border-bottom: 1px dotted #C0C0C0">
										<select size="1" name="custMaritalStatus" class="mediumselect">
											<option value=""><s:text name="global.val.select" /></option>
											<c:forEach items="${maritalStatusBean.values}"
												var="maritalStatus">
												<option value="${maritalStatus}">${maritalStatus}</option>
											</c:forEach>
									</select>
									</td>
									</tr>
									
									<tr bgcolor="#F4F4F4">
									
									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2" color="#595959"><b><s:text
													name="global.lbl.nationality" />&nbsp;</b></font></td>
									<td width="10%" style="border-bottom: 1px dotted #C0C0C0">
										<select size="1" name="nationality" class="mediumselect">
											<option value="">Select...</option>
											<c:forEach items="${nationalityBean.values}"
												var="nationality">
												<option value="${nationality}">${nationality}</option>
											</c:forEach>
									</select>
									</td>
								
								<td width="15%" align="right" 
 										style="border-bottom: 1px dotted #C0C0C0"><font
 										face="Calibri" size="2" color="#595959"><b><s:text 
 													name="global.lbl.customer.since" />:&nbsp;</b></font></td> 
 									<td bgcolor="#FFFFFF" width="10%" 
 										style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"> 
 										<sx:datetimepicker name="customerSince" displayFormat="dd-MM-yyyy" /> 
 									</td> 
 									
									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0" bgcolor="#FFFFFF">
										<font face="Calibri" size="2" color="#595959"><b><s:text
													name="global.lbl.father.spouse.name" />:&nbsp;</b></font>
									</td>
									<td width="10%" style="border-bottom: 1px dotted #C0C0C0"
										bgcolor="#FFFFFF">&nbsp;<input name="FatherSpouseName"
										class="mediumTxtLeftAlign" type="text">
									</td>
									    
									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0" bgcolor="#FFFFFF">
										<font face="Calibri" size="2" color="#595959"><b><s:text
													name="global.lbl.customer.registration" />:&nbsp;</b></font>
									</td>
									<td width="10%" style="border-bottom: 1px dotted #C0C0C0"
										bgcolor="#FFFFFF">&nbsp;<input name="customerRegNo"
										class="mediumTxtLeftAlign" type="text">
									</td>
								</tr>

								<tr bgcolor="#FFFFFF">
										<td width="15%" align="right" 
 										style="border-bottom: 1px dotted #C0C0C0"><font 
 										face="Calibri" size="2" color="#595959"><b><s:text 
 													name="global.lbl.caste" />:&nbsp;</b></font></td> 
 									<td width="10%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select size="1" name="customerCaste" class="mediumselect"> 
 											<option value="select"><s:text 
 													name="global.val.select" /></option> 
 											<option value="enmum.caste1"><s:text 
 													name="global.val.caste1" /></option> 
 											<option value="enum.caste2" selected><s:text 
 													name="global.val.caste2" /></option> 
 									</select> 
 									</td> 
 									<td width="15%" align="right" 
 										style="border-bottom: 1px dotted #C0C0C0"><font 
 										face="Calibri" size="2" color="#595959"><b><s:text 
 													name="global.lbl.caste.category" />:&nbsp;</b></font></td> 
 									<td width="10%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select size="1" name="customerCasteCategory" 
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
									
									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0" bgcolor="#FFFFFF">
										<font face="Calibri" size="2" color="#595959"><b> <s:text
													name="global.lbl.additional.information" />:&nbsp;
										</b></font>
									</td>
									<td width="60%" colspan="5"
										style="border-bottom: 1px dotted #C0C0C0" bgcolor="#FFFFFF">
										&nbsp;<input name="custAdditionalInfo" size="60"
										class="largeTxtLeftAlign" type="text">
									</td>
								</tr>
								<tr>
								
								<td width="15%" align="right" 
 										style="border-bottom: 1px dotted #C0C0C0"><font 
 										face="Calibri" size="2" color="#595959"><b><s:text 
 													name="global.lbl.KYC.type" />:&nbsp;</b></font></td> 
 									<td width="10%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select size="1" name="KYCType" class="mediumselect"> 
 											
 											<option value="enmum.caste1"><s:text 
 													name="global.val.E-KYC" /></option> 
 											<option value="enum.caste2" selected><s:text 
 													name="global.val.General" /></option> 
 									</select> 
 									</td> 
								<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0" bgcolor="#FFFFFF">
										<font face="Calibri" size="2" color="#595959"><b> <s:text
													name="global.lbl.HNW.category" />:&nbsp;
										</b></font>
									</td>
									<td width="60%" colspan="5"
										style="border-bottom: 1px dotted #C0C0C0" bgcolor="#FFFFFF">
										&nbsp;<input name="HNWCategory" size="20"
										class="largeTxtLeftAlign" type="text">
									</td>
								
								</tr>
							</table> 
							<!-- ADDRESS DETAILS -->
<div style="border-bottom: 1px border-top: 1px border-left: 1px border-right: 1px solid #000059">
							<table id="idTBLookuplist1" width="100%" height="26" cellpadding="0" cellspacing="1">
							<tr>
										
							<td width="40%" bgcolor="#595959" align="left"
								id="idCellShowTable">
								<a id="loginLink" onclick="toggleTable1();" href="#"> <b>
								<font face="Calibri" size="2">
								<s:text name="global.lbl.address.details" /></font></b></a></td>
								<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
							</tr>

							</table>
								<table width="100%" cellpadding="0" cellspacing="0">
										
									<tr height="25" bgcolor="#C4C4FF">
										<td width="15%" align="right"><font face="Calibri"
											size="2" color="#595959"><b></b></font></td>
										<td width="18%"></td>
										
									</tr>

									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.address.type" />:&nbsp;</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<select size="1" id="idCustAddressType" name="custAddressType"
											class="mediumselect">
												<option value="select"><s:text
														name="global.val.select" /></option>
												<c:forEach items="${addressTypeBean.values}"
													var="addressType">
													<option value="${addressType}">${addressType}</option>
												</c:forEach>
										</select>
										</td>
										
									</tr>

									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.address" />:&nbsp;</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input id="idCustAddress1" name="custAddress1" size="20"
											type="text" class="largeTxtLeftAlign">
										</td>
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.village" />:
											</b></font></td> 
											
											<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="villages1" id="idVillages1" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="villageMst" items="${villages1}" >
									<option value="${villageCode}">${villageMst.villageCode}-${villageMst.villageName}</option>
								</c:forEach>
								</select> 
 									</td>  
										
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.state" />:
											</b></font></td> 
											
											
											<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="states1" id="idStates1" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="stateMst" items="${states1}" >
									<option value="${stateCode}">${stateMst.stateCode}-${stateMst.stateName}</option>
								</c:forEach>
								</select> 
 									</td>  
									</tr>
									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="custAddress2" size="20" id="idCustAddress2"
											class="largeTxtLeftAlign">
										</td>
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.municipality" />:
											</b></font></td> 	
						
						<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="municipalities1" id="idMunicipalities1" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="municipality" items="${municipalities1}" >
									<option value="${municipalityCode}">${municipality.municipalityCode}-${municipality.municipalityName}</option>
								</c:forEach>
								</select> 
 									</td>  
						
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.country" />:
											</b></font></td> 
									
									<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="countries1" id="idCountry1" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="countryMst" items="${countries1}" >
									<option value="${countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
								</c:forEach>
								</select> 
 									</td>  		
									</tr>
									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="custAddress3" size="20" type="text"
											id="idCustAddress3" class="largeTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.district.city" />:
											</b></font></td> 
										
								<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="districts1" id="idDistrictCity1" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="districtMst" items="${districts1}" >
									<option value="${districtCode}">${districtMst.districtCode}-${districtMst.districtName}</option>
								</c:forEach>
								</select> 
 									</td>  
												
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.pincode" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="custPinCode" size="20" type="text" id="idCustPincode"
											class="smallTxtLeftAlign">
										</td>
									</tr>
									<tr>
									<td>
									<table width="100%" cellpadding="0" cellspacing="1">
									<tr height="25">
										<td width="30%" align="center"
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
									</tr>
								</table>
								</td>
								</tr>
								<tr>
								<td>
								<table id="tblData" width="100%" cellpadding="0" cellspacing="1">
									<tr height="25" bgcolor="#C4C4FF">
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.address.type" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.Address" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.village" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.state" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.municipality" /></b></font></td>
										<td width="5.19%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.country" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.district.city" /></b></font></td>
										<td width="5.19%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.pincode" /></b></font></td>

										<td width="12.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.action" /></b></font></td>
									</tr>
									<tr height="25" bgcolor="#FFFFFF">
									</tr>
								</table>
								</td>
								</tr>
								</table>
							</div> 
						</td>
					</tr>
			</table>
			</div>
			
			
			
			<!-- CONTACT DETAILS -->
<div style="border-bottom: 1px border-top: 1px border-left: 1px border-right: 1px solid #000059">
							<table id="idTBLookuplist2" width="100%" height="26" cellpadding="0" cellspacing="1">
							<tr>
										
							<td width="40%" bgcolor="#595959" align="left"
								id="idCellShowTable">
								<a id="loginLink" onclick="toggleTable2();" href="#"> <b>
								<font face="Calibri" size="2">
								<s:text name="global.lbl.contact.details" /></font></b></a></td>
								<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
							</tr>

							</table>
								<table width="100%" cellpadding="0" cellspacing="0">
										
									<tr height="25" bgcolor="#C4C4FF">
										<td width="15%" align="right"><font face="Calibri"
											size="2" color="#595959"><b></b></font></td>
										<td width="18%"></td>
										
									</tr>

									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.residence.phone" />:&nbsp;</b></font></td>
														
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input type="text" name="residencePhone" class="mediumTxtLeftAlign">
										</td>
										
									</tr>

									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.mobile.number" />:&nbsp;</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;
											<input id="" name="mobile1" size="20" type="text" class="mediumTxtLeftAlign">
											<input id="" name="mobile2" size="20" type="text" class="mediumTxtLeftAlign">
										</td>
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.email.id" />:
											</b></font></td> 
											
											<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<input id="" name="email1" size="40" type="text" class="largeTxtLeftAlign">
 										<input id="" name="email2" size="40" type="text" class="largeTxtLeftAlign"> 
 									</td>  
										
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.office.phone" />:
											</b></font></td> 
											
											
											<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<input id="" name="officePhone1" size="20" type="text" class="mediumTxtLeftAlign">
 										<input id="" name="officePhone2" size="20" type="text" class="mediumTxtLeftAlign"> 
 									</td>  
									</tr>
									<tr bgcolor="#FFFFFF">
										
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.fax.no" />:
											</b></font></td> 	
						
									<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 									<input id="" name="faxNO" size="20" type="text" class="mediumTxtLeftAlign">
 							</tr>
			
			</table>
			</div>

<div align=justify id="idAssetDtls" style="display: none">
						<table id="idTBLookuplist3" width="100%" height="26" cellpadding="0" cellspacing="1">
							<tr>
										
							<td width="40%" bgcolor="#595959" align="left"
								id="idCellShowTable">
								<a id="loginLink" onclick="toggleTable3();" href="#"> <b>
								<font face="Calibri" size="2">
								<s:text name="global.lbl.asset.details" /></font></b></a></td>
								<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
							</tr>

							</table>
				<table  width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="6" width="100%">
							<table width="100%" cellspacing="0" cellpadding="0">
								<tr valign="middle">
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2" color="#595959"><b><s:text
													name="global.lbl.registration" /> #:&nbsp;</b></font></td>
									<td width="25%" style="border-bottom: 1px dotted #C0C0C">
										<input type="text" name="registrationNo" size="25"
										id="idRegistration" class="mediumTxtLeftAlign">
									</td>
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text name="global.lbl.plot" />
											#:&nbsp;</font></td>
									<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="plotNo" size="25" id="idPlot"
										class="mediumTxtLeftAlign">
									</td>
								</tr>
								<tr valign="middle">
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text
												name="global.lbl.address" />:&nbsp;</font></td>
									<td colspan="3" width="75%"
										style="border-bottom: 1px dotted #C0C0C0"><textarea
											id="idAddress3" name="address"></textarea></td>
								</tr>
								<tr valign="middle">
									 <td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text
												name="global.lbl.village" />:&nbsp;</font></td> 
												<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="villages2" id="idVillages2" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="villageMst" items="${villages2}" >
									<option value="${villageCode}">${villageMst.villageCode}-${villageMst.villageName}</option>
								</c:forEach>
								</select> 
 									</td>  
									
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text
												name="global.lbl.taluka" />:&nbsp;</font></td>
													
									<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="municipalities2" id="idMunicipalities2" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="municipality" items="${municipalities2}" >
									<option value="${municipalityCode}">${municipality.municipalityCode}-${municipality.municipalityName}</option>
								</c:forEach>
								</select> 
 									</td>  
									
								</tr>
								<tr valign="middle">
									 <td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text
												name="global.lbl.district.city" />:&nbsp;</font></td> 
									<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="districts2" id="idDistrictCity2" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="districtMst" items="${districts2}" >
									<option value="${districtCode}">${districtMst.districtCode}-${districtMst.districtName}</option>
								</c:forEach>
								</select> 
 									</td>  							
									
									 <td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text name="global.lbl.state" />:&nbsp;</font></td> 
										
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="states2" id="idStates2" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="stateMst" items="${states2}" >
									<option value="${stateCode}">${stateMst.stateCode}-${stateMst.stateName}</option>
								</c:forEach>
								</select> 
 									</td>  
									
								</tr>
								<tr valign="middle">
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text name="global.lbl.area" />
											(<s:text name="global.lbl.acre" />):&nbsp;</font></td>
									<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="areaSize" size="15" id="idArea"
										class="mediumTxtLeftAlign">
									</td>
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text name="global.lbl.rate" />(<s:text
												name="global.lbl.INR" />):&nbsp;</font></td>
									<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
										<input name="areaRate" size="20" id="idRate"
										class="smallTxtLeftAlign">
									</td>
								</tr>
								<tr valign="middle">
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text
												name="global.lbl.approx.value" /> (<s:text
												name="global.lbl.INR" />):&nbsp;</font></td>
									<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="approxMonetaryValue" size="20"
										id="idApproxMonetaryvalue" class="smallTxtLeftAlign">
									</td>
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text
												name="global.lbl.remarks" />:&nbsp;</font></td>
									<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="remarks" size="30" id="idRemarks"
										class="mediumTxtLeftAlign">
									</td>
								</tr>
								<tr valign="middle">
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text
												name="global.lbl.o/s.loan" /> (<s:text
												name="global.lbl.if.any" />):&nbsp;</font></td>
									<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
										<input type="text" name="outstandingLoanYN" size="20"
										id="idLoanIfany" class="mediumTxtLeftAlign">
									</td>
									<td width="25%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2"><s:text
												name="global.lbl.o/s.amount" /> (<s:text
												name="global.lbl.INR" />):&nbsp;</font></td>
									<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
										<input id="idLoanAmount" name="outstandingLoanAmt"
										class="mediumTxtLeftAlign">
									</td>
								</tr>

							</table>

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

							<div>
								<table id="tblData1" width="100%" cellspacing="1"
									cellpadding="0">
									<tr bgcolor="" height="25">
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.registration" /> #
											</b></font></td>
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.plot" /> #
											</b></font></td>
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.address" /></b></font></td>
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.village.code" /></b></font></td>
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.taluka" /></b></font></td>
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.district.city" /></b></font></td>
										<td width="5.19%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.state" /></b></font></td>
										<td width="5.19%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.area" /></b></font></td>
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.rate" /></b></font></td>
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.approx.value" /> (<s:text
														name="global.lbl.INR" />)
											</b></font></td>

										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.remarks" /></b></font></td>
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.o/s.loan" /></b></font></td>
										<td width="7.14%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.o/s.amount" /></b></font></td>

										<td width="12.69%" bgcolor="#9999FF"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2"><b>&nbsp;<s:text
														name="global.lbl.action" /></b></font></td>
									</tr>
									<tr height="25" bgcolor="#FFFFFF">
									</tr>
								
								</table>
							</div>
							</td>
					</tr>
				</table>
				
			</div>



<div align=justify id="idKYCDtls" style="display: none">
							<table id="idTBLookuplist4" width="100%" height="26" cellpadding="0" cellspacing="1">
							<tr>
										
							<td width="40%" bgcolor="#595959" align="left"
								id="idCellShowTable">
								<a id="loginLink" onclick="toggleTable4();" href="#"> <b>
								<font face="Calibri" size="2">
								<s:text name="global.lbl.KYC.docs" /></font></b></a></td>
								<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
							</tr>

							</table>
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="6" width="100%">
							<table width="100%" cellspacing="0" cellpadding="0">
								<tr>
									<td style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<table width="100%" cellspacing="0" cellpadding="0">
											<tr height="20">
												
											<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.document.type" />:&nbsp;</b></font></td>
												<td width="10%"><select class="mediumselect" name="docType">
												<option>PAN</option>
												<option>Passport</option>
												<option>Electricty Bill</option>
												<option>Aadhar Card</option>
												</select>
												</td>
											<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.id.number" /> #:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input name="idNumber" size="30" type="text"
													id="" class="mediumTxtLeftAlign">
												</td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.issued.by" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input name="issuedBy" size="30" type="text"
													id="idIssuedBy" class="mediumTxtLeftAlign">
												</td>
											</tr>
											<tr height="20">
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.issued.date" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<sx:datetimepicker name="issuedDate" id="idIssuedDate"
														displayFormat="dd-MM-yyyy" />
												</td>

												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.expiry.date" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<sx:datetimepicker name="expiryDate" id="idExpiryDate"
														displayFormat="dd-MM-yyyy" />
												</td>
											</tr>

											<tr height="20">
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.recieved.date" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<sx:datetimepicker name="recievedDate" id=""
														displayFormat="dd-MM-yyyy" />
												</td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.remarks" /> #:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input name="remarks" size="30" type="text"
													id="" class="largeTxtLeftAlign">
												</td>
												</tr>
										</table>

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
										<table id="tblData3" width="100%" cellspacing="1"
											cellpadding="0">
											<tr height="20">
												<td width="20%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.document.type" /></b></font></td>
												<td width="15%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.document.number" /></b></font></td>
												<td width="15%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.document.id" /> #
													</b></font></td>
												<td width="15%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.issued.by" /></b></font></td>
												<td width="10%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.issued.date" /></b></font></td>
												<td width="10%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.expiry.date" /></b></font></td>
												<td width="15%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.action" /></b></font></td>
											</tr>
											<tr height="20">
											</tr>
										</table>
							</table> <br>
							<table width="100%" cellspacing="0" cellpadding="0">
								<tr>
									<td
										style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<table width="100%" cellspacing="0" cellpadding="0">
											<tr height="20">
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.family.member.name" />:&nbsp;</b></font></td>
												<td><input type="text" name="familyMemberName"
													id="idFamilyMemberName" size="30"
													class="mediumTxtLeftAlign"></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.relationship" />:&nbsp;</b></font></td>
												<td><input name="relationship1" size="30" type="text"
													id="idRelationship1" class="mediumTxtLeftAlign"></td>
											</tr>
											<tr height="20">
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.gender" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input type="radio" value="Male" class="radiobutton"
													id="idGender1" name="gender"><font face="Calibri"
													size="2"><s:text name="global.lbl.male" /></font>&nbsp;&nbsp;
													<input type="radio" value="Female" class="radiobutton"
													id="idGender1" name="gender"><font face="Calibri"
													size="2"><s:text name="global.lbl.female" /></font>
												</td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.dob" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<sx:datetimepicker name="dob" id="idDob"
														displayFormat="dd-MM-yyyy" />
												</td>
											</tr>
											<tr height="20">
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.profession" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input type="text" name="profession" size="20"
													id="idProfession" class="mediumTxtLeftAlign">
												</td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.education" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input type="text" name="education" size="20"
													id="idEducation" class="mediumTxtLeftAlign">
												</td>
											</tr>
										</table>
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
											<tr height="20">
												<td width="20%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.member.name" /></b></font></td>
												<td width="15%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.relationship" /></b></font></td>
												<td width="10%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.gender" /></b></font></td>
												<td width="10%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.date.of.birth" /></b></font></td>
												<td width="15%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.profession" /></b></font></td>
												<td width="15%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.education" /></b></font></td>
												<td width="15%" style="border-bottom: 1px dotted #C0C0C0"
													bgcolor="#8A8AFF"><font face="Calibri" size="2"><b>&nbsp;<s:text
																name="global.lbl.action" /></b></font></td>
											</tr>
											<tr height="20">
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table>
</td>
</tr>
</table>
</div>

<div align=justify id="idMisc" style="display: none">
							<table id="idTBLookuplist5" width="100%" height="26" cellpadding="0" cellspacing="1">
							<tr>
										
							<td width="40%" bgcolor="#595959" align="left"
								id="idCellShowTable">
								<a id="loginLink" onclick="toggleTable5();" href="#"> <b>
								<font face="Calibri" size="2">
								<s:text name="global.lbl.MISC.details" /></font></b></a></td>
								<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
							</tr>

							</table>
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="6" width="100%">
							<table width="100%" cellspacing="0" cellpadding="0">
								<tr>
									<td style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
										<table width="100%" cellspacing="0" cellpadding="0">
											<tr height="20" bgcolor="#FFFFFF">
									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2" color="#595959"><b> <s:text
													name="global.lbl.transaction.freeze" />:&nbsp;
										</b></font></td>
									<td width="35%" style="border-bottom: 1px dotted #C0C0C0">
										<font face="Calibri"> <input type="radio" value="true"
											class="radiobutton" name="transactionFreeze"></font><font
										size="2">&nbsp;<s:text name="global.lbl.yes" />&nbsp;&nbsp;
									</font><input type="radio" value="false" class="radiobutton"
										name="transactionFreeze"><font size="2">&nbsp;<s:text
												name="global.lbl.no" />
									</font>
									</td>
									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2" color="#595959"><b><s:text
													name="global.lbl.reason" />:&nbsp;</b></font></td>
									<td width="35%" colspan="3"
										style="border-bottom: 1px dotted #C0C0C0">&nbsp;<input
										type="text" name="transactionFreezeReason"
										class="largeTxtLeftAlign"></td>
								</tr>
						<tr>											
						<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.special.instructions" />:&nbsp;</b></font></td>
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0">
													<input name="specialInstructions" size="30" type="text"
													id="idIssuedBy" class="largeTxtLeftAlign">
												</td>
											</tr>
											<tr height="20">
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.NPA.rating" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<input type="text" name="NPARating" class="mediumTxtLeftAlign">
												</td>

												<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2" color="#595959"><b><s:text
													name="global.lbl.NPA.reason" />:&nbsp;</b></font></td>
									<td width="35%" colspan="3"
										style="border-bottom: 1px dotted #C0C0C0">&nbsp;
										<input type="text" name="NPAReason"
										class="largeTxtLeftAlign"></td>
											</tr>

											
										</table>
</td>
</tr></table></td></tr></table></div>

		<!--PERSONAL DETAILS -->
<div style="border-bottom: 1px border-top: 1px border-left: 1px border-right: 1px solid #000059">
							<table id="idTBLookuplist6" width="100%" height="26" cellpadding="0" cellspacing="1">
							<tr>
										
							<td width="40%" bgcolor="#595959" align="left"
								id="idCellShowTable">
								<a id="loginLink" onclick="toggleTable6();" href="#"> <b>
								<font face="Calibri" size="2">
								<s:text name="global.lbl.personal.details" /></font></b></a></td>
								<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
							</tr>

							</table>
								<table width="100%" cellpadding="0" cellspacing="0">
										

									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.customer.category" />:&nbsp;</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<select size="1" id="" name="customerCategory"
											class="mediumselect">
												<option >General</option>
												<option >Staff</option>
												<option >Pensioner</option>
												<option >Trust/Society</option>
												<option >Others</option>
												
										</select>
										</td>
										
									</tr>

									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.member.type" />:&nbsp;</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<select name="memberType" class="mediumselect">
												<option >Regular</option>
												<option >Nominal</option>
											</select>
										</td>
										 
										   
									</tr>
									
									
									<tr bgcolor="#FFFFFF">
									<td><s:text name="global.lbl.residentual.details"/></td>
									
										
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.resident.YN" />:
											</b></font></td> 	
						
						<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
										<font face="Calibri"> <input type="radio" value="true"
											class="radiobutton" name="residentYN"></font><font
										size="2">&nbsp;<s:text name="global.lbl.yes" />&nbsp;&nbsp;
									</font><input type="radio" value="false" class="radiobutton"
										name="residentYN"><font size="2">&nbsp;<s:text
												name="global.lbl.no" />
									</font>
 									</td>  
 									<td width="15%" align="right"
										style="border-bottom: 1px dotted #C0C0C0"><font
										face="Calibri" size="2" color="#595959"><b><s:text
													name="global.lbl.nationality" />&nbsp;</b></font></td>
									<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
										<select size="1" name="nationality" class="mediumselect">
											<option value="">Select...</option>
											<c:forEach items="${nationalityBean.values}"
												var="nationality">
												<option value="${nationality}">${nationality}</option>
											</c:forEach>
									</select>
									</td>
						
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.country" />:
											</b></font></td> 
									
									<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="countries2" id="idCountry2" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="countryMst" items="${countries2}" >
									<option value="${countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
								</c:forEach>
								</select> 
 									</td>  		
									</tr>
									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.passport.number" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="passportNumber" size="20" type="text"
											id="idPassportNumber" class="largeTxtLeftAlign">
										</td>
										<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.issued.by.country" />:&nbsp;</b></font></td>
												<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="countries3" id="idCountry3" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="countryMst" items="${countries3}" >
									<option value="${countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
								</c:forEach>
								</select> 
 									</td> 										
												<tr height="20">
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.issued.date" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<sx:datetimepicker name="passportIssuedDate" id="idPassportIssuedDate"
														displayFormat="dd-MM-yyyy" />
												</td>

												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.expiry.date" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<sx:datetimepicker name="passportExpiryDate" id="idPassportExpiryDate"
														displayFormat="dd-MM-yyyy" />
												</td>
											</tr>
										<tr>		
												
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.visa.type" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<select name="visaType" class="mediumselect">
											<option>Business Visa</option>
											<option>Working Visa</option>
											</select>
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.visa.number" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="visaNumber" size="20" type="text"
											id="idVisaNumber" class="mediumTxtLeftAlign">
										</td>
										<tr height="20">
												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.visa.issued.date" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<sx:datetimepicker name="visaIssuedDate" id="idVisaIssuedDate"
														displayFormat="dd-MM-yyyy" />
												</td>

												<td width="25%" style="border-bottom: 1px dotted #C0C0C0"
													align="right"><font face="Calibri" size="2"><b><s:text
																name="global.lbl.visa.expiry.date" />:&nbsp;</b></font></td>
												<td bgcolor="#FFFFFF" width="25%"
													style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
													<sx:datetimepicker name="visaExpiryDate" id="idVisaExpiryDate"
														displayFormat="dd-MM-yyyy" />
												</td>
											</tr>
										<tr>
										
										<td><s:text name="global.lbl.adhoc.details"/></td>
										
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.qualifications" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="qualifications" size="20" type="text"
											id="idQualifications" class="mediumTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.religion" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="religion" size="20" type="text"
											id="idReligion" class="mediumTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.caste" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="caste1" size="20" type="text"
											id="idCaste1" class="mediumTxtLeftAlign">
										</td>
										</tr>
										<tr>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.blood.group" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="bloodGroup" size="20" type="text"
											id="idBloodGroup" class="mediumTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.residance.type" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="residenceType" size="20" type="text"
											id="idResidenceType" class="mediumTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.number.of.dependants" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="numberOfDependants" size="20" type="text"
											id="idNumberOfDependants" class="mediumTxtLeftAlign">
										</td>
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.introducer.YN" />:
											</b></font></td> 	
						
						<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
										<font face="Calibri"> <input type="radio" value="true"
											class="radiobutton" name="introducerYN"></font><font
										size="2">&nbsp;<s:text name="global.lbl.yes" />&nbsp;&nbsp;
									</font><input type="radio" value="false" class="radiobutton"
										name="introducerYN"><font size="2">&nbsp;<s:text
												name="global.lbl.no" />
									</font>
 									</td>  
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.introducer.number" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="introducerNumber" size="20" type="text"
											id="idIntroducerNumber" class="mediumTxtLeftAlign">
										</td>
										
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.PEP.YN" />:
											</b></font></td> 	
						
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
										<font face="Calibri"> <input type="radio" value="true"
											class="radiobutton" name="PEPYN"></font><font
										size="2">&nbsp;<s:text name="global.lbl.yes" />&nbsp;&nbsp;
									</font><input type="radio" value="false" class="radiobutton"
										name="PEPYN"><font size="2">&nbsp;<s:text
												name="global.lbl.no" />
									</font>
 									</td>  
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.AML.Rating" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="AMLRating" size="20" type="text"
											id="idAMLRating" class="mediumTxtLeftAlign">
										</td>
										
									</tr>
									
									<tr>
									<td>
									</td>
									</tr>
									
									<tr>
									 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.TDS.YN" />:
											</b></font></td> 	
						
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
										<font face="Calibri"> <input type="radio" value="true"
											class="radiobutton" name="TDSYN"></font><font
										size="2">&nbsp;<s:text name="global.lbl.yes" />&nbsp;&nbsp;
									</font><input type="radio" value="false" class="radiobutton"
										name="TDSYN"><font size="2">&nbsp;<s:text
												name="global.lbl.no" />
									</font>
 									</td> 
 									<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.TDS.percentage" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="TDSPercentage" size="20" type="text"
											id="idTDSPercentage" class="mediumTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;<font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.reason" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="reason" size="20" type="text"
											id="idReason" class="mediumTxtLeftAlign">
										</td>
 									 
									</tr>
									</table>
									</div>
		<!-- ADDRESS DETAILS -->
<div style="border-bottom: 1px border-top: 1px border-left: 1px border-right: 1px solid #000059">
							<table id="idTBLookuplist7" width="100%" height="26" cellpadding="0" cellspacing="1">
							<tr>
										
							<td width="40%" bgcolor="#595959" align="left"
								id="idCellShowTable">
								<a id="loginLink" onclick="toggleTable7();" href="#"> <b>
								<font face="Calibri" size="2">
								<s:text name="global.lbl.employment.details" /></font></b></a></td>
								<td width="40%" bgcolor="#FFFFFF" valign="top" align="left">&nbsp;</td>
							</tr>

							</table>
								<table width="100%" cellpadding="0" cellspacing="0">
										
									<tr height="25" bgcolor="#C4C4FF">
										<td width="15%" align="right"><font face="Calibri"
											size="2" color="#595959"><b></b></font></td>
										<td width="18%"></td>
										
									</tr>

									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.profession.type" />:&nbsp;</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<select size="1" id="idProfessionType" name="professionType"
											class="mediumselect">
												<option>Profession1</option>
												<option>Profession2</option>
										</select>
										</td>
										
									</tr>

									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.address" />:&nbsp;</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input id="idAddress" name="address1" size="20"
											type="text" class="largeTxtLeftAlign">
										</td>
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.village" />:
											</b></font></td> 
											
											<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="villages4" id="idVillages4" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="villageMst" items="${villages4}" >
									<option value="${villageCode}">${villageMst.villageCode}-${villageMst.villageName}</option>
								</c:forEach>
								</select> 
 									</td>  
										
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.state" />:
											</b></font></td> 
											
											
											<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="states4" id="idStates4" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="stateMst" items="${states4}" >
									<option value="${stateCode}">${stateMst.stateCode}-${stateMst.stateName}</option>
								</c:forEach>
								</select> 
 									</td>  
									</tr>
									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="address2" size="20" id="idAddress1"
											class="largeTxtLeftAlign">
										</td>
										 <td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.municipality" />:
											</b></font></td> 	
						
						<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="municipalities4" id="idMunicipalities4" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="municipality" items="${municipalities4}" >
									<option value="${municipalityCode}">${municipality.municipalityCode}-${municipality.municipalityName}</option>
								</c:forEach>
								</select> 
 									</td>  
						
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.country" />:
											</b></font></td> 
									
									<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="countries4" id="idCountry4" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="countryMst" items="${countries4}" >
									<option value="${countryCode}">${countryMst.countryCode}-${countryMst.countryName}</option>
								</c:forEach>
								</select> 
 									</td>  		
									</tr>
									<tr bgcolor="#FFFFFF">
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											&nbsp;<input name="address3" size="20" type="text"
											id="idAddress2" class="largeTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.district.city" />:
											</b></font></td> 
										
								<td width="18%" style="border-bottom: 1px dotted #C0C0C0"> 
 										<select id="selected record" name="districts4" id="idDistrictCity4" class="mediumselect"><!-- name="selected record" -->
								<c:forEach var="districtMst" items="${districts4}" >
									<option value="${districtCode}">${districtMst.districtCode}-${districtMst.districtName}</option>
								</c:forEach>
								</select> 
 									</td>  
												
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.employee.number" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="employeeNumber" size="20" type="text" id="idEmployeeNumber"
											class="smallTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.designation" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="designation" size="20" type="text" id="idDesignation"
											class="smallTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.department" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="department" size="20" type="text" id="idDepartment"
											class="smallTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.years.in.service" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="yearsInService" size="20" type="text" id="idYearsInService"
											class="smallTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.DOR" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="DOR" size="20" type="text" id="idDOR"
											class="smallTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.annual.income" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="annualIncome" size="20" type="text" id="idAnnualIncome"
											class="smallTxtLeftAlign">
										</td>
											<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.other.bank.accounts" />:
											</b></font></td>
												<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.account.type" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<select name="accountType" class="mediumselect">
											<option>Account Type1</option>
											<option>Account Type2</option>
											<option>Account Type3</option>
											</select>
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.bank.code" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="bankCode" size="20" type="text" id="idBankCode"
											class="smallTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.bank.name" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="bankName" size="20" type="text" id="idBankName"
											class="smallTxtLeftAlign">
										</td>
										<td width="15%" align="right"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b> <s:text
														name="global.lbl.account.number" />:
											</b></font></td>
										<td width="18%" style="border-bottom: 1px dotted #C0C0C0">
											<input name="accountNumber" size="20" type="text" id="idAccountNumber"
											class="smallTxtLeftAlign">
										</td>
									</tr>
									</table>
								
									<tr>
									<td>
									<table width="100%" cellpadding="0" cellspacing="1">
									<tr height="25">
										<td width="30%" align="center"
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
									</tr>
								</table>
								</td>
								</tr>
							
								<tr>
								<td>
								<table id="tblData" width="100%" cellpadding="0" cellspacing="1">
									<tr height="25" bgcolor="#C4C4FF">
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.profeesion.type" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.employer.number" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.department" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.address" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.village" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.state" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.municipality" /></b></font></td>
										<td width="5.19%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.country" /></b></font></td>
										<td width="7.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.district.city" /></b></font></td>
										<td width="5.19%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.years.in.service" /></b></font></td>
										<td width="5.19%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.DOR" /></b></font></td>
										<td width="12.69%" align="left"
											style="border-bottom: 1px dotted #C0C0C0"><font
											face="Calibri" size="2" color="#595959"><b><s:text
														name="global.lbl.action" /></b></font></td>
									</tr>
									
								</table>
								</td>
								</tr>
									<table>
									<tr>
									<td>
									<table width="100%" cellpadding="0" cellspacing="1">
									<tr height="25">
										<td width="30%" align="center"
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
									</tr>
								</table>
								</td>
								</tr>
								<tr>
								<td>
								</td>
								</tr>
								</table>
</div>
<div>
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr bgcolor="#3366FF">
									<td width="100%" align="center"><input type="button"
										value="<s:text name="global.btn.prev"/>" class="button"
										name="btnPrev" onclick="javascript:nomineeDtls();"> <input
										type="submit" value="<s:text name="global.btn.save"/>"
										class="button" name="btnSave" onClick="javascript:save();">
									</td>



								</tr>
							</table>
							</div>
				<table>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
			
			<input type="hidden" value="mlValue" name="mlValue"> <input
				type="hidden" value="mlValue1" name="mlValue1"> <input
				type="hidden" value="mlValue2" name="mlValue2"> <input
				type="hidden" value="mlValue3" name="mlValue3"> <input
				type="hidden" value="mlValue4" name="mlValue4"><input
				type="hidden" value="mlValue5" name="mlValue5"><input
				type="hidden" value="mlValue6" name="mlValue6">
				
		</form>
	</div>


</body>

</html>