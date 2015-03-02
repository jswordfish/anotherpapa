<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PACS - Add New Customer Business Details</title>
</head>
<body>
	<form id="frmIdCustBusiDtlsSave" action="CustBusiDtlsSave">
		<label>Enter Customer Code</label> <input type="text" name="custCode" />
		<br> <label>Enter Employee Code</label> <input type="text"
			name="empCode" /> <br> <input type="Submit"
			name="btnCustBusiDtlsSave" value="Save" />
	</form>
</body>
</html>
