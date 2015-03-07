<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title><tiles:getAsString name="title" ignore="true" /></title>
<style type="text/css">
a {
	color: #258;
	text-decoration: none
}
</style>
</head>

<body bgcolor="#F3F3F3" topmargin="5" leftmargin="0">
	<div align="center">
		<table width="1200" cellspacing="1" border="0">
			<tr id="idHeaderRow" height="30" bgcolor="#FFFFFF" valign="middle">
				<td bgcolor="#FFFFFF"
					style="border-left: 1px solid #808080; border-right: 1px solid #808080;
							 border-top: 1px solid #808080	">
					<tiles:insertAttribute name="header" ignore="false" />
				</td>
			</tr>
			<tr id="idMainMenuRow" height="5" bgcolor="#FFFFFF" valign="middle">
				<td width="100%" align="left"
					style="border-left: 1px solid #808080; border-right: 1px solid #808080">
					<tiles:insertAttribute name="mainmenu" ignore="false" />
				</td>
			</tr>
			<tr id="idMenuRow" height="35" bgcolor="#0000AA" valign="middle">
				<td  width="90%" align="left"
					style="border-left: 1px solid #808080; border-right: 1px solid #808080">
					<tiles:insertAttribute name="maininfo" ignore="false" />
				</td>
			</tr>
			<tr id="idBodyRow" height="700" width="500" valign="top">
				<td bgcolor="#FFFFFF"
					style="border-left: 1px solid #808080; border-right: 1px solid #808080">
					<tiles:insertAttribute name="body" ignore="false" />
				</td>
			</tr>
			<tr id="idAuditInfoRow" height="40" bgcolor="#E5E5E5" valign="middle">
				<td 
					style="border-left: 1px solid #808080; border-right: 1px solid #808080">
					<tiles:insertAttribute name="auditInfo" ignore="false" />
				</td>
			</tr>
			<tr id="idFooterRow" height="10" bgcolor="#FFFFFF" valign="middle">
				<td 
					style="border-left: 1px solid #808080; border-right: 1px solid #808080; 
						border-top: 1px solid #808080; border-bottom: 1px solid #808080" >
					<tiles:insertAttribute name="footer" ignore="false" />
				</td>
			</tr>
		</table>
	</div>
</body>

</html>

