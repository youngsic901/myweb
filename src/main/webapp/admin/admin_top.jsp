<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<%
  String adminid = (String)session.getAttribute("adminKey"); // 페이지 마다 세션을 읽어들이는게 비효율적이므로 top 페이지에서 세션을 읽은 후 본문에서 include한다.

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