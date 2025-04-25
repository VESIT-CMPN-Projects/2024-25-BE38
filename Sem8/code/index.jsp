<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Monitoring System</title>
    
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

        .nav-links {
            display: flex;
            transition: all 0.3s ease;
        }

        .nav-links a {
            color: #555;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            padding: 8px 12px;
            border-radius: 5px;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-links a:hover {
            background: rgba(255, 255, 255, 0.5);
            transform: scale(1.1);
            color: #FF8C94;
        }

        /* Toggle Button */
        .toggle-btn {
            display: none;
            font-size: 24px;
            cursor: pointer;
        }

        /* Hero Section */
        .container {
            padding: 150px 20px 50px;
            text-align: center;
        }

        /* Enhanced Title */
        h1 {
            font-size: 3.5rem;
            font-weight: 700;
            text-transform: uppercase;
            background: linear-gradient(45deg, #FF8C94, #FFB6C1, #FF8C94);
            -webkit-background-clip: text;
            color: transparent;
            text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.2);
            animation: gradientMove 3s linear infinite alternate;
            transition: transform 0.3s ease;
        }

        h1:hover {
            transform: scale(1.05);
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
            position: relative;
            animation: fadeInUp 1s ease-out;
        }

        .flashcard:hover {
            transform: translateY(-10px) scale(1.1);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            background: rgba(255, 255, 255, 0.9);
            cursor: pointer;
        }

        .flashcard i {
            font-size: 40px;
            color: #FF8C94;
            margin-bottom: 10px;
            transition: all 0.3s ease;
        }

        .flashcard:hover i {
            transform: rotate(360deg);
            color: #B22222;
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

        /* Animations */
        @keyframes gradientMove {
            from { background-position: left; }
            to { background-position: right; }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
                flex-direction: column;
                position: absolute;
                top: 60px;
                right: 0;
                background: rgba(255, 248, 220, 0.95);
                width: 200px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
                border-radius: 5px;
                padding: 10px 0;
                text-align: center;
            }

            .nav-links a {
                display: block;
                margin: 10px 0;
            }

            .toggle-btn {
                display: block;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div><i class="fas fa-heartbeat"></i> Health Monitoring System</div>
        <div class="toggle-btn" onclick="toggleMenu()">
            <i class="fas fa-bars"></i>
        </div>
        <div class="nav-links">
            <a href="admin_login.jsp"><i class="fas fa-user-shield"></i> Admin</a>
            <a href="doctor_login.jsp"><i class="fas fa-user-md"></i> Doctor</a>
            <a href="login_mother.jsp"><i class="fas fa-female"></i> Mother</a>
            <a href="contact.jsp"><i class="fas fa-envelope"></i> Contact Us</a>
        </div>
    </div>

    <!-- Hero Section -->
    <div class="container">
        <h1>Welcome to the <span class="typing">Health Monitoring System</span></h1>
        <p>Track maternal and fetal health effortlessly with advanced monitoring and expert insights.</p>

        <!-- Flashcards -->
        <div class="flashcard-container">
            <div class="flashcard">
                <i class="fas fa-baby"></i>
                <h3>Fetal Health Specialist</h3>
                <p>Our experts monitor and provide insights on fetal heart rate and movement.</p>
            </div>

            <div class="flashcard">
                <i class="fas fa-heartbeat"></i>
                <h3>Maternal Health Specialist</h3>
                <p>Dedicated monitoring of maternal heart rate to ensure the mother's well-being.</p>
            </div>

            <div class="flashcard">
                <i class="fas fa-user-nurse"></i>
                <h3>Pediatric Specialist</h3>
                <p>Ensuring your baby's health before and after birth with expert guidance.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2025 Health Monitoring System. Designed with <i class="fas fa-heart"></i> by the team. <a href="#">Privacy Policy</a>
    </footer>

    <script>
        function toggleMenu() {
            var nav = document.querySelector(".nav-links");
            nav.style.display = (nav.style.display === "flex") ? "none" : "flex";
        }
    </script>

</body>
</html>
