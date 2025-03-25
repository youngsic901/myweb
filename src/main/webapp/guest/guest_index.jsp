<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<table style="width:95%">
    <tr>
        <td style="font-size: 30px;">MZ 쇼핑몰</td>
    </tr>
</table>
<%@include file="guest_top.jsp"%>

<table style="width:95%">
    <%
        if(memid != null){
    %>
    <tr style="text-align: center;">
        <td style="font-size: 20px;">
            <%=memid%>님 로그인
            <img src="../images/img_main.gif">
        </td>
    </tr>
    <%
        } else {
    %>
    <tr style="text-align: center;">
        <td style="font-size: 20px; background-image: url(../images/main.png); background-size: contain; background-repeat: no-repeat; padding: 30%">
        </td>
    </tr>
    <tr style="text-align: center;">
        <td>
            고객님 어서오십시오.
            <br><br><br>로그인 후 이용 바랍니다.
            <br><br><br><br><br><br><br><br><br>
        </td>
    </tr>
    <%
        }
    %>
</table>

<%@include file="guest_bottom.jsp"%>
</body>
</html>
