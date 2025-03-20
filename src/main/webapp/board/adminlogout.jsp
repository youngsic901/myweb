<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("adminOk"); // 'adminOk' 라는 키 세션 삭제 ==> 로그아웃
%>
<br><br>
<a href="javascript:window.close()">창닫기</a>
</body>
</html>
