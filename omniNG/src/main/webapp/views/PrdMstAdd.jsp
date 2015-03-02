<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PACS - Add New Product</title>
</head>
<body>
	<form id="frmIdPrdSave" action="PrdMstSave">
		<label>Enter Product Code</label> <input type="text" name="prdCode" />
		<br> <label>Enter Product Name</label> <input type="text"
			name="prdName" /> <br> <input type="Submit"
			name="btnBrMasterSave" value="Save" />
	</form>
</body>
</html>
