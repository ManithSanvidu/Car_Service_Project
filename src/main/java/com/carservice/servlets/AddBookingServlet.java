package com.carservice.servlets;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddBookingServlet extends HttpServlet {
    private static final String BOOKINGS_FILE_PATH = "c:\\Users\\HP\\IdeaProjects\\Car_Service_Project\\src\\main\\webapp\\txtfiles\\bookings.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String customerName = request.getParameter("customerName");
        String carNumber = request.getParameter("carNumber");
        String vehicleType = request.getParameter("vehicleType");
        String manufacturer = request.getParameter("manufacturer");
        String serviceDate = request.getParameter("serviceDate");
        String serviceType = request.getParameter("serviceType");


        String bookingDetails = String.format("%s,%s,%s,%s,%s,%s%n", customerName, carNumber, vehicleType, manufacturer, serviceDate, serviceType);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(BOOKINGS_FILE_PATH, true))) {
            writer.write(bookingDetails);
        }


        response.sendRedirect("serviceHistory.jsp");
    }
}