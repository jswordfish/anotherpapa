$(document).ready(function() {

	$('#idEffFrom').change(function(e) {
		var dtVal = $('#idEffFrom').val();
		if (!ValidateDate(dtVal)) {
			$('#el').css({"display" : "inline"});
			$('#el').html("Effective From Date format should be dd-mm-yyyy");
			$('#idEffFrom').focus();
			return false;
			e.preventDefault();
		}

	});

	$('#idEffTill').change(function(e) {
		var dtVal = $('#idEffTill').val();
		if (!ValidateDate(dtVal)) {
			$('#el').css({
				"display" : "inline"
			});
			$('#el').html("Effective Till Date format should be dd-mm-yyyy");
			$('#idEffTill').focus();
			return false;
			e.preventDefault();
		}

	});

});

function ValidateDate(dtValue) {
	var dtRegex = new RegExp(/\b\d{1,2}[\/]\d{1,2}[\/]\d{4}\b/);
	return dtRegex.test(dtValue);
}


$(document).ready(

/* This is the function that will get executed after the DOM is fully loaded */
function() {
	$("#idEffFrom").datepicker({
		changeMonth : true,// this option for allowing user to select month
		changeYear : true,// this option for allowing user to select from year
		dateFormat : 'dd-mm-yy',// range
		duration : 'fast',
		yearRange : '1947:2050'
	});
	$("#idEffTill").datepicker({
		changeMonth : true,// this option for allowing user to select month
		changeYear : true,// this option for allowing user to select from year
		dateFormat : 'dd-mm-yy',// range
		duration : 'fast',
		yearRange : '1947:2050'
	});
}

);