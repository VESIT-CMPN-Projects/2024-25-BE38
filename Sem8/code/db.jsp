<%@ page import="java.sql.*" %>
<%
    Connection conn = (Connection) application.getAttribute("conn");
    if (conn == null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/health_monitoring", "root", "abc123");
            application.setAttribute("conn", conn);
        } catch (Exception e) {
            out.println("Database Connection Error: " + e.getMessage());
        }
    }
%>
