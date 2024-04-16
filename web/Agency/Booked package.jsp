<%-- 
    Document   : Booked package
    Created on : 20 Mar, 2024, 12:16:16 PM
    Author     : Blesson MS George
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Booked package</title>
</head>
<%@include file="Head.jsp" %>
        <h2>Book Package</h2>
<body>
<%
    if (request.getParameter("aid") != null) {
        String bookingId = request.getParameter("aid");
        String action = request.getParameter("action"); // Action: accept or reject

        // Construct the update query based on the action
        String up = "";
        if (action.equals("accept")) {
            up = "UPDATE tbl_packagebookinghead SET packagebooking_status='1' WHERE packagebooking_id='" + bookingId + "'";
        } else if (action.equals("reject")) {
            up = "UPDATE tbl_packagebookinghead SET packagebooking_status='2' WHERE packagebooking_id='" + bookingId + "'";
        }

        if (con.executeCommand(up)) {
           
        }
    }
%>

<table border="1" align="center">
    <tr>
        <td>Package Name</td>
        <td>Package Booking Date</td>
        <td>Package Booking For Date</td>
        <td>Details</td>
        <td>Count</td>
        <td>Total Amount</td>
        <td>Action</td>
    </tr>
    <% 
       String selQry5 = "select * from tbl_packagebookinghead k inner join tbl_user p on p.user_id=k.user_id inner join tbl_package s on s.package_id=k.package_id where agency_id='"+ session.getAttribute("agencyid") +"'";
        ResultSet rs5 = con.selectCommand(selQry5);
        while (rs5.next()) { 
    %>
    <tr>
        <td><%=rs5.getString("package_name")%></td>
        <td><%=rs5.getString("packagebooking_date")%></td>
        <td><%=rs5.getString("packagebooking_fordate")%></td>
        <td><%=rs5.getString("packagebooking_details")%></td>
        <td><%=rs5.getString("packagebooking_count")%></td>
        <td><%=rs5.getString("packagebooking_amount")%></td>
        <td>
           <a href="Chat/Chat.jsp?id=<%=rs5.getString("user_id")%>">Chat</a> | <a href="?aid=<%=rs5.getString("packagebooking_id")%>&action=accept">Accept</a>
            <a href="?aid=<%=rs5.getString("packagebooking_id")%>&action=reject">Reject</a>
        </td>
    </tr>
    <%
               
                    }
                %>
</table>
</body>
<%@include file="Foot.jsp" %>
</html>
