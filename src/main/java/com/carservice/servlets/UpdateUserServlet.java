package com.carservice.servlets;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {

    private static final String USER_FILE_PATH = "C:\\Users\\HP\\IdeaProjects\\Car_Service_OOP_Project\\src\\main\\webapp\\txtfiles\\users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("useremail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get current session values
        String currentEmail = ((String) session.getAttribute("useremail")).trim();

        // Get form inputs
        String newUsername = request.getParameter("newUsername").trim();
        String newEmail = request.getParameter("newEmail").trim();
        String newPassword = request.getParameter("newPassword").trim();
        String confirmPassword = request.getParameter("confirmPassword").trim();
        String currentPassword = request.getParameter("currentPassword").trim();

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("editUser.jsp?error=Passwords+do+not+match");
            return;
        }

        File userFile = new File(USER_FILE_PATH);
        if (!userFile.exists()) {
            response.sendRedirect("editUser.jsp?error=User+file+not+found");
            return;
        }

        List<String> updatedUsers = new ArrayList<>();
        boolean userUpdated = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(userFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    String fileEmail = parts[0].trim();
                    String filePassword = parts[1].trim();
                    String fileUsername = parts[2].trim();
                    String fileMobile = parts[3].trim();

                    if (fileEmail.equals(currentEmail) && filePassword.equals(currentPassword)) {
                        // Update user
                        String updatedLine = newEmail + "," + newPassword + "," + newUsername + "," + fileMobile;
                        updatedUsers.add(updatedLine);
                        userUpdated = true;
                    } else {
                        updatedUsers.add(line);
                    }
                } else {
                    updatedUsers.add(line); // keep malformed lines
                }
            }
        }

        if (!userUpdated) {
            response.sendRedirect("editUser.jsp?error=Incorrect+current+password");
            return;
        }

        // Save updated content
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(userFile, false))) {
            for (String updatedLine : updatedUsers) {
                writer.write(updatedLine);
                writer.newLine();
            }
        }

        // Update session
        session.setAttribute("username", newUsername);
        session.setAttribute("useremail", newEmail);

        response.sendRedirect("User.jsp");
    }
}

