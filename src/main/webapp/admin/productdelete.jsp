<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="productManager" class="pack.product.ProductManager"/>

<%
  request.setCharacterEncoding("utf-8");

  String no = request.getParameter("no");
  boolean result = productManager.deleteProduct(no);

  if(result){
%>
<script>
  alert("정상 처리 되었습니다.");
  location.href="productmanager.jsp";
</script>
<%
  } else {
%>
<script>
  alert("삭제 실패\n관리자에게 문의 바랍니다.")
  history.back();
</script>
<%
  }
%>