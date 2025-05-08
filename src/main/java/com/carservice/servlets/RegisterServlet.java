package com.carservice.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final String FILE_PATH = "C:\\Users\\HP\\IdeaProjects\\Car_Service_Project\\src\\main\\webapp\\txtfiles\\users.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String mobilePhone = request.getParameter("Mobile Phone");

        // Validate the form data (basic validation example)
        if (name == null || email == null || password == null || mobilePhone == null ||
                name.isEmpty() || email.isEmpty() || password.isEmpty() || mobilePhone.isEmpty()) {
            response.sendRedirect("register.jsp?error=Please fill all the fields.");
            return;
        }

        // Format the user data as 'username,password' (username is email here)
        String userData = email + "," + password + "," + name + "," + mobilePhone;

        // Save the user data to the file
        appendUserDataToFile(userData);

        // Redirect to login page after successful registration
        response.sendRedirect("login.jsp?success=Registration successful! Please log in.");

    }

    // Method to append user data to the file
    private void appendUserDataToFile(String userData) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(userData);
            writer.newLine();
        }
    }
}
