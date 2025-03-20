<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bean" class="pack.board.BoardBean"/>
<jsp:setProperty name="bean" property="*"/>
<jsp:useBean id="boardManager" class="pack.board.BoardManager"/>

<%
    String bpage = request.getParameter("page");

    // 폼빈 내용 일부 채우기( 이름, 암호, 메일, 제목, 내용은 이미 작성 되어있음 )
    int num = bean.getNum();
    int gnum = bean.getGnum();
    int onum = bean.getOnum() + 1;  // 댓글이므로 1 증가
    int nested = bean.getNested() + 1;

    boardManager.updateOnum(gnum, onum); // 다른 게시글의 onum 갱신 작업
    bean.setOnum(onum);
    bean.setNested(nested);
    bean.setBip(request.getRemoteAddr());
    bean.setBdate();
    bean.setNum(boardManager.currentMaxNum() + 1);

    boardManager.saveReplyData(bean); // 답글 저장

    response.sendRedirect("boardlist.jsp?page=" + bpage);  // 댓글 추가 후 목록보기
%>