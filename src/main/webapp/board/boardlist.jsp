<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/board.css">

</head>
<body>
<table>
    <tr>
        <td>
            [ <a href="../index.html">메인으로</a> ]&nbsp;
            [ <a href="boardlist.jsp?page=1">최근목록</a> ]&nbsp;
            [ <a href="boardwrite.jsp">새글작성</a> ]&nbsp;
            [ <a href="#" id="admin" onclick="window.open('admin.jsp','width=300, height=200, top=200, left=300')">관리자용</a> ]&nbsp;
            <br>
            <br>
            <table style="width:100%">
                <tr style="background-color: cyan;">
                    <th>번호</th><th>글 제 목</th><th>작성자</th><th>등록일</th><th>조회수</th>
                </tr>
                <%

                %>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
