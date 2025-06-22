<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Moffat Bay - Login</title>
  <link rel="stylesheet" href="styles.css" />
</head>
<body>

<nav>
  <div class="logo">Moffat Bay Lodge</div>
  <ul class="navbar">
    <li><a href="index.jsp" class="active">Home</a></li>
    <li><a href="cabins.jsp">Cabins</a></li>
    <li><a href="attractions.jsp">Attractions</a></li>
    <li><a href="about.jsp">About</a></li>
    <li><a href="contact.jsp">Contact</a></li>
    <li><a href="login.jsp">Login</a></li>
  </ul>
</nav>

<div class="login-container">
  <form method="POST" action="LoginServlet">
    <h2>Login</h2>
    <input type="text" name="username" placeholder="Username" required />
    <input type="password" name="password" placeholder="Password" required />
    <button type="submit">Login</button>
    <a href="register.jsp" class="register-button">Register</a>

    <% if (request.getAttribute("error") != null) { %>
      <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>
  </form>
</div>

</body>
</html>