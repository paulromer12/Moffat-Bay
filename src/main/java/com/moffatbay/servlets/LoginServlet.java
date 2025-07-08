package com.moffatbay.servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.mindrot.jbcrypt.BCrypt;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/moffat_bay", "root", "BV-SQL@2025!")) {  // I have to remove the underscore for it to work with mine - William, also be sure to enter your proper password

                String sql = "SELECT password_hash, first_name FROM User WHERE email = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, email);
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        String storedHash = rs.getString("password_hash");

                        if (BCrypt.checkpw(password, storedHash)) {
                            HttpSession session = request.getSession();
                            session.setAttribute("user", email);
                            session.setAttribute("firstName", rs.getString("first_name"));
                            response.sendRedirect("index.jsp");
                        } else {
                            request.setAttribute("error", "Incorrect password.");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("error", "No account found for that email.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }

            }
        } catch (ClassNotFoundException e) {
            request.setAttribute("error", "Database driver not found.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to the login form
        response.sendRedirect("login.jsp");
    }
}