<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Login</title>
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

        .login-container {
            width: 350px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            color: #444;
            margin-bottom: 20px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #FF8C94;
            outline: none;
            box-shadow: 0 0 8px rgba(255, 140, 148, 0.5);
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #FF8C94, #FFAAA5);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s;
        }

        button:hover {
            background: linear-gradient(to right, #E57373, #D32F2F);
            transform: scale(1.05);
        }

        p {
            margin-top: 15px;
            font-size: 14px;
        }

        p a {
            color: #E57373;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s;
        }

        p a:hover {
            color: #D32F2F;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Doctor Login</h2>
        <form method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" name="login">Login</button>
        </form>
        <p>Don't have an account? <a href="doctor_signup.jsp">Sign Up</a></p>

        <%
            if (request.getParameter("login") != null) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                try {
                    String query = "SELECT * FROM doctors WHERE email=? AND password=?";
                    PreparedStatement pst = conn.prepareStatement(query);
                    pst.setString(1, email);
                    pst.setString(2, password);
                    ResultSet rs = pst.executeQuery();

                    if (rs.next()) {
                        session.setAttribute("doctorEmail", email);
                        response.sendRedirect("doctor_dashboard.jsp");
                    } else {
                        out.println("<p style='color:red;'>Invalid Email or Password!</p>");
                    }
                } catch (SQLException e) {
                    out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
                }
            }
        %>
    </div>
</body>
</html>