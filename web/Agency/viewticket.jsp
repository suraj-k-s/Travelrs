<%-- 
    Document   : viewticket
    Created on : 21 Mar, 2024, 8:52:50 PM
    Author     : Blesson MS George
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<body>
<%
    if (request.getParameter("aid") != null) {
        String headId = request.getParameter("aid");
        String action = request.getParameter("action"); // Action: accept or reject

        // Construct the update query based on the action
        String up = "";
        if (action.equals("accept")) {
            up = "UPDATE tbl_ticketbookinghead SET ticket_status='1' WHERE head_id='" + headId + "'";
        } else if (action.equals("reject")) {
            up = "UPDATE tbl_ticketbookinghead SET ticket_status='2' WHERE head_id='" + headId + "'";
        }

        if (con.executeCommand(up)) {
           
        }
    }
%>
<%
    // Check if the user is logged in
    if (session.getAttribute("agencyid") == null) {
        response.sendRedirect("Login.jsp"); // Redirect to login page if not logged in
    } else {
        // Fetch the agency ID of the logged-in user
        String agencyid = (String) session.getAttribute("agencyid");

        // Fetch and display packages accepted or rejected by the agency for the logged-in user
        String selQry = "SELECT th.head_id, th.head_date, th.head_fordate, th.head_details,th.ticket_file, th.ticket_status, tt.type_name, tp_from.place_name AS from_place_name, tp_to.place_name AS to_place_name, tu.user_name, ta.agency_name " +
                        "FROM tbl_ticketbookinghead th " +
                        "INNER JOIN tbl_tickettype tt ON th.type_id = tt.type_id " +
                        "INNER JOIN tbl_place tp_from ON th.from_place_id = tp_from.place_id " +
                        "INNER JOIN tbl_place tp_to ON th.to_place_id = tp_to.place_id " +
                        "INNER JOIN tbl_user tu ON th.user_id = tu.user_id " +
                        "INNER JOIN tbl_agency ta ON th.agency_id = ta.agency_id " +
                        "WHERE th.agency_id='" + agencyid + "'";
        
        ResultSet rs = con.selectCommand(selQry);
        try {
            
        %>
        <!-- Display the details -->
        <table class="info-table">
            <thead>
                <tr>
                    <th>Head Date</th>
                    <th>Head For Date</th>
                    <th>Head Details</th>
                    <th>Type Name</th>
                    <th>From Place Name</th>
                    <th>To Place Name</th>
                    <th>User Name</th>
                    <th>Agency Name</th>
                    <th>Action</th> <!-- New column for action buttons -->
                    <th>Ticket File</th> <!-- New column for ticket file link -->
                </tr>
            </thead>
            <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getString("head_date") %></td>
                    <td><%= rs.getString("head_fordate") %></td>
                    <td><%= rs.getString("head_details") %></td>
                    <td><%= rs.getString("type_name") %></td>
                    <td><%= rs.getString("from_place_name") %></td>
                    <td><%= rs.getString("to_place_name") %></td>
                    <td><%= rs.getString("user_name") %></td>
                    <td><%= rs.getString("agency_name") %></td>
                    <td>
                        <% if (rs.getString("ticket_status").equals("0")) { %>
                            <a href="?aid=<%=rs.getString("head_id")%>&action=accept">Accept</a>
                            <a href="?aid=<%=rs.getString("head_id")%>&action=reject">Reject</a>
                        <% } else if (rs.getString("ticket_status").equals("1")) { %>
                            <a href="?aid=<%=rs.getString("head_id")%>&action=reject">Reject</a>
                        <% } else if (rs.getString("ticket_status").equals("2")) { %>
                            <a href="?aid=<%=rs.getString("head_id")%>&action=accept">Accept</a>
                        <% } %>
                    </td>
                    <td align="center">
                        <% if (rs.getString("ticket_status").equals("1")) { 
                            if (rs.getString("ticket_file").equals("0")){
                        %>
                        
<!--                            <a href="ticketfile.jsp?head_id=<%=rs.getString("head_id")%>">Ticket File</a>-->
                        <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/TicketUploadAction.jsp">
                        <input type="hidden" name="id" value="<%=rs.getString("head_id")%>">
                        <input type="file" name="photo">
                        <input type="submit" name="send" value="Send">
                        </form>
                        <% }
                            else{
                                %>
                                <a href="../Assets/Files/<%=rs.getString("ticket_file")%>" download>Download</a>
                                <%
} %>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
        <%
        }} catch (Exception e) {
            e.printStackTrace();
        }
    } // end else
%>
</body>
</html>
