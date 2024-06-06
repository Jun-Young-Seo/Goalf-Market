<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-06-05
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../DB/db_connection.jsp"%>
<%
    String userType = (String)session.getAttribute("userType");

    if(userType==null || userType.equals("normal")){
        response.sendRedirect("../add_product/error_user_type.jsp");
        return;
    }

    String id = request.getParameter("id");
    String ball_id=null;
    String club_id=null;
    //공인지 클럽인지
    String category = request.getParameter("category");
    PreparedStatement pstmt = null;
    ResultSet resultset = null;
    boolean isBall = true;
    if(category.equals("club")){
        isBall=false;
    }
    if(isBall) {
        ball_id=id;
        String sqlQuery = "select * from ball";
        pstmt = connection.prepareStatement(sqlQuery);
        resultset = pstmt.executeQuery();
        if (resultset.next()) {
            sqlQuery = "delete from ball where ball_id = ?";
            pstmt = connection.prepareStatement(sqlQuery);
            pstmt.setString(1, ball_id);
            pstmt.executeUpdate();
        }
    }
    else{
        club_id=id;
        String sqlQuery = "select * from club";
        pstmt = connection.prepareStatement(sqlQuery);
        resultset = pstmt.executeQuery();
        if(resultset.next()){
            sqlQuery = "delete from club where club_id = ?";
            pstmt = connection.prepareStatement(sqlQuery);
            pstmt.setString(1, club_id);
            pstmt.executeUpdate();
        }
    }
    resultset.close();
    pstmt.close();
    connection.close();

    response.sendRedirect("../index.jsp");
%>
