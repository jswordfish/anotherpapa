<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to PACS</title>
<script language="javascript">

function startUp(){
	document.forms["pacsInit"].submit();
}

</script>
</head>

<body bgcolor="#F5F5F3" topmargin="0" leftmargin="0" onload="startUp();">

	<form id="pacsInit" action="LoginPage">
		<input type="hidden" name="tid" value="<%= request.getParameter("tid") %>" >
	</form>

</body>

</html>
