<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
    String senderEmail = request.getParameter("motherEmail");
    String receiverEmail = request.getParameter("doctorEmail");
    String message = request.getParameter("message");
    String senderType = "mother";

    if (senderEmail != null && receiverEmail != null && message != null && !message.trim().isEmpty()) {
        try {
            String sql = "INSERT INTO messages (sender_email, receiver_email, message, sender_type, timestamp) VALUES (?, ?, ?, ?, NOW())";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, senderEmail);
            pst.setString(2, receiverEmail);
            pst.setString(3, message);
            pst.setString(4, senderType);
            pst.executeUpdate();
            out.print("success");
        } catch (SQLException e) {
            out.print("error: " + e.getMessage());
        }
    } else {
        out.print("Invalid input");
    }
%>
