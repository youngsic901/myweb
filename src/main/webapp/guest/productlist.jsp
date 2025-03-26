<%@ page import="java.util.ArrayList" %>
<%@ page import="pack.product.ProductDto" %>
<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="productManager" class="pack.product.ProductManager"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객:상품목록</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<h2>* 상품 목록 입니다. *</h2>
<%@include file="guest_top.jsp"%>

<table style="width: 95%;">
    <tr style="background-color: gold;">
        <th>상품</th><th>가격</th><th>재고량</th><th>상세보기</th>
    </tr>
    <%
        ArrayList<ProductDto> list = productManager.getProductAll();
        for(ProductDto p:list){
    %>
    <tr style="text-align: center;">
        <td>
            <img src="../upload/<%=p.getImage()%>" width="150" /> 🛒<%=p.getName()%>
        </td>
        <td><%=p.getPrice()%></td>
        <td><%=p.getStock()%></td>
        <td>
            <a href="javascript:productDetailGuest('<%=p.getNo()%>')">보기</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

<%@include file="guest_bottom.jsp"%>

<form action="productdetail_g.jsp" name="detailFrm" method="post">
    <input type="hidden" name="no">
</form>
</body>
</html>
