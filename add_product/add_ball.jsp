<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <script src="../resources/check.js"></script>
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
            <h1 class="display-5 fw-bold">볼 등록</h1>
            <p class="col-md-8 fs-4">Addition Ball</p>
        </div>
    </div>

    <div class="row align-items-md-stretch">
        <form name="add_product_form" action="../process/process_add_product.jsp"
              method="post" enctype="multipart/form-data" onsubmit="return check_upload()">
            <%--미리 카테고리 밸류 1로 설정해서 보냄 -> 클럽이면 0 공이면 1 --%>
            <input type="hidden" id="product_category" name="product_category" value="1">

            <div class="mb-3 row">
                <label class="col-sm-2">상품코드</label>

                <div class="col-sm-3">
                    <input type="text" name="id" id="product_id" class="form-control" value="B_">
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
                <label class="col-sm-2">재고수</label>
                <div class="col-sm-3">
                    <input type="text" name="howMany" id="howMany" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">로스트볼 여부</label>
                <div class="col-sm-5">
                    <input type="radio" name="isLosted" value="new" > 신품
                    <input type="radio" name="isLosted" value="losted" > 로스트볼
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">카테고리</label>
                <div class="col-sm-3">
                    <input type="radio" name="category" value="white" > 화이트 볼
                    <input type="radio" name="category" value="color" > 컬러 볼
                </div>
            </div>
            <div class="mb-3 row">
            <p> 이미지 : <input type="file" name="filename">
            </div>
            <div class="col-sm-offset-2 col-sm-10 ">
                <input type="submit" class="btn btn-primary" value="등록하기"  >
            </div>
    </form>
    <jsp:include page="../footer.jsp" />
</div>
</body>
</html>
