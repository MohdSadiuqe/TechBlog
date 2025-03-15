package com.tech.blog.servlets;

import com.tech.blog.entities.Message;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LogoutServlet extends HttpServlet {

    // ✅ Allow GET requests for logout
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        session.removeAttribute("currentUser");

        Message message = new Message("Logout Successfully", "success", "alert-success");
        session.setAttribute("message", message);

        response.sendRedirect("Login_page.jsp");
    }
}
