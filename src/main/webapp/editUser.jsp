<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("useremail");
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Edit User Info</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body class="container mt-5">
<h2>Edit Profile</h2>

<% if (error != null && !error.trim().isEmpty()) { %>
<div class="alert alert-danger" role="alert">
    <%= error.replace("+", " ") %>
</div>
<% } %>

<form action="UpdateUserServlet" method="post" novalidate>
    <div class="mb-3">
        <label for="newUsername" class="form-label">New Username</label>
        <input type="text" id="newUsername" name="newUsername" class="form-control" value="<%= username %>" required minlength="3" />
    </div>

    <div class="mb-3">
        <label for="newEmail" class="form-label">New Email</label>
        <input type="email" id="newEmail" name="newEmail" class="form-control" value="<%= email %>" required />
    </div>

    <div class="mb-3">
        <label for="newPassword" class="form-label">New Password</label>
        <input type="password" id="newPassword" name="newPassword" class="form-control" required minlength="6" />
    </div>

    <div class="mb-3">
        <label for="confirmPassword" class="form-label">Confirm New Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required minlength="6" />
    </div>

    <div class="mb-3">
        <label for="currentPassword" class="form-label">Current Password</label>
        <input type="password" id="currentPassword" name="currentPassword" class="form-control" required />
    </div>

    <button type="submit" class="btn btn-primary">Update</button>
</form>
</body>
</html>
