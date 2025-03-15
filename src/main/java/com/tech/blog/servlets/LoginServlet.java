package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Fetch Username and Password
        String email = request.getParameter("user_email");
        String password = request.getParameter("user_password");

        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User user = dao.getUserByEmailAndPassword(email, password);

        if (user == null) {
            Message message = new Message("Invalid email or password", "error", "alert-danger");
            HttpSession session = request.getSession();
            session.setAttribute("message", message);
            response.sendRedirect("Login_page.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            response.sendRedirect("Profile.jsp");
        }
    }
}
