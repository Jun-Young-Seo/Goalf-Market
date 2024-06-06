<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
                    <img src="${pageContext.request.contextPath}/resources/images/icon.png" width="60" height="60" class="d-inline-block">
                    Home
                </a>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/product/club/clubs.jsp">Club</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/product/ball/balls.jsp">Ball</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/product/cart/cart.jsp">Cart</a>
                </li>
                </ul>

                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        For seller
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/add_product/add_ball.jsp">Register ball</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/add_product/add_club.jsp">Register club</a></li>
                    </ul>
                </li>
                    </ul>
                <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-outline-success">Login</a>
                <a href="${pageContext.request.contextPath}/my_page.jsp" class="btn btn-outline-info" >My Page</a>
                <a href="${pageContext.request.contextPath}/logout.jsp" class="btn btn-outline-danger" >LogOut</a>
        </div>
</nav>