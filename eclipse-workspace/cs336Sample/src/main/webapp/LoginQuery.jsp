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
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Storing username, password, usertype as strings for query
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String usertype = request.getParameter("usertype");
			//Making query to check if username and password is in database
			String querystring = "";
			if ("Customer".equals(usertype)) {
				querystring = "SELECT First_Name, Last_Name FROM Customers WHERE Username= '" + username + "' AND Password='" + password + "'";
			} else if ("Employee".equals(usertype)) {
				querystring = "SELECT First_Name, Last_Name FROM Employee WHERE Username= '" + username + "' AND Password='" + password + "'";
			}
			
			if (!querystring.isEmpty()) {
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(querystring);
			
			if (result.next()) {
				String firstname = result.getString("First_Name");
				String lastname = result.getString("Last_Name");
				session.setAttribute("user", username); // the username will be stored in the session
				out.println("Welcome " + firstname + " " + lastname);
				out.println("<a href='logout.jsp'>Log out</a>");
				response.sendRedirect("successfullogin.jsp");
				} else {
					session.setAttribute("loginError", "Invalid username or password. Please try again.");
	                response.sendRedirect("Login.jsp?usertype=" + usertype);
				}
				result.close();
			} else {
				out.println("User type not specified. Please try again. <a href='Home.jsp'>Go back</a>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
	        out.println("An error occurred while processing your request. Please try again.");
		}
		%>
			
	</body>
</html>