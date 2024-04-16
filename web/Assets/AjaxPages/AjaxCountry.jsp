<%-- 
    Document   : country
    Created on : 12 Mar, 2024, 2:36:45 PM
    Author     : Blesson MS George
--%>


<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<option value="">--select--</option>
<%
    String sel="select * from tbl_country where country_id='"+request.getParameter("cid")+"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("country_id")%>"><%=rs.getString("country_name")%></option>
        <%
    }
%>