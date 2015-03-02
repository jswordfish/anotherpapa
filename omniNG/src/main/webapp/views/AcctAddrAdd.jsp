<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PACS - Add New Account Address</title>
</head>
<body>
	<form id="frmIdAcctAddrSave" action="AcctAddrSave">
		<label>Enter Account Number</label> <input type="text"
			name="prdAcctId" /> <br> <label>Enter Address Type</label> <input
			type="text" name="addrType" /> <br> <input type="Submit"
			name="btnAcctAddrSave" value="Save" />
	</form>
</body>
</html>
