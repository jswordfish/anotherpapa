<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<script src="../menucss/ddmenu.js" type="text/javascript"></script>

<style>
</style>
<script language="javascript">
	
	function startUp() {
	}
	
</script>
</head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<div align="center">
	<div><input type="hidden" name="vToken" value="vToken"></div>
		<form name="formHome" id="formHomeId" method="post">

		<div id="idPageTitle" class="pageTitle" style="display:block" align="left">&nbsp;<s:text name="global.lbl.lookup.value"></s:text></div>
<BR>

			<table id="idTblTxn" width="100%" height="100%" cellpadding="0"
				cellspacing="0">
				
				<tr height="1" bgcolor="#FFFFFF">
					<td colspan="5" width="100%"></td>
				</tr>
				<tr height="300">
					<td valign="top" align="left" width="100%" colspan="5">
						<table width="100%" id="idListTbl" cellspacing="1" cellpadding="0">
							<tr height="25" bgcolor="#FF9966" id="idTRTitlerow"
								valign="middle">
								<td width="10%" align="left">
									<font face="Calibri" size="2">&nbsp;&nbsp;
										<b><s:text name="global.lbl.language" /></b>
								</font>
								</td>
								<td width="15%" align="left">
									<font face="Calibri" size="2">&nbsp;&nbsp;
										<b><s:text name="global.lbl.lookup.value.code" /></b>
									</font>
								</td>
									<td width="10%" align="left">
									<font face="Calibri" size="2">&nbsp;&nbsp;
										<b><s:text name="global.lbl.lookup.display.value" /></b>
									</font>
								</td>		
								<td width="10%" align="left">
									<font face="Calibri" size="2">&nbsp;&nbsp;
										<b><s:text name="global.lbl.lookupcode.id" /></b>
									</font>
								</td>				
							</tr>

							<s:iterator value="lookupValues">
								<tr>
									<td align="left" class="trList"><s:property value="languageCode" /></td>
									<td align="left" class="trList"><s:property value="lookupValueCode" /></td>
									<td align="left" class="trList"><s:property value="lookupDisplayValue" /></td>
 									<td align="left" class="trList"><s:iterator value="lookupCode"><s:property value="id" /></s:iterator></td>
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