<%-- 
    Document   : sgallary
    Created on : 21 Mar, 2024, 12:53:11 PM
    Author     : Blesson MS George
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gallery Details</title>
    <style>
        .photo-container {
            text-align: center;
            margin-bottom: 10px; /* Add some margin between photo and text */
        }
        .photo-container img {
            display: block;
            margin: 0 auto;
            width: 160px; /* Set width to 160px */
            height: auto; /* Automatically adjust height */
        }
        .info-table {
            width: 100%;
            margin: 0 auto;
            text-align: center; /* Center-align text */
        }
    </style>
</head>
 <%@include file="Head.jsp" %>
<body>
    <table align="center">
        <%
            int i = 0;
            String selQry = "SELECT g.gallary_id, g.gallary_caption, g.gallary_photo, g.package_id FROM tbl_gallary g";
            ResultSet rs = con.selectCommand(selQry);
            while (rs.next()) {
                i++;
                boolean photoOnLeft = i % 2 == 0; // Determines whether photo should be on the left or right
                
               
        %>
        <tr>
            <td>
                <div class="photo-container">
                    <img src="../Assets/Files/<%=rs.getString("gallary_photo")%>">
                </div>
                <table class="info-table">
                    <tr>
                        <td>Gallery Caption: <%=rs.getString("gallary_caption")%></td>
                    </tr>
                    <tr>
                        <td>Gallery ID: <%=rs.getString("gallary_id")%></td>
                    </tr>
                    <tr>
                        <td>Package ID: <%=rs.getString("package_id")%></td>
                    </tr>
                    <!-- Add delete action for gallery here -->
                   
                </table>
            </td>
        </tr>
        <%
            if(i == 4) {
                out.println("</tr><tr>");
                i = 0;
            }
        }
        %>
    </table>   
</body>
<%@include file="Foot.jsp" %>
</html>
