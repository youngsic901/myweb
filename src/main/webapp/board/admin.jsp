<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/board.css">
    <script src="../js/admin.js"></script>
</head>
<body>
<form action="adminlongin.jsp" name="frm" method="post">
    <table>
        <tr>
            <td>
                <%
                    String sessionValue = (String)session.getAttribute("adminOk");
                    if(sessionValue != null){
                %>
                이미 로그인 했어요!<br><br>
                <a href="adminlogout.jsp">로그아웃</a>
                <a href="javascript:window.close()">창닫기</a>
                <%
                    } else {
                %>
                    <table>
                        <tr>
                            <td>아이디 : <input type="text" name="id"></td>
                        </tr>
                        <tr>
                            <td>비밀번호 : <input type="password" name="pwd"></td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#" onclick="check()">로그인</a>
                                <a href="javascript:window.close()">창닫기</a>
                            </td>
                        </tr>
                    </table>
                <%
                    }
                %>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
