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
     <%@include file="Head.jsp" %>
        <h2>My Profile</h2>
    <%
        
        if (request.getParameter("save") != null) {
           
            String up = "update tbl_agency set agency_name='" + request.getParameter("name")  + "' ,agency_address='" + request.getParameter("address") + "',agency_email='" + request.getParameter("email") + "',agency_contact='" + request.getParameter("contact") + "' where agency_id='" + session.getAttribute("agencyid") + "'";
            if (con.executeCommand(up));
            {

            
    %>
    <script>
        alert('updated');
        window.location = "MyProfile.jsp";
    </script>
    <%            
            }
        }
        String selqry = "select* from tbl_agency where agency_id='" + session.getAttribute("agencyid") + "' ";
        ResultSet s1 = con.selectCommand(selqry);
        s1.next();


    %>



    <body>
        <h1>editprofile</h1>
        <form name="edit profile">
            <table border="2">
                 
            
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=s1.getString("agency_name")%>"></td>

                </tr>
                <tr>
                    <td>address</td>
                    <td><textarea name="address" rows="2" cols="20" value=""><%=s1.getString("agency_address")%></textarea></td>
                </tr>
                <tr>
                    <td>Email</td>
                     <td><input type="text" name="email" value="<%=s1.getString("agency_email")%>"></td> 
                </tr>
                <tr>
                    <td>Contact</td>
                     <td><input type="text"  name="contact" value="<%=s1.getString("agency_contact")%>"></td> 
                </tr>
                 
                   
                <tr>
                    <td colspan="2" text align="center">
                        <input type="submit" name="save" value="Update">
                    </td></tr>


          

            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
