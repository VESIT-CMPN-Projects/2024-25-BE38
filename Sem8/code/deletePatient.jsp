<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>

<%
    // Get patient ID from request
    String patientId = request.getParameter("patientId");

    if (patientId == null || patientId.isEmpty()) {
        response.sendRedirect("patientList.jsp?error=Invalid Patient ID");
        return;
    }

    // Get the database connection from application scope
    Connection conn = (Connection) application.getAttribute("conn");

    if (conn == null) {
        response.sendRedirect("patientList.jsp?error=Database Connection Error");
        return;
    }

    PreparedStatement ps = null;

    try {
        // Delete query
        String sql = "DELETE FROM mothers WHERE id = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(patientId));

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("patientList.jsp?success=Patient deleted successfully");
        } else {
            response.sendRedirect("patientList.jsp?error=Patient not found");
        }

    } catch (Exception e) {
        response.sendRedirect("patientList.jsp?error=" + e.getMessage());
    } finally {
        if (ps != null) ps.close();
    }
%>
