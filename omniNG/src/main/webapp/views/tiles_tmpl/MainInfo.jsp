<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body topmargin="0" leftmargin="0">

	<font face="Calibri" size="3" color="#FFFFFF">&nbsp;Welcome <b><%= request.getSession().getAttribute("loginId") %></b>,</font>
	<font face="Calibri" size="3" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Branch: <b><%= request.getSession().getAttribute("branchCode") %></b></font>&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;<font face="Calibri" size="3"
		color="#FFFFFF"><b>|</b></font>&nbsp;&nbsp;&nbsp;
	<a href="<s:url action="HomePage"/>"> <font face="Calibri" size="3"
		color="#FFFFFF"><s:text name="global.lbl.home" /></font>
	</a>&nbsp;&nbsp;<font face="Calibri" size="3"
		color="#FFFFFF"><b>|</b></font>&nbsp;&nbsp;	
	<a href="<s:url action="changePassword"/>"> <font face="Calibri"
		size="3" color="#FFFFFF"><s:text name="global.menu.change.password" />
	</font>
	</a>&nbsp;&nbsp;
	<font face="Calibri" size="3"
		color="#FFFFFF"><b>|</b></font>&nbsp;&nbsp;
	<a href="<s:url action="LogoutPage"/>"> <font face="Calibri"
		size="3" color="#FFFFFF"><s:text name="global.lbl.logout" />
		</font>
	</a>
</body>
</html>