<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PACS - Add New Lookup Directory</title>
</head>
<body>
	<form action="LookupDirSave">
		<label>Enter Lookup Dir Code</label> <input type="text"
			name="lookupDirCode" /> <br> <label>Enter Lookup Dir
			Desc</label> <input type="text" name="lookupDirDesc" /> <br> <input
			type="Submit" value="Save" />
	</form>
</body>
</html>
