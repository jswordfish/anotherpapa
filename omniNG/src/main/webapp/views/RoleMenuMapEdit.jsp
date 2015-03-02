<%@ page import="java.util.*"%>
<%@ page import="com.infrasofttech.dto.MenuMst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link href="css/stylesheet.css" rel="stylesheet" /> -->
<!-- for text-fields and labels -->
<script src="/js/validate.js" type="text/javascript"></script>
<!-- for front end validation -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

<!-- All internal validations -->


<script language="javascript">

	function getMLValues(tableid) {
		var tableValues = new Array();

		var tbl = document.getElementById(tableid);
		for (var i = 1; i < tbl.rows.length; i++) {
			//alert("123::" + tbl.rows[i]);

			var rowValues = getRowValues(tbl.rows[i]);
			alert("rowValues--" + rowValues);
			tableValues[tableValues.length] = rowValues;
			alert("in side tableValues--" + tableValues);
		}
		return tableValues;
	}
	var cnt = 1;

	function getRowValues(row) {
		var rowValues = new Array();
		var fld = "";
		//alert("Nested rd-table-tr-td");
		
		var authorizeAction = document.getElementById("authorizeAction" + cnt);
		var createAction = document.getElementById("createAction" + cnt);
		var updateAction = document.getElementById("updateAction" + cnt);
		var deleteAction = document.getElementById("deleteAction" + cnt);
		var searchAction = document.getElementById("searchAction" + cnt);
		var disableAction = document.getElementById("disableAction" + cnt);
		var downloadAction = document.getElementById("downloadAction" + cnt);
		var emailAction = document.getElementById("emailAction" + cnt);
		var enableAction = document.getElementById("enableAction" + cnt);
		var printAction = document.getElementById("printAction" + cnt);
		var rejectAction = document.getElementById("rejectAction" + cnt);
		var viewAction = document.getElementById("viewAction" + cnt);
		var smsAction = document.getElementById("smsAction" + cnt);
		var menuCode = document.getElementById("menuCode" + cnt).value;
		var id = document.getElementById("idMenuMst"+cnt).value;
		
		fld = menuCode;
		rowValues[rowValues.length] = fld;
		
		if (authorizeAction.disabled == false) {
			if (authorizeAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}

		if (createAction.disabled == false) {
			if (createAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}

		if (updateAction.disabled == false) {
			if (updateAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}

		if (deleteAction.disabled == false) {
			if (deleteAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}
		if (searchAction.disabled == false) {
			if (searchAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}
		if (disableAction.disabled == false) {
			if (disableAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}
		if (downloadAction.disabled == false) {
			if (downloadAction.checked) {
				fld = true;
			}

			else {
				fld = false;
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}
		if (emailAction.disabled == false) {
			if (emailAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}
		if (enableAction.disabled == false) {
			if (enableAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}
		if (printAction.disabled == false) {
			if (printAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}
		if (rejectAction.disabled == false) {
			if (rejectAction.checked) {
				fld = true;
				//alert("fld  rejectAction true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}

		if (viewAction.disabled == false) {
			if (viewAction.checked) {
				fld = true;
				//	alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}
		if (smsAction.disabled == false) {

			if (smsAction.checked) {
				fld = true;
				//alert("fld true>>>>"+fld);
			} else {
				fld = false;
				//	alert("fld false>>"+fld);
			}

			rowValues[rowValues.length] = fld;
		} else {
			fld = false;
			rowValues[rowValues.length] = fld;
		}
		fld = id;
		rowValues[rowValues.length] = fld; 
		//alert("DONE!!!!!");
		cnt++;
		return rowValues;
	}

	function getMultiArrayStringMargin(multiValues) {
		//alert('in multiarraystring');
		//alert("multiValues.length....>>>>>" + multiValues.length);
		var str = '';
		for (var i = 0; i < multiValues.length; i++) {

			var rowVal = multiValues[i];
			//alert("rowVal" + rowVal);
			//alert("rowVal.length>>>>>" + rowVal.length);
			for (var j = 0; j < rowVal.length; j++) {
				//alert("rowVal[j]).."+(rowVal[j].split("~")));
				var sely=rowVal[j];
				//var sely = (rowVal[j]).split(",");

				str = str + sely + '~';
				//alert(str);
			}
			str = str + '!';
		}
		//alert("getMultiArrayStringMargin..." + str);
		return str;
	}
	
	function addTable1() {
		var tableid = "idRoleMenuMap";
		//alert("value of tableid" + tableid);
		var tbl = document.getElementById(tableid);
		//alert("value of tbl" + tbl);
		var tableValues = getMLValues(tableid);

		//alert("tableValues..." + tableValues);
		var MlVal = getMultiArrayStringMargin(tableValues);
		//alert("MlVal....." + MlVal);
		document.getElementById("mlValue").value = MlVal;
	}
</script>

<script type="text/javascript">
function checkAll(ele) {

	 var check = document.getElementById("idCheckAll"+ele);
	 
	 //alert("select all id : "+check);
	 //alert("ele=====: "+ele);
	 if(check.checked==true) {
		 
		 //alert("inside if");
		 document.getElementById("authorizeAction"+ele).checked=true;		 
		 document.getElementById("createAction"+ele).checked=true;
		 document.getElementById("updateAction"+ele).checked=true;		 
		 document.getElementById("deleteAction"+ele).checked=true;
		 document.getElementById("searchAction"+ele).checked=true;		 
		 document.getElementById("disableAction"+ele).checked=true;
		 document.getElementById("downloadAction"+ele).checked=true;		 
		 document.getElementById("emailAction"+ele).checked=true;
		 document.getElementById("enableAction"+ele).checked=true;		 
		 document.getElementById("printAction"+ele).checked=true;
		 document.getElementById("rejectAction"+ele).checked=true;
		 document.getElementById("viewAction"+ele).checked=true;		 
		 document.getElementById("smsAction"+ele).checked=true;
		 
	 }
	 else{
		 //alert("inside else")
    	 document.getElementById("authorizeAction"+ele).checked=false;		 
		 document.getElementById("createAction"+ele).checked=false;
		 document.getElementById("updateAction"+ele).checked=false;		 
		 document.getElementById("deleteAction"+ele).checked=false;
		 document.getElementById("searchAction"+ele).checked=false;		 
		 document.getElementById("disableAction"+ele).checked=false;
		 document.getElementById("downloadAction"+ele).checked=false;		 
		 document.getElementById("emailAction"+ele).checked=false;
		 document.getElementById("enableAction"+ele).checked=false;		 
		 document.getElementById("printAction"+ele).checked=false;
		 document.getElementById("rejectAction"+ele).checked=false;
		 document.getElementById("viewAction"+ele).checked=false;		 
		 document.getElementById("smsAction"+ele).checked=false;
	 }
	 
}</script>

</head>

<body>
	<form id="omniform" method="POST" action="RoleMenuMapAddUpdateAction"
		name="nmRoleMenuMap">
		<input type="hidden" name="mlValue" id="mlValue">
		<div>
			<input type="hidden" name="vToken">
		</div>
		<div id="idPageTitle" class="pageTitle" style="display: block">
			&nbsp;
			<s:text name="global.pageTitle.role.menu.map"></s:text>
		</div>
		<div id="idErrMsg" class="errorDiv" style="display: none">
			<s:text name="errMsg"></s:text>
		</div>
		<div id="idErrTbl" class="errorDiv" style="display: none">
			<p id="el"></p>
		</div>
		<div>
			<input type="hidden" name="roleCode"
				value="<%=request.getAttribute("roleCode")%>"> <input
				type="hidden" name="roleName"
				value="<%=request.getAttribute("roleName")%>">
		</div>

		<div>
			<table id="idRoleMenuMap" width="1200" border="0" cellpadding="0"
				cellspacing="1">
				<tr bgcolor="#AAAAFF" height="20">
					<td width="30%" align="center"><font face="Calibri" size="2"><b>Menu
								Name</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>ALL</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Auth</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Add</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Edit</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Search</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Delete</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Disable</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Download</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Email</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Enable</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Print</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>View</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>Reject</b></font></td>
					<td width="5%" align="center"><font face="Calibri" size="2"><b>SMS</b></font></td>
					<!-- <td width="5%" align="center" ><font face="Calibri" size="2"><b>MenuCode</b></font></td> -->
				</tr>
				<s:bean name="com.infrasofttech.services.MenuMstNameComparator"
					var="menuMstNameComparator" />
				<s:sort comparator="#menuMstNameComparator" source="editSet">
				<% int cnt=1; %>
					<s:iterator status="status">
						<tr height="20" id="iRow">
							<td align="left" width="30%"
								style="border-bottom: 1px dotted #CCCCCC"><font
								face="Calibri" size="2">&nbsp;<s:property
										value="menuName" /></font></td>
							<td align="center" width="5%"
								style="border-bottom: 1px dotted #CCCCCC">
								
								<input
								type="checkbox" id="idCheckAll<%=cnt%>" name="nmSelectAllChBx"
								onclick="checkAll(<%=cnt%>)" /></td>
					
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table
										id="idAuthTbl">
										<tr>
											<td><s:checkbox name="authorizeAction"
													id="authorizeAction%{#status.count}" /></td>
										</tr>
									</table></td>

							
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table
										id="idCreateTbl">
										<tr>
											<td><s:checkbox name="createAction"
													id="createAction%{#status.count}" /></td>
										</tr>
									</table></td>

								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table
										id="idUpdateTbl">
										<tr>
											<td><s:checkbox id="updateAction%{#status.count}"
													name="updateAction" /></td>
										</tr>
									</table></td>
							
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="deleteAction%{#status.count}"
													name="deleteAction" /></td>
										</tr>
									</table></td>
							
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="searchAction%{#status.count}"
													name="searchAction" /></td>
										</tr>
									</table></td>
							
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="disableAction%{#status.count}"
													name="disableAction" /></td>
										</tr>
									</table></td>
							
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="downloadAction%{#status.count}"
													name="downloadAction" /></td>
										</tr>
									</table></td>
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="emailAction%{#status.count}"
													name="emailAction" /></td>
										</tr>
									</table></td>
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="enableAction%{#status.count}"
													name="enableAction" /></td>
										</tr>
									</table></td>
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="printAction%{#status.count}"
													name="printAction" /></td>
										</tr>
									</table></td>
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="rejectAction%{#status.count}"
													name="rejectAction" /></td>
										</tr>
									</table></td>
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="viewAction%{#status.count}"
													name="viewAction" /></td>
										</tr>
									</table></td>
								<td align="center" style="border-bottom: 1px dotted #CCCCCC"><table>
										<tr>
											<td><s:checkbox id="smsAction%{#status.count}"
													name="smsAction" /></td>
										</tr>
									</table></td>
							
							<td><s:hidden id="idMenuCode%{#status.count}" name="menuCode" /></td>
							<td><s:hidden id="idMenuMst%{#status.count}" name="id" /></td>
						</tr>
						<% cnt++;%>
					</s:iterator>
				</s:sort>
			</table>
		</div>
		<table width="100%" cellpadding="0" cellspacing="0">
			<tr height="25">
				<td width="20%" align="left"
					style="border-left: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
				</td>
				<td width="30%" align="right"
					style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					<input type="submit" tabindex="28" class="button" name="save "
					onclick="addTable1()" value="<s:text name="global.btn.save"/>">
				</td>
				<td width="20%" align="left"
					style="border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
					<input type="button" class="button" tabcount="29"
					value="<s:text name="global.btn.cancel"/>"
					onclick="javascript:cancel();">
				</td>
				<td width="30%" align="left"
					style="border-right: 1px solid #000080; border-top: 1px solid #000080; border-bottom: 1px solid #000080;; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;
				</td>
			</tr>
		</table>
	</form>
<!-- if(checkboxes[i].disabled==false){            		
					 checkboxes[i].checked = true;} -->
		 		

</body>
</html>