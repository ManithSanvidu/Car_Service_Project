package com.carservice.servlets;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class BookingManager {

    public static List<Map<String, String>> loadAndSortBookings(String filePath) {
        List<Map<String, String>> bookings = new LinkedList<>();
        try {
            List<String> lines = Files.readAllLines(Paths.get(filePath));
            for (String line : lines) {
                String[] parts = line.split(",");
                if (parts.length == 6) {
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

            // Selection sort to sort bookings by date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            for (int i = 0; i < bookings.size() - 1; i++) {
                int minIndex = i;
                for (int j = i + 1; j < bookings.size(); j++) {
                    Date date1 = dateFormat.parse(bookings.get(minIndex).get("date"));
                    Date date2 = dateFormat.parse(bookings.get(j).get("date"));
                    if (date2.before(date1)) {
                        minIndex = j;
                    }
                }
                if (minIndex != i) {
                    Map<String, String> temp = bookings.get(i);
                    bookings.set(i, bookings.get(minIndex));
                    bookings.set(minIndex, temp);
                }
            }
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
