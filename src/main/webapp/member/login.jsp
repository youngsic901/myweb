<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<%
    String id = (String)session.getAttribute("idKey");
%>
<html>
<head>
    <title>Title</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <script src="../js/login.js"></script>
</head>
<body>
<%
    if(id != null){
%>
<b><%=id%>님 로그인 중</b>
<a href="logout.jsp">로그아웃</a>
<%
    } else { // 로그인 안 한 경우
%>
<form name="loginForm">
    <table>
        <tr>
            <td colspan="2" style="text-align:center">* 회원 로그인 *</td>
        </tr>
        <tr>
            <td><label for="id">아이디</label></td>
            <td><input type="text" name="id" id="id"/></td>
        </tr>
        <tr>
            <td><label for="passwd">비밀번호</label></td>
            <td><input type="password" name="passwd" id="passwd"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="로 그 인" id="btnLogin"/>
                <input type="button" value="회원가입" id="btnNewMember"/>
            </td>
        </tr>
    </table>
</form>
<%
    }
%>
</body>
</html>
