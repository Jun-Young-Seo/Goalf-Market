<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-06-05
  Time: 오후 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nowSession = (String)session.getAttribute("userType");
    if(nowSession==null){
%>
<script>
    function not_logined() {
        alert("로그인 되어있지 않습니다.");
    }
        window.onload=not_logined();
        window.location.href="./login.jsp";


</script>
<%
    }
    else {
        session.invalidate();
        response.sendRedirect("./index.jsp");
    }
%>