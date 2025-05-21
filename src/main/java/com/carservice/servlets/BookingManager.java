package com.carservice.servlets;

import com.carservice.models.Booking;
import com.carservice.models.BookingList;
import com.carservice.models.BookingNode;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookingManager {

    public static List<Map<String, String>> loadAndSortBookings(String filePath, String loggedInUserName) {
        BookingList bookingList = new BookingList();
        try {
            for (String line : Files.readAllLines(Paths.get(filePath))) {
                String[] parts = line.split(",");
                if (parts.length == 6) {
                    String name = parts[0];
                    if (loggedInUserName == null || name.equalsIgnoreCase(loggedInUserName)) {
                        Booking booking = new Booking(
                                parts[0], // name
                                parts[1], // number
                                parts[2], // vehicle
                                parts[3], // make
                                parts[4], // date
                                parts[5]  // service
                        );
                        bookingList.add(booking);
                    }
                }
            }

            bookingList.selectionSortByDate();

        } catch (IOException e) {
            e.printStackTrace();
        }

        // Convert BookingList to List<Map<String, String>>
        List<Map<String, String>> result = new ArrayList<>();
        BookingNode current = bookingList.getHead();
        while (current != null) {
            Booking booking = current.booking;
            Map<String, String> bookingMap = new HashMap<>();
            bookingMap.put("name", booking.name);
            bookingMap.put("number", booking.number);
            bookingMap.put("vehicle", booking.vehicle);
            bookingMap.put("make", booking.make);
            bookingMap.put("date", booking.date);
            bookingMap.put("service", booking.service);
            result.add(bookingMap);
            current = current.next;
        }
        return result;
    }

    public static List<Map<String, String>> loadAndSortBookings(String filePath) {
        return loadAndSortBookings(filePath, null);
    }

    public static void saveBookings(String filePath, BookingList bookingList) throws IOException {
        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(filePath))) {
            BookingNode current = bookingList.getHead();
            while (current != null) {
                writer.write(current.booking.toString());
                writer.newLine();
                current = current.next;
            }
        }
    }
}
