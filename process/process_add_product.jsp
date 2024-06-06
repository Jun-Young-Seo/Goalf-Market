<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="balls.Ball"%>
<%@ page import="balls.BallRepository"%>
<%@ page import="clubs.Club"%>
<%@ page import="clubs.ClubRepository"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Enumeration" %>

<%-- DB 연결 --%>
<%@include file="../DB/db_connection.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
    MultipartRequest multi=new MultipartRequest(request,"C:\\apache-tomcat-10.1.19\\webapps\\GoalFMarket\\resources\\images",
            5*1024*1024,"UTF-8",policy);
    int productCode=-1; //상품구분 코드 --> 0이면 클럽 1이면 공. -1이면 에러처리
    String id = multi.getParameter("id");
    String name = multi.getParameter("name");
    String price = multi.getParameter("price");
    String brand = multi.getParameter("brand");
    String releaseDate = multi.getParameter("releaseDate");
    String description = multi.getParameter("description");
    String category = multi.getParameter("category");
    String productCategory = multi.getParameter("product_category");
    String howMany = multi.getParameter("howMany");
    boolean isLosted=true;
    boolean isUsed = true;
    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    if(productCategory.equals("0")) {//0이면 클럽, 중고채 설정
        if(multi.getParameter("isUsed").equals("new")){
            isUsed=false;
        }
        productCode=0;
    }
    else if (productCategory.equals("1")){ //1이면 볼, 로스트볼 설정
        if(multi.getParameter("isLosted").equals("new")){
            isLosted=false;
        }
        productCode=1;
    }

    int productPrice = Integer.parseInt(price);
    int stock = Integer.parseInt(howMany);

    PreparedStatement pstmt = null;
    String sqlQuery=null;
    switch (productCode){
        //클럽인경우
        case 0:
            //항목 10개
            //id price name brand description stock category releasedate isUsed fileName
            sqlQuery="INSERT INTO CLUB VALUES(?,?,?,?,?,?,?,?,?,?)";
            pstmt = connection.prepareStatement(sqlQuery);
            pstmt.setString(1, id);
            pstmt.setString(2,price);
            pstmt.setString(3,name);
            pstmt.setString(4,brand);
            pstmt.setString(5,description);
            pstmt.setInt(6,stock);
            pstmt.setString(7,category);
            pstmt.setString(8,releaseDate);
            pstmt.setBoolean(9,isUsed);
            pstmt.setString(10,fileName);
            break;
        //공인경우
        case 1:
            sqlQuery="INSERT INTO BALL VALUES(?,?,?,?,?,?,?,?,?,?)";
            pstmt=connection.prepareStatement(sqlQuery);
            pstmt.setString(1, id);
            pstmt.setString(2,price);
            pstmt.setString(3,name);
            pstmt.setString(4,brand);
            pstmt.setString(5,description);
            pstmt.setInt(6,stock);
            pstmt.setString(7,category);
            pstmt.setString(8,releaseDate);
            pstmt.setBoolean(9,isLosted);
            pstmt.setString(10,fileName);
            break;
    }
    pstmt.executeUpdate();
    pstmt.close();
    connection.close();
    response.sendRedirect("../index.jsp");

%>
