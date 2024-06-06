<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-06-05
  Time: 오후 7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <title>My Page</title>
</head>
<body>
<div class="container py-4">
    <%@ include file="./menu.jsp"%>
    <%@include file="DB/db_connection.jsp"%>
    <div class="p-5 mb-4 bg-success text-white rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">회원정보</h1>
            <p class="col-md-8 fs-4">My Page</p>
        </div>
    </div>
    <%
        String nowSession = (String)session.getAttribute("userType");
        if(nowSession==null){
    %>
    <script>
        function not_logined(){
            alert("로그인 후 마이페이지에 접속할 수 있습니다.");
        }
        window.onload=not_logined();
        window.location.href="./login.jsp";
    </script>
    <%
        }
    PreparedStatement pstmt = null;
    ResultSet resultset = null;
    String id=null;
    String type=null;
    String tel=null;
    String nation=null;

    String userId = (String) session.getAttribute("userId");
    String sqlQuery = "SELECT * FROM user WHERE id=?";

    pstmt = connection.prepareStatement(sqlQuery);
    pstmt.setString(1,userId);
    resultset = pstmt.executeQuery();
    if (resultset.next()) {
        id=resultset.getString("id");
        type=resultset.getString("type");
        tel = resultset.getString("tel");
        nation=resultset.getString("nation");
%>
        <div class="row align-items-md-stretch">
            <div class="col-md-6">
                <h3>ID : <span class="badge text-bg-info"> <%=id%></span></h3>
                <h3>사용자 유형 : <span class="badge text-bg-info"><%=type%></span></h3>
                <h3>전화번호 : <span class="badge text-bg-info"><%=tel%></span></h3>
                <h3>국가 : <span class="badge text-bg-info"><%=nation%></span></h3>
                <br><br><br><br><hr>
                <p><a href="./index.jsp" class="btn btn-outline-secondary"> 홈으로 돌아가기 &raquo;</a>
                <p><a href="./exit_user.jsp?id=<%=id%>"class="btn btn-danger">회원탈퇴</a>
            </div>
        </div>
    </div>
<%
    }
    pstmt.close();
    connection.close();
%>
</body>
</html>
