<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="orderManager" class="pack.order.OrderManager"/>

<%
    String flag = request.getParameter("flag");
    String no = request.getParameter("no");
    String state = request.getParameter("state");

    boolean b = false;

    if(flag.equals("update")){
        b = orderManager.updateOrder(no, state);
    } else if(flag.equals("delete")){
        b = orderManager.deleteOrder(no);
    } else {
        response.sendRedirect("ordermanager.jsp");
    }

    if(b){
%>
<script>
    alert("정상적으로 state 처리가 되었습니다.");
    location.href="ordermanager.jsp";
</script>
<%
    } else {
%>
<script>
    alert("오류 발생\n관리자에게 문의 바람.");
    location.href="ordermanager.jsp";
</script>
<%
    }
%>