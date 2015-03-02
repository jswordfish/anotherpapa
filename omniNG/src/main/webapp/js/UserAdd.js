//Dynamic table Add, update , delete

var i;

function add() {
	//alert("add funtion");
	if (document.getElementById("idTenant").value == '00'
			|| document.getElementById("idBranches").value == '00') {
		alert('tenants or branches is not selected correctly ');

	} else {
		var branchesValue = [];
		var s = document.getElementById("idBranches");
		//alert("idBranches lenght  " + s.options.length);
		for (var i = 0; i < s.options.length; i++) {
			if (s.options[i].selected == true) {
				var branchId = s.options[i].text;

				//  alert("value of branchId>>>>>:"+s.options[i].text);
				branchesValue.push(branchId);

			}

		}

		var branchesIds = [];
		var s1 = document.getElementById("idBranches");
		//alert("idBranches lenght  " + s1.options.length);
		for (var j = 0; j < s.options.length; j++) {
			if (s1.options[j].selected == true) {
				var schoolid1 = s1.options[j].value;

				//    alert("value of branchCd>>>>>"+ s1.options[i].value);
				branchesIds.push(schoolid1);
			}

		}

		/* 	document.getElementById("idClear").disabled = false; */
		var table = document.getElementById("tblData");
		var row = table.insertRow(1);
		var sel = document.getElementById("idTenant");
		var tenantText = sel.options[sel.selectedIndex].text;

		//alert("value of idTenant text"+tenantText);

		var sel2 = document.getElementById("idTenant");
		var tenantId = sel2.options[sel2.selectedIndex].value;
		//alert("value of idTenant tenantId"+tenantId);

		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		/*var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4); */
		// Add some text to the new cells:
		/* cell1.innerHTML = '<input type="hidden" value="tenantId"/>';
		cell2.innerHTML = '<input type="hidden" value="branchesIds"/>'; */
		cell1.innerHTML = tenantText;
		cell2.innerHTML = branchesValue;
		cell3.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

		/* clearing(); */
		
		//alert("document.forms[0].mlValue.value.  from add...."
			//	+ document.getElementById("mlValue").value);
	}
}


function edit(row) {
	document.getElementById("idUpdate").disabled = false;
	document.getElementById("idClear").disabled = false;
	document.getElementById("idAdd").disabled = true;
	document.getElementById("idDel").disabled = true;
	clearing();
	var table = document.getElementById("tblData");
	i = row.parentNode.parentNode.rowIndex;

	var a = table.rows[i];
	/* var idTenant = a.cells[0].innerHTML;
	var idBranches = a.cells[1].innerHTML;
	

	 document.getElementById("idTenant").text = idTenant;
	document.getElementById("idBranches").value = idBranches;  */

}
function update() {
	//alert('in upadte');
	//i = row.parentNode.parentNode.rowIndex;
	if (document.getElementById("idTenant").value == '00'
			|| document.getElementById("idBranches").value == "00") {
		alert('tenants or branches is not selected correctly ');

	}else{
	var table = document.getElementById("tblData");
	var e = table.rows[i];
	//alert('1');
	var branchesValue = [];
	var s = document.getElementById("idBranches");
	//alert("idBranches lenght  " + s.options.length);
	for (var j = 0; j < s.options.length; j++) {
		if (s.options[j].selected == true) {
			var branchId = s.options[j].text;

			/*  alert("value of branchId>>>>>:"+s.options[j].text); */
			branchesValue.push(branchId);

		}

	}
	//alert('2');
	var sel = document.getElementById("idTenant");
	var tenantText = sel.options[sel.selectedIndex].text;
	alert(tenantText);

	//alert('3');
	e.cells[0].innerHTML = tenantText;
	e.cells[1].innerHTML = branchesValue;

	//alert('4');
	document.getElementById("idUpdate").disabled = true;
	document.getElementById("idAdd").disabled = false;
	document.getElementById("idDel").disabled = false;

	clearing();
	//alert('5');
	var tableid = "tblData";
	var tbl = document.getElementById(tableid);
	var tableValues = getMLValues(tableid);
	var MlVal = getMultiArrayStringMargin(tableValues);
	document.forms[0].mlValue.value = MlVal;
	//alert('6');
	}
}
function clearing() {

	/*  document.getElementById("formHomeId").reset();  */
	document.getElementById("idTenant").value = '00';
	document.getElementById("idBranches").value = '00';

	document.getElementById("idUpdate").disabled = true;
	document.getElementById("idAdd").disabled = false;
	document.getElementById("idDel").disabled = false;
}
function deleteRow(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData').deleteRow(i);
	
	
	

}
function getMLValues(tableid) {
	var tableValues = new Array();

	var tbl = document.getElementById(tableid);
	for (var i = 1; i < tbl.rows.length; i++) {
		var rowValues = getRowValues(tbl.rows[i]);
		//alert("rowValues--" + rowValues);
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
//	alert('in multiarraystring');
	//alert("multiValues.length....>>>>>"+multiValues.length);
	var str = '';
	for (var i = 0; i < multiValues.length; i++) {

		var rowVal = multiValues[i];
		//alert("rowVal" + rowVal);
		//alert("rowVal.length>>>>>" + rowVal.length);
		for (var j = 0; j < rowVal.length; j++) {
			//alert("rowVal[j]).."+(rowVal[j].split("~")));
			var sely = (rowVal[j]).split("~");

			str = str + sely[0] + '~';
			//alert(str);
		}
		str = str + '!';
	}
	//alert("getMultiArrayStringMargin..." + str);
	return str;
}
function addTables(){
	
	alert("in useradd.js");
new FormValidator(
			'userAdd',
			[   {
				name : 'loginId',
				display : 'Login ID',
				rules : 'required'
			},{
				name : 'userFName',
				display : 'First Name',
				rules : 'required'
			}, {
				name : 'tenants',
				display : 'Tenants',
				rules : 'required'
			},{
				name : 'emailId',
				display : 'Email Id',
				rules : 'required|valid_email'
			}, {
				name : 'branches1',
				display : 'Branches',
				rules : 'required'
			},    ],
			
		    
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
}