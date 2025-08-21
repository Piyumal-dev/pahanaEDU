<%@ page session="true" %>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.html");
    return;
  }
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* Navbar */
    nav {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        display: flex;
        justify-content: center;
        gap: 25px;
        padding: 15px 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        position: sticky;
        top: 0;
    }

    nav a {
        color: white;
        text-decoration: none;
        font-size: 1.05rem;
        font-weight: 500;
        position: relative;
        padding: 6px 8px;
        transition: color 0.3s ease;
    }

    nav a::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -3px;
        width: 0;
        height: 2px;
        background: white;
        transition: width 0.3s ease;
    }

    nav a:hover {
        color: #ffd700;
    }

    nav a:hover::after {
        width: 100%;
    }

    /* Container */
    .container {
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        padding: 40px 20px;
        color: white;
    }

    .container h1 {
        font-size: 2.2rem;
        margin-bottom: 10px;
    }

    .container p {
        font-size: 1.1rem;
        opacity: 0.85;
        max-width: 500px;
    }

    /* Card styling for welcome section */
    .welcome-card {
        background: rgba(255, 255, 255, 0.12);
        backdrop-filter: blur(8px);
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        margin-top: 20px;
    }

    @media (max-width: 600px) {
        nav {
            flex-wrap: wrap;
            gap: 15px;
        }
        .container h1 {
            font-size: 1.8rem;
        }
    }
</style>
</head>
<body>

<nav>
    <a href="customers"><i class="fas fa-users"></i> Customers</a>
    <a href="items"><i class="fas fa-box"></i> Items</a>
    <a href="help.html"><i class="fas fa-question-circle"></i> Help</a>
    <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</nav>

<div class="container">
    <div class="welcome-card">
        <h1>Welcome, <%= username %>!</h1>
        <p>Use the navigation above to manage customers, items, and billing efficiently.</p>
    </div>
</div>

</body>
</html>
