<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<%
  String adminid = (String)session.getAttribute("adminKey");

  if(adminid == null){
    response.sendRedirect("adminlogin.jsp");
  }
%>

<table style="width: 95%;">
  <tr style="background-color: #aabbcc; text-align: center;">
    <th><a href="../guest/guest_index.jsp">홈페이지</a></th>
    <th><a href="adminlogout.jsp">로그아웃</a></th>
    <th><a href="membermanager.jsp">회원관리</a></th>
    <th><a href="prductmanager.jsp">상품관리</a></th>
    <th><a href="ordermanager.jsp">주문관리</a></th>
  </tr>
</table>