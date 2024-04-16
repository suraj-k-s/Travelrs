<%-- 
    Document   : Country
    Created on : 22 Feb, 2024, 4:39:27 PM
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
  if(request.getParameter("Save")!=null)
       {
           String Country=request.getParameter("country");
           String insQry = "insert into tbl_country(country_name) values('" + Country + "')";
           if (con.executeCommand(insQry))
           {
           }
       }
        if(request.getParameter("delid")!= null)
            {
                String id= request.getParameter("delid");
                String delQry = "delete from tbl_country where country_id='"+id+"'";
                 con.executeCommand(delQry);
            }
            
        %>
          <%@include file="Head.jsp" %>
        <h2>Country</h2>
         <form name="country" method="post">
            <table border="2">
                <tr>
                    <td>Country
                    <td>
                        <input type="text" name="country">
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
                <td>Action</td>
            </tr>
            <%
            int i=0;
                String selQry = "select * from tbl_country";
                ResultSet rs = con.selectCommand(selQry);
                while(rs.next()) 
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("country_name")%></td>
                <td><a href="Country.jsp?delid=<%=rs.getString("country_id")%>">delete</a></td>
            </tr>
            

            <%
                }

            %>
         </table>
         
    </body>
      <%@include file="Foot.jsp" %>
</html>
