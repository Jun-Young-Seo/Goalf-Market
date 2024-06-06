<%--
  Created by IntelliJ IDEA.
  User: SeoJunYoung
  Date: 2024-05-28
  Time: 오후 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%
    request.setCharacterEncoding("UTF-8");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    //현재시간 기준으로
    Date today = new Date();

    Calendar calendar = Calendar.getInstance();
    calendar.setTime(today);
    calendar.add(Calendar.DAY_OF_MONTH, 2); // 이틀 추가 -- 배송에 이틀 걸리는거 구현

    String deliveryDatestr = sdf.format(calendar.getTime()); // Date 객체를 문자열로 변환

    Cookie id = new Cookie("id", URLEncoder.encode(request.getParameter("id"), "UTF-8"));
    Cookie name = new Cookie("name", URLEncoder.encode(request.getParameter("name"), "UTF-8"));
    Cookie country = new Cookie("country",	URLEncoder.encode(request.getParameter("country"), "UTF-8"));
    Cookie code = new Cookie("code", URLEncoder.encode(request.getParameter("code"), "UTF-8"));
    Cookie address = new Cookie("address", URLEncoder.encode(request.getParameter("address"), "UTF-8"));
    Cookie tel = new Cookie("tel", URLEncoder.encode(request.getParameter("tel"), "UTF-8"));
    Cookie deliveryDate = new Cookie("deliveryDate",deliveryDatestr);

    id.setMaxAge( 24 * 60 * 60);
    name.setMaxAge( 24 * 60 * 60);
    code.setMaxAge( 24 * 60 * 60);
    country.setMaxAge( 24 * 60 * 60);
    address.setMaxAge( 24 * 60 * 60);
    tel.setMaxAge( 24 * 60 * 60);
    deliveryDate.setMaxAge( 24 * 60 * 60);

    id.setPath("/");
    name.setPath("/");
    code.setPath("/");
    country.setPath("/");
    address.setPath("/");
    tel.setPath("/");
    deliveryDate.setPath("/");

    response.addCookie(id);
    response.addCookie(name);
    response.addCookie(country);
    response.addCookie(code);
    response.addCookie(address);
    response.addCookie(tel);
    response.addCookie(deliveryDate);

    response.sendRedirect("../product/order/order_complete.jsp");
%>
