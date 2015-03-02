<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<link href="css/stylesheet.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
</style>
<script language="javascript">
	function startUp() {
	}

	function addUser() {
		window.location.href = "<s:url value="userAdd"/>";
		return false;
	}
</script>
</head>
<base target="_top">
<body bgcolor="#F5F5F3" topmargin="0" onload="startUp();">
	<%-- <s:property value="li" /> --%>
	<div align="center">
		<table border="0" width="1024" align="center" cellspacing="0"
			height="100%">
			<%-- <s:iterator value="li"> --%>
			<tr>
				<td>ub LoginId: <s:property value="ub.loginId" />
				</td>
				<td>ub BranchCode:<s:property value="ub.branchCode" />

				</td>
				<td>ubar.loginId:<s:property value="ubar.loginId" /></td>
				<td>ubar.branchCode:<s:property value="ubar.branchCode" /></td>
				<%-- <td>
					<s:iterator value="ubar.roleAccessControls" >
					List1:<s:property/>
					
					</s:iterator>
					
					</td> --%>

				<s:iterator value="ubar.roleAccessControls">
					<tr>

						<td>roleCode:<s:property value="roleCode" /></td>
						<td>moduleCode:<s:property value="moduleCode" /></td>
						<td>sectionCode:<s:property value="sectionCode" /></td>
						<td>menuCode:<s:property value="menuCode" /></td>
						<td>actionCodes:<s:property value="actionCodes" /></td>


					</tr>
				</s:iterator>




			</tr>

			<%-- <s:iterator value="ubar.roleAccessControls" var="list">
						List1:
						<s:property value="list.roleCode"  />
						</s:iterator>  --%>
			<%-- 	</s:iterator>  --%>



			<%-- <logic:iterate name="roleAccessControls" id="listUserId">
							<p>
								List Users
								<s:property name="listUserId" property="roleCode" />
								<s:property name="listUserId" property="moduleCode" />
							</p>
						</logic:iterate>  --%>







		</table>
	</div>
</body>

</html>