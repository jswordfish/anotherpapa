<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<link href="/css/stylesheet.css" rel="stylesheet" />

<script language="javascript">
	function startUp() {
		//alert("startUp is calling");
		
	
	}

	function toggleTable() {
		//alert("basic is loading");
		window.location.href = "<s:url value="CustomerInformation"/>";
	}
	
	function toggleTable1()
	{
	     var elem=document.getElementById("idTBLookuplist");
	     
	     var hide = elem.style.display =="none";
	     if (hide) {
	         elem.style.display="table";
	    } 
	    else {
	       elem.style.display="none";
	    }
	}
</script>

</head>

<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">


		<form name="frmMarkasInoperative" id="idfrmMarkasInoperative"
			method="POST" action="MarkasInoperative">

			<table id="idTblTitle" width="100%" height="26" cellpadding="0"
				cellspacing="1">
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="3" width="100%"></td>
				</tr>
				<tr height="25" bgcolor="#FFFFFF">
					<td width="40%"><font face="Calibri" size="2" color="#CC0000">
							&nbsp;&nbsp;&nbsp;</font><font face="Calibri" color="#CC0000">
							Inoperative Customer Maintenance | CREATE </font></td>
					<td width="40%" bgcolor="#FFFF99">&nbsp;<font
						face="Wingdings 2" size="2" color="#000000"> </font><font
						face="Calibri" size="2" color="#000000">SUCCESS or FAILURE
							message with green or red background</font><font face="Calibri" size="2"
						color="#CC0000">&nbsp;&nbsp;</font></td>
					<td width="20%" bgcolor="#FFFFFF">
						<p align="center">
							<b><font size="2" face="Calibri">&nbsp;Branch Code: 02</font></b>
					</td>
				</tr>

			</table>
			<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0">

				<tr>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="20%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.customer.number" /></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
						<input type="text" name="T20" size="10" class="largeTxtLeftAlign"
						required> &nbsp; <img alt="Search"
						src="media/icons/search.png" width="16" height="16">&nbsp; <input
						type="text" name="T20" size="10" class="largeTxtLeftAlign"
						required>
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#CCCCFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">
						&nbsp;<font face="Calibri" size="2"><s:text
								name="global.lbl.as.on.date" /></font>
					</td>
					<td colspan="3" width="30%" bgcolor="#FFFFFF" valign="middle"
						align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;&nbsp;
						<input type="text" name="T20" size="10" class="largeTxtLeftAlign"
						required> &nbsp; <input type="submit"
						value="<s:text name="global.ref.view"/>" class="button">
					</td>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="20%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>



				<tr height="25" bgcolor="#FF9966" id="idTRTitlerow" valign="middle">
					<td width="20%" bgcolor="#CCCCFF align="left"><b><font
							face="Calibri" size="2">&nbsp;&nbsp;<s:text
									name="global.lbl.sr.no" /></font></b></td>
					<td width="20%" bgcolor="#CCCCFF align="left"><font
						face="Calibri" size="2"><b>&nbsp;&nbsp;</b></font><b><font
							face="Calibri" size="2"><s:text name="global.lbl.branch" /></font></b></td>
					<td width="20%" bgcolor="#CCCCFF align="left"><font
						face="Calibri" size="2"><b>&nbsp;&nbsp;<s:text
									name="global.lbl.account" />
						</b></font>
					<td width="20%" bgcolor="#CCCCFF align="center"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.account.name" /></b></font>
					<td width="20%" bgcolor="#CCCCFF align="center"><font
						face="Calibri" size="2"><b>&nbsp;<s:text
									name="global.lbl.closed.y.n" /></b></font></td>

				</tr>

				<tr height="1" bgcolor="#FFFFFF">
				</tr>



				<tr>
					<td width="20%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="middle" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="20%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
					<td width="30%" bgcolor="#FFFFFF" valign="top" align="left"
						style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #C0C0C0">&nbsp;</td>
				</tr>

			</table>
			<table>
				<tr>


					<td width="100%" align="center">&nbsp; <input type="submit"
						value="<s:text name="global.btn.create"/>" class="button">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
						value="<s:text name="global.btn.cancel"/>" class="button">
					</td>
				</tr>
			</table>

		</form>
	</div>
</body>
</html>