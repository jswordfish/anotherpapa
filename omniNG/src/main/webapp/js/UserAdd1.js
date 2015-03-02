var i;


function add() {
	//alert("add funtion");
	document.getElementById("idClear").disabled = false;
	document.getElementById("idUpdate").disabled = false;
	if (document.getElementById("idRoles").value == '00'
		|| document.getElementById("idBranches").value == '00') {
	alert('tenants or branches is not selected correctly ');

}else{
var rolesValue = [];
var s = document.getElementById("idRoles");
// alert("idBranches lenght  " + s.options.length);
 for (var i = 0; i < s.options.length; i++) {
     if (s.options[i].selected == true) {
         var roleId = s.options[i].text;
      

       //  alert("value of branchId>>>>>:"+s.options[i].text);
         rolesValue.push(roleId);
             
             
     }

 }
 
 var rolesIds = [];
 var s1 = document.getElementById("idRoles");
          //  alert("idBranches lenght  " + s1.options.length);
            for (var j= 0; j < s.options.length; j++) {
                if (s1.options[j].selected == true) {
                    var roleVl = s1.options[j].value;
                 

                //    alert("value of branchCd>>>>>"+ s1.options[i].value);
                 rolesIds.push(roleVl);
                }
          
            }

/* 	document.getElementById("idClear").disabled = false; */
var table = document.getElementById("tblData");
var row = table.insertRow(1);
var sel = document.getElementById("idBranches");
var branches = sel.options[sel.selectedIndex].text;

//alert("value of idTenant text"+tenantText);


var sel2 = document.getElementById("idBranches");
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
cell1.innerHTML = branches;
cell2.innerHTML= rolesValue;
cell3.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> '; 

//clearing();
}

}

	 

function edit(row) {
	//alert('in edit');
	document.getElementById("idUpdate").disabled = false;
	document.getElementById("idClear").disabled = false;
	document.getElementById("idAdd").disabled = true;
	document.getElementById("idDel").disabled = true;
	clearing();
	var table = document.getElementById("tblData");
	i = row.parentNode.parentNode.rowIndex;
  //alert('12345');
	var a = table.rows[i];
	

}
function update() {
	//alert('in upadte');
	//i = row.parentNode.parentNode.rowIndex;
	if (document.getElementById("idBranches").value == '00'
			|| document.getElementById("idRoles").value == '00') {
		alert('tenants or branches is not selected correctly ');

	}else{
	var table = document.getElementById("tblData");
	var e = table.rows[i];
	//alert('1');
	 var rolesValue = [];
	  var s = document.getElementById("idRoles");
	            // alert("idBranches lenght  " + s.options.length);
	             for (var i = 0; i < s.options.length; i++) {
	                 if (s.options[i].selected == true) {
	                     var roleId = s.options[i].text;
	                  

	                   //  alert("value of branchId>>>>>:"+s.options[i].text);
	                     rolesValue.push(roleId);
	                         
	                         
	                 }
	           
	             }
	//alert('2');
	var sel = document.getElementById("idBranches");
	var branches = sel.options[sel.selectedIndex].text;
	//alert(tenantText);

	//alert('3');
	e.cells[0].innerHTML = branches;
	e.cells[1].innerHTML = rolesValue;

	//alert('4');
	document.getElementById("idUpdate").disabled = true;
	document.getElementById("idAdd").disabled = false;
	document.getElementById("idDel").disabled = false;

	clearing();
	
//alert('6');
	}
}
function clearing() {

	/*  document.getElementById("formHomeId").reset();  */
	document.getElementById("idRoles").value = '00';
	document.getElementById("idBranches").value = '00';

	document.getElementById("idUpdate").disabled = true;
	document.getElementById("idAdd").disabled = false;
	document.getElementById("idDel").disabled = false;
}
function deleteRow(row) {
	i = row.parentNode.parentNode.rowIndex;
	document.getElementById('tblData').deleteRow(i);
	
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
	//alert('in multiarraystring');
	//alert("multiValues.length....>>>>>"+multiValues.length);
	var str = '';
	for (var i =0; i<multiValues.length; i++)
	{ 
		
		var rowVal = multiValues[i];
	//alert("rowVal"+rowVal);
	//alert("rowVal.length>>>>>"+rowVal.length);
		for (var j =0; j<rowVal.length;j++)
		{
			//alert("rowVal[j]).."+(rowVal[j].split("~")));
		     var sely=(rowVal[j]).split("~");
		     
			str = str+sely[0]+'~';
			//alert(str);
		}
		str = str + '!';		
	}
	//alert("getMultiArrayStringMargin..."+str);
	return str;
}
