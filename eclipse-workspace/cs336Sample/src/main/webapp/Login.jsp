<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Customer Login</title>
	</head>
	<body>
		<form action="LoginQuery.jsp" method="POST">
			Username: <input type="text" name="username"/> <br/>
			Password:<input type="password" name="password"/> <br/>
			<input type="submit" value="Login"/>
		</form>
	</body>
</html>