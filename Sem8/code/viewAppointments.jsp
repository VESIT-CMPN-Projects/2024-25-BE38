<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments</title>

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
            display: flex;
            flex-direction: column;
            align-items: center;
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

        /* Content */
        .container {
            margin-top: 100px;
            text-align: center;
            width: 90%;
            max-width: 900px;
        }

        /* Button */
        .btn {
            background: #FF8C94;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
            margin-bottom: 20px;
            display: inline-block;
        }

        .btn:hover {
            background: #FF5A5F;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.9);
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

        /* Footer */
        footer {
            background: #FFF8DC;
            color: #555;
            text-align: center;
            padding: 20px;
            width: 100%;
            position: relative;
            bottom: 0;
        }

        footer a {
            color: #FF8C94;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div>Doctor's Dashboard</div>
        <div class="nav-links">
            <a href="mother_dashboard.jsp">Dashboard</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <!-- Appointment List -->
    <div class="container">
        <h1>My Appointments</h1>
        <a href="scheduleAppointment.jsp" class="btn">Schedule New Appointment</a>

        <table>
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th>Doctor</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Location</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>001</td>
                    <td>Dr. Sarah Smith</td>
                    <td>2025-04-05</td>
                    <td>10:00 AM</td>
                    <td>City Hospital, Room 204</td>
                    <td><button class="btn">Cancel</button></td>
                </tr>
                <tr>
                    <td>002</td>
                    <td>Dr. James Johnson</td>
                    <td>2025-04-07</td>
                    <td>02:30 PM</td>
                    <td>Sunshine Clinic</td>
                    <td><button class="btn">Cancel</button></td>
                </tr>
                <tr>
                    <td>003</td>
                    <td>Dr. Emily Williams</td>
                    <td>2025-04-10</td>
                    <td>11:00 AM</td>
                    <td>Family Care Center</td>
                    <td><button class="btn">Cancel</button></td>
                </tr>
                <tr>
                    <td>004</td>
                    <td>Dr. Andrew Brown</td>
                    <td>2025-04-12</td>
                    <td>09:30 AM</td>
                    <td>Wellness Medical Hub</td>
                    <td><button class="btn">Cancel</button></td>
                </tr>
                <tr>
                    <td>005</td>
                    <td>Dr. Olivia Taylor</td>
                    <td>2025-04-15</td>
                    <td>03:00 PM</td>
                    <td>Maternal Health Clinic</td>
                    <td><button class="btn">Cancel</button></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2025 Health Monitoring System. Designed with <i class="fas fa-heart"></i> by the team. <a href="#">Privacy Policy</a>
    </footer>



</body>
</html>
