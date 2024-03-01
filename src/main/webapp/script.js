
function validateInput(event) {
	var input1 = document.getElementById("operand1");
	var input2 = document.getElementById("operand2");
	var errorMessage = document.getElementById("errorMessage");
	var value1 = input1.value.trim();
	var value2 = input2.value.trim();
	// Check if the input is a number or not
	if (!isNaN(value1) && value1 !== "" && !isNaN(value2) && value2 !== "") {
		// If input are valid, proceed with calculation
		errorMessage.style.display = "none"; // Hide error message
		// Perform calculation here
	} else {
		// If input are not a number, display error message
		errorMessage.style.display = "block"; // Show error message
		// Prevent the default behavior (form submission)
		event.preventDefault();
	}
}