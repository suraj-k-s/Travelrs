<%-- 
    Document   : ChangePassword
    Created on : 23 Feb, 2024, 12:32:19 PM
    Author     : Blesson MS George
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@include file="Head_1.jsp" %>
        <h2>Book Package</h2>
    <% if (request.getParameter("save") != null) {
            String Cpass = request.getParameter("cpassword");
            String Npass = request.getParameter("newpassword");
            String REpass = request.getParameter("repassword");
            String seluser = "select * from tbl_agency where agency_password ='" + Cpass + "' and agency_id='" + session.getAttribute("agencyid") + "' ";
            out.print(seluser);
            ResultSet s1 = con.selectCommand(seluser);
            if (s1.next()) {
                if (Npass.equals(REpass)) {
                    String upd = "update tbl_agency set agency_password='" + REpass + "' where agency_id ='" + session.getAttribute("agencyid") + "' ";
                    if (con.executeCommand(upd)) {

                            %>
                            <script>

                                alert("password Changed");
                                window.location = "ChangePassword.jsp";

                            </script>
                            <%  }
                            } else {

                            %>
                            <script>

                                alert("password does not match");
                                window.location = "ChangePassword.jsp";

                            </script>
                            <%        }
                            } else {
                            %>
                            <script>
                                alert("Current password does not match");
                                window.location = "ChangePassword.jsp";
                            </script>

                            <%
                                    }
        }
    %>


    <body>
        <h1>Change password</h1>
        <form name="password">
            <table border="2">
                <tr>
                    <td>Current password</td>
                    <td>
                        <input type="text" name="cpassword">

                    </td>

                </tr>
                <tr>
                    <td>New password</td>
                    <td> <input type="text" name="newpassword"></td>
                </tr>
                <tr>
                    <td>Re password</td>
                    <td> <input type="text" name="repassword"></td>
                </tr>
                <td colspan="2" align="center">
                    <input type="submit" name="save" value="submit">
                    <input type="reset" name="cancel" value="cancel">
                </td>
            </table>
        </form>
    </body>
    <%@include file="Foot_1.jsp" %>
</html>
