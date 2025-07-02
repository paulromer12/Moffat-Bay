package com.moffatbay.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.moffatbay.models.Reservation;

public class ReservationLookupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String resId = request.getParameter("reservationNumber");
        if (resId == null || resId.isEmpty()) {
            request.setAttribute("error", "Please enter a reservation number.");
            request.getRequestDispatcher("reservationLookup.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/moffatbay", "root", "root")) {

            	String sql = "SELECT r.reservation_id, u.first_name, rt.name, "
            	           + "r.check_in_date, r.check_out_date, r.num_guests, r.total_price "
            	           + "FROM Reservation r "
            	           + "JOIN User u ON r.user_id = u.user_id "
            	           + "JOIN RoomType rt ON r.room_type_id = rt.room_type_id "
            	           + "WHERE r.reservation_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, Integer.parseInt(resId));
                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        Reservation res = new Reservation(
                            rs.getInt("reservation_id"),
                            rs.getString("first_name"),
                            rs.getString("name"),
                            rs.getDate("check_in_date").toString(),
                            rs.getDate("check_out_date").toString(),
                            rs.getInt("num_guests"),
                            rs.getBigDecimal("total_price")
                        );
                        request.setAttribute("reservation", res);
                    } else {
                        request.setAttribute("error", "No reservation found with that number.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving reservation.");
        }

        request.getRequestDispatcher("reservationLookup.jsp").forward(request, response);
    }
}