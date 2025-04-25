<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Real-Time Health Data</title>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #FFD3B6, #B5EAD7);
            color: #444;
            text-align: center;
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

        .navbar a {
            color: #555;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .navbar a:hover {
            color: #FF8C94;
        }

        .container {
            margin: 100px auto 50px;
            padding: 20px;
            width: 80%;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .data-box {
            background: #eaf4ff;
            padding: 15px;
            margin: 15px auto;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            width: 60%;
        }

        table {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
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

        .btn {
            padding: 10px 15px;
            background: #FF8C94;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 15px;
            font-weight: bold;
            transition: all 0.3s;
        }
        
        .btn:hover {
            background: #e76f7c;
        }

        footer {
            background: #FFF8DC;
            color: #555;
            text-align: center;
            padding: 20px;
            margin-top: 30px;
        }
    </style>

    <script>
        async function fetchThingSpeakData() {
            try {
                const response1 = await fetch('https://api.thingspeak.com/channels/2883046/feeds.json?results=5');
                const response2 = await fetch('https://api.thingspeak.com/channels/2882992/feeds.json?results=5');
                const data1 = await response1.json();
                const data2 = await response2.json();
                
                if (data1.feeds.length > 0) {
                    let heartRateValues = [];
                    let tableBody = "";
                    data1.feeds.forEach(feed => {
                        const date = feed.created_at.split("T")[0];
                        const heartRate = feed.field1 ? parseInt(feed.field1) : 0;
                        const babyHeartRate = feed.field2 ? parseInt(feed.field2) : 0;
                        heartRateValues.push(heartRate);

                        tableBody += `
                            <tr>
                                <td>${date}</td>
                                <td>${heartRate} bpm</td>
                                <td>${babyHeartRate} bpm</td>
                            </tr>`;
                    });
                    document.getElementById("heartRateTable").innerHTML = tableBody;

                    const avgHeartRate = heartRateValues.reduce((a, b) => a + b, 0) / heartRateValues.length;
                    document.getElementById("heartRateStatus").innerText = avgHeartRate >= 60 && avgHeartRate <= 120 ? "Normal" : "Abnormal";
                }

                if (data2.feeds.length > 0) {
                    let tableBody = "";
                    data2.feeds.forEach(feed => {
                        const date = feed.created_at.split("T")[0];
                        const x = feed.field1 ? parseInt(feed.field1) : 0;
                        const y = feed.field2 ? parseInt(feed.field2) : 0;
                        const z = feed.field3 ? parseInt(feed.field3) : 0;
                        const movementStatus = (x === 0 && y === 0 && z === 0) ? "Abnormal" : "Normal";

                        tableBody += `
                            <tr>
                                <td>${date}</td>
                                <td>${x}</td>
                                <td>${y}</td>
                                <td>${z}</td>
                                <td>${movementStatus}</td>
                            </tr>`;
                    });
                    document.getElementById("movementTable").innerHTML = tableBody;
                }

            } catch (error) {
                console.error("Error fetching data:", error);
            }
        }

        window.onload = fetchThingSpeakData;
    </script>
</head>
<body>

    <div class="navbar">
        <div>Real-Time Health Data</div>
        <div>
            <a href="mother_dashboard.jsp">Dashboard</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>Real-Time Health Data</h2>

        <h3>Mother & Baby Heart Rate</h3>
        <div id="heartRateStatus" class="data-box">Loading...</div>

        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Mother's Heart Rate</th>
                    <th>Baby's Heart Rate</th>
                </tr>
            </thead>
            <tbody id="heartRateTable">
                <tr><td colspan="3">Loading data...</td></tr>
            </tbody>
        </table>

        <h3>Baby's Movement (Accelerometer Data)</h3>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>X-Axis</th>
                    <th>Y-Axis</th>
                    <th>Z-Axis</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody id="movementTable">
                <tr><td colspan="5">Loading data...</td></tr>
            </tbody>
        </table>
    </div>

    <footer>
        &copy; 2025 Health Monitoring System. Designed by the team. <a href="privacy.jsp" style="color:#FF8C94;">Privacy Policy</a>
    </footer>
</body>
</html>
