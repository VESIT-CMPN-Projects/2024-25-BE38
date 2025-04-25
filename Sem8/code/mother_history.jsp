<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Heart Rate & Baby's Movement</title>

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        body, html {
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

        /* Graph Layout */
        .graph-wrapper {
            width: 100%;
            max-width: 600px; /* Adjusted size */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 100px;
        }

        .graph-container {
            width: 100%;
            aspect-ratio: 16 / 9; /* Makes iframe responsive */
            display: flex;
            justify-content: center;
            align-items: center;
            background: none; /* Removes background */
            box-shadow: none; /* Removes any shadow */
            border: none;
            padding: 0;
            margin: 0 auto;
            overflow: hidden;
        }

        .graph-container iframe {
            width: 100%;
            height: 100%;
            border: none;
            display: block;
            background: transparent;
        }

        /* Button Styling */
        .toggle-button {
            background: #FF8C94;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
            margin: 20px 0;
        }

        .toggle-button:hover {
            background: #FF5A5F;
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
        <div>Mother's Dashboard</div>
        <div class="nav-links">
            <a href="mother_dashboard.jsp">Dashboard</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <!-- Main Content -->
    <h1 style="text-align: center; margin-top: 80px;">My Heart Rate & Baby's Movement</h1>

    <!-- Mother's Heart Rate Graph -->
    <div class="graph-wrapper">
        <h2>Mother's Heart Rate</h2>
        <div class="graph-container">
            <iframe src="https://thingspeak.com/channels/2883046/charts/1?bgcolor=transparent&color=%23d62020&dynamic=true"></iframe>
        </div>
    </div>

    <!-- Toggle Button for Baby's Movement -->
    <button class="toggle-button" onclick="toggleMovement()">Show Baby's Movement</button>

    <!-- Baby's Movement Graphs (Initially Hidden) -->
    <div id="babyMovementGraphs" style="display: none;">
        <h2>Baby's Movement (X, Y, Z Axes)</h2>
        <div class="graph-wrapper">
            <div class="graph-container">
                <iframe src="https://thingspeak.com/channels/2882992/charts/1?bgcolor=transparent&color=%23ff0000&dynamic=true"></iframe>
            </div>
            <div class="graph-container">
                <iframe src="https://thingspeak.com/channels/2882992/charts/2?bgcolor=transparent&color=%2300ff00&dynamic=true"></iframe>
            </div>
            <div class="graph-container">
                <iframe src="https://thingspeak.com/channels/2882992/charts/3?bgcolor=transparent&color=%230000ff&dynamic=true"></iframe>
            </div>
        </div>
    </div>

    <!-- Footer -->
  

    <!-- JavaScript -->
    <script>
        function toggleMovement() {
            let graphDiv = document.getElementById("babyMovementGraphs");
            let button = document.querySelector(".toggle-button");

            if (graphDiv.style.display === "none") {
                graphDiv.style.display = "block";
                button.textContent = "Hide Baby's Movement";
            } else {
                graphDiv.style.display = "none";
                button.textContent = "Show Baby's Movement";
            }
        }
    </script>
 <footer>
    &copy; 2025 Health Monitoring System. Designed with <i class="fas fa-heart"></i> by the team. <a href="#">Privacy Policy</a>
</footer>
</body>
</html>
