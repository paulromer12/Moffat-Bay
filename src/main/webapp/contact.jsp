<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact - Moffat Bay Lodge</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/contact.css">
    
    
</head>
<body>
    <nav>
        <div class="logo">Moffat Bay Lodge</div>
        <ul class="navbar">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="reservation.jsp">Cabins</a></li>
            <li><a href="attractions.jsp">Attractions</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp" class="active">Contact</a></li>
            <% if (session.getAttribute("user") != null) { %>
                <li><a href="ReservationSummaryServlet">Account</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            <% } else { %>
                <li><a href="login.jsp">Login</a></li>
            <% } %>
        </ul>
    </nav>

    <div class="landing-container">

        <div class="center-content">
            <h2>Contact Us</h2>
            <p>We'd love to hear from you! Fill out the form below and we'll get back to you soon.</p>
            
            <form class="contact-form" action="thankyou.jsp" method="post">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <textarea name="message" placeholder="Your Message" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>
        <h4>Call Us: (509) 627-3333</h4>
        <!-- <h4>moffat_bay@gmail.com</h4> -->
    </div>
</body>
</html>
