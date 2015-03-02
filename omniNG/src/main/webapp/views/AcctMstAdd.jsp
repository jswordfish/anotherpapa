<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PACS - Add New Account</title>
</head>
<body>
	<form id="frmIdUserTypeSave" action="AcctMstSave">
		<label>Enter Customer Code</label> <input type="text" name="custNo" />
		<br> <label>Enter Product</label> <input type="text" name="prdId" />
		<br> <label>Enter Account Number</label> <input type="text"
			name="prdAcctId" /> <br> <input type="Submit"
			name="btnAcctMstSave" value="Save" />
	</form>
</body>
</html>
