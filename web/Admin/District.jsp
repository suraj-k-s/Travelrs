<%-- 
    Document   : District
    Created on : 22 Feb, 2024, 4:40:37 PM
    Author     : Blesson MS George
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            if (request.getParameter("Save") != null) {
                String State = request.getParameter("sel_state");
                String District = request.getParameter("txt_district");
                String insQry = "insert into tbl_district(district_name,state_id)values('" + District + "','" + State + "')";
                con.executeCommand(insQry);
            }

            if (request.getParameter("delid") != null) {
                String id = request.getParameter("delid");
                String delQry = "delete from tbl_district where district_id='" + id + "'";
                con.executeCommand(delQry);

                {
                }
            }

        %>
        <%@include file="Head.jsp" %>
        <h2>District</h2>
        <form name="state" method="post">
            <table border="2">
                <tr>
                    <td>Country</td>

                    <td>
                        <select name="sel_country" onchange="getState(this.value)">
                            <option value="">----Select----</option>

                            <%                                String selQ = "select * from tbl_country";
                                ResultSet rs1 = con.selectCommand(selQ);
                                while (rs1.next()) {
                            %>
                            <option value="<%=rs1.getString("country_id")%>"><%=rs1.getString("country_name")%></option>

                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <td>State


                <td>
                    <select name="sel_state" id="sel_state">
                        <option value="">----Select----</option>

                    </select>
                </td>
                </tr>

                <tr>
                    <td>District
                    <td>
                        <input type="text" name="txt_district">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="Save" value="ok">
                    </td>
                </tr>
        </form>
        <table border="1">
            <tr>
                <td>SI.No</td>
                <td>Country</td>
                <td>State</td>
                <td>District</td>
                <td>Action</td>
            </tr>
            <%                int i = 0;
                String selQry = "select * from tbl_district sun inner join tbl_state s on sun.state_id=s.state_id inner join tbl_country c on c.country_id=s.country_id";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("country_name")%></td>
                <td><%=rs.getString("state_name")%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><a href="District.jsp?delid=<%=rs.getString("district_id")%>">delete</a></td>
            </tr>


            <%
                }

            %>
        </table>
    </body>
    <%@include file="Foot.jsp" %>
    <script src="../Assets/JQ/jquery.js"></script>
    <script>
                                function getState(cid)
                                {
                                    $.ajax({
                                        url: "../Assets/AjaxPages/AjaxState.jsp?cid=" + cid,
                                        success: function(html) {
                                            $("#sel_state").html(html);

                                        }
                                    });
                                }



    </script>
</html>
