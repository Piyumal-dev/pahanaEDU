<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modern Login</title>
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
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
        overflow: hidden;
    }

    /* Glassmorphism container */
    .login-container {
        background: rgba(255, 255, 255, 0.12);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        border-radius: 18px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        width: 100%;
        max-width: 420px;
        padding: 30px;
        animation: fadeIn 0.8s ease;
        border: 1px solid rgba(255,255,255,0.2);
    }

    /* Header */
    .login-header {
        text-align: center;
        color: white;
        margin-bottom: 25px;
    }

    .login-header h1 {
        font-size: 2rem;
        font-weight: 700;
        letter-spacing: 1px;
    }

    .login-header p {
        opacity: 0.85;
        font-size: 1.05rem;
    }

    /* Input Group */
    .input-group {
        margin-bottom: 20px;
        position: relative;
    }

    .input-icon {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #aaa;
        font-size: 1.1rem;
    }

    .input-group input {
        width: 100%;
        padding: 14px 14px 14px 45px;
        border-radius: 12px;
        border: none;
        background: rgba(255,255,255,0.15);
        color: white;
        font-size: 1rem;
        outline: none;
        transition: all 0.3s ease;
    }

    .input-group input::placeholder {
        color: rgba(255,255,255,0.6);
    }

    .input-group input:focus {
        background: rgba(255,255,255,0.25);
        box-shadow: 0 0 0 3px rgba(255,255,255,0.15);
    }

    /* Button */
    .login-button {
        background: linear-gradient(135deg, #4776E6, #8E54E9);
        color: white;
        border: none;
        border-radius: 12px;
        padding: 14px;
        width: 100%;
        font-size: 1.05rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .login-button:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(142,84,233,0.4);
    }

    .login-button:active {
        transform: translateY(0);
    }

    /* Error Message */
    .error-message {
        background: rgba(255, 0, 0, 0.15);
        color: #ff6b6b;
        padding: 12px;
        border-radius: 10px;
        font-weight: 500;
        font-size: 0.95rem;
        display: flex;
        align-items: center;
        gap: 8px;
        margin-top: 15px;
        border-left: 4px solid #ff6b6b;
    }

    /* Animation */
    @keyframes fadeIn {
        from {opacity: 0; transform: scale(0.95);}
        to {opacity: 1; transform: scale(1);}
    }
</style>
</head>
<body>

<div class="login-container">
    <div class="login-header">
        <h1>Welcome Back</h1>
        <p>Sign in to access your account</p>
    </div>

    <form method="post" action="login" class="login-form">
        <div class="input-group">
            <i class="fas fa-user input-icon"></i>
            <input type="text" id="username" name="username" required placeholder="Username">
        </div>

        <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" id="password" name="password" required placeholder="Password">
        </div>

        <button type="submit" class="login-button">
            <i class="fas fa-sign-in-alt"></i> Login
        </button>
    </form>

    <% if(request.getAttribute("error") != null) { %>
        <div class="error-message">
            <i class="fas fa-exclamation-circle"></i>
            <div><%= request.getAttribute("error") %></div>
        </div>
    <% } %>
</div>

<script>
    document.querySelector('.login-button').addEventListener('click', function() {
        this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Authenticating...';
        setTimeout(() => { this.innerHTML = '<i class="fas fa-sign-in-alt"></i> Login'; }, 20000);
    });
</script>

</body>
</html>
