package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain"); // Set response type as plain text
        PrintWriter out = response.getWriter();

        String user_check = request.getParameter("user_checkbox");

        if (user_check == null) {
            out.print("Please accept the Terms and Conditions.");
            return;
        }

        String name = request.getParameter("user_name");
        String email = request.getParameter("user_email");
        String password = request.getParameter("user_password");
        String gender = request.getParameter("user_gender");
        String about = request.getParameter("user_about");

        if (gender == null || gender.isEmpty()) {
            out.print("Error: Gender not selected.");
            return;
        }

        User user = new User(name, email, password, gender, about);
        UserDao dao = new UserDao(ConnectionProvider.getConnection());

        if (dao.saveUser(user)) {
            out.print("success"); // Send success message
        } else {
            out.print("Something went wrong! Please try again.");
        }
    }
}
