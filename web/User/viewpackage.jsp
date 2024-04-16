<%-- 
    Document   : viewpackage
    Created on : 20 Mar, 2024, 3:37:21 PM
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
    <body>

        <%
            // Check if the user is logged in
            if (session.getAttribute("userid") == null) {
                response.sendRedirect("Login.jsp"); // Redirect to login page if not logged in
            }

            // Fetch the user ID of the logged-in user
            String userId = (String) session.getAttribute("userid");

            // Fetch and display packages accepted or rejected by the agency for the logged-in user
            String selQry5 = "SELECT * FROM tbl_packagebookinghead k INNER JOIN tbl_user p ON p.user_id=k.user_id INNER JOIN tbl_package s ON s.package_id=k.package_id WHERE k.user_id='" + userId + "' ";
            ResultSet rs5 = con.selectCommand(selQry5);
        %>

        <table border="1" align="center">
            <tr>
                <td>Package Name</td>
                <td>Package Booking Date</td>
                <td>Package Booking For Date</td>
                <td>Details</td>
                <td>Count</td>
                <td>Total Amount</td>
                <td>Status</td>



            </tr>
            <%
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
                    <%
                        String status = rs5.getString("packagebooking_status");
                        if (status.equals("1")) {
                    %>
                    Accepted | <a href="Chat/Chat.jsp?id=<%=rs5.getString("agency_id")%>">Chat</a> / <a href="Review.jsp?id=<%=rs5.getString("package_id")%>">Review</a>
                    <%

                        } else if (status.equals("2")) {
                            out.println("Rejected");
                        }
                    %>
                </td>


            </tr>
            <%
                }
            %>
        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>
