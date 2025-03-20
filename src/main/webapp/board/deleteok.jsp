<% request.setCharacterEncoding("utf-8");  %>

<jsp:useBean id="boardManager" class="pack.board.BoardManager" />

<%
    String num = request.getParameter("num");
    String bpage = request.getParameter("page");
    String pass = request.getParameter("pass");
// num 은 frombean 을 타고 넘어왔음

//비밀번호 비교 후 수정 여부 결정
    boolean b = boardManager.checkPassword(Integer.parseInt(num), pass);   // 비번비교

    if(b){
        boardManager.delData(num);
        response.sendRedirect("boardlist.jsp?page=" + bpage);   // 삭제후 목로고기
    }else{
%>
<script>
    alert("비밀번호가 불일치 합니다");
    history.back();
</script>
<%
    }

%>