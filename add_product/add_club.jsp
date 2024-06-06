<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>상품 등록</title>
    <%--defer 속성은 비동기 js파일 다운로드 --%>
</head>
<body>
<div class="container py-4">
    <%@ include file="../menu.jsp"%>
    <%
        String userType = (String)session.getAttribute("userType");

        if(userType==null || userType.equals("normal")){
            response.sendRedirect("./error_user_type.jsp");
        }
    %>
    <div class="p-5 mb-4 bg-success text-white rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">채 등록</h1>
            <p class="col-md-8 fs-4">Addition Club</p>
        </div>
    </div>

    <div class="row align-items-md-stretch">
        <form name="add_product_form" action="../process/process_add_product.jsp" method="post" onsubmit="return check_upload()"
        enctype="multipart/form-data">
            <%--미리 카테고리 밸류 1로 설정해서 보냄 -> 클럽이면 0 공이면 1 --%>
            <input type="hidden" name="product_category" id="product_category" value="0">
            <div class="mb-3 row">
                <label class="col-sm-2">상품코드</label>
                <div class="col-sm-3">
                    <input type="text" name="id" id="product_id" class="form-control" value="C_" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">상품명</label>
                <div class="col-sm-3">
                    <input type="text" name="name" id="name" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">가격</label>
                <div class="col-sm-3">
                    <input type="text" name="price" id="price" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">브랜드</label>
                <div class="col-sm-3">
                    <input type="text" name="brand" id="brand" class="form-control">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">출시일</label>
                <div class="col-sm-3">
                    <input type="text" name="releaseDate" id="releaseDate" class="form-control">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2">설명</label>
                <div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2"
                              class="form-control" placeholder="100자 이상 적어주세요"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">분류</label>
                <div class="col-sm-5">
                    <input type="radio" name="category" value="driver" > 드라이버
                    <input type="radio" name="category" value="wood" > 우드
                    <input type="radio" name="category" value="utility" > 유틸리티
                    <input type="radio" name="category" value="iron" > 아이언
                    <input type="radio" name="category" value="wedge" > 웻지
                    <input type="radio" name="category" value="putter" > 퍼터

                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">재고수</label>
                <div class="col-sm-3">
                    <input type="text" id="howMany" name="howMany" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">중고여부</label>
                <div class="col-sm-5">
                    <input type="radio" name="isUsed" value="new" > 신품
                    <input type="radio" name="isUsed" value="used" > 중고
                </div>
            </div>
            <div class="mb-3 row">
                <p> 이미지 : <input type="file" name="filename">
            </div>
            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10 ">
                    <input type="submit" class="btn btn-primary" value="등록하기" >
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="../footer.jsp" />
</div>
<script src="../resources/check.js" defer></script>

</body>
</html>
