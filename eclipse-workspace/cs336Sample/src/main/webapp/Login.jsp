<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
	String usertype = request.getParameter("type");
	String pagetitle = "Login";
	if ("Customer".equals(usertype)) {
		pagetitle = "Customer Login";
	} else if ("Employee".equals(usertype)) {
		pagetitle = "Employee Login";
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Customer Login</title>
		<script type="text/javascript">
        function goToHome() {
            window.location.href = "Home.jsp";
        }
    	</script>
	</head>
	<body>
		<%
			String loginError = (String) session.getAttribute("loginError");
			if (loginError != null) {
				out.println("<p style='color:red;'>" + loginError + "</p>");
				session.removeAttribute("loginError");
			}
		%>
		<form action="LoginQuery.jsp" method="POST">
			Username: <input type="text" name="username"/> <br/>
			Password:<input type="password" name="password"/> <br/>
			<input type="hidden" name="usertype" value="<%= request.getParameter("usertype") %>"/>
			<input type="submit" value="Login"/>
			<button type="button" onclick="goToHome()">Home</button>
		</form>
	</body>
</html>