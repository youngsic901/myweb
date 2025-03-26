<%@ page import="pack.product.ProductDto" %>
<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="productManager" class="pack.product.ProductManager"/>

<%
    String no = request.getParameter("no");
    ProductDto productDto = productManager.getProduct(no);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객:상품 상세보기</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<%@include file="guest_top.jsp"%>

<form action="cartproc.jsp">
    <table style="width: 95%;">
        <tr>
            <td style="width: 20%;">
                <img src="../upload/<%=productDto.getImage()%>" width="150"/>
            </td>
            <td style="width: 50%; vertical-align: top;">
                <table style="width: 100%;">
                    <tr>
                        <td>번호</td><td><%=productDto.getNo()%></td>
                        <td>품명</td><td><%=productDto.getName()%></td>
                        <td>가격</td><td><%=productDto.getPrice()%></td>
                        <td>등록일</td><td><%=productDto.getSdate()%></td>
                        <td>재고 수량</td><td><%=productDto.getStock()%></td>
                    </tr>
                    <tr>
                        <td colspan="3"><br><br><br><br>주문 수량:</td>
                        <td colspan="2"><br><br><br><input type="number" min="1" name="quantity" value="1" style="text-align: center; width: 2cm"></td>
                    </tr>
                </table>
            </td>
            <td style="width: 30%; vertical-align: top;">
                <h3>* 상품 설명 *</h3>
                <%=productDto.getDetail()%>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center;">
                <br>
                <input type="hidden" name="product_no" value="<%=productDto.getNo()%>">
                <input type="submit" value="장바구니에 담기">
                <input type="button" value="이전으로 이동" onclick="history.back()">
            </td>
        </tr>
    </table>
</form>

<%@include file="guest_bottom.jsp"%>
</body>
</html>
