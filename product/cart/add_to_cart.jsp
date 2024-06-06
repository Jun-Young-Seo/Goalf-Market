<%@ page import="balls.BallRepository" %>
<%@ page import="balls.Ball" %>
<%@ page import="java.util.Vector" %>
<%@ page import="clubs.ClubRepository" %>
<%@ page import="clubs.Club" %><%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-05-25
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<script type="text/javascript">
    function go_to_cart() {
        alert("상품이 정상적으로 추가되었습니다.");
        if (confirm("지금 장바구니로 이동할까요?")) {
            window.location.href = "./cart.jsp";
        } else {
            window.location.href = "../../index.jsp";
        }
    }
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    System.out.println(id);
    boolean isBall = true;
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("../../index.jsp");
        return;
    }

    if (id.charAt(0) == 'C') { // 클럽인 경우 Flag false
        isBall = false;
    }

    if (isBall) {
        BallRepository ballRepository = BallRepository.getInstance();
        Ball ball = ballRepository.getBallById(id);
        if (ball == null) {
            response.sendRedirect("../ball/balls.jsp");
            return;
        }

        Vector<Ball> ballCartList = (Vector<Ball>) session.getAttribute("ballCartlist");
        if (ballCartList == null) {
            ballCartList = new Vector<Ball>();
            session.setAttribute("ballCartlist", ballCartList);
        }

        boolean isFirstOrder = true;
        for (int i = 0; i < ballCartList.size(); i++) {
            Ball ballForCart = ballCartList.get(i);
            if (ballForCart.getBallID().equals(id)) {
                isFirstOrder = false;
                int orderTimes = ballForCart.getQuantity() + 1;
                ballForCart.setQuantity(orderTimes);
                break; // 동일한 상품이 이미 있으므로 더 이상 반복할 필요 없음
            }
        }

        if (isFirstOrder) {
            ball.setQuantity(1);
            ballCartList.add(ball);
        }
    }
    else if(!isBall){//클럽인경우
        ClubRepository clubRepository = ClubRepository.getInstance();
        Club club = clubRepository.getClubById(id);
        System.out.println("It's club");
        if (club == null) {
            System.out.println("club is null");
            response.sendRedirect("../club/clubs.jsp");
            return;
        }

        Vector<Club> clubCartList = (Vector<Club>) session.getAttribute("clubCartlist");
        if (clubCartList == null) {
            clubCartList = new Vector<Club>();
            session.setAttribute("clubCartlist", clubCartList);
        }

        boolean isFirstOrder = true;
        for (int i = 0; i < clubCartList.size(); i++) {
            Club clubForCart = clubCartList.get(i);
            if (clubForCart.getClubID().equals(id)) {
                isFirstOrder = false;
                int orderTimes = clubForCart.getQuantity() + 1;
                clubForCart.setQuantity(orderTimes);
                break; // 동일한 상품이 이미 있으므로 더 이상 반복할 필요 없음
            }
        }

        if (isFirstOrder) {
            club.setQuantity(1);
            clubCartList.add(club);
        }

    }
    %>
    <script>
    go_to_cart();
    </script>


