<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.infrasofttech.domain.entities.MenuMst"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/stylesheet.css" rel="stylesheet" />
	<script language="javascript">
	function startUp() {

	}
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/stylesheet.css" rel="stylesheet" />
</head>
<body>
<%
Object vToken=session.getAttribute("vToken");
System.out.println("vToken.........."+vToken);
Object branchCode=session.getAttribute("branchCode");
Object pwd=session.getAttribute("pwd");
Object salt=session.getAttribute("salt");

%>
<form>
	<input	type="hidden"  name="vToken" id="idvToken">
	<input type="hidden" name="menuCode" >
	<div align="center">
		<table border="0" width="1200" cellspacing="6" cellpadding="0"
			style="font-family: Calibri; font-size: 10pt; color: #000080; 
			border-left-color: #808080; border-top-color: #808080"
			bgcolor="#FFFFFF"><tr><td width="100%">

			<%
				Boolean flagMenuOver = true;
				List<MenuMst> menuList = (List<MenuMst>)session.getAttribute("displayMenuz");
				System.out.println("menusize in JSP::"+menuList.size());

				Set<String> sections = new HashSet<String>();
				for(MenuMst menu : menuList){
					sections.add(menu.getSectionCode());
				}
				Integer colWidth = (int)(100 / sections.size());
				
			%>
				<table width="100%">
					<tr>
			<%
					for(String sectionCode: sections){
			%>
						<td valign="top" width="<%= colWidth %>%">
							<table width="100%">
								<tr bgcolor="#AAAAFF" height="25">
									<td width="100%"><b><font face="Calibri" size="3">&nbsp;<%= sectionCode %></font></b></td>
								</tr>
							<%
								for(MenuMst menuMst : menuList){
									if(menuMst.getSectionCode().equalsIgnoreCase(sectionCode)){
							%>
										<tr bgcolor="#EEEEEE" height="25">
											<td width="100%">&nbsp;
												<a href="<%= menuMst.getMenuFilePath() %>?menuCode=<%= menuMst.getMenuCode() %>">
													<font face="Calibri" size="3"><%= menuMst.getMenuName() %></font>
												</a>
											</td>					
										</tr>
							<%			
									}
								}
							%>	
							</table>	
						</td>
			<%			
					}
			%>			
					</tr>
				</table>
				<hr>
			
		</td></tr></table>
	</div>
</form>
</body>
</html>
