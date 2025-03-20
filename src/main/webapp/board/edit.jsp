<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="boardManager" class="pack.board.BoardManager"/>
<jsp:useBean id="dto" class="pack.board.BoardDto"/>

<%
  String num = request.getParameter("num");
  String bpage = request.getParameter("page");
  dto = boardManager.getData(num); // 수정 대상 자료 읽기
%>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../css/board.css">
  <script src="../js/edit.js"></script>
</head>
<body>
<h2 style="text-align: center;">* 글 수정 *</h2>
<form action="editsave.jsp" name="frm" method="post">
  <input type="hidden" name="num" value="<%=num%>">
  <input type="hidden" name="page" value="<%=bpage%>">
  <table border="1">
    <tr>
      <td>이름</td>
      <td>
        <label for="name"></label>
        <input name="name" style="width: 98%" value="<%=dto.getName()%>" id="name">
      </td>
    </tr>
    <tr>
      <td>비밀번호</td>
      <td>
        <label for="pass"></label>
        <input type="password" name="pass" style="width: 98%" id="pass">
      </td>
    </tr>
    <tr>
      <td>이메일</td>
      <td>
        <label for="mail"></label>
        <input type="email" name="mail" style="width: 98%" id="mail" value="<%=dto.getMail()%>">
      </td>
    </tr>
    <tr>
      <td>글제목</td>
      <td>
        <label for="title"></label>
        <input type="text" name="title" style="width: 98%" id="title" value="<%=dto.getTitle()%>">
      </td>
    </tr>
    <tr>
      <td>글내용</td>
      <td>
        <label for="cont"></label>
        <textarea rows="10" style="width: 98%" id="cont" name="cont"><%=dto.getCont()%></textarea><%-- textarea 사이에는 공백 절대 금지!!!!!!!!!!!!!!!!!--%>
      </td>
    </tr>
    <tr>
      <td colspan="2" style="text-align: center;" height="50">
        <input type="button" value="수정완료" id="check">&nbsp;
        <input type="button" value="목록보기" onclick="location.href='boardlist.jsp?page=<%=bpage%>'">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
