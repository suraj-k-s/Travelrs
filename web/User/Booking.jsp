<%-- 
    Document   : seach
    Created on : 12 Mar, 2024, 2:24:26 PM
    Author     : Blesson MS George
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking</title>
    </head>
    <%@include file="Head.jsp" %>
    <%
        String id = "";
        String sel = "select * from tbl_agency where place_id='" + session.getAttribute("plac") + "'";
        ResultSet rs = con.selectCommand(sel);
        if (rs.next()) {
            id = rs.getString("agency_id");
        }

        if (request.getParameter("btn_save") != null) {
            String indate = request.getParameter("check_in_date");
            String outdate = request.getParameter("check_out_date");

            String book = request.getParameter("package_details");

            String total = request.getParameter("txt_tamount");
            String count = request.getParameter("package_count");

            String insQry = "insert into tbl_packagebookinghead(packagebooking_date,packagebooking_fordate,packagebooking_details,packagebooking_amount,packagebooking_count,user_id,package_id,agency_id)values('" + indate + "','" + outdate + "','" + book + "','" + total + "','" + count + "','" + session.getAttribute("userid") + "','" + request.getParameter("ans") + "','" + id + "')";
            if (con.executeCommand(insQry)) {
                String sels = "select max(packagebooking_id) as id from tbl_packagebookinghead";
                ResultSet rss = con.selectCommand(sels);
                rss.next();
                String in = "INSERT INTO `tbl_packagebookingbody` (`packagebooking_id`, `user_name`, `user_age`, `user_passport_number`) VALUES ('" + rss.getString("id") + "','" + request.getParameter("txt_name") + "','" + request.getParameter("txt_age") + "','" + request.getParameter("txt_p") + "')";
                con.executeCommand(in);
    %>
    <script>
        alert("Package Booked");
    </script>
    <%
            }
        }
    %>

    <body>


        <form  method="post">
            <table border="1" align="center">
                <tr>
                    <td>Check-in Date</td>
                    <td><input type="date" name="check_in_date" required></td>
                </tr>
                <tr>
                    <td>Check-out Date</td>
                    <td><input type="date" name="check_out_date" required></td>
                </tr>
                <tr>
                    <td>Booking Detail</td>
                    <td><textarea name="package_details" required></textarea></td>
                </tr>

                <tr>
                    <td>Booking Amount</td>
                    <td ><input type="text" value="<%=request.getParameter("amt")%>" name="txt_amount" id="txt_amount" readonly=""/></td>
                </tr>
                <tr>
                    <td>Package Count</td>
                    <td><input type="number" name="package_count" value="1" onkeyup="updateAmount(this.value)" onclick="updateAmount(this.value)" required></td>
                </tr>

                <tr>
                    <td>Total</td>
                    <td ><input type="text" value="<%=request.getParameter("amt")%>" name="txt_tamount" id="txt_tamount" readonly=""/></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td ><input type="text"  name="txt_name" id="txt_name" readonly=""/></td>
                </tr>
                <tr>
                    <td>Age</td>
                    <td ><input type="text"  name="txt_age" id="txt_age" readonly=""/></td>
                </tr>
                <tr>
                    <td>Passport Number</td>
                    <td ><input type="text"  name="txt_p" id="txt_p" readonly=""/></td>
                </tr>

                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="Save"/></td>
                </tr>


                <table align="center">
                    <tr>

                </table>
        </form>

        <!-- Other HTML code -->

        <script>
            function updateAmount(count) {
                var amount = document.getElementById("txt_amount").value;
                var total = amount * count;
                document.getElementById("txt_tamount").value = total;
            }
        </script>
    </body>
    <%@include file="Foot.jsp" %>
</html>
