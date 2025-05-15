package com.carservice.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import java.util.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {

    private List<Map<String, String>> loadRecentFeedbacks(HttpServletRequest request) throws IOException {
        String relativePath = "/txtfiles/feedback.txt";
        String absolutePath = getServletContext().getRealPath(relativePath);
        Path feedbackFilePath = Paths.get(absolutePath);

        List<Map<String, String>> recentFeedbacks = new ArrayList<>();

        if (!Files.exists(feedbackFilePath)) return recentFeedbacks;

        List<String> lines = Files.readAllLines(feedbackFilePath);
        List<List<String>> feedbackBlocks = new ArrayList<>();
        List<String> currentBlock = new ArrayList<>();

        for (String line : lines) {
            if (line.equals("---------------------------")) {
                if (!currentBlock.isEmpty()) {
                    feedbackBlocks.add(new ArrayList<>(currentBlock));
                    currentBlock.clear();
                }
            } else {
                currentBlock.add(line);
            }
        }

        int start = Math.max(feedbackBlocks.size() - 3, 0);
        for (int i = feedbackBlocks.size() - 1; i >= start; i--) {
            List<String> block = feedbackBlocks.get(i);
            Map<String, String> feedbackMap = new HashMap<>();
            for (String entry : block) {
                String[] parts = entry.split(": ", 2);
                if (parts.length == 2) {
                    feedbackMap.put(parts[0].trim(), parts[1].trim());
                }
            }
            recentFeedbacks.add(feedbackMap);
        }

        return recentFeedbacks;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form fields
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        String date = new Date().toString();

        // Format and write feedback
        String feedbackData = String.format(
                "Name: %s%nEmail: %s%nSubject: %s%nMessage: %s%nDate: %s%n---------------------------%n",
                name, email, subject, message, date
        );

        String relativePath = "/txtfiles/feedback.txt";
        String absolutePath = getServletContext().getRealPath(relativePath);
        Path feedbackFilePath = Paths.get(absolutePath);

        Files.createDirectories(feedbackFilePath.getParent());
        Files.write(feedbackFilePath, feedbackData.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.APPEND);

        // Load updated feedbacks and forward to contact.jsp
        List<Map<String, String>> recentFeedbacks = loadRecentFeedbacks(request);
        request.setAttribute("recentFeedbacks", recentFeedbacks);
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> recentFeedbacks = loadRecentFeedbacks(request);
        request.setAttribute("recentFeedbacks", recentFeedbacks);
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }
}
