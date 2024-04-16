<%-- 
    Document   : viewticket
    Created on : 21 Mar, 2024, 8:52:50 PM
    Author     : Blesson MS George
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.ServletException"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ticket Booking Details</title>
    <style>
        .info-table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        .info-table td, .info-table th {
            border: 1px solid #dddddd;
            padding: 8px;
            text-align: left;
        }
        .info-table th {
            background-color: #f2f2f2;
        }
    </style>
</head>
 <%@include file="Head.jsp" %>
<body>
   <%
    // Check if the user is logged in
    if (session.getAttribute("userid") == null) {
        response.sendRedirect("Login.jsp"); // Redirect to login page if not logged in
    }

    // Fetch the user ID of the logged-in user
    String userId = (String) session.getAttribute("userid");

    // Fetch and display packages accepted or rejected by the agency for the logged-in user
        String selQry = "SELECT * FROM tbl_ticketbookinghead tb inner join tbl_agency a on tb.agency_id=a.agency_id WHERE user_id='" + userId + "'";
        ResultSet rs = null;
        try {
            rs = con.selectCommand(selQry);
            
            while (rs.next()) {
    %>
    <table class="info-table">
        <tr>
            <th>Head Date</th>
            <th>Head For Date</th>
            <th>Head Details</th>
            <th>Type ID</th>
            <th>From Place ID</th>
            <th>To Place ID</th>
            <th>User ID</th>
            <th>Agency Name</th>
            <th>Ticket</th>
        </tr>
        <tr>
            <td><%=rs.getString("head_date")%></td>
            <td><%=rs.getString("head_fordate")%></td>
            <td><%=rs.getString("head_details")%></td>
            <td><%=rs.getString("type_id")%></td>
            <td><%=rs.getString("from_place_id")%></td>
            <td><%=rs.getString("to_place_id")%></td>
            <td><%=rs.getString("user_id")%></td>
            <td><%=rs.getString("agency_name")%></td>
            <td>
            <a href="../Assets/Files/<%=rs.getString("ticket_file")%>" download>Download</a>
            </td>
        </tr>
    </table>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
<%@include file="Foot.jsp" %>
</html>
