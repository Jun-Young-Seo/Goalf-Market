<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="clubs.Club"%>
<%@include file="../../DB/db_connection.jsp"%>>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <title>골프채 상세 정보</title>
    <script type="text/javascript">
        function add_to_cart(){
            let userType = sessionStorage.getItem("userType");
            console.log(userType);
            if(userType==="null"){//sessionStorage.setItem()은 null이 아니라 "null"로 저장된다
                alert("로그인 해주세요");
                window.location.href="../../login.jsp";
                return;
            }

            if(confirm("클럽을 장바구니에 추가하시겠습니까?")){
                document.addForm.submit();
            }
            else{
                document.addForm.reset();
            }
        }

    </script>
</head>
<body>
<div class="container py-4">
    <%@ include file="../../menu.jsp"%>
    <div class="p-5 mb-4 bg-success text-white rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">골프채 정보</h1>
            <p class="col-md-8 fs-4">Club Info</p>
        </div>
    </div>

    <%
        String id = request.getParameter("id");
        PreparedStatement pstmt = null;
        ResultSet resultset = null;

        String sqlQuery = "SELECT * FROM club WHERE club_Id = ?";

        pstmt = connection.prepareStatement(sqlQuery);
        pstmt.setString(1,id); //id값 받아온걸로 변경
        resultset = pstmt.executeQuery();
        if (resultset.next()) {


    %>
    <div class="row align-items-md-stretch">
        <div class="col-md-12">
            <img src="../../resources/images/<%=resultset.getString("club_fileName")%>"style="width: 400px;height: 400px"/>
            <h3><b><%=resultset.getString("club_name")%></b></h3>
            <p><%=resultset.getString("club_description")%>
            <p><b>클럽 재고번호 ID : </b><span class="badge text-bg-danger"> <%=resultset.getString("club_id")%></span>
            <p><b>브랜드</b> : <%=resultset.getString("club_brand")%>
            <p><b>출시일</b> : <%=resultset.getString("club_releaseDate")%>
            <p><b>재고수</b> : <%=resultset.getString("club_stock")%>
            <h4><%=resultset.getString("club_price")%>원</h4>
            <p> <form name="addForm" action="../cart/add_to_cart.jsp" method="post"></p>
            <input type="hidden" name="id" value="<%=resultset.getString("club_id")%>">
            <p><a href="#" class="btn btn-outline-success" onclick="add_to_cart()" > 주문하기</a>
                <a href="../cart/cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
                <a href="../delete_product.jsp?id=<%=resultset.getString("club_id")%>&category=club" class="btn btn-warning"> 삭제하기</a>
                <a href="./clubs.jsp" class="btn btn-outline-secondary"> 목록</a>
        </form>
        </div>
    </div>
    <%
        }
    %>
    <jsp:include page="../../footer.jsp" />
</div>
</body>
</html>
