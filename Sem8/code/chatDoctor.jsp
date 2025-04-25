<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    // Database connection
    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/health_monitoring", "root", "abc123");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Database Connection Failed: " + e.getMessage() + "</p>");
    }

    // Get doctor email
    String doctorEmail = request.getParameter("doctorEmail");
    if (doctorEmail == null) {
        doctorEmail = "doctor@example.com";
    }

    // Get selected mother email
    String motherEmail = request.getParameter("motherEmail");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Chat</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e5ddd5;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        .container {
            display: flex;
            width: 100%;
            height: 100vh;
        }

        /* Left Sidebar (Mothers List) */
        .left-panel {
            width: 30%;
            background: #075e54;
            color: white;
            padding: 20px;
            overflow-y: auto;
        }

        .left-panel h3 {
            font-size: 22px;
            margin-bottom: 15px;
            border
            padding-bottom: 5px;
        }

        .left-panel ul {
            list-style: none;
            padding: 0;
        }

        .left-panel ul li {
            margin: 10px 0;
        }

        .left-panel ul li a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            display: block;
            padding: 10px;
            border-radius: 8px;
            background: #128c7e;
            transition: 0.3s;
        }

        .left-panel ul li a:hover {
            background: #25d366;
            color: white;
        }

        /* Right Chat Panel */
        .right-panel {
            width: 70%;
            display: flex;
            flex-direction: column;
            background: #e5ddd5;
            padding: 20px;
            position: relative;
        }

        /* Chat Header */
        .chat-header {
            background-color: #0f5d4f;
            color: white;
            font-weight: bold;
            display: flex;
            justify-content: space-between; /* Aligns text to left and button to right */
            align-items: center;
            padding: 10px 15px;
            border-radius: 5px;
        }

        /* Back Button */
        .back-button {
            background: #ff3b30;
            color: white;
            border: none;
            padding: 6px 12px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
            transition: 0.3s;
        }

        .back-button:hover {
            background: #d32f2f;
        }

        /* Chat Box */
        .chat-box {
            flex-grow: 1;
            border-radius: 10px;
            padding: 15px;
            height: 400px;
            overflow-y: auto;
            background: #ffffff;
            display: flex;
            flex-direction: column;
            border: 1px solid #ccc;
        }

        /* Messages */
        .message {
            padding: 12px;
            margin: 8px 0;
            border-radius: 12px;
            max-width: 60%;
            font-size: 16px;
            display: inline-block;
        }

        .mother {
            background: #dcf8c6;
            text-align: left;
            align-self: flex-start;
        }

        .doctor {
            background: #34b7f1;
            color: white;
            text-align: right;
            align-self: flex-end;
        }

        /* Message Input Box */
        .message-input {
            display: flex;
            align-items: center;
            padding: 10px;
            background: #ffffff;
            border-top: 1px solid #ccc;
            position: sticky;
            bottom: 0;
            width: 100%;
        }

        .message-input textarea {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
            outline: none;
            font-size: 16px;
        }

        .message-input button {
            padding: 10px 15px;
            margin-left: 10px;
            border: none;
            background: #128c7e;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            transition: 0.3s;
        }

        .message-input button:hover {
            background: #25d366;
        }
    </style>

    <script>
        function loadMessages() {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("chatBox").innerHTML = xhr.responseText;
                }
            };
            xhr.open("GET", "loadMessages.jsp?doctorEmail=<%= doctorEmail %>&motherEmail=<%= motherEmail %>", true);
            xhr.send();
        }
        
        setInterval(loadMessages, 5000); // Refresh every 5 seconds
        window.onload = loadMessages;
    </script>
</head>
<body>

<div class="container">
    <!-- Sidebar -->
    <div class="left-panel">
        <h3>Mothers</h3>
        <ul>
            <%
            if (conn != null) {
                try {
                    String query = "SELECT DISTINCT m.name, m.email " +
                                   "FROM mothers m " +
                                   "JOIN messages msg ON (msg.sender_email = m.email OR msg.receiver_email = m.email) " +
                                   "WHERE msg.sender_type='mother' OR msg.receiver_email=?";
                    PreparedStatement pst = conn.prepareStatement(query);
                    pst.setString(1, doctorEmail);
                    ResultSet rs = pst.executeQuery();
                    
                    boolean hasMothers = false;
                    while (rs.next()) {
                        hasMothers = true;
                        String motherName = rs.getString("name");
                        String mother = rs.getString("email");
            %>
                        <li><a href="chatDoctor.jsp?doctorEmail=<%= doctorEmail %>&motherEmail=<%= mother %>"><%= motherName %></a></li>
            <%
                    }
                    if (!hasMothers) {
                        out.println("<p>No mothers available for chat.</p>");
                    }
                    rs.close();
                    pst.close();
                } catch (SQLException e) {
                    out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
                }
            }
            %>
        </ul>
    </div>

    <!-- Chat Window -->
    <div class="right-panel">
        <%
        if (motherEmail != null) {
        %>
            <div class="chat-header">
                Chat with <%= motherEmail %>
                <button class="back-button" onclick="window.location.href='doctor_dashboard.jsp'">Back</button>
            </div>
            <div class="chat-box" id="chatBox"></div>

            <form class="message-input" action="sendMessage.jsp" method="POST">
                <input type="hidden" name="doctorEmail" value="<%= doctorEmail %>">
                <input type="hidden" name="motherEmail" value="<%= motherEmail %>">
                <textarea name="message" rows="3" placeholder="Type your message..." required></textarea>
                <button type="submit">Send</button>
            </form>
        <%
        }
        %>
    </div>
</div>

</body>
</html>
