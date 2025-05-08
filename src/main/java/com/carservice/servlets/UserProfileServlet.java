package com.carservice.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {
    private static final String FILE_PATH = "C:\\Users\\HP\\IdeaProjects\\Car_Service_Project\\src\\main\\webapp\\txtfiles\\users.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String email = (String) session.getAttribute("userEmail");

        File file = new File(FILE_PATH);
        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "User file not found.");
            return;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            boolean found = false;

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    String storedEmail = parts[0].trim();
                    if (storedEmail.equals(email)) {
                        String name = parts[2].trim();
                        String mobile = parts[3].trim();

                        request.setAttribute("name", name);
                        request.setAttribute("email", storedEmail);
                        request.setAttribute("mobile", mobile);

                        found = true;
                        break;
                    }
                }
            }

            if (found) {
                request.getRequestDispatcher("userProfile.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
            }
        }
    }
}
