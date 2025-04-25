<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
    String motherEmail = request.getParameter("motherEmail");
    String doctorEmail = request.getParameter("doctorEmail");

    if (conn != null && motherEmail != null && doctorEmail != null) {
        try {
            String sql = "SELECT sender_email, message FROM messages " +
                         "WHERE (sender_email=? AND receiver_email=?) OR (sender_email=? AND receiver_email=?) " +
                         "ORDER BY timestamp ASC";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, motherEmail);
            pst.setString(2, doctorEmail);
            pst.setString(3, doctorEmail);
            pst.setString(4, motherEmail);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                String sender = rs.getString("sender_email");
                String msg = rs.getString("message");
                String msgClass = sender.equals(motherEmail) ? "mother" : "doctor";
%>
                <div class="message <%= msgClass %>"><%= msg %></div>
<%
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.print("<p style='color:red;'>Invalid request or connection error.</p>");
    }
%>
