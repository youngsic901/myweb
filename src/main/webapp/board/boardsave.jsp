<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bean" class="pack.board.BoardBean"/>
<jsp:setProperty name="bean" property="*"/>
<jsp:useBean id="boardManager" class="pack.board.BoardManager"/>

<%
    int newNum = boardManager.currentMaxNum() + 1;
    bean.setNum(newNum);
    bean.setBip(request.getRemoteAddr());
    bean.setBdate();
    bean.setGnum(newNum);   // 원글인 경우...

    boardManager.saveData(bean);

    response.sendRedirect("boardlist.jsp?page=1");  // 추가 후 목록보기
%>