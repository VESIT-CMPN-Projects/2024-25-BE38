<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Patient List</title>

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #FFD3B6, #B5EAD7);
            color: #444;
            overflow-x: hidden;
        }

        /* Navbar Styling */
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
            color: #555;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            padding: 8px 12px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            background: rgba(255, 255, 255, 0.5);
            transform: scale(1.1);
            color: #FF8C94;
        }

        /* Table Styling */
        table {
            width: 80%;
            margin: 120px auto;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #FF8C94;
            color: white;
        }

        .action-btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        .view-btn { background: #4CAF50; color: white; }
        .edit-btn { background: #FFD700; color: black; }
        .delete-btn { background: #FF4500; color: white; }

        .action-btn:hover {
            opacity: 0.8;
            transform: scale(1.1);
        }

        /* Footer */
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

    <!-- Navbar -->
    <div class="navbar">
        <div>Doctor Dashboard</div>
        <div class="nav-links">
            <a href="doctor_dashboard.jsp">Back</a>
            <a href="doctor_logout.jsp">Logout</a>
        </div>
    </div>

    <h1 style="text-align: center; margin-top: 100px;">Patient List</h1>

    <table>
        <thead>
            <tr>
                <th>Patient ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = (Connection) application.getAttribute("conn");
                if (conn == null) {
                    out.println("<p style='color:red; text-align:center;'>Database Connection Error</p>");
                } else {
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        ps = conn.prepareStatement("SELECT id, name, email FROM mothers");
                        rs = ps.executeQuery();
                        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td>
                    <a href="patientProfile.jsp?patientId=<%= rs.getInt("id") %>">
                        <button class="action-btn view-btn">View</button>
                    </a>
                    <a href="editPatient.jsp?patientId=<%= rs.getInt("id") %>">
                        <button class="action-btn edit-btn">Edit</button>
                    </a>
                    <a href="deletePatient.jsp?patientId=<%= rs.getInt("id") %>" 
                       onclick="return confirm('Are you sure you want to delete this patient?');">
                        <button class="action-btn delete-btn">Delete</button>
                    </a>
                </td>
            </tr>
            <%
                        }
                    } catch (SQLException e) {
                        out.println("<p style='color:red; text-align:center;'>Error Fetching Data: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                    }
                }
            %>
        </tbody>
    </table>

    <footer>
        &copy; 2025 Health Monitoring System. Designed with <i class="fas fa-heart"></i> by the team. <a href="#">Privacy Policy</a>
    </footer>

</body>
</html>
