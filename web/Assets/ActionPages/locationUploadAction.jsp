<%-- 
    Document   : locationUploadAction
    Created on : 20 Mar, 2024, 5:06:49 PM
    Author     : Blesson MS George
--%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%

    FileItem f_item = null;
    File savedFile = null;

    String field_name = "";
    String photo = "";
    String file_name = "";

    String field[] = new String[20];
    String value[] = new String[20];

    // Checking if request contains multipart data
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (isMultipart) {

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Declaring a list of form fields
        List items_list = null;

        // Assigning fields to list 'items_list'
        try {
            items_list = upload.parseRequest(request);
        } catch (FileUploadException ex) {
            out.println(ex);
        }

        // Declaring iterator used to iterate through all positions in item_lists
        Iterator itr = items_list.iterator();
        int k = 0;

        // Iterating through the list 'items_list'
        while (itr.hasNext()) {
            f_item = (FileItem) itr.next();

            if (f_item.isFormField()) {
                //getting fieldname and value
                field[k] = f_item.getFieldName();//field
                value[k] = f_item.getString();//user typing value

                k++;//
            } else {
                file_name = f_item.getName();
                field_name = f_item.getFieldName();

                if (field_name.equals("filephoto")) {
                    String ext = file_name.substring(file_name.lastIndexOf("."));
                    File proj_path = new File(config.getServletContext().getRealPath("/"));
                    String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\Files\\";
                    Random r = new Random();
                    int r_num = r.nextInt(1111) + 999;
                    photo = "LocationPhoto_" + r_num + ext;
                    savedFile = new File(file_path + photo);
                    try {
                        f_item.write(savedFile);
                    } catch (Exception ex) {
                        out.println(ex);
                    }
                }
            }
        }

        String InsQry = "INSERT INTO tbl_package_location(location_name	, location_photo, package_id)"
                + "values('" + value[0] + "','" + photo + "','" + value[1] + "')";

        System.out.println(InsQry);

        boolean status = obj.executeCommand(InsQry);

        if (status == true) {
%>
<script type="text/javascript">
    alert("Location Added");
    setTimeout(function() {
        window.location.href = '../../Admin/location.jsp?id=<%=value[1]%>'
    }, 40);
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("Location Not Added");
    setTimeout(function() {
        window.location.href = '../../Admin/location.jsp?location.jsp?id=<%=value[1]%>'
    }, 40);
</script>
<%
        }
    }
%>
