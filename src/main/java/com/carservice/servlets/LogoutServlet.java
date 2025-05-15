package com.carservice.servlets;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidate the current session
        HttpSession session = request.getSession(false); // Avoid creating a new session
        if (session != null) {
            session.invalidate();
        }

        // Redirect to index.jsp
        response.sendRedirect("index.jsp");
    }
}
