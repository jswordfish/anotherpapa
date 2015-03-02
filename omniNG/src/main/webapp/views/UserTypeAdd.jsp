<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PACS - Add New User Type</title>
</head>
<body>
	<form id="frmIdUserTypeSave" action="UserTypeSave">
		<label>Enter User Type Code</label> <input type="text"
			name="userTypeCode" /> <br> <label>Enter User Type
			Description</label> <input type="text" name="userTypeDesc" /> <br> <input
			type="Submit" name="btnUserTypeSave" value="Save" />
	</form>
</body>
</html>
