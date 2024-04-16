<%-- 
    Document   : TicketType
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
           String TicketType=request.getParameter("type");
           String insQry = "insert into tbl_tickettype(type_name) values('" + TicketType + "')";
           if (con.executeCommand(insQry))
           {
           }
       }
        if(request.getParameter("delid")!= null)
            {
                String id= request.getParameter("delid");
                String delQry = "delete from tbl_tickettype where type_id='"+id+"'";
                 con.executeCommand(delQry);
            }
            
        %>
        
        <%@include file="Head.jsp" %>
        <h2>Ticket Type</h2>
         <form name="type" method="post">
            <table border="2">
                <tr>
                    <td>TicketType
                    <td>
                        <input type="text" name="type">
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
                <td>TicketType</td>
                <td>Action</td>
            </tr>
            <%
            int i=0;
                String selQry = "select * from tbl_tickettype";
                ResultSet rs = con.selectCommand(selQry);
                while(rs.next()) 
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("type_name")%></td>
                <td><a href="TicketType.jsp?delid=<%=rs.getString("type_id")%>">delete</a></td>
            </tr>
            

            <%
                }

            %>
    </body>
   <%@include file="Foot.jsp" %>
</html>
