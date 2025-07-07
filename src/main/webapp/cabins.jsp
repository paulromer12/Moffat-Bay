<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cabins</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
    <nav>
        <div class="logo">Moffat Bay Lodge</div>
		<ul class="navbar">
		    <li><a href="index.jsp" class="active">Home</a></li>
		    <li><a href="reservation.jsp">Cabins</a></li>
		    <li><a href="attractions.jsp">Attractions</a></li>
		    <li><a href="about.jsp">About</a></li>
		    <li><a href="contact.jsp">Contact</a></li>
		    <%
		        String user = (String) session.getAttribute("user");
		        if (user != null) {
		    %>
		        <li><a href="ReservationSummaryServlet">Account</a></li>
		        <li><a href="logout.jsp">Logout</a></li>
		    <%
		        } else {
		    %>
		        <li><a href="login.jsp">Login</a></li>
		    <%
		        }
		    %>
		</ul>
    </nav>
  
    <div class="register-container">
        <h1>Guest Registration</h1>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
        <form action="register" method="post">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required>

            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="telephone">Phone:</label>
            <input type="tel" id="telephone" name="telephone" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
