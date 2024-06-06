<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-05-30
  Time: 오후 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <title>주문 완료</title>
</head>
<body>
<%
    String id = "";
    String tel = "";
    String deliveryDate = "";
    String address="";
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            Cookie cookie = cookies[i];
            String str = cookie.getName();
            if (str.equals("id"))
                id = URLDecoder.decode((cookie.getValue()), "utf-8");
            if (str.equals("deliveryDate"))
                deliveryDate = URLDecoder.decode((cookie.getValue()), "utf-8");
            if(str.equals("address"))
                address = URLDecoder.decode((cookie.getValue()), "utf-8");
            if(str.equals("tel"))
                tel=URLDecoder.decode((cookie.getValue()), "utf-8");
        }

    }
%>
<div class="container py-4">
    <%@ include file="../../menu.jsp"%>

    <div class="p-5 mb-4 bg-success text-white rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">주문 완료</h1>
            <p class="col-md-8 fs-4">Order Completed</p>
        </div>
    </div>


    <div class="row align-items-md-stretch ">
        <h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
        <p>주문은	<%	out.println(deliveryDate);	%>에 배송될 예정입니다!!
        <p>주문번호 :	<%	out.println(id);	%>
        <p>배송지 : <%out.println(address);%>
        <p>수령인 전화번호 : <%out.print(tel);%>
    </div>
    <div class="container">
        <p><a href="../../index.jsp" class="btn btn-secondary"> &laquo;홈으로 돌아가기</a>
    </div>
    <%@ include file="../../footer.jsp"%>
</div>
</body>
</html>
<%
    //장바구니 세션 무효화
    //로그인은 그대로
    session.removeAttribute("ballCartList");
    session.removeAttribute("clubCartList");

    for (int i = 0; i < cookies.length; i++) {
        Cookie thisCookie = cookies[i];
        String n = thisCookie.getName();
        if (n.equals("id"))
            thisCookie.setMaxAge(0);
        if (n.equals("name"))
            thisCookie.setMaxAge(0);
        if (n.equals("delivery_date"))
            thisCookie.setMaxAge(0);
        if (n.equals("country"))
            thisCookie.setMaxAge(0);
        if (n.equals("code"))
            thisCookie.setMaxAge(0);
        if (n.equals("address"))
            thisCookie.setMaxAge(0);
        if(n.equals("tel"))
            thisCookie.setMaxAge(0);
        response.addCookie(thisCookie);
    }

%>
