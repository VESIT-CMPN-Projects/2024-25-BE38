<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
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
            color: #8B4513;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            padding: 8px 12px;
            border-radius: 5px;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-links a:hover {
            background: #FFD3B6;
            color: #B22222;
            transform: scale(1.1);
        }

        .container {
            padding: 150px 20px 20px;
            text-align: center;
        }

        h2 {
            font-size: 2.5rem;
            margin: 20px 0;
            color: #333;
            letter-spacing: 2px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        p {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 40px;
        }

        /* Flashcards */
        .flashcard-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .flashcard {
            background: rgba(255, 255, 255, 0.7);
            border-radius: 15px;
            padding: 20px;
            width: 300px;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            color: #444;
        }

        .flashcard:hover {
            transform: translateY(-10px) scale(1.1);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            background: rgba(255, 255, 255, 0.9);
            cursor: pointer;
        }

        /* Button Styling */
        .btn-custom {
            background: linear-gradient(to right, #FF8C94, #FFAAA5);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 15px;
            display: inline-block;
            transition: background 0.3s ease, transform 0.2s;
        }

        .btn-custom:hover {
            background: linear-gradient(to right, #E57373, #D32F2F);
            transform: scale(1.1);
        }

        /* Footer */
        footer {
            background: #FFF8DC;
            color: #555;
            text-align: center;
            padding: 20px;
            margin-top: 100px;
        }

        footer a {
            color: #FF8C94;
            text-decoration: none;
            font-weight: bold;
        }

        footer a:hover {
            color: #B22222;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>Doctor Dashboard</div>
        <div class="nav-links">
          
            <a href="javascript:void(0);" onclick="logout()">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>Welcome, Doctor!</h2>
        <p>Manage your patients and appointments efficiently.</p>

        <div class="flashcard-container">
            <div class="flashcard">
                <h3>My Patients</h3>
                <p>View and manage your assigned patients.</p>
                <a href="patientList.jsp" class="btn-custom">View Patients</a>
            </div>

            <div class="flashcard">
                <h3>Appointments</h3>
                <p>Check and schedule your appointments.</p>
                <a href="viewAppointments.jsp".jsp" class="btn-custom">View Appointments</a>
            </div>

            <div class="flashcard">
                <h3>Patient Messages</h3>
                <p>View and respond to messages from Patients..</p>
                <a href="chatDoctor.jsp" class="btn-custom">View Messages</a>
            </div>
        </div>
    </div>

    <footer>
        &copy; 2025 Health Monitoring System. Designed with <i class="fas fa-heart"></i> by the team. <a href="#">Privacy Policy</a>
    </footer>
    <script>
        function logout() {
            window.location.href = "index.jsp";
        }
    </script>
</body>
</html>
