<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PACS - Add New Place</title>
</head>
<body>
	<form action="PlaceMstSave">
		<label>Enter Place Code</label> <input type="text" name="placeCd" /> <br>
		<label>Enter Place Name</label> <input type="text" name="placeCdDesc" />
		<br> <input type="Submit" value="Save" />
	</form>
</body>
</html>
