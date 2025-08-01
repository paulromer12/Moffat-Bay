<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<!-- Navigation -->
<nav>
    <div class="logo">Moffat Bay Lodge</div>
    <ul class="navbar">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="reservation.jsp">Cabins</a></li>
        <li><a href="attractions.jsp">Attractions</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="login.jsp" class="active">Login</a></li>
    </ul>
</nav>

<!-- Login -->
<div class="login-container">
    <form method="POST" action="login">
        <h2>Guest Login</h2>
        <input type="text" name="username" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Login</button>
        <a href="registration.jsp" class="register-button">Register</a>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
    </form>
</div>

</body>
</html>
