<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bean" class="pack.board.BoardBean"/>
<jsp:setProperty name="bean" property="*"/>
<jsp:useBean id="boadManager" class="pack.board.BoardManager"/>

<%
    String bpage = request.getParameter("page");
    // num은 FormBean을 타고 이미 저장됨

    // 비밀번호 비교 후 수정 여부 결정
    boolean b = boadManager.checkPassword(bean.getNum(), bean.getPass());

    if(b){
        System.out.println(bean.getCont());
        boadManager.saveEdit(bean);
        response.sendRedirect("boardlist.jsp?page=" + bpage); // 수정 후 목록보기
    } else {
%>
    <script>
        alert("비밀번호 불일치!");
        history.back();
    </script>
<%
    }
%>
