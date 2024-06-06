<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-05-28
  Time: 오후 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>주문 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
<div class="container py-4">
    <%@ include file="../../menu.jsp"%>

    <div class="p-5 mb-4 bg-success text-white rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">주문 정보</h1>
            <p class="col-md-8 fs-4">Order Information</p>
        </div>
    </div>
    <div class="row align-items-md-stretch ">
<form action="../../process/process_order_info.jsp" method="POST" >
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
            <div class="mb-3 row">
                <label class="col-sm-2">성명</label>
                <div class="col-sm-3">
                    <input type="text" name="name" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">국가명</label>
                <div class="col-sm-3">
                    <input type="text" name="country" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">우편번호</label>
                <div class="col-sm-3">
                    <input type="text" name="code" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">주소</label>
                <div class="col-sm-5">
                    <input type="text" name="address" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">수령인 전화번호</label>
                <div class="col-sm-5">
                    <input type="text" name="tel" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10 ">
                    <a href="../../product/cart/cart.jsp" class="btn btn-secondary" role="button"> 쇼핑 계속하기 </a>
                    <input type="submit" class="btn btn-primary" value="주문하기" />
                    <a href="./cancel.jsp" class="btn btn-secondary" role="button"> 취소하기 </a>
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="../../footer.jsp" />
</div>
</body>
</html>

