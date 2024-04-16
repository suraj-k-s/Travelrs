<%-- 
    Document   : STate
    Created on : 22 Feb, 2024, 4:39:35 PM
    Author     : Blesson MS George
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>State</title>
    </head>
    <body>
          <%

        if (request.getParameter("Save") != null) {
            String Country = request.getParameter("sel_country");
            String State = request.getParameter("state");
            String insQry = "insert into tbl_state(state_name,country_id)values('" + State + "','" + Country + "')";
            con.executeCommand(insQry);
        }
        if (request.getParameter("delid") != null) {
            String id = request.getParameter("delid");
            String delQry = "delete from tbl_state where state_id='" + id + "'";
            con.executeCommand(delQry);
            {
            }
        }

    %>
          <%@include file="Head.jsp" %>
        <h2>State</h2>
         <form name="state" method="post">
            <table border="2">
                <tr>
                    <td>Country</td>
                     
                    <td>
                        <select name="sel_country">
                            <option value="">----Select----</option>
                            <%
                            String selQ= "select * from tbl_country";
                            ResultSet rs1 = con.selectCommand(selQ);
                            while(rs1.next())
                            {
                                %>
                                <option value="<%=rs1.getString("country_id")%>"><%=rs1.getString("country_name")%></option>
                                
                                <%
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <td>State</td>
                    <td>
                        <input type="text" name="state">
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
                <td>Action</td>
            </tr>
            <%                int i = 0;
                String selQry = "select * from tbl_state s inner join tbl_country c on c.country_id=s.country_id";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;
                
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("country_name")%></td>
                <td><%=rs.getString("state_name")%></td>
                <td><a href="State.jsp?delid=<%=rs.getString("state_id")%>">delete</a></td>
            </tr>


            <%
                }

            %>
        </table>
    </body>
</html>

    </body>
      <%@include file="Foot.jsp" %>
</html>
