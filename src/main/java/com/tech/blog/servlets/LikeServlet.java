package com.tech.blog.servlets;
import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LikeServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // Get parameters from the request
        String operation = request.getParameter("operation");
        int uid = Integer.parseInt(request.getParameter("uid"));
        int pid = Integer.parseInt(request.getParameter("pid"));

        LikeDao likeDao=new LikeDao(ConnectionProvider.getConnection());
        if(operation.equals("like")) {
            boolean flag = likeDao.insertLike(pid, uid);
            out.println(flag);
        }
    }
}
