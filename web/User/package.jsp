<%-- 
    Document   : package
    Created on : 9 Mar, 2024, 1:52:55 PM
    Author     : Blesson MS George
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Package </title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
    <body>


        <table align="center">
            <tr>
                <%
                    int i = 0;
            String selQry5 = "SELECT pl.*, pl.location_id, pl.location_name, pl.location_photo, pl.package_id FROM tbl_package_location pl";
                    ResultSet rs5 = con.selectCommand(selQry5);
                    while (rs5.next()) {
                        i++;

                %>
                <td>
            <table border="1" style="margin: 10px">
                <tr>
                    <td><%=rs5.getString("location_name")%></td>
                </tr>
                <tr>
                    <td><%=rs5.getString("location_id")%></td>
                </tr>
                <tr>
                    <td><%=rs5.getString("location_photo")%></td>
                </tr>
                <tr>
                    <td><%=rs5.getString("package_id")%></td>
                </tr>
                <!-- Add delete action for location here -->
                <tr>
                    <td>
                        <form action="slocation.jsp" method="post">
                            <input type="hidden" name="location_id" value="<%=rs5.getString("location_id")%>">
                          
                        </form>
                    </td>
                </tr>
            </table>
        </td>
        <%
            if(i == 4) {
                out.println("</tr><tr>");
                i = 0;
            }
        }
        
        %>
    </tr>
</table>   
</body>
<%@include file="Foot.jsp" %>
</html>