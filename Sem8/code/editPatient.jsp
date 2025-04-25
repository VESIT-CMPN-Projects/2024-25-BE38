<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="db.jsp" %>


<%
    String patientId = request.getParameter("patientId");
    String name = "";
    String email = "";
    String channelId = "";
    String channelApiKey = "";



    if (conn != null && patientId != null) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT name, email, channel_id, channel_api_key FROM mothers WHERE id = ?"
            );
            ps.setInt(1, Integer.parseInt(patientId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                email = rs.getString("email");
                channelId = rs.getString("channel_id");
                channelApiKey = rs.getString("channel_api_key");
            } else {
                out.println("<h3 style='color:red;'>❌ Patient not found!</h3>");
                return;
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>❌ Error retrieving patient: " + e.getMessage() + "</h3>");
            return;
        }
    } else {
        out.println("<h3 style='color:red;'>❌ Invalid request or database connection error.</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Patient</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #FFD3B6, #B5EAD7);
            color: #444;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: #FFF8DC;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .nav-links a {
            text-decoration: none;
            color: #555;
            margin: 0 15px;
            font-weight: bold;
        }

        .container {
            width: 50%;
            margin: 120px auto;
            background: rgba(255,255,255,0.85);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #FF8C94;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-container {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .action-btn {
            padding: 10px 15px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .update-btn { background: #FFD700; color: black; }
        .cancel-btn { background: #FF4500; color: white; }

        .action-btn:hover {
            opacity: 0.8;
            transform: scale(1.1);
        }

        footer {
            background: #FFF8DC;
            color: #555;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div>Admin Dashboard</div>
    <div class="nav-links">
        <a href="mother_dashboard.jsp">Back</a>
        <a href="mother_logout.jsp">Logout</a>
    </div>
</div>

<div class="container">
    <h2>Edit Patient</h2>
    <form action="updatePatient.jsp" method="post">
        <input type="hidden" name="patientId" value="<%= patientId %>">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= name %>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= email %>" required>

        <label for="channelId">ThingSpeak Channel ID:</label>
        <input type="text" id="channelId" name="channelId" value="<%= channelId %>">

        <label for="channelApiKey">ThingSpeak API Key:</label>
        <input type="text" id="channelApiKey" name="channelApiKey" value="<%= channelApiKey %>">

        <div class="btn-container">
            <button type="submit" class="action-btn update-btn">Update</button>
            <button type="button" class="action-btn cancel-btn" onclick="window.history.back();">Cancel</button>
        </div>
    </form>
</div>

<footer>
    © 2025 Health Monitoring System. Designed by the team.
</footer>

</body>
</html>
