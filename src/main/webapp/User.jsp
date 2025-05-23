<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("useremail");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/user.css">
    <title>User Profile</title>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light sticky-top p-0" style="background-color: oklch(0.511 0.262 276.966);">
    <a href="welcome.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <h2 class="m-0 text-white" style="font-family: 'Papyrus', serif;"><i class="fa fa-car me-3"></i>AutoCare Tracker</h2>
    </a>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="welcome.jsp" class="nav-item nav-link">Home</a>
            <a href="newBooking.jsp" class="nav-item nav-link">New Booking</a>
            <a href="serviceHistory.jsp" class="nav-item nav-link">Service History</a>
            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
            <a href="User.jsp" class="nav-item nav-link active">User</a>
        </div>
    </div>
</nav>

<!-- Profile Section -->
<div class="profile-container">
    <div class="greeting">Hi, <%= username != null ? username : "Guest" %></div>

    <div class="section-title">Account Information</div>

    <div class="info-item">
        <div>
            <span class="info-label">Username:</span>
            <span class="info-value"><%= username %></span>
        </div>
        <button class="change-btn" onclick="window.location.href='index.jsp'">Change</button>
    </div>

    <div class="info-item">
        <div>
            <span class="info-label">Email:</span>
            <span class="info-value"><%= email %></span>
        </div>
        <button class="change-btn" onclick="window.location.href='index.jsp'">Change</button>
    </div>

    <div class="info-item">
        <div>
            <span class="info-label">Password:</span>
            <span class="info-value">*******</span>
        </div>
        <button class="change-btn" onclick="window.location.href='index.jsp'">Change</button>
    </div>

    <div class="section-title">Booking List</div>
    <div class="booking-list">
        <%
            List<Map<String, String>> userBookings = (List<Map<String, String>>) request.getAttribute("userBookings");
            if (userBookings != null && !userBookings.isEmpty()) {
                for (Map<String, String> booking : userBookings) {
        %>
            <div class="booking-item">
                <div class="booking-info">
                    <span class="booking-label">Service:</span>
                    <span class="booking-value"><%= booking.get("service") %></span>
                </div>
                <div class="booking-info">
                    <span class="booking-label">Date:</span>
                    <span class="booking-value"><%= booking.get("date") %></span>
                </div>
            </div>
        <%
                }
            } else {
        %>
            <div class="no-bookings">No bookings found.</div>
        <%
            }
        %>
    </div>

    <form action="LogoutServlet" method="post">
        <input type="hidden" name="redirect" value="welcome.jsp">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
</div>
</body>
</html>
