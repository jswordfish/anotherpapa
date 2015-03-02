<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PACS - Add New Customer Business</title>
</head>
<body>
	<form id="frmIdCustBusiSave" action="CustBusiSave">
		<label>Enter Customer Code</label> <input type="text" name="custCode" />
		<br> <label>Enter Business Name</label> <input type="text"
			name="businessName" /> <br> <input type="Submit"
			name="btnBrMasterSave" value="Save" />
	</form>
</body>
</html>
