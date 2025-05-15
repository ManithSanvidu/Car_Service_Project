package com.carservice.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final String FILE_PATH = "C:\\Users\\HP\\IdeaProjects\\Car_Service_OOP_Project\\src\\main\\webapp\\txtfiles\\users.txt";

    private static class User {
        String password;
        String username;

        User(String password, String username) {
            this.password = password;
            this.username = username;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Login form submitted");
        String email = request.getParameter("email");
        String password = request.getParameter("password");




        Map<String, User> users = loadUsers();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (users.containsKey(email) && users.get(email).password.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("useremail", email);
            session.setAttribute("username", users.get(email).username);
            response.sendRedirect("welcome.jsp");
        } else {
            out.println("<html><body>");
            out.println("<h3 style='color:red;'>Invalid email or password</h3>");
            out.println("<a href='login.jsp'>Try again</a>");
            out.println("</body></html>");
        }

        out.close();
    }

    private Map<String, User> loadUsers() throws IOException {
        Map<String, User> users = new HashMap<>();
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            System.out.println("File not found");
            return users;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    String email = parts[0].trim();
                    String password = parts[1].trim();
                    String username = parts[2].trim();
                    users.put(email, new User(password, username));
                }
            }
        } catch (IOException e) {
            System.err.println("ERROR: Failed to read user database: " + e.getMessage());
            throw e;
        }

        return users;
    }
}

