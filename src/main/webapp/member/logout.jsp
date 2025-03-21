<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<%
    session.removeAttribute("idKey");
//    session.invalidate(); // 모든 세션 전체 삭제
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    alert("로그아웃 성공");
    location.href = "login.jsp";
</script>
</body>
</html>
