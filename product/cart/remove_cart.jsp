<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-05-27
  Time: 오후 5:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="balls.Ball"%>
<%@ page import="balls.BallRepository"%>
<%@ page import="clubs.Club"%>
<%@ page import="clubs.ClubRepository"%>
<%@ page import="java.util.Vector" %>
<%
    String id = request.getParameter("id");
    boolean isBall = true; //공인지 판단하는 변수
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("../../index.jsp");
        return;
    }
    if(id.charAt(0)=='C'){//클럽인 경우 C로 시작
        isBall=false;
    }
    if(isBall) {
        BallRepository ballRepository = BallRepository.getInstance();
        Ball ball = ballRepository.getBallById(id);
        if (ball == null) {
            response.sendRedirect("../../index.jsp");
        }
        Vector<Ball> ballCartList= (Vector<Ball>) session.getAttribute("ballCartlist");
        if(ballCartList==null){
            ballCartList = new Vector<Ball>();
        }
        Ball b = new Ball(null,null,-1,null,null,null,null,false,-1,null);
        for (int i = 0; i < ballCartList.size(); i++) {
            b = ballCartList.get(i);
            if (b.getBallID().equals(id)) {
                ballCartList.remove(b);
            }
            break;
        }
        session.setAttribute("ballCartlist", ballCartList);
    }
    if(!isBall) {//클럽인 경우
        ClubRepository clubRepository = ClubRepository.getInstance();
        Club club = clubRepository.getClubById(id);
        if (club == null) {
            response.sendRedirect("../../index.jsp");
        }
        Vector<Club> clubCartList = (Vector<Club>) session.getAttribute("clubCartlist");

        if (clubCartList == null) {
            clubCartList = new Vector<Club>();
        }
        Club c = new Club(null,null,-1,null,null,null,null,false,-1,null);

        for (int i = 0; i < clubCartList.size(); i++) {
            c = clubCartList.get(i);
            if (c.getClubID().equals(id)) {
                clubCartList.remove(c);
            }
            break;
        }
        session.setAttribute("clubCartlist", clubCartList);
    }
    response.sendRedirect("./cart.jsp");
%>
