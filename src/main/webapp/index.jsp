<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

   <!-- CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link href="css/Style.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
       .banner-background {
           clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
       }
   </style>

</head>
<body>

    <%
    Connection con=ConnectionProvider.getConnection();
    %>

    <!--Navbar-->

    <%@ include file="NavBar.jsp" %>

    <!--Banner-->

    <%@ include file="Banner.jsp" %>

    <!--Cards-->

    <%@ include file="Cards.jsp" %>


    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>>

    <script src="js/Myjs.js" type="text/javascript"></script>


  <script>
$(document).ready(function() {
    console.log("Loaded.....");

    $('#reg_form').on("submit", function(event) {
        event.preventDefault(); // Prevent default form submission

        let form = new FormData(this); // Creating FormData object

        $('#submit-btn').hide();
        $('#loader').show();

        $.ajax({
            url: "RegisterServlet", // Ensure this matches your servlet mapping
            type: "POST",
            data: form,
            processData: false, // Prevent jQuery from converting FormData
            contentType: false, // Prevent jQuery from overriding Content-Type
            success: function(response) {
                console.log("Success:", response);

                $('#submit-btn').show();
                $('#loader').hide();

                response = response.trim(); // Trim response to avoid whitespace issues

                if (response === "success") {
                    swal("Registration Successful!", "Redirecting to login page...", "success")
                    .then(() => {
                        window.location.href = "Login_page.jsp"; // Redirect on success
                    });
                } else {
                    swal("Error", response, "error"); // Show error message
                }
            },
            error: function(xhr, status, error) {
                $('#submit-btn').show();
                $('#loader').hide();
                console.error("AJAX Error:", error);
                swal("Something Went Wrong!", "Please try again.", "error");
            }
        });
    });
});
  </script>

</body>
</html>
