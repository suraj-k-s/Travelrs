<%-- 
    Document   : gallery
    Created on : 21 Mar, 2024, 12:43:39 PM
    Author     : Blesson MS George
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Location Details</title>
    </head>
   
    <body>
       
       <h1 align="center">Location</h1>
        <br>
        <%@include file="Head.jsp" %>
        <h2>Gallery</h2>
        <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/GallaryUploadAction.jsp">
         <table border="1"align="center">
                <tr>
                    <td>Gallery Caption</td>
                    <td><input type="text" name="txt_name" autocomplete="off" required=""/>
                        <input type="text" name="txt_id" value="<%=request.getParameter("id")%>" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="filephoto" id="filephoto" required=""/></td>    
                </tr>
                 <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="save"/></td>
                </tr>
            </table>
        </form>     
</body>
  <%@include file="Foot.jsp" %>
</html>