<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    // Database connection
    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/health_monitoring", "root", "abc123");

        // Get chat details
        String doctorEmail = request.getParameter("doctorEmail");
        String motherEmail = request.getParameter("motherEmail");

        if (doctorEmail != null && motherEmail != null) {
            String chatQuery = "SELECT sender_email, message FROM messages " +
                               "WHERE (sender_email=? AND receiver_email=?) OR (sender_email=? AND receiver_email=?) " +
                               "ORDER BY timestamp ASC";
            PreparedStatement chatPst = conn.prepareStatement(chatQuery);
            chatPst.setString(1, motherEmail);
            chatPst.setString(2, doctorEmail);
            chatPst.setString(3, doctorEmail);
            chatPst.setString(4, motherEmail);
            ResultSet chatRs = chatPst.executeQuery();

            while (chatRs.next()) {
                String sender = chatRs.getString("sender_email");
                String msg = chatRs.getString("message");
                String msgClass = sender.equals(doctorEmail) ? "doctor" : "mother";
%>
                <div class="message <%= msgClass %>"><%= msg %></div>
<%
            }
            chatRs.close();
            chatPst.close();
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
    } finally {
        if (conn != null) conn.close();
    }
%>
