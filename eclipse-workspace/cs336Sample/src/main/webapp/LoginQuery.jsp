<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Signing In</title>
	</head>
	<body>
		<%
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Storing username and password as strings for query
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			//Making query to check if username and password is in database
			String querystring = "SELECT * FROM Customers WHERE Username= '" + username + "' AND Password='" + password +"'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(querystring);
			
			if (result.next()) {
				session.setAttribute("user", username); // the username will be stored in the session
				out.println("Welcome " + username);
				out.println("<a href='logout.jsp'>Log out</a>");
				response.sendRedirect("successfullogin.jsp");
				} else {
				out.println("Invalid password <a href='Login.jsp'>try again</a>");
				}
		%>
			
	</body>
</html>