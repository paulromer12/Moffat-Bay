<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <div class="landing-container">
        <header>
            <h1>Moffat Bay Lodge</h1>
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
        </header>

        <div class="center-content">
            <h2>Experience the Wilderness</h2>
            <p>Discover the serene beauty of Moffat Bay Lodge,<br>your perfect getaway in nature.</p>
            <button onclick="location.href='reservation.jsp'">Book Now</button>
        </div>
    </div>
</body>
</html>