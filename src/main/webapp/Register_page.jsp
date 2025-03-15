<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <title></title>
</head>
         <!-- CSS -->

         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <link href="css/Style.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <style>
             .banner-background {
                 clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
             }
         </style>
<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/Myjs.js"></script>
  <!--Navbar-->

  <%@ include file="NavBar.jsp" %>

  <main class="primary-background p-5" style="padding-bottom: 100px">
       <div class="container">
             <div class="col-md-6 offset-md-3">
                   <div class="card">
                        <div class="card-header primary-background text-white text-center">
                             <span class="fa fa-user-circle fa-2x"><span>
                             <br>
                             Register Here
                        </div>
                        <div class="card-body">
                              <form id="reg_form" action="RegisterServlet" method="post">
                                <div class="form-group">
                                     <label for="User_name">User Name</label>
                                     <input name="user_name" type="text" class="form-control" id="User_name" placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                   <label for="gender">Select Gender</label>
                                   <br>
                                   <input type="radio" id="gender_male" value="male" name="user_gender"> Male
                                   <input type="radio" id="gender_female" value="female" name="user_gender"> Female
                                </div>

                                <div class="form-group">
                                    <textarea name="user_about" class="form-control" id="" col="30" row="10" placeholder="Enter Something About Yoou..." ></textarea>
                                </div>

                                <div class="form-group form-check">
                                  <input name="user_checkbox" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree Terms and Condition</label>
                                </div>

                                <br>
                                <div class="container text-center" id="loader" style="display: none;">
                                        <script class="fa fa-refresh fa-spin fa-3x"></script>
                                        <h4>please wait...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                              </form>
                        </div>
                        <div class="card-footer">
                        </div>
                   </div>
             </div>
       </div>
  </main>

</body>
</head>