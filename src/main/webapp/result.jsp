<%@ page language="java" contentType="text/html; charset=UTF-16"
    pageEncoding="UTF-16"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-16">
	<title>Web Calculator with Joke</title>
	<link rel="stylesheet" href="style.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
</head>
<body>
	<img alt="" src="images\laugh.gif" class="img2">
	<h2>Joke of the Day!</h2>
	<h5>🤣<%=request.getAttribute("value2")%> </h5>
	
	<form action="HomeServlet" method="post" onsubmit="validateInput(event)">
		
			<input name="num1" id="operand1" type="text" placeholder="Enter first number" />
			<input name="num2" id="operand2" type="text" placeholder="Enter second number" />
			
			<select name="operator">
	            <option value="+">+</option>
	            <option value="-">-</option>
	            <option value="*">*</option>
	            <option value="/">/</option>
        	</select><br>
        	<button type="submit">Calculate</button>
        	<button type="reset">Reset</button> <br>
        	<span id="errorMessage" style="color: red; display: none;">Please enter numbers.</span>
	</form> 
	
	<h2>Answer is <%=request.getAttribute("value1")%></h2>

	<a href="index.html"><i class="fa-solid fa-house"></i>  Home</a>
	<a href="history.jsp"><i class="fa-solid fa-clock-rotate-left"></i> History</a>
	
	
	<script src="script.js"></script>
</body>
</html>