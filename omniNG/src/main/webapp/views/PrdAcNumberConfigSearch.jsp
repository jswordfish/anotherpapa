<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<style>
</style>
<link href="css/stylesheet.css" rel="stylesheet" />
<script language="javascript">
	function addPrdAcNoConfig() {
		window.location.href = "<s:url value="PrdAcNumberAdd"/>";
	}
	function edit(){
	/* 	alert("1");
		alert("ID: " + document.getElementById("id").value); */
		document.forms["formHomeId"].submit();
	}
	function disable(){
		/* alert("2");
		alert("ID: " + document.getElementById("id").value); */
		document.forms["formHomeId"].submit();
	}
	function search(){
		/* alert("2");
		alert("ID: " + document.getElementById("id").value); */
		/* var searchBy=document.getElementById("");
		
		window.location.href = "<s:url value=""/>"; */
		document.forms["formHomeId"].submit();
	}
	function startUp() {

	}
</script>
</head>
<base target="_top">
<body bgcolor="#F5F5F5" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="formHome" id="formHomeId">
         <div><input type="hidden" name="vToken"></div>
	
			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td colspan="1" width="20%"><font face="Calibri" size="2"
						color="#CC0000"> &nbsp;&nbsp;&nbsp;</font><font face="Calibri"
						color="#CC0000"><s:text
								name="global.lbl.PrdAcNoConfig" /></font></td>
					<td width="60%" bgcolor="#FFFFFF">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#CC0000">&nbsp;&nbsp;</font></td>
				
				</tr>
			</table>
			<table id="idTblTxn" width="100%" height="100%" cellpadding="0"
				cellspacing="0">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="5" width="100%" bgcolor="#FFFFFF"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFff">
					<td width="20%">
						<p align="left">
							<font face="Calibri" size="2">&nbsp; <input type="button"
								name="add" class="bigbtn"
								value="<s:text name="global.btn.add.PrdAcNumberConfig"/>"
								onclick="javascript:addPrdAcNoConfig();"></font> <font
								face="Calibri" size="2">&nbsp;</font>
					</td>
					<td width="50%"><font face="Calibri" size="2"> <select
							size="1" name="seachType" id="idSearch">
								<option><s:text name="global.val.search.by" />...
								</option>
								<option value="<s:text name="global.val.product" />"><s:text name="global.val.product" /></option>
								<option value="<s:text name="global.val.separator" />"><s:text name="global.val.separator" /></option>
								<option value="<s:text name="global.val.fromdate" />"><s:text name="global.val.fromdate" /></option>
								<option value="<s:text name="global.val.todate" />"><s:text name="global.val.todate" /></option>
								<option value="<s:text name="global.val.disabled" />"><s:text name="global.val.disabled" /></option>
						</select>
						 <input type="text" name="T1" size="30"> 
						<s:url id="searchURL" action="PrdAcNoConfigSearch">
						<s:param name="searchType" value="%{searchType}"></s:param>	</s:url>
						 <s:a href="%{searchURL}" >GO</s:a> &nbsp;&nbsp; <a href="" onclick="javasript:search();"> </a>
						
						</font></td>
				
				<td></td>
				</tr>
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="5" width="100%"></td>
				</tr>
				<tr height="300">
					<td valign="top" align="left" width="100%" colspan="5">
						<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0" border="0" bordercolor="lightgray">
							<tr height="25" bgcolor="#FF9966" id="idTRTitlerow"
								valign="middle" >
								<td width="0%" align="left"></td>
								<td width="20%" align="left"><b><font face="Calibri"
										size="2">&nbsp;&nbsp;<s:text name="global.lbl.product" /></font></b></td>
								<td width="10%" align="left"><font face="Calibri" size="2"><b>&nbsp;&nbsp;</b></font><b><font
										face="Calibri" size="2"><s:text
												name="global.lbl.separator" /></font></b></td>
								<td width="10%" align="left"><font face="Calibri" size="2"><b>&nbsp;&nbsp;<s:text
												name="global.lbl.total.ac.length" /></b></font>
								<td width="10%" align="left"><b><font face="Calibri"
										size="2">&nbsp;<s:text
												name="global.lbl.toal.sac.length" /></font></b></td>
								<td width="15%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;<s:text
												name="global.lbl.effectivedate" /></b></font>
								<td width="15%" align="center"><font face="Calibri"
									size="2"><b>&nbsp;<s:text
												name="global.lbl.effective.tilldate" /></b></font></td>
								<td width="20%" align="center"><font face="Calibri"
									size="2"><b><s:text name="global.lbl.action" /></b></font></td>
							</tr>


							<s:iterator value="prdAcNoConfig">
								<tr height="25" id="idTRDatarow" valign="middle">
									<td width="0%" align="left"></td>
									<s:hidden value="id" />
									
								
									<td width="20%" align="left" class="trList"><font face="Calibri"
											size="2">&nbsp;&nbsp;
										<s:iterator value="products">	<s:property value="productName" /><span>(</span><s:property value="productCode" /><span>)</span></s:iterator>	
								</font>
											
											</td>
									<td width="10%" align="center" class="trList"><font face="Calibri"
											size="2">&nbsp;&nbsp;<s:property value="sepr" /></font></td>
									<td width="10%" align="center" class="trList"><font face="Calibri"
											size="2">&nbsp;&nbsp;<s:property
													value="totalAccountLen" /></font></td>

									<td width="10%" align="center" class="trList"><font face="Calibri"
											size="2">&nbsp;&nbsp;<s:property
													value="totalSubAccountLen" /></font></td>
									<td width="15%" align="center" class="trList"><font face="Calibri"
											size="2">&nbsp;&nbsp;<s:property value="EffFromDate" /></font></td>
									<td width="15%" align="center" class="trList"><font face="Calibri"
											size="2">&nbsp;&nbsp;<s:property value="EffTillDate" /></font></td>
							    	<td class="trList" width="20%" align="center" ><s:url id="editURL" action="PrdAcNoConfigEdit">
											<s:param name="id" value="%{id}"></s:param>
										</s:url> <s:a href="%{editURL}">Edit</s:a> &nbsp;&nbsp; 
										<a href="" onclick="javasript:edit();"></a> 
										<s:url id="enableURL" action="PrdAcNoConfigEnable">
										<s:param name="id" value="%{id}"></s:param>
										</s:url> <s:a href="%{enableURL}">Enable</s:a> &nbsp;&nbsp; 
										<a href="" onclick="javasript:disable();"> </a></td>
									<%-- <td class="trList"><a href="PrdAcNoConfigEdit?id=<s:property value="id"/>">EDIT</a>&nbsp;&nbsp;<a href="PrdAcNoConfigDisable?id=<s:property value="id"/>">DISABLE</a> --%>
									
								</tr>
							</s:iterator>
						</table>

					</td>
				</tr>
			</table>


		</form>


	</div>

</body>


</html>