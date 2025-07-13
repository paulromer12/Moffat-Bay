<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Confirm Your Reservation</title>
    <link rel="stylesheet" href="css/reservationConfirmation.css">
</head>
<body>
    <div class="confirmation-container">
        <h2>Confirm Your Reservation</h2>
        <p>Please review the details of your reservation before confirming.</p>

        <div class="reservation-details">
            <div class="detail-row">
                <span class="label">Room Type:</span>
                <span class="value">${param.roomTypeName}</span>
            </div>
            <div class="detail-row">
                <span class="label">Number of Guests:</span>
                <span class="value">${param.numGuests}</span>
            </div>
            <div class="detail-row">
                <span class="label">Check-in Date:</span>
                <span class="value">${param.checkIn}</span>
            </div>
            <div class="detail-row">
                <span class="label">Check-out Date:</span>
                <span class="value">${param.checkOut}</span>
            </div>
            <div class="detail-row">
                <span class="label">Total Price:</span>
                <span class="value price">$${param.totalPrice}</span>
            </div>
        </div>

        <div class="confirmation-actions">
            <form action="ConfirmReservationServlet" method="post">
                <input type="hidden" name="roomTypeId" value="${param.roomTypeId}">
                <input type="hidden" name="numGuests" value="${param.numGuests}">
                <input type="hidden" name="checkIn" value="${param.checkIn}">
                <input type="hidden" name="checkOut" value="${param.checkOut}">
                <input type="hidden" name="totalPrice" value="${param.totalPrice}">
                <button type="submit" class="confirm-btn">Confirm Reservation</button>
            </form>
            <a href="reservation.jsp" class="back-btn">Cancel</a>
        </div>
    </div>
</body>
</html>