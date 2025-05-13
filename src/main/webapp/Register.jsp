<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/31/2025
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<nav class="navbar">
    <h1 class="brand">AutoCare Tracker</h1>
    <div class="nav-links">
        <a href="login.jsp">LOG IN</a>
        <a href="Register.jsp" class="active">REGISTER</a>
    </div>
</nav>
<div class="container">
    <div class="left-section">
        <h2>Welcome Back!</h2>
    </div>
    <div class="right-section">
        <div class="login-box">
            <h2>Register</h2>

            <form action="register" method="post">
                <div class="input-group">
                    <label for="Name">Name</label>
                    <i class="fa fa-name"></i>
                    <input type="text" id="Name" name="Name" placeholder="Enter your name" required>
                </div>
                <div class="input-group">
                    <label for="Email">Email</label>
                    <i class="fa fa-lock"></i>
                    <input type="email" id="Email" name="Email" placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="Password">Password</label>
                    <i class="fa fa-lock"></i>
                    <input type="password" id="Password" name="Password" placeholder="Enter your password" required>
                </div>
                <div class="input-group">
                    <label for="Mobile Phone">Mobile Phone</label>
                    <i class="fa fa-phone"></i>
                    <input type="tel" id="Mobile Phone" name="Mobile Phone" placeholder="Enter your mobile phone no." required>
                </div>
                <div class="options">
                    <label><input type="checkbox">I agree with the Terms of service</label>
                </div>
                <button type="submit" class="signup-btn">Sign up</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
