package com.moffatbay.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.*;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form inputs
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("telephone");
        String password = request.getParameter("password");

        // Validate email and password format
        boolean valid = isValidEmail(email) && isValidPassword(password);
        if (!valid) {
            request.setAttribute("error", "Invalid email or password. Ensure that passwords contain at least one lowercase letter, one uppercase letter, one number, and be at least 8 characters long.");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
            return;
        }

        // Hash password
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        try {

            // Load MySQL JDBC driver (critical for many servlet containers)
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/moffatbay", "root", "root")) {

                // Check for existing email
                String checkSql = "SELECT email FROM User WHERE email = ?";
                try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                    checkStmt.setString(1, email);
                    ResultSet rs = checkStmt.executeQuery();
                    if (rs.next()) {
                        request.setAttribute("error", "Email already registered.");
                        request.getRequestDispatcher("/registration.jsp").forward(request, response);
                        return;
                    }
                }

                // Insert new user
                String insertSql = "INSERT INTO User (first_name, last_name, email, phone, password_hash) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(insertSql)) {
                    stmt.setString(1, firstName);
                    stmt.setString(2, lastName);
                    stmt.setString(3, email);
                    stmt.setString(4, phone);
                    stmt.setString(5, hashedPassword);

                    int rows = stmt.executeUpdate();
                    if (rows > 0) {
                        response.sendRedirect("login.jsp?registered=1");
                    } else {
                        request.setAttribute("error", "Registration failed. Please try again.");
                        request.getRequestDispatcher("/registration.jsp").forward(request, response);
                    }
                }

            }
        } catch (ClassNotFoundException e) {
            request.setAttribute("error", "MySQL JDBC driver not found.");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace(); // dev-only, remove or log securely in production
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
        }
    }

    private boolean isValidEmail(String email) {
        return email != null && email.matches("^[\\w.-]+@[\\w.-]+\\.\\w{2,}$");
    }

    private boolean isValidPassword(String password) {
        return password != null && password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$");
    }
}
