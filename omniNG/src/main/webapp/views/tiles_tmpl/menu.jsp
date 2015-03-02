<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

<script>
	function startUp(){
		document.forms["idMenuFrm"].submit();
	}
</script>
</head>
<body topmargin="0" leftmargin="0" onload="startUp();">

	<form id="'idMenuFrm" action="MenuHome">
	
	</form>	
</body>
</html>