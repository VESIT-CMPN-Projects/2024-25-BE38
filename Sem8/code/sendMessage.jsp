<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    // Database connection
    Connection conn = null;
    PreparedStatement pst = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/health_monitoring", "root", "abc123");

        // Get parameters from the form
        String doctorEmail = request.getParameter("doctorEmail");
        String motherEmail = request.getParameter("motherEmail");
        String message = request.getParameter("message");

        if (doctorEmail != null && motherEmail != null && message != null && !message.trim().isEmpty()) {
            // Insert message into the database
            String query = "INSERT INTO messages (sender_email, receiver_email, sender_type, message, timestamp) VALUES (?, ?, ?, ?, NOW())";
            pst = conn.prepareStatement(query);
            pst.setString(1, doctorEmail);
            pst.setString(2, motherEmail);
            pst.setString(3, "doctor");
            pst.setString(4, message);

            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("chatDoctor.jsp?doctorEmail=" + doctorEmail + "&motherEmail=" + motherEmail);
            } else {
                out.println("<p style='color:red;'>Error: Message not sent.</p>");
            }
        } else {
            out.println("<p style='color:red;'>Invalid input. Please enter a message.</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
    } finally {
        try { if (pst != null) pst.close(); if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
