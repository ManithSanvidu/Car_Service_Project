package com.carservice.servlets;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class BookingManager {

    public static List<Map<String, String>> loadAndSortBookings(String filePath, String loggedInUserName) {
        List<Map<String, String>> bookings = new LinkedList<>();
        try {
            List<String> lines = Files.readAllLines(Paths.get(filePath));
            for (String line : lines) {
                String[] parts = line.split(",");
                if (parts.length == 6) {
                    // Add booking if loggedInUserName is null or matches the booking's name
                    if (loggedInUserName == null || parts[0].equalsIgnoreCase(loggedInUserName)) {
                        Map<String, String> booking = new HashMap<>();
                        booking.put("name", parts[0]);
                        booking.put("number", parts[1]);
                        booking.put("vehicle", parts[2]);
                        booking.put("make", parts[3]);
                        booking.put("date", parts[4]);
                        booking.put("service", parts[5]);
                        bookings.add(booking);
                    }
                }
            }

            // Sort the filtered list by date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            bookings.sort((b1, b2) -> {
                try {
                    Date date1 = dateFormat.parse(b1.get("date"));
                    Date date2 = dateFormat.parse(b2.get("date"));
                    return date1.compareTo(date2);
                } catch (ParseException e) {
                    return 0; // Keep original order if parsing fails
                }
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Overloaded method to handle calls without a username
    public static List<Map<String, String>> loadAndSortBookings(String filePath) {
        return loadAndSortBookings(filePath, null); // Pass null for loggedInUserName
    }

    public static void saveBookings(String filePath, List<Map<String, String>> bookings) throws IOException {
        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(filePath))) {
            for (Map<String, String> booking : bookings) {
                // Maintain the original order: name, number, vehicle, make, date, service
                writer.write(String.join(",",
                        booking.getOrDefault("name", ""),
                        booking.getOrDefault("number", ""),
                        booking.getOrDefault("vehicle", ""),
                        booking.getOrDefault("make", ""),
                        booking.getOrDefault("date", ""),
                        booking.getOrDefault("service", "")
                ));
                writer.newLine();
            }
        }
    }
}

