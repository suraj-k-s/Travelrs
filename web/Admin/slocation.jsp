<%-- 
    Document   : slocation
    Created on : 21 Mar, 2024, 11:18:01 AM
    Author     : Blesson MS George
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Location Details</title>
    <style>
        .photo-container {
            text-align: center;
        }
        .photo-container img {
            display: block;
            margin: 0 auto;
            width: 160px; /* Set width to 160px */
            height: 160px; /* Set height to 160px */
        }
        .info-table {
            width: 100%;
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>

        <%@include file="Head.jsp" %>
        <h2>View Location</h2>
<body>
    <table align="center">
        <%
            int i = 0;
            String selQry5 = "SELECT pl.*, pl.location_id, pl.location_name, pl.location_photo, pl.package_id FROM tbl_package_location pl";
            ResultSet rs5 = con.selectCommand(selQry5);
            while (rs5.next()) {
                i++;
                boolean photoOnLeft = i % 2 == 0; // Determines whether photo should be on the left or right
                
                if(request.getParameter("delid")!= null) {
                    String id= request.getParameter("delid");
                    String delQry = "delete from tbl_package_location where location_id='"+id+"'";
                    con.executeCommand(delQry);
                }
        %>
        <tr>
            <td>
                <div class="photo-container">
                    <img src="../Assets/Files/<%=rs5.getString("location_photo")%>">
                </div>
                <table class="info-table">
                    <tr>
                        <td>Location Name: <%=rs5.getString("location_name")%></td>
                    </tr>
                    <tr>
                        <td>Location ID: <%=rs5.getString("location_id")%></td>
                    </tr>
                    <tr>
                        <td>Package ID: <%=rs5.getString("package_id")%></td>
                    </tr>
                    <!-- Add delete action for location here -->
                    <tr>
                        <td><a href="slocation.jsp?delid=<%=rs5.getString("location_id")%>">delete</a></td>
                    </tr>
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
