<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/script.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("btnAdminLogin").onclick = funcLogin;
            document.getElementById("btnHome").onclick = funcAdminHome;
        }
    </script>
</head>
<body>
<form action="loginproc.jsp" name="adminLoginForm" method="post">
    <table style="width: 300px">
        <tr>
            <td colspan="2">
                <h2>* 관리자 로그인 *</h2>
            </td>
        </tr>
        <tr>
            <td>id</td>
            <td><input type="text" name="admin_id" /></td>
        </tr>
        <tr>
            <td>password</td>
            <td><input type="password" name="admin_passwd" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="관리자 로그인" id="btnAdminLogin">
                <input type="button" value="메인 홈페이지" id="btnHome">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
