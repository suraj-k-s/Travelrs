<%-- 
    Document   : Login
    Created on : 23 Feb, 2024, 12:30:05 PM
    Author     : Blesson MS George
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>

<%
    if (request.getParameter("btn_submit") != null) {
        String email = request.getParameter("txt_email");
        String password = request.getParameter("txt_password");

        String selectadmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
        ResultSet admin = con.selectCommand(selectadmin);

        String selectagency = "select * from tbl_agency where agency_email='" + email + "' and agency_password='" + password + "'";
        ResultSet agency = con.selectCommand(selectagency);

        String selectuser = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
        ResultSet user = con.selectCommand(selectuser);

//         Agency
        if (agency.next()) {
            session.setAttribute("agencyid", agency.getString("agency_id"));
            session.setAttribute("agencyname", agency.getString("agency_name"));
            response.sendRedirect("../Agency/HomePage.jsp");
        } //         user
        else if (user.next()) {
            session.setAttribute("userid", user.getString("user_id"));
            session.setAttribute("username", user.getString("user_name"));
            session.setAttribute("plac", user.getString("place_id"));
            response.sendRedirect("../User/HomePage.jsp");
        } //         Admin
        else if (admin.next()) {
            session.setAttribute("adminid", admin.getString("admin_id"));
            session.setAttribute("adminname", admin.getString("admin_name"));
            response.sendRedirect("../Admin/HomePage.jsp");
        } else {
%>
<script>
    alert("Email or Password Mistached");
</script>
<%
        }
    }
%>
<!doctype html>
<html lang="en">
    <head>
        <title>Login 10</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="../Assets/Template/Login/css/style.css">

    </head>
    <body class="img js-fullheight" style="background-image: url(../Assets/Template/Login/images/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Have an account?</h3>
                            <form action="#" class="signin-form" method="post">
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Email" name="txt_email" required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" name="txt_password" class="form-control" placeholder="Password" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="btn_submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>
                                <p class="w-100 text-center">&mdash; Or didn't have an account &mdash;</p>
                                  <div class="form-group">
                                      <div class="social d-flex text-center">
	          	<a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span>Register Now</a>
                                  
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <label class="checkbox-wrap checkbox-primary">
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="../Assets/Template/Login/js/jquery.min.js"></script>
        <script src="../Assets/Template/Login/js/popper.js"></script>
        <script src="../Assets/Template/Login/js/bootstrap.min.js"></script>
        <script src="../Assets/Template/Login/js/main.js"></script>

    </body>
</html>

