<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<nav class="navbar">
    <h1 class="brand">AutoCare Tracker</h1>
    <div class="nav-links">
        <a href="Register.jsp">Register</a>
        <a href="login.jsp" class="active">LOG IN</a>
    </div>
</nav>
<div class="container">
    <div class="left-section">
        <h2>Welcome Back!</h2>
    </div>
    <div class="right-section">
        <div class="login-box">
            <h2>Log in</h2>
            <form action="login" method="post">
                <div class="input-group">
                    <label for="email">Email</label>
                    <i class="fa fa-user"></i>
                    <input type="text" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <i class="fa fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <div class="options">
                    <label><input type="checkbox"> Remember Me</label>
                    <a href="#">Forgot Password?</a>
                </div>
                <button type="submit" class="login-btn">Log in</button>
                <div class="separator">Or</div>
                <button type="button" class="signup-btn" onclick="location.href='Register.jsp'">Sign up</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
