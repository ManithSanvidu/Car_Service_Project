<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/9/2025
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.carservice.servlets.BookingManager, java.util.List, java.util.Map" %>
<%
    String filePath = application.getRealPath("/txtfiles/bookings.txt");
    String carNumber = request.getParameter("id");
    Map<String, String> bookingToEdit = null;

    if (carNumber != null) {
        List<Map<String, String>> bookings = BookingManager.loadAndSortBookings(filePath);
        for (Map<String, String> booking : bookings) {
            if (booking.get("number").equals(carNumber)) {
                bookingToEdit = booking;
                break;
            }
        }
    }

    if (bookingToEdit == null) {
        response.sendRedirect("serviceHistory.jsp"); // Redirect if booking not found
        return;
    }
%>
<html>
<head>
    <title>Edit Booking</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/editServiceHistory.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Edit Booking</h2>
    <form action="EditBookingServlet" method="post">
        <div class="form-group">
            <label>Car Number:</label>
            <label>
                <input type="text" name="number" class="form-control" value="<%= bookingToEdit.get("number") %>" readonly>
            </label>
        </div>
        <div class="form-group">
            <label>Date:</label>
            <label>
                <input type="date" name="date" class="form-control" value="<%= bookingToEdit.get("date") %>" required>
            </label>
        </div>
        <div class="form-group">
            <label>
                <select id="serviceType" name="serviceType" class="form-control" required>
                    <option value="">Select Service Type</option>
                    <option value="Oil Change" <%= "Oil Change".equals(bookingToEdit.get("service")) ? "selected" : "" %>>Oil Change</option>
                    <option value="Engine Check" <%= "Engine Check".equals(bookingToEdit.get("service")) ? "selected" : "" %>>Engine Check</option>
                    <option value="Tire Replacement" <%= "Tire Replacement".equals(bookingToEdit.get("service")) ? "selected" : "" %>>Tire Replacement</option>
                    <option value="Battery Renewal" <%= "Battery Renewal".equals(bookingToEdit.get("service")) ? "selected" : "" %>>Battery Renewal</option>
                    <option value="Car Wash" <%= "Car Wash".equals(bookingToEdit.get("service")) ? "selected" : "" %>>Car Wash</option>
                </select>
            </label>
        </div>
        <div class="form-group">
            <label>Vehicle Type:</label>
            <label>
                <input type="text" name="vehicle" class="form-control" value="<%= bookingToEdit.get("vehicle") %>" required>
            </label>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary mt-3">Update Booking</button>
        </div>
    </form>
</div>
</body>
</html>
