<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script type="text/javascript">
    function redirectToLogin(userType) {
        // Redirect to Login.jsp with a query parameter to indicate the user type
        window.location.href = "Login.jsp?usertype=" + userType;
    }
</script>
</head>
<body>
    <form>
        <button type="button" onclick="redirectToLogin('Customer')">Customer</button>
        <button type="button" onclick="redirectToLogin('Employee')">Employee</button>
    </form>
</body>
</html>