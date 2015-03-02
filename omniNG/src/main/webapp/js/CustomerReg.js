//For Dynamic Table updation of Customer Module
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
	document.forms["formHomeId"].mlValue.value = MlVal;
	//alert("document.forms].mlValue.value..."
		//	+ document.forms["formHomeId"].mlValue.value);
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
	//alert(MlVal);
	document.forms["formHomeId"].mlValue.value = MlVal;
	//alert(document.forms["formHomeId"].mlValue.value);
	
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
	var cell16 = row.insertCell(15);
	
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
	if (document.getElementById('idOsLoanY').checked) {
		cell14.innerHTML = document.getElementById("idOsLoanY").value;
		}
	else if(document.getElementById('idOsLoanN').checked){
		cell14.innerHTML = document.getElementById("idOsLoanN").value;
	}else {
		cell14.innerHTML ='';
	}
	
	cell15.innerHTML = document.getElementById("idOsAmount").value;
	cell16.innerHTML = '<input type="button" id="idEdit1" class="smallbtn" value ="EDIT" onclick="edit1(this);"> &nbsp;&nbsp;<input type="button" id="idDel1" class="smallbtn" value ="DEL" onclick="deleteRow1(this);"> ';

	clearing1();
	var tableid = "tblData1";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	//alert("tableValues..."+tableValues);
	var MlVal = getMultiArrayStringMargin(tableValues);
	//alert("MlVal....."+MlVal);
	document.forms["formHomeId"].mlValue1.value = MlVal;
	//alert("document.forms[0].mlValue1.value..."
		//	+ document.forms["formHomeId"].mlValue1.value);
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
	document.getElementById("idAssetAddress2").value = idAssetAddress2;
	document.getElementById("idAssetAddress3").value = idAssetAddress3;
	document.getElementById("idVillages2").value = idVillages2;
	document.getElementById("idMunicipalities2").value = idMunicipalities2;
	document.getElementById("idDistrictCity2").value = idDistrictCity2;
	document.getElementById("idStates2").value = idStates2;
	document.getElementById("idAreaSize").value = idAreaSize;
	document.getElementById("idAreaRate").value = idAreaRate;
	document.getElementById("idApproxMonetaryValue").value = idApproxMonetaryValue;
	document.getElementById("idRemarks1").value = idRemarks1;
	//document.getElementById("idOsLoanYN").value = idOsLoanYN;
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
	e.cells[9].innerHTML = document.getElementById("idAreaSize").value;
	e.cells[10].innerHTML = document.getElementById("idAreaRate").value;
	e.cells[11].innerHTML = document.getElementById("idApproxMonetaryValue").value;
	e.cells[12].innerHTML = document.getElementById("idRemarks1").value;
	if (document.getElementById('idOsLoanY').checked) {
		e.cells[13].innerHTML = document.getElementById("idOsLoanY").value;
		}
	else if(document.getElementById('idOsLoanN').checked){
		e.cells[13].innerHTML = document.getElementById("idOsLoanN").value;
	}else {
		cell14.innerHTML ='';
	}
	
	e.cells[14].innerHTML = document.getElementById("idOsAmount").value;

	document.getElementById("idUpdate1").disabled = true;
	document.getElementById("idAdd1").disabled = false;
	document.getElementById("idDel1").disabled = false;

	clearing1();
	var tableid = "tblData1";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms["formHomeId"].mlValue1.value = MlVal;
}
function clearing1() {

	/*  document.getElementById("formHomeId").reset();  */
	document.getElementById("idRegNumber").value='';
	document.getElementById("idPlotNumber").value='';
	document.getElementById("idAssetAddress1").value='';
	document.getElementById("idAssetAddress2").value='';
	document.getElementById("idAssetAddress3").value='';
	document.getElementById("idVillages2").value='';
	document.getElementById("idMunicipalities2").value='';
	document.getElementById("idDistrictCity2").value='';
	document.getElementById("idStates2").value='';
	document.getElementById("idAreaSize").value='';
	document.getElementById("idAreaRate").value='';
	document.getElementById("idApproxMonetaryValue").value='';
	document.getElementById("idRemarks1").value='';
	//document.getElementById("idOsLoanYN").checked =false;
	document.getElementById("idOsAmount").value='';
	
	
	
 	document.getElementById("idUpdate1").disabled = true;
	document.getElementById("idAdd1").disabled = false;
	document.getElementById("idDel1").disabled = false;
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

	cell1.innerHTML =  document.getElementById("idNoOfStaff").value;
	cell2.innerHTML = document.getElementById("idRegCode").value;
	cell3.innerHTML = '<input type="button" id="idEdit2" class="smallbtn" value ="EDIT" onclick="edit2(this);"> &nbsp;&nbsp;<input type="button" id="idDel2" class="smallbtn" value ="DEL" onclick="deleteRow2(this);"> ';

	clearing2();
	var tableid = "tblData2";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	//alert("tableValues..."+tableValues);
	var MlVal = getMultiArrayStringMargin(tableValues);
	//alert("MlVal....."+MlVal);
	document.forms["formHomeId"].mlValue2.value = MlVal;
	//document.getElementsByName("mlValue2").value = MlVal;
	//document.forms["formHomeId"].mlValue2.value = MlVal;
	//alert("document.forms[0].mlValue2.value..."	+ document.forms["formHomeId"].mlValue2.value);
}
function clearing2() {

	/*  document.getElementById("formHomeId").reset();  */
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
	var idNoOfStaff = a.cells[0].innerHTML;
	var idRegCode = a.cells[1].innerHTML;
	
	document.getElementById("idNoOfStaff").value = idNoOfStaff;
	document.getElementById("idRegCode").value = idRegCode;
	
}
function update2() {

	//i = row.parentNode.parentNode.rowIndex;

	var table = document.getElementById("tblData2");
	var e = table.rows[i];
	e.cells[0].innerHTML = document.getElementById("idNoOfStaff").value;
	e.cells[1].innerHTML = document.getElementById("idRegCode").value;
	
	document.getElementById("idUpdate2").disabled = true;
	document.getElementById("idAdd2").disabled = false;
	document.getElementById("idDel2").disabled = false;

	clearing2();
	var tableid = "tblData2";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms["formHomeId"].mlValue2.value = MlVal;
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
	var cell18 = row.insertCell(17);
	

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
	document.forms["formHomeId"].mlValue3.value = MlVal;
	//alert("document.forms[0].mlValue3.value..."
		//	+ document.forms["formHomeId"].mlValue3.value);
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
	var idAnnualIncome = a.cells[10].innerHTML;
	var idAccountType = a.cells[11].innerHTML;
	var idBankCode = a.cells[12].innerHTML;
	var idBankName = a.cells[13].innerHTML;
	var idAccountNumber = a.cells[14].innerHTML;
	var idYearsInService = a.cells[15].innerHTML;
	var idDesignation = a.cells[16].innerHTML;
	
	

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
	document.getElementById("idAnnualIncome").value = idAnnualIncome;
	document.getElementById("idAccountType").value = idAccountType;
	document.getElementById("idBankCode").value = idBankCode;
	document.getElementById("idBankName").value = idBankName;
	document.getElementById("idAccountNumber").value = idAccountNumber ;
	document.getElementById("idYearsInService").value = idYearsInService;
	document.getElementById("idDesignation").value = idDesignation;

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
	e.cells[10].innerHTML = document.getElementById("idAnnualIncome").value;
	e.cells[11].innerHTML = document.getElementById("idAccountType").value;
	e.cells[12].innerHTML = document.getElementById("idBankCode").value;
	e.cells[13].innerHTML = document.getElementById("idBankName").value;
	e.cells[14].innerHTML = document.getElementById("idAccountNumber").value;
	e.cells[15].innerHTML = document.getElementById("idYearsInService").value;
	e.cells[16].innerHTML = document.getElementById("idDesignation").value;

	document.getElementById("idUpdate3").disabled = true;
	document.getElementById("idAdd3").disabled = false;
	document.getElementById("idDel3").disabled = false;

	clearing3();
	var tableid = "tblData3";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms["formHomeId"].mlValue3.value = MlVal;
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
	var cell9 = row.insertCell(8);

	// Add some text to the new cells:

	cell1.innerHTML = document.getElementById("idProofType").value;
	cell2.innerHTML = document.getElementById("idKYCType1").value;
	cell3.innerHTML = document.getElementById("idIdNumber").value;
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
//	alert("MlVal....."+MlVal);
	document.forms["formHomeId"].mlValue4.value = MlVal;
	//alert("document.forms[0].mlValue4.value..."
		//	+ document.forms["formHomeId"].mlValue4.value);
}
function deleteRow4(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData4').deleteRow(i);

}
function clearing4() {

	document.getElementById("idProofType").value = '';
	document.getElementById("idKYCType1").value = '';
	document.getElementById("idIdNumber").value = '';
	document.getElementById("idIssuedDate").value = '';
	document.getElementById("idExpiryDate").value = '';
	document.getElementById("idIssuedBy").value = '';
	document.getElementById("idRecievedDate").value = '';
	document.getElementById("idRemarks").value = '';


	document.getElementById("idUpdate4").disabled = true;
	document.getElementById("idAdd4").disabled = false;
	document.getElementById("idDel4").disabled = false;
}
function edit4(row) {
	document.getElementById("idUpdate4").disabled = false;
	document.getElementById("idClear4").disabled = false;
	document.getElementById("idAdd4").disabled = true;
	document.getElementById("idDel4").disabled = true;

	var table = document.getElementById("tblData4");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	var idProofType = a.cells[0].innerHTML;
	var idKYCType1 = a.cells[1].innerHTML;
	var idIdNumber = a.cells[2].innerHTML;
	var idIssuedDate = a.cells[3].innerHTML;
	var idExpiryDate = a.cells[4].innerHTML;
	var idIssuedBy = a.cells[5].innerHTML;
	var idRecievedDate = a.cells[6].innerHTML;
	var idRemarks = a.cells[7].innerHTML;

	document.getElementById("idProofType").value = idProofType;
	document.getElementById("idKYCType1").value = idKYCType1;
	document.getElementById("idIdNumber").value = idIdNumber;
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
	e.cells[0].innerHTML = document.getElementById("idProofType").value;
	e.cells[1].innerHTML = document.getElementById("idKYCType1").value;
	e.cells[2].innerHTML = document.getElementById("idIdNumber").value;
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
	document.forms["formHomeId"].mlValue4.value = MlVal;
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
	var cell7 = row.insertCell(6);

	// Add some text to the new cells:

	cell1.innerHTML = document.getElementById("idFamilyMemberName").value;
	cell2.innerHTML = document.getElementById("idRelationship1").value;
	if (document.getElementById('idGender1M').checked) {
		cell3.innerHTML = document.getElementById("idGender1M").value;
		}
	else if(document.getElementById('idGender1F').checked){
		cell3.innerHTML = document.getElementById("idGender1F").value;
	}else {
		cell3.innerHTML = '';
	}
	
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
	document.forms["formHomeId"].mlValue5.value = MlVal;
	//alert("document.forms[0].mlValue5.value..."
		//	+ document.forms["formHomeId"].mlValue5.value);
}
function deleteRow5(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData5').deleteRow(i);

}
function clearing5() {

	document.getElementById("idFamilyMemberName").value = '';
	document.getElementById("idRelationship1").value = '';
	//document.getElementById("idGender1").value = '';
	document.getElementById("idDob").value = '';
	document.getElementById("idProfession").value = '';
	document.getElementById("idEducation").value = '';

	document.getElementById("idUpdate5").disabled = true;
	document.getElementById("idAdd5").disabled = false;
	document.getElementById("idDel5").disabled = false;
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
	if (document.getElementById('idGender1M').checked) {
		e.cells[2].innerHTML = document.getElementById("idGender1M").value;
		}
	else if(document.getElementById('idGender1F').checked){
		e.cells[2].innerHTML = document.getElementById("idGender1F").value;
	}else {
		cell3.innerHTML = '';
	}
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
	document.forms["formHomeId"].mlValue5.value = MlVal;
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


