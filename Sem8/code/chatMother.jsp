<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
    String motherEmail = (String) session.getAttribute("motherEmail");
    if (motherEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String doctorEmail = "doctor@example.com";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mother Chat</title>
    <style>
        /* Your existing CSS stays the same */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e5ddd5;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
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
            border-bottom: 2px solid #25d366;
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
            text-align: center;
        }

        .left-panel ul li a:hover {
            background: #25d366;
        }

        /* Chat Area */
        .right-panel {
            width: 70%;
            display: flex;
            flex-direction: column;
            background: #e5ddd5;
            padding: 20px;
        }

        /* Chat Header */
        .chat-header {
            font-size: 20px;
            background: #075e54;
            color: white;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
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

        /* Input Box */
        .message-input {
            display: flex;
            padding: 10px;
            background: #ffffff;
            border-radius: 8px;
            align-items: center;
            border-top: 1px solid #ccc;
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
        async function sendMessage() {
            const messageInput = document.getElementById("message");
            const message = messageInput.value.trim();
            if (!message) return;

            const formData = new URLSearchParams();
            formData.append("motherEmail", "<%= motherEmail %>");
            formData.append("doctorEmail", "<%= doctorEmail %>");
            formData.append("message", message);

            try {
                const res = await fetch("sendMessageMother.jsp", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: formData.toString()
                });

                const result = await res.text();
                messageInput.value = ""; // Clear input
                fetchMessages(); // Reload chat after send
            } catch (err) {
                alert("Error sending message: " + err);
            }
        }

        async function fetchMessages() {
            const response = await fetch("fetchMessages.jsp?motherEmail=<%= motherEmail %>&doctorEmail=<%= doctorEmail %>");
            const data = await response.text();
            document.getElementById("messages").innerHTML = data;
            const chatBox = document.getElementById("messages");
            chatBox.scrollTop = chatBox.scrollHeight; // Scroll to bottom
        }

        setInterval(fetchMessages, 3000); // Refresh every 3 sec
        window.onload = fetchMessages; // Load messages on page load
    </script>
</head>
<body>
<div class="container">
    <div class="left-panel">
        <h3>Doctors</h3>
        <ul>
            <li><a href="#">Doctor</a></li>
        </ul>
    </div>

    <div class="right-panel">
        <div class="chat-header">Chat with Doctor</div>
        <div class="chat-box" id="messages">
            <!-- Messages will load here -->
        </div>

        <!-- AJAX input box -->
        <div class="message-input">
            <textarea id="message" rows="3" placeholder="Type your message..." required></textarea>
            <button type="button" onclick="sendMessage()">Send</button>
        </div>
    </div>
</div>
</body>
</html>
