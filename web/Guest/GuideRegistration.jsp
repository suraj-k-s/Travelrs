<%-- 
    Document   : GuideRegistration
    Created on : 23 Feb, 2024, 12:29:58 PM
    Author     : Blesson MS George
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Reg</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>

        <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/GuideUploadAction.jsp">
            <table border="1">
                <tr>
            <td>Name</td>
            <td><input required type="text" name="txt_name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
          </tr>
                  <tr>
            <td>Address</td>
            <td><textarea name="txt_address" required></textarea></td>
          </tr>
                
                <tr>
            <td>Contact</td>
            <td><input type="text" required name="txt_contact" pattern="[7-9]{1}[0-9]{9}" 
                title="Phone number with 7-9 and remaing 9 digit with 0-9"/></td>
          </tr>
                <tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="filephoto" id="filephoto" required=""/></td>    
                </tr>
                <tr>
                    <td>proof</td>
                    <td><input type="file" name="fileproof" id="fileproof" required=""/></td>    
                </tr>
               <tr>
            <td>Email</td>
            <td><input type="email" required name="txt_email" /></td>
          </tr>
                
              <tr>
                    <td>District</td>
                    <td><select name="seldistrict" id="seldistrict" onChange="getPlace(this.value)">
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
                    <select id="sel_place2" name="sel_place2" required>

                        <option value="">--select--</option>

                    </select>
                </td>

                     
                            
              <tr>
            <td>Password</td>
            <td><input type="text" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required name="txt_pass" /></td>
          </tr>
          <tr>
            <td>Re-Password</td>
            <td><input type="password" required name="txt_repass" /></td>
          </tr>
          <tr>
            <td colspan="2" align="center">
              <input type="submit" name="btn_submit" value="Submit" />
            </td>
          </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
    <script src="../Assets/JQ/jquery.js"></script>
    <script>
                        function getPlace(did)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                success: function(html) {
                                    $("#sel_place2").html(html);

                                }
                            });
                        }



    </script>
</html>