package com.moffatbay.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get form inputs
        String roomTypeIdStr = request.getParameter("roomTypeId");
        String numGuestsStr = request.getParameter("numGuests");
        String checkInStr = request.getParameter("checkIn");
        String checkOutStr = request.getParameter("checkOut");
        String totalPriceStr = request.getParameter("totalPrice");
        String roomTypeName = request.getParameter("roomTypeName");

        // Basic validation
        if (roomTypeIdStr == null || numGuestsStr == null || checkInStr == null || checkOutStr == null || totalPriceStr == null) {
            request.setAttribute("error", "Missing reservation details.");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
            return;
        }

        // Forward to confirmation page
        request.setAttribute("roomTypeId", roomTypeIdStr);
        request.setAttribute("numGuests", numGuestsStr);
        request.setAttribute("checkIn", checkInStr);
        request.setAttribute("checkOut", checkOutStr);
        request.setAttribute("totalPrice", totalPriceStr);
        request.setAttribute("roomTypeName", roomTypeName);

        request.getRequestDispatcher("reservationConfirmation.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // redirect to reservation form
        response.sendRedirect("reservation.jsp");
    }
}