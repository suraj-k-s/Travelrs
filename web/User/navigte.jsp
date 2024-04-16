<%-- 
    Document   : navigte
    Created on : 9 Mar, 2024, 3:39:56 PM
    Author     : Blesson MS George
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navigation</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
            session.setAttribute("placeid", request.getParameter("plac"));
        %>
        <form>
            <table border="1" align="center">
                <tr>
                    <td>Country</td>

                    <td>
                        <select name="sel_country">
                            <option value="">----Select----</option>
                            <%
                                String selQ = "select * from tbl_country";
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
                        <select name="sel_state" id="sel_state" onchange="getDistrict(this.value)">

                            <option value="">--select--</option>
                            <%
                                String selQry1 = "select * from tbl_state";
                                ResultSet rs1 = con.selectCommand(selQry1);
                                while (rs1.next()) {
                            %>  
                            <option value="<%=rs1.getString("state_id")%>">
                                <%=rs1.getString("state_name")%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>District</td>
                    <td><select name="seldistrict" id="sel_district" onChange="getPlace(this.value)">
                            <option value="">--select--</option>
                            <%
                                String selQry2 = "select * from tbl_district";
                                ResultSet rs2 = con.selectCommand(selQry2);
                                while (rs2.next()) {
                            %>  
                            <option value="<%=rs2.getString("district_id")%>">
                                <%=rs2.getString("district_name")%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Place</td>
                    <td>
                        <select id="sel_place" name="sel_place" required>

                            <option value="">--select--</option>
                            <%
                                String selQry3 = "select * from tbl_place";
                                ResultSet rs3 = con.selectCommand(selQry3);
                                while (rs3.next()) {
                            %>  
                            <option value="<%=rs3.getString("place_id")%>">
                                <%=rs3.getString("place_name")%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>



                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="save"/></td>
                </tr>
            </table>
        </form>


        <table border="1" align="center">



            <%
                String dyl = "select * from tbl_user where place_id='" + request.getParameter("sel_place") + "' ";
                ResultSet d1 = con.selectCommand(dyl);
                d1.next();
                int i = 0;
                String selQry5 = "select * from tbl_package k inner join tbl_place p on k.place_id= p.place_id inner join tbl_district d on p.district_id=d.district_id inner join tbl_state s on s.state_id=d.state_id inner join tbl_country c on c.country_id=s.country_id";

                if (request.getParameter("btn_save") != null) {
                    selQry5 += " where p.place_id='" + request.getParameter("sel_place") + "'";
                }

                ResultSet rs5 = con.selectCommand(selQry5);
                while (rs5.next()) {
                    i++;

            %>
            <td>
                <table border="1" style="margin: 10px">
                    <tr>
                        <td  align="center"><img src="../Assets/Files/<%=rs5.getString("package_photo")%>" width="150" height="150"></td>
                    </tr>
                    <tr>
                        <td  align="center"><%=rs5.getString("package_name")%></td>
                    </tr>
                    <tr>
                        <td  align="center"><%=rs5.getString("package_details")%></td>
                    </tr>
                    <tr>
                        <td  align="center"><%=rs5.getString("country_name")%></td>
                    </tr>
                    <tr>
                        <td  align="center"><%=rs5.getString("state_name")%></td>
                    </tr>
                    <tr>
                        <td  align="center"><%=rs5.getString("district_name")%></td>
                    </tr>
                    <tr>
                        <td align="center"><%=rs5.getString("place_name")%></td>
                    </tr>
                    <tr>
                        <td  align="center"><%=rs5.getString("package_price")%></td>
                    </tr>
                    <tr>


                        <td colspan="2">
                            <a href="Booking.jsp?ans=<%=rs5.getString("package_id")%>&amt=<%=rs5.getString("package_price")%>">Booking</a> |  
                            <a href="slocation.jsp">View Location</a> |
                            <a href="sgallary.jsp">View Gallary</a> |
                            <a href="viewticket.jsp">View Ticket</a> |

                        </td>

                    </tr>
                </table>
            </td>



            <%
                    if (i == 4) {
                        out.println("</tr><tr>");
                        i = 0;
                    }
                }
            %>
        </table>
    </table>
</form>

<script src="../Assets/JQ/jquery.js"></script>
<script>
                        function getCountry(sid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxCountry.jsp?sid=" + sid,
                                success: function(html) {
                                    $("#sel_country").html(html);

                                }
                            });

                            function getState(sid)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxState.jsp?sid=" + sid,
                                    success: function(html) {
                                        $("#sel_state").html(html);

                                    }
                                });
                            }


                        }


                        function getDistrict(sid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxDistrict.jsp?sid=" + sid,
                                success: function(html) {
                                    $("#sel_district").html(html);

                                }
                            });
                        }

                        function getPlace(did)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                success: function(html) {
                                    $("#sel_place").html(html);

                                }
                            });
                        }


</script>
</body>
<%@include file="Foot.jsp" %>

</html>
