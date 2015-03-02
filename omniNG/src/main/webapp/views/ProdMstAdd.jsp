<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>

<head>
<%-- <script src="js/ProdMstAdd.js"></script>	 --%>

<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/stylesheet.css" />" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252"> -->
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


	function add() {
		document.getElementById("idClear").disabled = false;
		document.getElementById("idUpdate").disabled = false;
		var table = document.getElementById("tblData");
		var row = table.insertRow(1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		var cell6 = row.insertCell(5);
		// Add some text to the new cells:

		cell1.innerHTML = document.getElementById("idCategory").value;
		cell2.innerHTML = document.getElementById("idType").value;
		cell3.innerHTML = document.getElementById("idDescription").value;
		cell4.innerHTML = document.getElementById("idMinNum").value;
		cell5.innerHTML = document.getElementById("idMaxNum").value;
		cell6.innerHTML = '<input type="button" id="idEdit" class="smallbtn" value ="EDIT" onclick="edit(this);"> &nbsp;&nbsp;<input type="button" id="idDel" class="smallbtn" value ="DEL" onclick="deleteRow(this);"> ';

		clearing();
		var tableid = "tblData";
		var tbl = document.getElementById(tableid);
		var tableValues = getMLValues(tableid);
		//alert("tableValues..."+tableValues);
		var MlVal=getMultiArrayStringMargin(tableValues);
		//alert("MlVal....."+MlVal);
		document.forms["formHomeId"].mlValue.value = MlVal;
		//alert("document.forms[0].mlValue.value>>>"+document.forms[0].mlValue.value);
	}
	function deleteRow(row) {
		i = row.parentNode.parentNode.rowIndex;
		document.getElementById('tblData').deleteRow(i);
		
	}
	
	function edit(row) {
		document.getElementById("idUpdate").disabled = false;
		document.getElementById("idClear").disabled = false;
		document.getElementById("idAdd").disabled = true;
		document.getElementById("idDel").disabled = true;
		
		var table = document.getElementById("tblData");
		i = row.parentNode.parentNode.rowIndex;
		
		var a = table.rows[i];
		var category = a.cells[0].innerHTML;
		var type = a.cells[1].innerHTML;
		var desc = a.cells[2].innerHTML;
		var minNum = a.cells[3].innerHTML;
		var maxNum = a.cells[4].innerHTML;
		document.getElementById("idCategory").value = category;
		document.getElementById("idType").value = type;
		document.getElementById("idDescription").value = desc;
		document.getElementById("idMinNum").value = minNum;
		document.getElementById("idMaxNum").value = maxNum;
		

	}

	function update() {
		
		var table = document.getElementById("tblData");
		var e = table.rows[i];
		e.cells[0].innerHTML = document.getElementById("idCategory").value;
		e.cells[1].innerHTML = document.getElementById("idType").value;
		e.cells[2].innerHTML = document.getElementById("idDescription").value;
		e.cells[3].innerHTML = document.getElementById("idMinNum").value;
		e.cells[4].innerHTML = document.getElementById("idMaxNum").value;
		
		document.getElementById("idUpdate").disabled = true;
		document.getElementById("idAdd").disabled = false;
		document.getElementById("idDel").disabled = false;

		var tableid = "tblData";
		var tbl = document.getElementById(tableid);
		var tableValues = getMLValues(tableid);
		var MlVal=getMultiArrayStringMargin(tableValues);
		document.forms[0].mlValue.value=MlVal;
	}
	function clearing() {
		document.getElementById("idCategory").value='';
		document.getElementById("idType").value='';
		document.getElementById("idDescription").value='';
		document.getElementById("idMinNum").value='';
		document.getElementById("idMaxNum").value=''; 
	
	}

	function save() {
		var tableid = "tblData";
		var tbl = document.getElementById(tableid);
		var tableValues = getMLValues(tableid);
		var MlVal=getMultiArrayStringMargin(tableValues);
		document.forms["formHomeId"].mlValue.value=MlVal;
		
		document.forms["formHomeId"].submit();
		
		/* window.location.href = "<s:url value="ProdMstMgmtSave"/>"; */
	}

	function cancel() {
		window.location.href = "<s:url value=""/>";
	}

	function addAssetDet() {
		document.getElementById("idTBLAsset").style.display = "inline";
		document.getElementById("idTBLShare").style.display = "none";
		document.getElementById("idTBLAcMap").style.display = "none";
		document.getElementById("idTBLNominee").style.display = "none";
	}
	function addShareDet() {
		document.getElementById("idTBLAsset").style.display = "none";
		document.getElementById("idTBLShare").style.display = "inline";
		document.getElementById("idTBLAcMap").style.display = "none";
		document.getElementById("idTBLNominee").style.display = "none";
	}
	function addAcMap() {
		document.getElementById("idTBLAsset").style.display = "none";
		document.getElementById("idTBLShare").style.display = "none";
		document.getElementById("idTBLAcMap").style.display = "inline";
		document.getElementById("idTBLNominee").style.display = "none";
	}
	function addNomineeDet() {
		document.getElementById("idTBLAsset").style.display = "none";
		document.getElementById("idTBLShare").style.display = "none";
		document.getElementById("idTBLAcMap").style.display = "none";
		document.getElementById("idTBLNominee").style.display = "inline";
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
	
</script>


	
</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
		<form name="formHome" id="formHomeId" action="ProdMstMgmtSave"	method="post">
	<div align="center">
		<div><input type="hidden" name="vToken"></div>
	<div id="idPageTitle" class="pageTitle" style="display:block" align="left">&nbsp;<s:text name="global.pageTitle.product.master" />
		
	</div>
	<div id="idErrMsg" class="errorDiv" style="display:none"><s:text name="errMsg"></s:text></div>
	    	<div align="left" id="idErrTbl" class="errorDiv" style="display:none">
			<p id="el" style="color: #FF0040" align="left"></p>			
			
		  </div>
     	
	
			<table id="idTblTitle"  width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				
			</table>
			<table id="idTblTxn" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.product.code" />&nbsp;</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" tabindex="1" id="idProductCode" name="productCode"
						class="mediumTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.product.name" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<input
						type="text" tabindex="2" name="productName" size="30"
						style="font-family: Calibri; font-size: 10pt; color: #000000; border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.currency" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select name="currencyCode" tabindex="3" class="mediumselect">
							<option value=""><s:text name="global.val.select" />...
							</option>
							<c:forEach var="currency" items="${currency}">
							
                           <option value="${currency.currencyISOCode}">${currency.currencyISOCode}</option>
                            </c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.customer.internal" />
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select	name="customerInternal" tabindex="4" class="mediumselect">
						<option value=""><s:text name="global.val.select" />...
							</option>
							<c:forEach var="custIntMap" items="${custIntMap}">
							
                           <option value="${custIntMap.key}">${custIntMap.value}</option>
                            </c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.voucher.entry.level" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="vcrEntryLevel" tabindex="5">
							<option value=""><s:text name="global.val.select" />...
							</option>
							<c:forEach var="voucherType" items="${voucherTypeMap}">
							  <option value="${voucherType.key}">${voucherType.value}</option></c:forEach>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2"><s:text
								name="global.lbl.account.open.level" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="vcrOpenLevel" tabindex="6">
							<option value=""><s:text name="global.val.select" />...
							</option>
							<c:forEach var="acctType" items="${acctType}">
							  <option value="${acctType.key}">${acctType.value}</option></c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;&nbsp;<s:text
								name="global.lbl.module.type" />&nbsp;
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<select
						name="moduleType" tabindex="7">
						<option value=""><s:text name="global.val.select" />...
							</option>
						<c:forEach var="moduleType" items="${moduleType}">
							  <option value="${moduleType.key}">${moduleType.value}</option></c:forEach>	

					</select></td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.type.of.deposit" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<select
						name="typeOfDeposit" tabindex="7">
						<option value=""><s:text name="global.val.select" />...
							</option>
						<c:forEach var="typeOfDeposits" items="${typeOfDeposits}">
							  <option value="${typeOfDeposits.key}">${typeOfDeposits.value}</option>
					</c:forEach>	
                             
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.auto.generate.ac" /> #</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> 
						<input type="radio" value="true" name="autoGenAcNoYN" tabindex="9" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font>
						<input	type="radio" name="autoGenAcNoYN" value="false" tabindex="9" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						<font face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.auto.generate.sub.ac" /> #
					</font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;

						<font face="Calibri"> <input type="radio" value="true"	name="autoGenSubAcNoYN" tabindex="10" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input type="radio" name="autoGenSubAcNoYN" class="radiobutton" value="false" tabindex="10">
						<font size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>

				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.minimum.balance.cheque.book" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="minBalChqBook" tabindex="11" placeholder="0.00"
						class="smallTxtLeftAlign">
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.asset.liability" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<select
						name="assetLiability" tabindex="12" class="mediumselect">
					<option value=""><s:text name="global.val.select" />...
							</option>
						<c:forEach var="asset" items="${assetLiability}">
							  <option value="${asset.key}">${asset.value}</option></c:forEach>	
							
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.minimum.balance.non-cheque" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<input type="text" name="minBalNonChqBook" tabindex="13" placeholder="0.00"
						class="smallTxtLeftAlign" >
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.financial.non-financial" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<select
						name="finNonFin" tabindex="14" class="mediumselect">
						<option value=""><s:text name="global.val.select" />...
							</option>
							<c:forEach var="finNonFin" items="${finNonFin}">
							  <option value="${finNonFin.key}">${finNonFin.value}</option></c:forEach>	
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.conditional.asset.gl" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select size="1" name="conditionalAssetGL" tabindex="15">
							<option value=""><s:text name="global.val.select" />...</option>
							<option value="AssetGL1">AssetGL1</option>
							<option value="AssetGL2">AssetGL2</option>
					</select>
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.conditional.liability.gl" /></font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;<select
						size="1" name="conditionalLiabilityGL" tabindex="16">
							<option value=""><s:text name="global.val.select" />...</option>
							<option value="LiabilityGL1">LiabilityGL1</option>
							<option value="LiabilityGL2">LiabilityGL2</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.reconciliation.type" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select name="reconType" tabindex="17" class="mediumselect">
						<option value=""><s:text name="global.val.select" />...
							</option>
							<c:forEach var="rType" items="${reconType}">
							  <option value="${rType.key}">${rType.value}</option></c:forEach>	
					</select> &nbsp;
					</td>
					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
						face="Calibri" size="2">&nbsp;<s:text
								name="global.lbl.product.status" />&nbsp;
					</font></td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<select name="prdStatus" tabindex="18" class="mediumselect">
						<option value=""><s:text name="global.val.select" />...
							</option>
							<c:forEach var="prodStatus" items="${prodStatus}">
							  <option value="${prodStatus.key}">${prodStatus.value}</option></c:forEach>	
					</select></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.accrued" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> <input type="radio" value="true"	name="accruedYN" tabindex="19" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font>
						<input value="false" tabindex="19"	type="radio" name="accruedYN" class="radiobutton"> 
						<font	size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>



					<td width="20%" bgcolor="#CCCCFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.cash.dr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> 
						<input type="radio" value="true" name="cashDrYN" tabindex="20" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font>
						<input value="false"	type="radio" name="cashDrYN" class="radiobutton" tabindex="20"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>


					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text name="global.lbl.cash.cr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> 
						<input type="radio" value="true" name="cashCrYN" tabindex="21" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font>
						<input value="false" tabindex="21"	type="radio" name="cashCrYN" class="radiobutton"> 
						<font	size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.transfer.dr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri">
						 <input type="radio" value="true"	name="transferDrYN" tabindex="22" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font>
						<input value="false" tabindex="22"	type="radio" name="transferDrYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>



					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.transfer.cr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">


						<font face="Calibri"> <input type="radio" value="true"
							name="transferCrYN" tabindex="23" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input value="false" tabindex="23"
						type="radio" name="transferCrYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>

				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
						<font face="Calibri" size="2"><s:text
								name="global.lbl.clearing.dr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> <input type="radio" value="true"
							name="clearingDrYN" tabindex="24" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input value="false" tabindex="24"
						type="radio" name="clearingDrYN" class="radiobutton"> <font
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>

					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
						face="Calibri" size="2"><s:text
								name="global.lbl.clearing.cr" /></font>
					</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">

						<font face="Calibri"> <input type="radio" value="true"
							name="clearingCrYN" tabindex="25" checked class="radiobutton"></font>
						<font size="2"><s:text name="global.lbl.yes" /> </font><input value="false" tabindex="25"
						type="radio" name="clearingCrYN" class="radiobutton"> <font 
						size="2"><s:text name="global.lbl.no" /></font>&nbsp;
					</td>
				</tr>
			</table>

			<BR>
			<DIV
				style="border: 1px solid #0000FF; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
				<table id="TempData" width="100%" cellpadding="0" cellspacing="0" height="87">
					<thead>
						<tr height="15">
							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.category" />&nbsp;
							</font></td>
							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
								<input type="text" tabindex="26" id="idCategory" name="cateogry"
								size="15">
							</td>

							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.type" />&nbsp;
							</font></td>

							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
								type="text" tabindex="27" name="catType" id="idType">
							</td>
						</tr>
						<tr height="15">
							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.description" />&nbsp;
							</font></td>
							<td colspan="3" width="80%" bgcolor="#FFFFFF" valign="middle"
								align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
								<textarea id="idDescription" name="catDesc" tabindex="28"></textarea>
							</td>
						</tr>
						<tr height="15">
							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0"><font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.minimum.number" /></font></td>
							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;
								<input type="text" tabindex="29" name="minNumber" id="idMinNum" placeholder="0.00"
								class="mediumTxtLeftAlign">
							</td>
							<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<font
								face="Calibri" size="2">&nbsp;<s:text
										name="global.lbl.maximum.number" /></font>
							</td>
							<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
								style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;<input
								type="text" tabindex="30" name="maxNumber" id="idMaxNum" placeholder="0.00"
								class="mediumTxtLeftAlign">
							</td>

						</tr>
					</thead>
					<tbody></tbody>
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
							id="idAdd" class="button" onclick="add();" tabindex="31" > &nbsp; <input
							type="button" value=" <s:text name="global.btn.update"/> "
							id="idUpdate" tabindex="32" class="button" onclick="update();" >&nbsp; <input
							type="button" value=" <s:text name="global.btn.clear"/> "
							id="idClear" tabindex="33" class="button" onclick="clearing();" >
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

							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Category1" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Type1" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Desc1" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="MinNum1" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="MaxNum1" /></font></b></td>
							<td height="21" bgcolor="#CCCCFF" align="center"
								style="border-bottom: 1px dotted #C0C0C0"><b><font
									face="Calibri" size="2"><s:text name="Action" /></font></b></td>
						</tr>

					</table>
				</div>

			</DIV>
			<br>
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr height="25">
					<td width="20%" align="left"
						style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
					<td width="30%" align="right"
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
						<input type="submit" value=" <s:text name="global.btn.save"/> "
						class="button" tabindex="34" >
					</td>
					<td
						style="border-top: 1px solid #000080; border-bottom: 1px solid #000080; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"
						align="left" width="20%">&nbsp; <input
						value="<s:text name="global.btn.cancel"/>"
						style="font-family: Calibri; font-size: 10pt;"
						onclick="javascript:cancel();" type="reset" tabindex="35"
						class="button">
					</td>


					<td width="30%" align="left"
						style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					</td>
				</tr>
			</table>
			<input type="hidden" value="mlValue" name="mlValue">
		</form>

	</div>

<script type="text/javascript">
		new FormValidator(
				'formHome',

				[ {
					name : 'productCode',
					display : 'Product Code',
					rules : 'required'
				}, {
					name : 'productName',
					display : 'Product Name',
					rules : 'required'
				}, {
					name : 'currencyCode',
					display : 'Currency',
					rules : 'required'
				},  {
					name : 'vcrEntryLevel',
					display : 'Voucher Entry Level',
					rules : 'required'
				}, {
					name : 'vcrOpenLevel',
					display : 'Account Open Level',
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
	</script>



</body>

</html>