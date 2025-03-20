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
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    if(id.equals("admin") && pwd.equals("11")){
        session.setAttribute("adminOk", id); // 세션 생성
        out.println("로그인 성공<br>");
    } else {
        out.println("로그인 실패<br>");
    }
%>
<a href="javascript:window.close()">창닫기</a>
</body>
</html>