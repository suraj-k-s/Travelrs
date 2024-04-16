<%-- 
    Document   : add package
    Created on : 8 Mar, 2024, 3:53:25 PM
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

    <body>
         <body>
        <%

            if (request.getParameter("btn_save") != null) {
                String District = request.getParameter("sel_district");
                String Place = request.getParameter("sel_place");
                String insQry = "insert into tbl_place(place_name,district_id)values('" + Place + "','" + District + "')";
                con.executeCommand(insQry);
            }

            if (request.getParameter("delid") != null) {
                String id = request.getParameter("delid");
                String delQry = "delete from tbl_package where package_id='" + id + "'";
                con.executeCommand(delQry);
          {
                %>
                <script>
                alert("Package Added");
                </script>
                <%
         }
     }
    %>

        <%@include file="Head.jsp" %>
        <h2>ADD PACKAGE</h2>
        <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/PackageUploadAction.jsp">
            <table border="1" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>photo</td>
                    <td><input type="file" name="filephoto" autocomplete="off" required=""/></td>
                </tr> 
                <tr>
                    <td>Price</td>
                     <td><input type="number" name="price" autocomplete="off" required=""/></td>
                </tr>
                <td>Details</td>
                    <td><textarea name="details" id="txt_details" autocomplete="off" required></textarea></td>
                </tr>
                
                 <tr>
                     <td>state</td> 
                     <td>
                       <select name="sel_state" id="sel_state" onchange="getDistrict(this.value)">
                        
                            <option value="">--select--</option>
                            <%
                                String selQry2 = "select * from tbl_state";
                                ResultSet rs2 = con.selectCommand(selQry2);
                                while (rs2.next()) {
                            %>  
                            <option value="<%=rs2.getString("state_id")%>">
                                <%=rs2.getString("state_name")%>
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
                                String selQry = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getString("district_id")%>">
                                <%=rs.getString("district_name")%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                <tr>
                    <td>Place</td> 
                     <td>
                         <select id="selplace" name="sel_place" required>
                        
                            <option value="">--select--</option>
                            <%
                                String selQry1 = "select * from tbl_place";
                                ResultSet rs1 = con.selectCommand(selQry1);
                                while (rs1.next()) {
                            %>  
                            <option value="<%=rs1.getString("place_id")%>">
                                <%=rs1.getString("place_name")%>
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
                 </form>
                        <br>
                        <br>
       
        <table border="1" align="center">
            <tr>
                <td>SI.No</td>
                <td>Package Name</td>
                <td>Photo</td>
                <td>Details</td>
                <td>Country</td>
                <td>State</td>
                <td>District</td>
                 <td>Place</td>
                  <td>Price</td>
                  <td align="center">Action</td>
                 
            </tr>
            <%                int i = 0;
                String selQry5 = "select * from tbl_package k inner join tbl_place p on k.place_id= p.place_id inner join tbl_district d on p.district_id=d.district_id inner join tbl_state s on s.state_id=d.state_id inner join tbl_country c on c.country_id=s.country_id";
                ResultSet rs5 = con.selectCommand(selQry5);
                while (rs5.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs5.getString("package_name")%></td>
                <td><img src="../Assets/Files/<%=rs5.getString("package_photo")%>" width="150" height="150"></td>
               <td><%=rs5.getString("package_details")%></td>
               <td><%=rs5.getString("country_name")%></td>
                <td><%=rs5.getString("state_name")%></td>
                <td><%=rs5.getString("district_name")%></td>
                 <td><%=rs5.getString("place_name")%></td>
                <td><%=rs5.getString("package_price")%></td>
                <td><a href="add package.jsp?delid=<%=rs5.getString("package_id")%>">delete</a>
                
                |
                
                <a href="location.jsp?id=<%=rs5.getString("package_id")%>">Add Location</a>
                
             |
                  <a href="gallery.jsp?id=<%=rs5.getString("package_id")%>">Add Gallary</a></td>
            </tr>


            <%
                }

            %>
        </table>
            </table>
        </form>
                        
                         <script src="../Assets/JQ/jquery.js"></script>
    <script>
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
                                    $("#selplace").html(html);

                                }
                            });
                        }
                        

    </script>
    </body>
      <%@include file="Foot.jsp" %>
</html>
                    