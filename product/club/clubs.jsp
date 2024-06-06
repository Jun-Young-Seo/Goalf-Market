<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="clubs.Club"%>
<%@ page import="java.util.Vector" %>
<%@ page import="clubs.ClubRepository" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>골프 채 목록</title>
</head>
<body>
<div class="container py-4">
    <%@ include file="../../menu.jsp"%>

    <div class="p-5 mb-4 bg-success text-white rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">골프 채 목록</h1>
            <p class="col-md-8 fs-4">Golf Club List</p>
        </div>
    </div>
    <%@ include file="../../DB/db_connection.jsp"%>
    <div class="row align-items-md-stretch   text-center">
    <%
        PreparedStatement pstmt = null;
        ResultSet resultset = null;
        String sqlQuery = "SELECT * FROM club";

        pstmt = connection.prepareStatement(sqlQuery);
        resultset = pstmt.executeQuery();

        while(resultset.next()){
    %>
        <div class="col-md-4">
            <div class="h-100 p-2">
                <img src="../../resources/images/<%= resultset.getString("club_fileName") %>" style="height: 250px; width: 350px">
                <hr>
                <h3><b><%=resultset.getString("club_name")%></b></h3>
                <h5><br>[ <%=resultset.getString("club_brand")%> ] <span class="badge text-bg-info"><%=resultset.getString("club_category")%></span></h5>
                <p> <%=resultset.getString("club_description")%>
                <p><h5><span class="badge text-bg-primary"><%=resultset.getString("club_price")%>원</span></h5>
                <p> <a href="club_detail.jsp?id=<%=resultset.getString("club_id") %>"
                       class ="btn btn-outline-primary" role="button" >상세 정보></a>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <%@ include file="../../footer.jsp"%>
</div>
</body>
</html>
