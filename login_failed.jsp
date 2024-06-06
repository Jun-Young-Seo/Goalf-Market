<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-06-05
  Time: 오후 6:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <title>로그인 실패</title>
</head>
<body>
<div class="container py-4">
    <%@ include file="./menu.jsp"%>
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">로그인 실패</h1>
            <p class="col-md-8 fs-4">아이디 또는 비밀번호를 확인해주세요.</p>
        </div>
    </div>



    <div class="container">
        <p><a href="./index.jsp" class="btn btn-secondary"> &laquo;돌아가기</a>
    </div>

    <%@ include file="./footer.jsp"%>
</div>
</body>
</html>

