<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-05-28
  Time: 오후 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <meta charset="UTF-8">
    <script>
        function check_remove_all() {
            if (confirm("정말로 삭제할까요? 되돌릴 수 없어요.")) {
                alert("삭제되었습니다.");
                //get 방식으로 URL에 name : check, value : yes 로 같은 파일에 재전송됨.
                window.location.href = "./check_remove_cart_all.jsp?check=yes";
            } else {
                alert("삭제가 취소되었습니다.");
                window.location.href = "./cart.jsp";
            }
        }
        window.onload = function() {
            check_remove_all();
        }
    </script>
</head>
<body>
</body>
</html>

<%
    //만약 체크 값이 yes면 세션 초기화 -> 장바구니 비워짐
    String check = request.getParameter("check");
    if(check == null){
        response.sendRedirect("./cart.jsp");
        return;
    }
    if (check.equals("yes")) {
        session.invalidate();
        response.sendRedirect("./cart.jsp");
    }

%>
