<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="pack.order.OrderBean" %>
<%@ page import="pack.product.ProductDto" %>
<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="cartManager" class="pack.order.CartManager" scope="session"/>
<jsp:useBean id="productManager" class="pack.product.ProductManager"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객:상품주문</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<h2>* 장바구니 목록 *</h2>
<%@include file="guest_top.jsp"%>
<table style="width: 95%;">
    <tr style="background-color: silver;">
        <th>주문상품</th><th>가격(소계)</th><th>수량</th><th>조회</th>
    </tr>
    <%
        int totalPrice = 0;
        Hashtable<String, Object> hCart = cartManager.getCartList();
        if(hCart.size() == 0) { // hCart.isEmpty();
    %>
    <tr>
        <td colspan="5">주문 건수가 없습니다.</td>
    </tr>
    <%
        } else {
            Enumeration enu = hCart.keys(); // Map 타입의 컬렉션을 읽어 반복처리
            while (enu.hasMoreElements()){
                OrderBean orderBean = (OrderBean)hCart.get(enu.nextElement());
                ProductDto product = productManager.getProduct(orderBean.getProduct_no());
                int price = Integer.parseInt(product.getPrice());
                int quantity = Integer.parseInt(orderBean.getQuantity());
                int subTotal = price * quantity; // 소계
                totalPrice += subTotal; // 총계
    %>
    <tr style="text-align: center;">
        <td><%=product.getName()%></td>
        <td><%=subTotal%></td>
        <td><%=quantity%></td>
        <td>
            <a href="javascript:productDetailGuest('<%=product.getNo()%>')">상세보기</a>
        </td>
    </tr>
    <%
            } // while문 종료
    %>
    <tr>
        <td colspan="4">
            <br>
            <b>총 결제 금액 : <%=totalPrice%>&nbsp;&nbsp;
            <a href="orderproc.jsp">[ 주문하기 ]</a>
            </b>
        </td>
    </tr>
    <%
        } // if else문 종료
    %>
</table>

<%@include file="guest_bottom.jsp"%>
<form action="productdetail_g.jsp" name="detailFrm">
    <input type="hidden" name="no">
</form>
</body>
</html>
