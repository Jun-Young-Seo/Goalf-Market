<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-06-03
  Time: 오후 11:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

  <title>회원 가입 페이지</title>
</head>
<body>
<div class="container py-4">
  <%@ include file="./menu.jsp"%>
  <div class="p-5 mb-4 bg-success text-white rounded-3">
    <div class="container-fluid py-5">
      <h1 class="display-5 fw-bold">회원 가입</h1>
      <p class="col-md-8 fs-4">Join Us</p>
    </div>
  </div>
  <div class="row align-items-md-stretch">
    <form name="join_form" action="./process/process_join.jsp" method="post">
      <div class="mb-3 row">
        <label class="col-sm-2">아이디</label>
        <div class="col-sm-3">
          <input type="text" name="id" id="id" class="form-control" >
        </div>
      </div>
      <div class="mb-3 row">
        <label class="col-sm-2">비밀번호</label>
        <div class="col-sm-3">
          <input type="password" name="pwd" id="pwd" class="form-control" >
        </div>
      </div>
      <div class="mb-3 row">
        <label class="col-sm-2">이름</label>
        <div class="col-sm-3">
          <input type="text" name="name" id="name" class="form-control" >
        </div>
      </div>
      <div class="mb-3 row">
        <label class="col-sm-2">유형</label>
        <div class="col-sm-5">
        <input type="radio" name="type" value="normal" > 일반
        <input type="radio" name="type" value="seller" > 판매자
      </div>
      </div>
      <div class="mb-3 row">
        <label class="col-sm-2">전화번호</label>
        <div class="col-sm-3">
          <input type="text" name="tel" id="tel" class="form-control">
        </div>
      </div>
      <div class="mb-3 row">
        <label class="col-sm-2">국가</label>
        <div class="col-sm-3">
          <input type="text" name="nation" id="nation" class="form-control">
        </div>
      </div>
          <input type="submit" class="btn btn-primary" value="등록하기" >
    </form>
  </div>
  <jsp:include page="./footer.jsp" />
</div>
</body>
</html>
