<%@ page import="java.util.ArrayList" %>
<%@ page import="pack.order.OrderBean" %>
<%@ page import="pack.product.ProductDto" %>
<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="orderManager" class="pack.order.OrderManager"/>
<jsp:useBean id="productManager" class="pack.product.ProductManager"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자:주문관리</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<%@include file="admin_top.jsp"%>

<table style="width: 95%;">
    <tr style="background-color: cyan;">
        <th>주문번호</th><th>고객id</th><th>상품명</th><th>주문수량</th><th>주문일자</th><th>주문상태</th><th>보기</th>
    </tr>
    <%
        ArrayList<OrderBean> list = orderManager.getOrderAll();
        if(list.isEmpty()){
    %>
    <tr><td colspan="7">주문 내역이 없습니다.</td></tr>
    <%
        } else {
            for (int i = 0; i < list.size(); i++){
                OrderBean order = (OrderBean)list.get(i);
                ProductDto product = productManager.getProduct(order.getProduct_no());
    %>
    <tr style="text-align: center;">
        <td><%=order.getNo()%></td>
        <td><%=order.getId()%></td>
        <td><%=product.getName()%></td>
        <td><%=order.getQuantity()%></td>
        <td><%=order.getSdate()%></td>
        <td>
            <%
                switch (order.getState()){
                    case "1": out.println("접수"); break;
                    case "2": out.println("입금확인"); break;
                    case "3": out.println("배송준비"); break;
                    case "4": out.println("배송중"); break;
                    case "5": out.println("처리완료"); break;
                    default:out.println("접수중");
                }
            %>
        </td>
        <td><a href="javascript:orderDetail('<%=order.getNo()%>')">상세보기</a></td>
    </tr>
    <%
            }
        }
    %>
</table>

<%@include file="admin_bottom.jsp"%>

<form action="orderdetail.jsp" name="detailFrm" method="post">
    <input type="hidden" name="no">
</form>
</body>
</html>
