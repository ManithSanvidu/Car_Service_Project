<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.carservice.servlets.BookingManager, java.util.List, java.util.Map" %>
<html>
  <head>
    <title>Service History</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/booking.css" rel="stylesheet">
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light sticky-top p-0" style="background-color: oklch(0.511 0.262 276.966);">
        <a href="welcome.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-white" style="font-family: 'Papyrus', serif;"><i class="fa fa-car me-3"></i>AutoCare Tracker</h2>
        </a>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="index.jsp" class="nav-item nav-link">Home</a>
                <a href="newBooking.jsp" class="nav-item nav-link active">New Booking</a>
                <a href="booking.jsp" class="nav-item nav-link">Service History</a>
                <a href="User.jsp" class="nav-item nav-link">User</a>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->

    <div class="container mt-5">
      <h1 class="text-center mb-4">Service History</h1>
      <button class="btn btn-primary mb-4" onclick="window.location.href='newBooking.jsp'">Create New Booking</button>
      <ul class="booking-list">
        <%
          String filePath = application.getRealPath("/txtfiles/bookings.txt");
          List<Map<String, String>> bookings = BookingManager.loadAndSortBookings(filePath);

          for (Map<String, String> booking : bookings) {
        %>
        <li class="booking-item d-flex justify-content-between align-items-center">
          <div class="booking-details">
            <p><strong>Car Number:</strong> <%= booking.get("number") %></p>
            <p><strong>Date:</strong> <%= booking.get("date") %></p>
            <p><strong>Service Type:</strong> <%= booking.get("service") %></p>
            <p><strong>Vehicle Type:</strong> <%= booking.get("vehicle") %></p>
          </div>
          <div class="actions">
            <button class="btn btn-success" onclick="window.location.href='newBooking.jsp?id=<%= booking.get("number") %>'">Edit</button>
              <button class="btn btn-danger" onclick="if(confirm('Are you sure you want to delete this booking?')) window.location.href='deleteBooking?id=<%= booking.get("number") %>'">Delete</button>
          </div>
        </li>
        <% } %>
      </ul>
    </div>
  </body>
</html>
