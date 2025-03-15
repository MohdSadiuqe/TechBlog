<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page import="com.tech.blog.dao.LikeDao" %>
<%@ page import="com.tech.blog.dao.UserDao" %>
<div class="row">
<%
    User uuu=(User)session.getAttribute("currentUser");
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Posts> posts = null;
    if(cid==0){
        posts=dao.getPosts();
    }
    else{
        posts=dao.getPostsByCatId(cid);
    }
    if(posts.size()==0){
    out.println("<h3 class='display-4 text-center'>No Posts Found</h3></h3>");
    }
    for (Posts ps : posts) {  // Fixed loop syntax
%>
  <div class="col-md-6">
     <div class="card">
        <div class="card-body">
            <b><%= ps.getpTitle() %></b> <!-- Fixed method call and closing tag -->
            <p><%= ps.getpContent() %></p>
        </div>
        <div class="card-footer primary-background text-center">
             <%
                 LikeDao likeDao=new LikeDao(ConnectionProvider.getConnection());
             %>
             <a href="Show_blog_page.jsp?pid=<%= ps.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
             <a href="#!" onclick="doLike(<%= ps.getPid()%>, <%= ps.getUserId() %>)"class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up "><span><%=likeDao.countLikeOnPost(ps.getPid())%></span></i></a>

        </div>
     </div>
  </div>
<%
    }
%>
</div>
