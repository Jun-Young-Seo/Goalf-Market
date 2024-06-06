<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-06-05
  Time: 오후 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="DB/db_connection.jsp"%>

<%
    PreparedStatement pstmt = null;
    ResultSet resultset = null;
    String type=null;
    String tel=null;
    String nation=null;

    String id= request.getParameter("id");
    String sqlQuery = "DELETE FROM user WHERE id=?";

    pstmt = connection.prepareStatement(sqlQuery);
    pstmt.setString(1,id);
    pstmt.executeUpdate();
    pstmt.close();
    connection.close();

    response.sendRedirect("./index.jsp");
%>