<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=utf-8" language="java" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>GoalF Market</title>
    <script>
        function search() {
            let search = document.getElementById("search").value;
            console.log(search);
            let url = "https://search.shopping.naver.com/search/all?query="+search;
            window.open(url);
        }
    </script>
</head>
<body>
<div class="container py-4">
    <%@include file="menu.jsp"%>
    <%!String welcome = "Welcome to GoalF Market";
        String tagline = "<b>온라인 골프 쇼핑몰에 오신 것을 환영합니다!</b>";%>
    <div class="p-5 mb-4 bg-success text-white rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold"><%=welcome%></h1>
            <p class="col-md-8 fs-4">Online golf mall</p>
        </div>
    </div>
    <div class="row align-items-md-stretch   text-center">
        <div class="col-md-12">
            <div class="h-100 p-5">
                <h3><%=tagline%></h3>
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("hh시 mm분 ss초");
                    Calendar c = Calendar.getInstance();
                    String userType = (String)session.getAttribute("userType");
                    int dayNight = c.get(Calendar.AM_PM);
                    if(dayNight==0) {
                        out.print("현재 접속 시각 : 오전 "+ sdf.format(c.getTime())+"<br><br>");
                    }
                    else{
                        out.print("현재 접속 시각 : 오후 "+ sdf.format(c.getTime())+"<br><br>");
                    }
                    %>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="p-3 text-primary-emphasis bg-info-subtle border border-primary-subtle rounded-3">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control  text-primary-emphasis" id="search" placeholder="네이버 쇼핑 최저가 검색하기">
                                    <button class="btn btn-outline-secondary  text-primary-emphasis" type="button" onclick="search()" id="button-addon2">검색</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <%
                    out.print("<br><hr><br><br>");
                    if(userType==null) {
                        out.print("<b>로그인하세요</b>");
                    }
                    else if(userType.equals("normal")){
                        out.print("<b>현재 접속 권한 : 일반 사용자</b>");
                    }
                    else if(userType.equals("seller")){
                        out.print("<b>현재 접속 권한 : 판매자</b>");
                    }
                    else if(userType.equals("admin")){
                        out.print("<b>현재 접속 권한 : 관리자</b>");
                    }
                %>
                <script>
                    sessionStorage.setItem("userType","<%=userType%>");
                </script>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</div>
</body>
</html>
