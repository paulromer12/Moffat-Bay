<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thank You</title>
       <link rel="stylesheet" href="css/login.css">
       <link rel="stylesheet" href="css/thankyou.css">
</head>
<body>
    <div class="landing-container">
        <header>
		<nav>
	        <div class="logo">Moffat Bay Lodge</div>
	        <ul class="navbar">
	            <li><a href="index.jsp">Home</a></li>
	            <li><a href="reservation.jsp">Cabins</a></li>
	            <li><a href="attractions.jsp">Attractions</a></li>
	            <li><a href="about.jsp">About</a></li>
	            <li><a href="contact.jsp">Contact</a></li>
	            <%
	                String user = (String) session.getAttribute("user");
	                if (user != null) {
	            %>
	                <li><a href="ReservationSummaryServlet" class="active">Account</a></li>
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

        <div class="thankyou-container">
            <h2>Thank You!</h2>
            <p>Your message has been received. We'll be in touch soon!</p>
        </div>
    </div>
</body>
</html>
