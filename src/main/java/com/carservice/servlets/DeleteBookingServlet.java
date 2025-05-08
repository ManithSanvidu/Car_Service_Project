package com.carservice.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import java.util.*;

@WebServlet("/deleteBooking") // Use this if you want to avoid editing web.xml
public class DeleteBookingServlet extends HttpServlet {

    private static final String BOOKINGS_FILE_PATH = "c:/Users/HP/IdeaProjects/Car_Service_Project/src/main/webapp/txtfiles/bookings.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id != null && !id.trim().isEmpty()) {
            Path path = Paths.get(BOOKINGS_FILE_PATH);

            if (Files.exists(path)) {
                List<String> lines = Files.readAllLines(path);
                List<String> updatedLines = new ArrayList<>();

                for (String line : lines) {
                    String[] parts = line.split(",");
                    if (parts.length >= 2 && !parts[1].equals(id)) {
                        updatedLines.add(line); // keep only if ID doesn't match
                    }
                }

                Files.write(path, updatedLines);
            }
        }

        response.sendRedirect("booking.jsp");
    }
}
