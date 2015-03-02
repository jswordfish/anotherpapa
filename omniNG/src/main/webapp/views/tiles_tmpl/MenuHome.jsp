<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.infrasofttech.domain.entities.MenuMst"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map.Entry"%>

<%@page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<style>

.topmenu	ul { 
 		font-family: Calibri; 
 		font-size: 14px; 
 		font: bold; 
 		padding: 0px 15px; 
		list-style: none; 
 		position: relative; 
 		display: inline-table; 
 		height: 20px; 
 		z-index:99;
 	} 
	
.topmenu	ul li { 
 		float: left; 
 		font-family: Calibri; 
 		font-size: 14px; 
 		color: #0000FF; 
 	} 
	
.topmenu	ul li:hover a { 
 		position: relative; 
 		color: #0000FF; 
 		height: 20px; 
 	} 
 	
.topmenu ul li a { 
 		display: block; padding: 1px 2px; 
 		color: #0000AF; text-decoration: none; 
 		height: 20px; 
 	} 
	
.topmenu	ul ul { 
 		background: #000000F; padding: 0; 
 		position: absolute; top: 100%; 
 		display: none; 
 		height: 20px; 
 	} 
	
.topmenu	ul ul li { 
 		float: none;  
 		border-left: 1px solid #AAAAAF; 
 		border-right: 1px solid #AAAAAF; 
 		border-bottom: 1px solid #AAAAAF; 
 		position: relative; 
/*  		background: #DDDDEF;  */
 		background: #FFFFFF;
 		height: 20px; 
 	} 
	
.topmenu	ul ul li a { 
 	   width: 16em; 
 		padding: 0px 30px; 
 		color: #FFFFFF; 
 		font: bold; 
 	} 
	
.topmenu	ul ul li a:hover { 
 		background: #0000EF; 
 		color: #FFFFFF; 
 		font: bold; 
 	} 

.topmenu	ul li:hover > ul { 
 		display: block; 
 		background: #DDDDEF; 
 	} 
	
.topmenu	ul ul ul { 
 		position: absolute; left: 100%; top:0; 
 	} 

</style>
</head>


<body>
<form id="omnimenuform">
<div class="topmenu" align="center">
<table width="100%" cellspacing="0" cellpadding="0"><tr height="20"><td bgcolor="#D1D1FF" width="100%" align="left">


<%      
	Map<String, List<MenuMst>> mapSectionWithSetOfMenuz1 = (Map<String, List<MenuMst>>)session.getAttribute("sections_menus");
	System.out.println("yyyy "+mapSectionWithSetOfMenuz1);
	
	
%>
	<%
		for(Entry<String, List<MenuMst>> entry : mapSectionWithSetOfMenuz1.entrySet()) {
		String key = entry.getKey();
		System.out.println(" key "+key);
		List<MenuMst> value = entry.getValue();
		%>
		<ul>
			<li><a href="#"><%= key %></a> 
				<!-- Display Vertical Menuz for each Section -->	
				<ul>
				<%
					for(MenuMst menu: value){
				%>
					<li><a href="<%= menu.getMenuFilePath()%>"> <%= menu.getMenuName() %></a></li>
				<%
					}
				%>
				</ul>
			</li>
		</ul>		
		<%
		}
		%>
	

		
	</td></tr></table>
</div>
</form>
</body>
</html>