<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Web Calculator with Joke</title>
	<link rel="stylesheet" href="style.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
</head>
<body>
	<h2> Calculation History</h2>
	<%
        // Retrieve history from session or request (depending on your implementation)
        @SuppressWarnings("unchecked")
        List<String> history = (List<String>) session.getAttribute("history");
        if (history == null || history.isEmpty()) {
            out.println("<p>No calculations performed yet.</p>");
        } else {
            out.println("<ul>");
            for (String expression : history) {
                out.println("<li style='list-style-type: none;'>" + expression + "</li>");
            }
            out.println("</ul>");
        }
    %> 
   
    
    <a href="index.html"><i class="fa-solid fa-house"></i>  Home</a>
</body>
</html>