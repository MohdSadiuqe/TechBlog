package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class EditProfileServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
//      Fetch all Data

        String email=request.getParameter("user_email");
        String name=request.getParameter("user_name");
        String password=request.getParameter("user_password");
        String about=request.getParameter("user_about");

//       Get the User from the Session

        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("currentUser");
        user.setEmail(email);
        user.setName(name);
        user.setPassword(password);
        user.setAbout(about);

//        Update the User

        UserDao UserDao=new UserDao(ConnectionProvider.getConnection());
        boolean ans= UserDao.updateUser(user);
        if(ans){
            out.println("<h1>Profile Updated Successfully</h1>");
        }
        else{
            out.println("<h1>Something went wrong...</h1>");
        }
    }
}