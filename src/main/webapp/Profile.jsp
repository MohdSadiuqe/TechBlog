<%@ page import="com.tech.blog.entities.User"%>
<%@ page errorPage="Error_page.jsp"%>
<%
   User user = (User) session.getAttribute("currentUser");
   if (user == null) {
       response.sendRedirect("Login_page.jsp");
       return;
   }
%>
<html>
  <head>
    <title>Profile</title>
      <!-- CSS -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
       <link href="css/Style.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <style>
       body {
            background: url("img/imgs.jpg");
            background-size: cover;
            background-attachment: fixed;
        }
       </style>
  </head>
  <body>

<!--NavBar-->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"> <span class="fa fa-paper-plane"></span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-bell-o"></span> LearnCode with Saad</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
          <span class="fa fa-id-card-o"></span> Category
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
         <li class="nav-item">
             <a class="nav-link disabled" href="#"><span class="fa fa-id-card-o"></span>Contact</a>
         </li>

         <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-model"><span class="fa fa-snowflake-o fa-spin"></span>Do Post</a>
         </li>
      </li>
    </ul>

    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-model">
          <span class="fa fa-user-circle"></span> <%= user.getName() %>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
      </li>
    </ul>
  </div>
</nav>

<!--End of NavBar-->

<!--main body of the page-->

<main>
     <div class="container">
          <div class="row mt-4">
          <!--First column-->
               <div class="col-md-4">

                    <!--Categories-->

                    <div class="list-group">
                      <a href="#" onclick="getPosts(0,this) " class=" c-link list-group-item list-group-item-action active" aria-current="true">
                        All posts
                      </a>
                    <%
                        PostDao dao = new PostDao(ConnectionProvider.getConnection());
                        ArrayList<Category> list1 = dao.getCategories();
                        for (Category cc : list1) {
                    %>
                        <a href="#"  onclick="getPosts(<%=cc.getCid()%>,this) "  class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                    <%
                        }
                    %>

                    </div>
               </div>
          <!--Second column-->
               <div class="col-md-8" id="post-container">

                    <!--Posts-->

                    <div class="container text-center" id="loader">
                         <i class="fa fa-refresh fa-4x fa-spin"></i>
                         <h3 class="mt-2">Loading...</h3>
                    </div>

                    <div class="container-fluid" id="post-container">

                    </div>
               </div>
          </div>
     </div>
</main>

<!--end body of the page-->

<!--Profile Modal-->
<div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="profileLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white d-flex justify-content-between">
           <h5 class="modal-title">TechBlog</h5>
           <button type="button" class="close" data-dismiss="modal">
               <span>&times;</span>
           </button>
      </div>
      <div class="modal-body text-center">
         <h5 class="font-weight-bold"><%= user.getName() %></h5>
         <!--Details-->
         <div id="Profile_details">
         <table class="table">
           <tbody>
             <tr>
               <th scope="row">Id:</th>
               <td><%= user.getId() %></td>
             </tr>
             <tr>
               <th scope="row">Email</th>
               <td><%= user.getEmail() %></td>
             </tr>
             <tr>
               <th scope="row">Gender</th>
               <td><%= user.getGender() %></td>
             </tr>
                <tr>
                <th scope="row">About</th>
                <td><%= user.getAbout() %></td>
                </tr>
           </tbody>
         </table>
         </div>


         <!--profile Model-->
         <div id="Profile_edit" style="display: none;">
             <h3 class="mt-2">Please Edit Carefully</h3>
             <form action="EditProfileServlet" method="POST">
                 <table>
                     <tr>
                         <td>Id</td>
                         <td><%= user.getId() %></td>
                     </tr>
                     <tr>
                          <td>Email</td>
                          <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
                     </tr>
                     <tr>
                          <td>Name</td>
                          <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
                     </tr>

                      <tr>
                          <td>Password</td>
                          <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
                      </tr>
                       <tr>
                           <td>Gender</td>
                           <td><%= user.getGender().toUpperCase() %></td>
                       </tr>
                       <tr>
                            <td>About</td>
                            <td>
                                <textarea rows="4 " class="form-control" name="user_about"><%= user.getAbout() %>
                                </textarea>
                            </td>
                       </tr>
                 </table>
                  <div class="container">
                       <button type="submit" class="btn btn-primary">save</button>
                  </div>
             </form>
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile-button" class="btn btn-secondary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!--End of Profile Modal-->

<!--Add post Model-->

<!-- Button trigger modal -->


<!-- Add post Modal -->

<div class="modal fade" id="add-post-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="add-post-form" action="AddPostServlet" method="POST">
          <div class="form-group">
              <%@ page import="java.util.ArrayList" %>
              <%@ page import="com.tech.blog.entities.Category" %>
              <%@ page import="com.tech.blog.dao.PostDao" %>
              <%@ page import="com.tech.blog.helper.ConnectionProvider" %>

               <%
                  PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                  ArrayList<Category> categories = postDao.getCategories();
               %>

               <select class="form-control" name="cid">
                 <option selected disabled>---Select Category---</option>
              <%
                   if (categories != null && !categories.isEmpty()) {
                      for (Category category : categories) {
              %>
                      <option value="<%= category.getCid() %>"><%= category.getName() %></option>
              <%
                   }
                   } else {
              %>
             <option disabled>No Categories Found</option>
              <%
                   }
              %>
              </select>
          </div>

          <div class="form-group">
              <input type="text" placeholder="Title" class="form-control" name="pTitle">
          </div>

           <div class="form-group">
                <textarea class="form-control" style="height: 200px" placeholder="Enter Your Post" name="pContent"></textarea>
           </div>

           <div class="form-group">
                <textarea class="form-control" style="height: 200px" placeholder="Enter Your Program (if any)" name="pCode"></textarea>
           </div>
               <div class="container text-center">
                    <button type="submit" class="btn btn-outline-primary">Post</button>
               </div>
        </form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<!--End of Post model-->

<!-- JavaScript -->

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/Myjs.js"></script>
 <script>
   $(document).ready(function () {
       let editstatus=false;
       $('#edit-profile-button').click(function () {
           if(editstatus== false){
               $('#Profile_details').hide();
               $('#Profile_edit').show();
               editstatus=true;
               $(this).text('back');
           }
           else{
                $('#Profile_details').show();
                $('#Profile_edit').hide();
                editstatus = false; // Reset edit status
                $(this).text('Edit'); // Change button text back to "Edit"
           }
       });
   });
</script>

<!--now add post js-->

<script>
$(document).ready(function() {
    $("#add-post-form").on("submit", function(e) {
        e.preventDefault();  // Prevent default form submission

        $.ajax({
            url: "AddPostServlet",
            type: "POST",
            data: $(this).serialize(),
            beforeSend: function() {
                console.log("Submitting post...");
            },
            success: function(response) {
                console.log("Server Response: " + response);
                if (response.trim() === "done") {
                    swal("Success!", "Post added successfully!", "success")
                        .then((value) => {
                            location.reload();  // Reload the page to see the new post
                        });
                } else {
                    swal("Error!", "Failed to add post. Please try again.", "error");
                }
            },
            error: function(xhr, status, error) {
                console.log("AJAX Error: " + error);
                swal("Error!", "An unexpected error occurred.", "error");
            }
        });
    });
});

 </script>

<!--Loading Post ajax-->
 <script>

      function getPosts(catId,temp){
          $("#Loader").show();
          $("#post-container").hide();
          $(".c-link").removeClass("active");
          $.ajax({
              url:"Load_posts.jsp",
              data:{cid:catId},
              success: function(data,textStatus,jqXHR){
                  console.log(data);
                  $("#Loader").hide();
                  $("#post-container").show();
                  $("#post-container").html(data);
                  $(temp).addClass("active");
              }
          })
      }

      $(document).ready(function(e){
         let allPostRef=$(".c-link");
          getPosts(0,allPostRef[0]);

      });
 </script>
  </body>
</html>