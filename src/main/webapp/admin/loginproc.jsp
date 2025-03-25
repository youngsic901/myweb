<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="memberManager" class="pack.member.MemberManager"/>

<%
  String adminid = request.getParameter("admin_id");
  String adminpasswd = request.getParameter("admin_passwd");

  boolean b = memberManager.adminLoginCheck(adminid, adminpasswd);

  if(b) {
    session.setAttribute("adminKey", adminid);
    response.sendRedirect("admin_index.jsp");
  } else {
%>
<script>
  alert("관리자 입력 자료 불일치!!!");
  location.href = "adminlogin.jsp";
</script>
<%
  }
%>