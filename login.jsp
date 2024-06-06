<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-06-03
  Time: 오후 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<head>
    <title>로그인 페이지</title>
</head>
    <body>
    <div class="container py-4">
        <%@ include file="./menu.jsp"%>
        <%
            String nowSession = (String)session.getAttribute("userType");
            if(nowSession!=null){
        %>
        <script>
            function already_logined(){
                alert("이미 로그인되어 있습니다.");
                window.location.href="./index.jsp"
            }
            window.onload = already_logined;
        </script>
        <%
            }
        %>
        <div class="p-5 mb-4 bg-success text-white rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">로그인</h1>
                <p class="col-md-8 fs-4">Login</p>
            </div>
        </div>
        <div class="row align-items-md-stretch   text-center">
            <div class="row justify-content-center align-items-center ">
                <div class="h-100 p-5 col-md-6">
                    <form class="form-signin" action="./process/process_login.jsp" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id = "user_id" name="user_id" placeholder="ID">
                            <label for="user_id">ID</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="user_pwd" name="user_pwd" placeholder="Password">
                            <label for="user_pwd">Password</label>
                        </div>
                        <p><br>
                        <button class="btn btn-lg btn-success" type="submit">로그인</button>
                    </form>

                    <form action="./join.jsp" method="post">
                    <button class="btn btn-lg btn-danger" type="submit">회원가입</button>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="./footer.jsp"%>
    </div>
    </body>

</html>
