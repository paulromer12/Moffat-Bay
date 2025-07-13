<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reserve Your Room</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/reservation.css">
</head>
<body>
    <nav>
        <div class="logo">Moffat Bay Lodge</div>
        <ul class="navbar">
            <li><a href="index.jsp" >Home</a></li>
            <li><a href="reservation.jsp" class="active">Cabins</a></li>
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

    <main>
      <h1 style="text-align:center; margin-top:30px;">Reserve Your Room</h1>
      <% if (request.getAttribute("error") != null) { %>
          <p class="error"><%= request.getAttribute("error") %></p>
      <% } %>

	      <div class="room-list">
	                <!-- Double Full -->
	          <div class="room-card">
	              <img src="images/cabin.jpg" alt="Double Full Room">
	              <h2>Double Full</h2>
	              <p>Two full beds, perfect for families or groups.</p>
	              <p><strong>$120/night</strong></p>
	              <form action="ReservationServlet" method="post">
	                  <input type="hidden" name="roomTypeId" value="1">
	                  <label>Guests:
	                      <input type="number" name="numGuests" min="1" max="6" required>
	                  </label>
	                  <label>Check-In:
	                      <input type="date" name="checkIn" required>
	                  </label>
	                  <label>Check-Out:
	                      <input type="date" name="checkOut" required>
	                  </label>
	                  <p>Estimated Total: $<span class="price-display">0.00</span></p>
	                  <input type="hidden" name="totalPrice" class="total-price-hidden" value="0.00">
	                  <button type="submit">Reserve Double Full</button>
	              </form>
	          </div>

	          <!-- Queen Room -->
	          <div class="room-card">
	              <img src="images/cabin.jpg" alt="Queen Room">
	              <h2>Queen Room</h2>
	              <p>Spacious queen-bed cabin with a private balcony and great views.</p>
	              <p><strong>$135/night</strong></p>
	              <form action="ReservationServlet" method="post">
	                  <input type="hidden" name="roomTypeId" value="2">
	                  <label>Guests:
	                      <input type="number" name="numGuests" min="1" max="6" required>
	                  </label>
	                  <label>Check-In:
	                      <input type="date" name="checkIn" required>
	                  </label>
	                  <label>Check-Out:
	                      <input type="date" name="checkOut" required>
	                  </label>
	                  <p>Estimated Total: $<span class="price-display">0.00</span></p>
	                  <input type="hidden" name="totalPrice" class="total-price-hidden" value="0.00">
	                  <button type="submit">Reserve Queen</button>
	              </form>
	          </div>

	          <!-- Double Queen Room -->
	          <div class="room-card">
	              <img src="images/cabin.jpg" alt="Double Queen Room">
	              <h2>Double Queen Room</h2>
	              <p>Two queen-beds in a cabin with a private balcony and fun for the whole family.</p>
	              <p><strong>$150/night</strong></p>
	              <form action="ReservationServlet" method="post">
	                  <input type="hidden" name="roomTypeId" value="3">
	                  <label>Guests:
	                      <input type="number" name="numGuests" min="1" max="6" required>
	                  </label>
	                  <label>Check-In:
	                      <input type="date" name="checkIn" required>
	                  </label>
	                  <label>Check-Out:
	                      <input type="date" name="checkOut" required>
	                  </label>
	                  <p>Estimated Total: $<span class="price-display">0.00</span></p>
	                  <input type="hidden" name="totalPrice" class="total-price-hidden" value="0.00">
	                  <button type="submit">Reserve Double Queen</button>
	              </form>
	          </div>

	          <!-- King Room -->
	          <div class="room-card">
	              <img src="images/cabin.jpg" alt="King Room">
	              <h2>King Room</h2>
	              <p>Luxurious king-bed suite with fireplace and lakeside view.</p>
	              <p><strong>$160/night</strong></p>
	              <form action="ReservationServlet" method="post">
	                  <input type="hidden" name="roomTypeId" value="4">
	                  <label>Guests:
	                      <input type="number" name="numGuests" min="1" max="6" required>
	                  </label>
	                  <label>Check-In:
	                      <input type="date" name="checkIn" required>
	                  </label>
	                  <label>Check-Out:
	                      <input type="date" name="checkOut" required>
	                  </label>
	                  <p>Estimated Total: $<span class="price-display">0.00</span></p>
	                  <input type="hidden" name="totalPrice" class="total-price-hidden" value="0.00">
	                  <button type="submit">Reserve King</button>
	              </form>
	          </div>
	      </div>

<div class="room-list">
    <div class="room-card">
        <h2>Need to look up a previous reservation?</h2>
        <p>Use the button below to view previous reservations.</p>
        <button onclick="location.href='reservationLookup.jsp'">Reservation Look Up</button>
    </div>
</div>

    </main>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
      const forms = document.querySelectorAll(".room-card form");

      forms.forEach(form => {
        const checkInInput = form.querySelector('input[name="checkIn"]');
        const checkOutInput = form.querySelector('input[name="checkOut"]');
        const priceDisplay = form.querySelector(".price-display");
        const hiddenTotalPrice = form.querySelector(".total-price-hidden");
        const roomTypeId = form.querySelector('input[name="roomTypeId"]').value;

        const rates = {
            "1": 120,  // Double Full
            "2": 135,  // Queen
            "3": 150,  // Double Queen
            "4": 160,  // King
        };

        function updatePrice() {
          const checkIn = new Date(checkInInput.value);
          const checkOut = new Date(checkOutInput.value);
          const oneDay = 24 * 60 * 60 * 1000;

          if (checkIn && checkOut && checkOut > checkIn) {
            const nights = Math.round((checkOut - checkIn) / oneDay);
            const total = nights * rates[roomTypeId];
            priceDisplay.textContent = total.toFixed(2);
            hiddenTotalPrice.value = total.toFixed(2);
          } else {
            priceDisplay.textContent = "0.00";
            hiddenTotalPrice.value = "0.00";
          }
        }

        checkInInput.addEventListener("change", updatePrice);
        checkOutInput.addEventListener("change", updatePrice);
      });
    });
    </script>
</body>
</html>