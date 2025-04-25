<%@ page import="java.sql.*" %>

<%
    // Get parameters from form
    String patientId = request.getParameter("patientId");
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    String message = "";
    boolean success = false;

    // Get the database connection
    Connection conn = (Connection) application.getAttribute("conn");

    if (conn != null && patientId != null && name != null && email != null) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE mothers SET name = ?, email = ? WHERE id = ?");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setInt(3, Integer.parseInt(patientId));

            int updated = ps.executeUpdate();

            if (updated > 0) {
                message = "Patient details updated successfully!";
                success = true;
            } else {
                message = "Failed to update patient details.";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    } else {
        message = "Invalid input or database connection error.";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Status</title>
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.5/sweetalert2.min.css">
    <!-- SweetAlert2 JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.5/sweetalert2.all.min.js"></script>
    
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            Swal.fire({
                icon: "<%= success ? "success" : "error" %>",
                title: "<%= success ? "Success" : "Failed" %>",
                text: "<%= message %>",
                confirmButtonColor: "#3085d6",
                confirmButtonText: "OK"
            }).then(() => {
                window.location.href = "patientList.jsp";
            });
        });
    </script>
</head>
<body>
</body>
</html>
