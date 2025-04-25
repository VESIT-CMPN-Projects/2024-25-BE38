<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("motherEmail") == null) {
        response.sendRedirect("mother_login.jsp");
        return;
    }

    String email = (String) sessionObj.getAttribute("motherEmail");

    // Database Connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health_monitoring", "root", "abc123");

    PreparedStatement ps = con.prepareStatement("SELECT * FROM mothers WHERE email=?");
    ps.setString(1, email);
    ResultSet rs = ps.executeQuery();

    String motherName = "";
    int age = 0;
    String bloodGroup = "";
    String gestationalAge = "";
    String medicalConditions = "";
    String doctorAssigned = "";

    if (rs.next()) {
        motherName = rs.getString("name");
        // Add additional columns if they exist in your database
    }
    con.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mother Profile</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #FFD3B6, #B5EAD7);
            color: #444;
            overflow-x: hidden;
        }

        .navbar {
            background: #FFF8DC;
            color: #555;
            padding: 15px 20px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-links a {
            color: #8B4513;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            padding: 8px 12px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            background: #FFD3B6;
            color: #B22222;
        }

        .container {
            padding: 100px 20px 20px;
            text-align: center;
        }

        .profile-card {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            padding: 20px;
            width: 50%;
            margin: auto;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        .profile-card h2 {
            text-align: center;
        }

        .profile-info {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .btn-custom {
            background: linear-gradient(to right, #FF8C94, #FFAAA5);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            transition: background 0.3s ease, transform 0.2s;
            margin-top: 15px;
        }

        .btn-custom:hover {
            background: linear-gradient(to right, #E57373, #D32F2F);
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>Mother Dashboard</div>
        <div class="nav-links">
            <a href="mother_dashboard.jsp">Home</a>
            <a href="javascript:void(0);" onclick="logout()">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="profile-card">
            <h2>Mother's Profile</h2>
            <p class="profile-info"><strong>Name:</strong> <%= motherName %></p>
            <p class="profile-info"><strong>Email:</strong> <%= email %></p>
            <a href="editPatient.jsp" class="btn-custom">Edit Profile</a>
        </div>
    </div>

    <script>
        function logout() {
            window.location.href = "index.jsp";
        }
    </script>
</body>
</html>
