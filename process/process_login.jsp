<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-06-03
  Time: 오후 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../DB/db_connection.jsp"%>
<%
    PreparedStatement pstmt = null;
    ResultSet resultset = null;
    String DBPwd=null;
    String userType=null;

    String userId = request.getParameter("user_id");
    String pwd = request.getParameter("user_pwd");
    System.out.println(userId);
    System.out.println(pwd);
    String sqlQuery = "SELECT pwd, type FROM user WHERE id=?";

    pstmt = connection.prepareStatement(sqlQuery);
    pstmt.setString(1,userId);
    resultset = pstmt.executeQuery();
    if (resultset.next()) {
        DBPwd = resultset.getString("pwd");
        System.out.println("DBPWD : " + DBPwd);
        if (DBPwd.equals(pwd)) {
            userType = resultset.getString("type");
            session.setAttribute("userType", userType);
            session.setAttribute("userId", userId);
            pstmt.close();
            connection.close();
            response.sendRedirect("../index.jsp");
            return;
        }
    }
        //DB의 모든 행을 다 돌았는데 일치하는 값이 없는 경우
        pstmt.close();
        connection.close();
        response.sendRedirect("../login_failed.jsp");

%>
