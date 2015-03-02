<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script language="javascript">

function startUp(){
	document.forms["userSave"].submit();
}

</script>

</head>
<body bgcolor="#F5F5F3" topmargin="0" leftmargin="0" onload="startUp();">

	<form id="userSave" action="userList" method="post"></form>

</body>
</html>