<!DOCTYPE html>
<%@page import="com.infrasofttech.omning.action.HolidaySaveAction"%>
<%@page import="com.infrasofttech.domain.entities.HolidayBranchMap"%>
<%@page import="com.infrasofttech.omning.services.HolidayMstService"%>
<%@page import="com.infrasofttech.domain.entities.HolidayMst"%>
<%@page import="com.infrasofttech.omning.utils.SpringUtil"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link rel="stylesheet" href="css1/bootstrap.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="js1/html5shiv.min.js"></script>
      <script src="js1/respond.min.js"></script>
    <![endif]-->

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css"
	rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js1/jquery.min.js"></script>
<script src="js1/bootstrap.min.js"></script>

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

<style class="cp-pen-styles">
label {
	margin-left: 20px;
}

#datepicker {
	width: 180px;
	margin: 0 20px 20px 20px;
}

#datepicker>span:hover {
	cursor: pointer;
}
</style>
<script>
	$(document).ready(function() {
		var data = [];
		
		<c:forEach  var="branches" items="${holidayBranchMaps}">
		alert("in function");
		data.push('<c:out value="${branches.branchCode}"/>');
		</c:forEach>
		for (var i = 0; i < data.length; i++) {
		
			$('#branchCode option').map(function() {
				if ($(this).val() == data[i])
					return this;
			}).attr('selected', 'selected');
		}
	});
</script>

	<script>
	function goToList(){
		document.forms["omniHolidayBranchMapForm"].action = "holidayBranchMapList.action";
		document.forms["omniHolidayBranchMapForm"].submit();
	}	
	</script>
<script>
	$(function() {
		$('#datepicker').datepicker({
			autoclose : true,
			todayHighlight : true
		}).datepicker('update', new Date());
		;
	});
</script>

<script
	src='http://codepen.io/assets/editor/live/css_live_reload_init.js'></script>


<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>

</head>

<body>
	<form id="omniHolidayBranchMapForm" method="POST"
		action="holidayBranchMapSave">
		<%	int i = 0;
			String mode = (String) request.getAttribute("mode");
			System.out.println("Product JSP mode:" + mode);
			Map<String, String> branches = new HashMap<String, String>();

			branches = (Map<String, String>) request.getAttribute("branches");
			if (branches == null) {
				branches = new HashMap<String, String>();
			}

			HolidayBranchMap holidayBranchMap = (HolidayBranchMap) request
					.getAttribute("holidayBranchMap");
		%>
		<div id="result" class="container">
			<input type="hidden" name="mode" value="<%=mode%>">
			<table class="table table-condensed">

				<tr class="active">
					<td class="col-md-1" align="left"><s:text name="global.lbl.branch" />&nbsp;<select id="branchCode" name="branchCode"
						multiple="multiple">
							<%
								for (Map.Entry<String, String> entry : branches.entrySet()) {
							%>
							<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
							<%
								}
							%>
					</select> </td>
									
					
				</tr>

				<tr class="active">

					<%
					List<HolidayMst> holidays = (List<HolidayMst>)request.getAttribute("holidays");
					%>



					<td class="col-md-1">
						<table class="table">
							<thead>
								<tr>
									<th class="col-md-1"> </th>
									<th class="col-md-1"><s:text name="global.lbl.holiday.code" /></th>
									<th class="col-md-1"><s:text name="global.lbl.holiday.date" /></th>
									<th class="col-md-1"><s:text name="global.lbl.holiday.description" /></th>
								</tr>
							</thead>

							<tbody>
								
								<tr class="active">
									<%
										
											for (HolidayMst holiday : holidays) {
									
										if (mode.equalsIgnoreCase("CREATE")) {
									%><tr class="active">
									<td class="col-md-1"><input type="checkbox" name="holidayCode"
										id="check" value="<%=holiday.getHolidayCode()%>">
										<input type="hidden" name="holidayDate" value="<%=holiday.getHolidayDate()%>"></td>

									<td><%=holiday.getHolidayCode() %></td>
									<td><%=holiday.getHolidayDate()%></td>
									<td><%=holiday.getHolidayDesc() %></td>
									</tr>
									<%
										} else {
									%><tr class="active">
									<td class="col-md-1"><input checked="checked"
										type="checkbox" name="holidayCode" id="check" value="<%=holiday.getHolidayCode()%>">
										<input type="hidden" name="holidayDate" readonly="readonly" value="<%=holiday.getHolidayDate()%>"></td>
										
									<td><%=holiday.getHolidayCode() %></td>
									<td><%=holiday.getHolidayDate()%></td>
									<td><%=holiday.getHolidayDesc() %></td>
									
									<%
										}
									%>
									<%
										}
								
									%>
									
								</tr>
															</tbody>
						</table>
					</td>
				</tr>




				<tr class="active">
					<td colspan="4" width="100%" height="25" align="center"><input
						type="submit" name="" value="<s:text name="global.btn.save" />"> <input
						type="button" name="" value="<s:text name="global.btn.back.to.list" />"
						onClick="javascript:goToList();"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
