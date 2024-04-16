<%-- 
    Document   : ticket
    Created on : 21 Mar, 2024, 2:43:13 PM
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
    <body>
        <%
            String id = "";
            String sel = "select * from tbl_agency where place_id='" + session.getAttribute("plac") + "'";
            ResultSet rsq = con.selectCommand(sel);
            if (rsq.next()) {
                id = rsq.getString("agency_id");
            }
            if (request.getParameter("btn_save") != null) {
                String hedate = request.getParameter("date");
                String details = request.getParameter("details");
                String type = request.getParameter("type");
                String place = request.getParameter("sel_place1");
                String place1 = request.getParameter("sel_place2");

                String insQry = "insert into tbl_ticketbookinghead(head_date,head_fordate,head_details,type_id,from_place_id,to_place_id,user_id,agency_id)"
                        + "values('" + hedate + "','" + hedate + "','" + details + "','" + type + "','" + place + "','" + place1 + "','" + session.getAttribute("userid") + "','" + id + "')";
                out.println(insQry);
                if (con.executeCommand(insQry)) {
                    String sels = "select max(head_id) as id from tbl_ticketbookinghead";
                    ResultSet rss = con.selectCommand(sels);
                    rss.next();
                    String in = "INSERT INTO `tbl_ticketbookingbody` (`head_id`, `user_name`, `body_age`, `body_paasport_number`) VALUES ('" + rss.getString("id") + "','" + request.getParameter("txt_name") + "','" + request.getParameter("txt_age") + "','" + request.getParameter("txt_p") + "')";
                    con.executeCommand(in);

                }
            }

        %>
    </body>
    <form  method="post">
        <table border="1" align="center">
            <tr>
                <td>Date</td>
                <td><input type="date" name="date" required></td>
            </tr>
            <tr>
                <td>Details</td>
                <td><textarea name="details" id="txt_details" autocomplete="off" required></textarea></td>
            </tr>

            <tr>
                <td>Ticket</td> 
                <td>
                    <select name="type" id="type">
                        <option value="">----Select----</option>

                        <%                                String selQ10 = "select * from tbl_tickettype";
                            ResultSet rs10 = con.selectCommand(selQ10);
                            while (rs10.next()) {
                        %>
                        <option value="<%=rs10.getString("type_id")%>"><%=rs10.getString("type_name")%></option>

                        <%
                            }
                        %>
            </tr>

            </tr>
            <tr>   
                <td>From</td>
            </tr>  


            <tr>
                <td>Country</td>

                <td>
                    <select name="sel_country" onchange="getState1(this.value)">
                        <option value="">----Select----</option>
                        <%                                String selQ = "select * from tbl_country";
                            ResultSet rs = con.selectCommand(selQ);
                            while (rs.next()) {
                        %>
                        <option value="<%=rs.getString("country_id")%>"><%=rs.getString("country_name")%></option>

                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>

            <tr>
                <td>state</td> 
                <td>
                    <select name="sel_state1" id="sel_state1" onchange="getDistrict1(this.value)">

                        <option value="">--select--</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>District</td>
                <td><select name="sel_district1" id="sel_district1" onChange="getPlace1(this.value)">
                        <option value="">--select--</option>

                    </select>
                </td>
            </tr>

            <tr>
                <td>Place</td>
                <td>
                    <select id="sel_place1" name="sel_place1" required>

                        <option value="">--select--</option>

                    </select>
                </td>
            <tr>   
                <td>To</td>
            </tr>  


            <tr>
                <td>Country</td>

                <td>
                    <select name="sel1_country" onchange="getState2(this.value)">
                        <option value="">----Select----</option>
                        <%
                            String selQ9 = "select * from tbl_country";
                            ResultSet rs9 = con.selectCommand(selQ9);
                            while (rs9.next()) {
                        %>
                        <option value="<%=rs9.getString("country_id")%>"><%=rs9.getString("country_name")%></option>

                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>state</td> 
                <td>
                    <select name="sel1_state2" id="sel_state2" onchange="getDistrict2(this.value)">

                        <option value="">--select--</option>

                    </select>
                </td>
            </tr>

            <tr>
                <td>District</td>
                <td><select name="sel1_district2" id="sel_district2" onChange="getPlace2(this.value)">
                        <option value="">--select--</option>

                    </select>
                </td>
            </tr>
            <tr>
                <td>Place</td>
                <td>
                    <select id="sel_place2" name="sel_place2" required>

                        <option value="">--select--</option>

                    </select>
                </td>
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
        </table>
        <script src="../Assets/JQ/jquery.js"></script>
        <script>
                function getState1(sid)
                {
                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxState.jsp?cid=" + sid,
                        success: function(html) {
                            $("#sel_state1").html(html);

                        }
                    });
                }


                function getDistrict1(sid)
                {
                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxDistrict.jsp?sid=" + sid,
                        success: function(html) {
                            $("#sel_district1").html(html);

                        }
                    });
                }

                function getPlace1(did)
                {
                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                        success: function(html) {
                            $("#sel_place1").html(html);

                        }
                    });
                }


                function getState2(sid)
                {
                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxState.jsp?cid=" + sid,
                        success: function(html) {
                            $("#sel_state2").html(html);

                        }
                    });
                }

                function getDistrict2(sid)
                {
                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxDistrict.jsp?sid=" + sid,
                        success: function(html) {
                            $("#sel_district2").html(html);

                        }
                    });
                }

                function getPlace2(did)
                {
                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                        success: function(html) {
                            $("#sel_place2").html(html);

                        }
                    });
                }


        </script>


    </form>
</body>
<%@include file="Foot.jsp" %>
</html>
