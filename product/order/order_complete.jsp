<%@ page import="java.net.URLDecoder" %>
<%@ page import="balls.Ball" %>
<%@ page import="java.util.Vector" %>
<%@ page import="clubs.Club"%>
<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-05-28
  Time: 오후 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");


    String id = "";
    String name = "";
    String country = "";
    String code = "";
    String address = "";
    String tel = "";
    String deliveryDate= "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            Cookie thisCookie = cookies[i];
            String cookieName = thisCookie.getName();
            if (cookieName.equals("id"))
                id = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
            if (cookieName.equals("name"))
                name = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
            if (cookieName.equals("country"))
                country = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
            if (cookieName.equals("code"))
                code = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
            if (cookieName.equals("address"))
                address = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
            if(cookieName.equals("tel"))
                tel=URLDecoder.decode((thisCookie.getValue()), "UTF-8");
            if(cookieName.equals("deliveryDate"))
                deliveryDate=URLDecoder.decode((thisCookie.getValue()), "UTF-8");
        }

    }
%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>주문 정보</title>
</head>
<body>

<div class="container py-4">
    <%@ include file="../../menu.jsp"%>

    <div class="p-5 mb-4 bg-success text-white rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">주문 정보</h1>
            <p class="col-md-8 fs-4">Order Info</p>
        </div>
    </div>
    <div class="row align-items-md-stretch alert alert-info">


        <div class="text-center ">
            <h1>영수증</h1>
        </div>
        <div class="row justify-content-between">
            <div class="col-4" align="left">
                <strong>배송 주소</strong> <br> 성명 : <% out.println(name); %><br>
                우편번호 : <% 	out.println(code);%><br>
                주소 : <%	out.println(address);%>(<%	out.println(country);%>)<br>
                전화번호 : <%out.println(tel);%>
            </div>
            <div class="col-4" align="right">
                <p>	<em>배송일: <% out.println(deliveryDate);	%></em>
            </div>
        </div>
        <div class=" py-5">
            <table class="table table-hover">
                <tr>
                    <th class="text-center">상품</th>
                    <th class="text-center">#</th>
                    <th class="text-center">가격</th>
                    <th class="text-center">소계</th>
                </tr>
                <%
                    int totalForBall = 0;
                    int sumForBall = 0;
                    Vector<Ball> ballCartList = (Vector<Ball>)session.getAttribute("ballCartlist");
                    if(ballCartList==null){
                        ballCartList = new Vector<Ball>();
                    }
                    for (int i = 0; i < ballCartList.size(); i++) { // 상품리스트 하나씩 출력하기
                        Ball ball = ballCartList.get(i);
                        int ballPrice = ballCartList.get(i).getBallPrice() * ball.getQuantity();
                        totalForBall += ballPrice;
                %>
                <tr>
                    <td><%=ball.getBallID()%> - <%=ball.getBallName()%></td>
                    <td><%=ball.getBallPrice()%></td>
                    <td><%=ball.getQuantity()%></td>
                    <td><%=totalForBall%></td>
                    <td><a href="../cart/remove_cart.jsp?id=<%=ball.getBallID()%>" class="badge text-bg-danger">삭제</a></td>
                </tr>
                <%
                        sumForBall+=totalForBall;
                        totalForBall = 0 ;
                    }
                    int sumForClub=0;
                    int totalForClub = 0;
                    Vector<Club> clubCartList =(Vector<Club>)session.getAttribute("clubCartlist");
                    if(clubCartList == null){
                        clubCartList=new Vector<Club>();
                    }
                    for(int i=0; i<clubCartList.size(); i++){
                        Club club = clubCartList.get(i);
                        int clubPrice = clubCartList.get(i).getClubPrice() * club.getQuantity();
                        totalForClub += clubPrice;

                %>
                <tr>
                    <td><%=club.getClubID()%> - <%=club.getClubName()%></td>
                    <td><%=club.getClubPrice()%></td>
                    <td><%=club.getQuantity()%></td>
                    <td><%=totalForClub%></td>
                    <td><a href="./remove_cart.jsp?id=<%=club.getClubID()%>" class="badge text-bg-danger">삭제</a></td>
                </tr>
                <%
                        sumForClub+=totalForClub;
                        totalForClub=0;
                    }
                    int totalPrice= sumForBall+sumForClub;


                %>
                <tr>
                    <td> </td>
                    <td> </td>
                    <td class="text-right">	<strong>총액: </strong></td>
                    <td class="text-center text-danger"><strong><%=totalPrice%> </strong></td>
                </tr>
            </table>
            <a href="./order_info.jsp?cartId=<%=id%>"class="btn btn-secondary" role="button"> 이전 </a>
            <a href="./order_finish.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
            <a href="./cancel.jsp" class="btn btn-secondary"	role="button"> 취소 </a>
        </div>
    </div>
</div>
    <jsp:include page="../../footer.jsp" />
</body>
</html>
