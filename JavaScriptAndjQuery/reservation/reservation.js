/* user id: welchm            Becca Jaeger
assignment number:10
date:03.29.19 */
"use strict";
$(document).ready(function () {
	$('#arrival_date').focus();//set focus
	var emailPattern = /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/;
	$("form").submit(function (event) {
		var val = validate();//reading return flag off function
		if (val === false) {//if bad data
			event.preventDefault();//don't send form through
		}
		$("#arrival_date").focus();
	});
}); // end ready

function validate() { //function to validate data entries
	$("span").text("");   // clear any previous error messages
	var isValid = true;
	var emailPattern = /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/;
	var arrival = $('#arrival_date').val();
	var nights = $('#nights').val();
	var name = $("#name").val();
	var email = $("#email").val();
	var phone = $("#phone").val();

	if (arrival === "") {
		$('#arrival_date').next().text('Please enter a valid arrival date.');
		isValid = false;
	}
	if (nights === "" || isNaN(nights)) {
		$('#nights').next().text('Please enter a valid number of nights.');
		isValid = false;
	}
	if (name === "") {
		$('#name').next().text('Please enter your name.');
		isValid = false;
	}
	if (email === "" ||
		!email.match(emailPattern)) {
		$("#email").next().text("Please enter a valid email.");
		isValid = false;
	}
	if (phone === "") {
		$('#phone').next().text('Please enter a valid phone number.');
		isValid = false;
	}
	if (isValid === false) {
		return false;
	}
};