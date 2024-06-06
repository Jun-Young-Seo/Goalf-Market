<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-06-03
  Time: 오후 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../DB/db_connection.jsp"%>
<html>
<head>
<script>
    //ID가 중복인 경우 실행
    //DB에서 ID 값 찾아서 존재하면 (resultSet.next()가능하면)
    function already_exist_id(){
        alert("이미 존재하는 ID입니다. 다른 ID를 입력하세요.");
        window.location.href = "../join.jsp"
    }
</script>
</head>
<body>
<%
    PreparedStatement pstmt = null;
    ResultSet resultset = null;
    String sqlQuery = null;

    String id = request.getParameter("id");
    sqlQuery = "SELECT * FROM USER where id=?";
    pstmt = connection.prepareStatement(sqlQuery);
    pstmt.setString(1,id);
    resultset = pstmt.executeQuery();
    if(resultset.next()){//if절 실행되면 ID가 중복
    %>
    <script>
        already_exist_id();
    </script>
<%
        pstmt.close();
        resultset.close();
        connection.close();
        return; //ID 중복이면 모두 close() 후 JSP 종료
    }
    String pwd = request.getParameter("pwd");
    String type = request.getParameter("type");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String nation = request.getParameter("nation");
    //항목 총 6개
    //id, pwd, type, name, tel, nation
    sqlQuery="INSERT INTO USER VALUES(?,?,?,?,?,?)";
    pstmt = connection.prepareStatement(sqlQuery);

    pstmt.setString(1,id);
    pstmt.setString(2,pwd);
    pstmt.setString(3,type);
    pstmt.setString(4,name);
    pstmt.setString(5,tel);
    pstmt.setString(6,nation);

    pstmt.executeUpdate();
    pstmt.close();
    connection.close();
    response.sendRedirect("../index.jsp");
%>
</body>
</html>