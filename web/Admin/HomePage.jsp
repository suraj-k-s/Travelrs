<%@page import="java.sql.ResultSet"%>
<%@include file="Head.jsp" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

    <h1 class="p-relative">Dashboard</h1>

    <!-- Start Projects Table -->
    <div class="projects p-20 bg-white rad-10 m-20">
        <h2 class="mt-0 mb-20">Bookings</h2>
        <div class="responsive-table">
            <table class="fs-15 w-full">
                <thead>
                    <tr>
                        <th>Package</th>
                        <th>Date</th>
                        <th>For Date</th>
                        <th>Details</th>
                        <th>Count</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    String selQry5 = "select * from tbl_packagebookinghead k inner join tbl_user p on p.user_id=k.user_id inner join tbl_package s on s.package_id=k.package_id ";
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

                </tr>
                <%

                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<div class="projects p-20 bg-white rad-10 m-20">
    <h2 class="mt-0 mb-20">Bookings</h2>
    <div class="responsive-table">
        <table class="fs-15 w-full">
            <thead>
                <tr>
                    <th>Head Details</th>
                    <th>Date</th>
                    <th>Head For Date</th>
                    <th>Ticket Type</th>
                    <th>Agency</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String selQry = "select * from tbl_ticketbookinghead k inner join tbl_tickettype t on t.type_id=k.type_id inner join tbl_agency a on  a.agency_id=k.agency_id";
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("head_details")%></td>
                    <td><%=rs.getString("head_date")%></td>
                    <td><%=rs.getString("head_fordate")%></td>
                    <td><%=rs.getString("type_name")%></td>
                     <td><%=rs.getString("agency_name")%></td>
                    
                    
                    <td><%=rs.getString("ticket_amount")%></td>

                </tr>
                <%

                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<%@include file="Foot.jsp" %>