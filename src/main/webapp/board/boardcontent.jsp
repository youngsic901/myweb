<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="boardManager" class="pack.board.BoardManager"/>
<jsp:useBean id="dto" class="pack.board.BoardDto"/>

<%
    String num = request.getParameter("num");
    String bpage = request.getParameter("page");
//    out.println(num + " " + bpage);

    boardManager.updateReadcnt(num); // 조회수 증가
    dto = boardManager.getData(num); // 해당 자료 읽기

//    out.print(dto.getNum() + " " + dto.getName() + " " + dto.getTitle());
    String apass = "******"; // 일반 사용자는 비밀번호가 보이지 않게 하기
    String adminOk = (String)session.getAttribute("adminOk"); // 세션에서 adminOk라는 키의 값을 읽음
    if(adminOk != null){
        if(adminOk.equals("admin")) apass = dto.getPass();
    }
%>
<html>
<head>
    <title>게시판</title>
    <link rel="stylesheet" type="text/css" href="../css/board.css">
</head>
<body>
<table>
    <tr>
        <td><b>비밀번호 : <%=apass%></b></td>
        <td colspan="2" style="text-align: right">
            <a href="reply.jsp?num=<%=dto.getNum()%>&page=<%=bpage%>">
                <img src="../images/reply.gif" alt="">
            </a>

            <a href="edit.jsp?num=<%=dto.getNum()%>&page=<%=bpage%>">
                <img src="../images/edit.gif" alt="">
            </a>

            <a href="delete.jsp?num=<%=dto.getNum()%>&page=<%=bpage%>">
                <img src="../images/del.gif" alt="">
            </a>

            <a href="boardlist.jsp?page=<%=bpage%>">
                <img src="../images/list.gif" alt="">
            </a>
        </td>
    </tr>
    <tr style="height: 30px">
        <td>
            작성자 : <a href="mailto:<%=dto.getMail()%>"><%=dto.getName()%></a> (ip : <%=dto.getBip()%>)
        </td>
        <td>작성일 : <%=dto.getBdate()%></td>
        <td>조회수 : <%=dto.getReadcnt()%></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: cyan">제목 : <%=dto.getTitle()%></td>
    </tr>
    <tr>
        <td colspan="3">
            <label for="cont"></label>
            <textarea rows="10" style="width: 99%" id="cont" readonly="readonly"><%=dto.getCont()%></textarea>
        </td>
    </tr>
</table>
</body>
</html>
