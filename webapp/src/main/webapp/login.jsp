<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page (Temporary)</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 50px; }
        .message { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Login Page (Temporary Placeholder)</h1>

    <% 
        String registered = request.getParameter("registered");
        if ("1".equals(registered)) {
    %>
        <p class="message">🎉 Registration successful! You may now log in.</p>
    <% 
        } 
    %>

    <!-- Simple form just to simulate the idea -->
    <form method="post" action="login">
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email"><br><br>

        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password"><br><br>

        <input type="submit" value="Login">
    </form>
</body>
</html>
