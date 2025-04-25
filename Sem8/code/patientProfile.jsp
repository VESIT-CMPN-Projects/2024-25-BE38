<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Profile</title>
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #FFD3B6, #B5EAD7);
            color: #444;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            height: 100vh;
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
            color: #B22222;
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
            color: #FF4500;
        }

        .container {
            max-width: 900px;
            margin: 100px auto 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #aaa;
            background: white;
        }

        h2, h3 {
            color: #444;
        }

        .graph-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            justify-content: center;
            align-items: center;
        }

        .graph-card {
            width: 450px;
            height: 260px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div><i class="fas fa-heartbeat"></i> Health Monitoring System</div>
        <div class="nav-links">
            <a href="patientList.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="contact.jsp"><i class="fas fa-envelope"></i> Contact</a>
        </div>
    </div>

    <div class="container">
        <h2>Patient Profile</h2>
        
        <div class="graph-container">
            <div class="graph-card">
                <h3>Mother's Heart Rate</h3>
                <iframe width="450" height="260" src="https://thingspeak.com/channels/2883046/charts/1?api_key=MT3W3OA0TM5OIZAI&width=450&height=260&results=10&dynamic=true"></iframe>
            </div>

            <div class="graph-card">
                <h3>Baby Movement X-Axis</h3>
                <iframe width="450" height="260" src="https://thingspeak.com/channels/2882992/charts/1?api_key=FWFQXVQB3QQYFOQD&width=450&height=260&results=10&dynamic=true"></iframe>
            </div>

            <div class="graph-card">
                <h3>Baby Movement Y-Axis</h3>
                <iframe width="450" height="260" src="https://thingspeak.com/channels/2882992/charts/2?api_key=FWFQXVQB3QQYFOQD&width=450&height=260&results=10&dynamic=true"></iframe>
            </div>

            <div class="graph-card">
                <h3>Baby Movement Z-Axis</h3>
                <iframe width="450" height="260" src="https://thingspeak.com/channels/2882992/charts/3?api_key=FWFQXVQB3QQYFOQD&width=450&height=260&results=10&dynamic=true"></iframe>
            </div>
        </div>
    </div>
</body>
</html>
