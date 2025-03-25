<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="memberBean" class="pack.member.MemberBean"/>
<jsp:setProperty name="memberBean" property="*"/>

<jsp:useBean id="memberManager" class="pack.member.MemberManager"/>

<%
  String id = (String)session.getAttribute("idKey");

  boolean b = memberManager.memberUpdate(memberBean, id);

  if(b){
%>
<script type="text/javascript">
  location.href="../guest/guest_index.jsp";
</script>
<%
  } else {
%>
<script type="text/javascript">
  alert("수정 실패\n관리자에게 문의 바람");
  history.back();
</script>
<%
  }
%>