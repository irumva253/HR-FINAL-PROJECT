<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
<%
response.setHeader("cache-control","no-cache,no-store,must-validate");//http 1.1
response.setHeader("progma", "no-cache");// HTTP 1.0
response.setHeader("Expires", "0");//proxies

if(session.getAttribute("username")==null){
response.sendRedirect("Login.jsp");
}

%>


        Dear ${uname}, welcome to your Portal


 <form action="Logout" method="post">
 <input type="submit" value="logout">
</form>
</body>
</html>