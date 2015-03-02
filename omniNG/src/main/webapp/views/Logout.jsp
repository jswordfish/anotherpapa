<%@page import="com.infrasofttech.domain.entities.LanguageMst"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/stylesheet.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="validate.js"></script>


</head>

<body bgcolor="#F5F5F3" topmargin="0" leftmargin="0" onLoad="javascript:startUp();">
<form name="frmLogout" id="omniform" method="POST" >
<%
	String errMsg = (String)request.getAttribute("errMsg");
	if(null==errMsg) {errMsg="";}
%>
	<br>
	<div id="errors"></div>
	<div align="center">
		<font face="Calibri" size="3" color="#FF0000"><b>
			<span id="simulationInfos"><%= errMsg %></span>
		</b></font>
	</div>
	<h2>You are successfully logout!! </h2>
	<br>
	<%-- <h2>To login again 
	<s:url id="logoutURL" action="LoginPage">
		<s:param name="tid" value="\0\01">001</s:param>
 	</s:url> 
	<s:a href="%{logoutURL}">Click Here</s:a> 
											 </h2> --%>
</form>
</body>
</html>
