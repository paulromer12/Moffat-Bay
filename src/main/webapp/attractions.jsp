<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attractions at Moffat Bay Lodge</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/attractions.css">
</head>
<body>

<!-- Navigation -->
<nav>
    <div class="logo">Moffat Bay Lodge</div>
    <ul class="navbar">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="reservation.jsp">Cabins</a></li>
        <li><a href="attractions.jsp" class="active">Attractions</a></li>
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
    <h1>Attractions at Moffat Bay Lodge</h1>

    <div class="attractions-container">
    <div class="cards-container">
        <div class="card">
            <h3>Hiking</h3>
            <p>Explore scenic trails across lush forests and breathtaking landscapes.</p>
            <p><strong>Price:</strong> $30 per person</p>
            <p><strong>Status:</strong> Available</p>
        </div>
        <div class="card">
            <h3>Kayaking</h3>
            <p>Paddle the crystal-clear waters and enjoy peaceful views of the island.</p>
            <p><strong>Price:</strong> $45 per hour</p>
            <p><strong>Status:</strong> Available</p>
        </div>
        <div class="card">
            <h3>Whale Watching</h3>
            <p>Join guided tours to spot majestic whales in their natural habitat.</p>
            <p><strong>Price:</strong> $60 per person</p>
            <p><strong>Status:</strong> Seasonal</p>
        </div>
        <div class="card">
            <h3>Scuba Diving</h3>
            <p>Discover vibrant marine life with certified instructors for all levels.</p>
            <p><strong>Price:</strong> $80 per dive</p>
            <p><strong>Status:</strong> Available</p>
        </div>
    </div>
</div>
</body>
</html>
