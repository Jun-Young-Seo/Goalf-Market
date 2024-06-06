<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-05-25
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="balls.Ball"%>
<%@ page import="balls.BallRepository"%>
<%@ page import="clubs.ClubRepository"%>
<%@ page import="clubs.Club"%>
<%@ page import="java.util.Vector" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <%
        String id = session.getId();
    %>
    <title>상품 장바구니</title>
</head>
<body>
<script type="text/javascript">
    function check_user_type(){
        let userType = sessionStorage.getItem("userType");
        if(userType==="null"){
            alert("로그인 해주세요.");
            window.location.href="../../login.jsp";
        }
    }
    window.onload=check_user_type;
</script>
<div class="container py-4">
    <%@ include file="../../menu.jsp"%>

    <div class="p-5 mb-4 bg-success text-white rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">장바구니</h1>
            <p class="col-md-8 fs-4">Cart</p>
        </div>
    </div>

    <div class="row align-items-md-stretch ">
        <div class="row">
            <table width="100%">
                <tr>
                    <td align="left"><a href="./check_remove_cart_all.jsp?check=need_check" class="btn btn-danger">삭제하기</a></td>
                    <td align="right"><a href="../order/order_info.jsp?id=<%=id%>" class="btn btn-success">주문하기</a></td>
                </tr>
            </table>
        </div>
        <div style="padding-top: 50px">
            <table class="table table-hover">
                <tr>
                    <th>상품</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>소계</th>
                    <th>비고</th>
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
                    <td><a href="./remove_cart.jsp?id=<%=ball.getBallID()%>" class="badge text-bg-danger">삭제</a></td>
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
                %>
                <tr>
                    <th></th>
                    <th></th>
                    <th>총액</th>
                    <th><%=sumForBall+sumForClub%></th>
                    <th></th>
                </tr>
            </table>
            <a href="../../index.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
        </div>
    </div>

    <%@ include file="../../footer.jsp"%>
</div>
</body>
</html>
 