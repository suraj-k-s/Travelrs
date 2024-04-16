<%-- 
    Document   : EditProfile
    Created on : 23 Feb, 2024, 12:31:43 PM
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
    <%
        if (request.getParameter("save") != null) {
            String up = "update tbl_guide set guide_name='" + request.getParameter("name")  + "' ,guide_address='" + request.getParameter("address") + "',guide_email='" + request.getParameter("email") + "',guide_contact='" + request.getParameter("contact") + "' where guide_id='" + session.getAttribute("guideid") + "'";
            if (con.executeCommand(up));
            {

    %>
    <script>
        alert('updated');
        window.location = "MyProfile.jsp";
    </script>
    <%            }

        }
        String selqry = "select* from tbl_guide where guide_id='" + session.getAttribute("guideid") + "' ";
        ResultSet s1 = con.selectCommand(selqry);
        s1.next();


    %>



    <body>
        <h1>editprofile</h1>
        <form name="edit profile">
            <table border="2">
                 
            
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=s1.getString("guide_name")%>"></td>

                </tr>
                <tr>
                    <td>address</td>
                    <td><textarea name="address" rows="2" cols="20" value=""><%=s1.getString("guide_address")%></textarea></td>
                </tr>
                <tr>
                    <td>Email</td>
                     <td><input type="text" name="email" value="<%=s1.getString("guide_email")%>"></td> 
                </tr>
                <tr>
                    <td>Contact</td>
                     <td><input type="text"  name="contact" value="<%=s1.getString("guide_contact")%>"></td> 
                </tr>
                 
                   
                <tr>
                    <td colspan="2" text align="center">
                        <input type="submit" name="save" value="Update">
                    </td></tr>


          

            </table>
        </form>
    </body>
</html>
