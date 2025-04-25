<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Signup</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #FFD3B6, #B5EAD7);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
        }
        h2 {
            color: #444;
        }
        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            background: #FF8C94;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background: #e06b75;
        }
        a {
            color: #FF8C94;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Signup</h2>
        <form method="post">
            <input type="text" name="name" placeholder="Name" required><br>
            <input type="email" name="email" placeholder="Email" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" name="signup" value="Sign Up" class="btn">
        </form>
        <p>Already have an account? <a href="admin_login.jsp">Login</a></p>
        
        <%
            if (conn == null) {
                out.println("<p style='color:red;'>Database connection error. Check db.jsp.</p>");
            } else {
                if (request.getParameter("signup") != null) {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    try {
                        String query = "INSERT INTO admin (name, email, password) VALUES (?, ?, ?)";
                        PreparedStatement pst = conn.prepareStatement(query);
                        pst.setString(1, name);
                        pst.setString(2, email);
                        pst.setString(3, password);
                        int result = pst.executeUpdate();
                        pst.close();
                        if (result > 0) {
                            out.println("<p style='color:green;'>Signup successful! <a href='admin_login.jsp'>Login here</a></p>");
                        } else {
                            out.println("<p style='color:red;'>Signup failed. Try again.</p>");
                        }
                    } catch (SQLException e) {
                        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    }
                }
            }
        %>
    </div>
</body>
</html>