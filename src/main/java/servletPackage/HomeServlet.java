package servletPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;


public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String[] jokes = { "Why do Java developers wear glasses? Because they don't C#!",
			"I told my computer I needed a break, and now it won't stop sending me Kit Kat bars.",
			"Why don't programmers like nature? It has too many bugs.",
			"How many programmers does it take to change a light bulb? None, it's a hardware problem.",
			"How many developers does it take to screw in a lightbulb?None. They just fix the darkness.",
			"My code has no bugs. It just has unexpected features.",
			"Why did the two Java methods get a divorce?Because they couldn't find their class.",
			"Why did the developer go broke?Because he used up all his cache.",
			"Why did the object-oriented programmer get fired?Because he couldn't meet deadlines.",
			"What's the best part about a semicolon?All the controversy ends with a point."
	};



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String str1 = request.getParameter("num1");
		String str2 = request.getParameter("num2");
		String operator = request.getParameter("operator");

		// Validate and parse input
		double firstNumber = Double.parseDouble(str1);
		double secondNumber = Double.parseDouble(str2);

		// Perform calculation based on operator
		double result = calculate(firstNumber, secondNumber, operator);
		
		
		// Format result with two decimal places
        DecimalFormat df = new DecimalFormat("0.00");
        String formattedResult = df.format(result);
		
		// Store the calculation in history
		HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
		List<String> history = (List<String>) session.getAttribute("history");
        if (history == null) {
            history = new ArrayList<>();
            session.setAttribute("history", history);
        }
        String expression = firstNumber + " " + operator + " " + secondNumber + " = " + formattedResult;
        history.add(expression);
        
        System.out.println(history.size());
		int randomIndex = (int) (Math.random() * jokes.length);
		String randomJoke = jokes[randomIndex];
        
//		response.sendRedirect("result.jsp?ans=" + result + "&joke=" + randomJoke);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/result.jsp");
		request.setAttribute("value1", formattedResult);
		request.setAttribute("value2", randomJoke);
		dispatcher.forward(request, response);
	}

	private double calculate(double firstNumber, double secondNumber, String operator) {
		switch (operator) {
		case "+":
			return firstNumber + secondNumber;
		case "-":
			return firstNumber - secondNumber;
		case "*":
			return firstNumber * secondNumber;
		case "/":
			if (secondNumber == 0) {
				throw new IllegalArgumentException("Division by zero is not allowed.");
			}
			return firstNumber / secondNumber;
		default:
			throw new IllegalArgumentException("Invalid operator: " + operator);
		}
	}
	
}
