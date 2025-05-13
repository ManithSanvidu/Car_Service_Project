package com.carservice.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/EditBookingServlet")
public class EditBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String number = request.getParameter("number");
        String date = request.getParameter("date");
        String serviceType = request.getParameter("serviceType");
        String vehicle = request.getParameter("vehicle");

        String filePath = getServletContext().getRealPath("/txtfiles/bookings.txt");
        String loggedInUserName = (String) request.getSession().getAttribute("username");

        List<Map<String, String>> bookings = BookingManager.loadAndSortBookings(filePath, loggedInUserName);
        boolean updated = false;

        for (Map<String, String> booking : bookings) {
            if (booking.get("number").equals(number)) {
                // Update only editable fields
                booking.put("date", date);
                booking.put("service", serviceType);
                booking.put("vehicle", vehicle);
                updated = true;
                break;
            }
        }

        if (updated) {
            BookingManager.saveBookings(filePath, bookings);
        }

        // Redirect to serviceHistory.jsp after update
        response.sendRedirect("serviceHistory.jsp");
    }
}
