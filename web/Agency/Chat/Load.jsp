<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_chat tsc inner join tbl_agency t on (tsc.to_agency_id=t.agency_id) or (tsc.from_agency_id=t.agency_id) where t.agency_id='" + session.getAttribute("agencyid") + "' order by chat_id";
    //System.out.println(selQry);
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {

        if (rs.getString("to_user_id").equals(request.getParameter("id"))) {


%>

<div class="chat-message is-sent">
    <img src="../../Assets/Files/<%=rs.getString("agency_photo")%>" alt="">
    <div class="message-block">
        <span><%=rs.getString("agency_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
    <img style="width: 20px;height: 20px;margin-top: 30px" src="../../Assets/friendskit/assets/img/icons/feed/delete.svg" onclick="deleteChat(<%=rs.getString("chat_id")%>)">
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%

} else if (rs.getString("from_user_id").equals(request.getParameter("id"))) {

    String sel = "select * from tbl_user where user_id='" + rs.getString("from_user_id") + "'";

    ResultSet z = con.selectCommand(sel);
    if (z.next()) {
%>
<div class="chat-message is-received">
    <img src="../../Assets/Files/<%=z.getString("user_photo")%>" alt="">
    <div class="message-block">
        <span><%=z.getString("user_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%
            }

        }
    }


%>