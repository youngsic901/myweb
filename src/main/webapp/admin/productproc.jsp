<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="productManager" class="pack.product.ProductManager"/>

<%
    String flag = request.getParameter("flag");
    boolean result = false;

    if (flag.equals("update")) {
//        result = productManager.updateProduct(request);
    } else if (flag.equals("delete")) {
//        result = productManager.deleteProduct(request);
    } else {
        response.sendRedirect("productmanager.jsp");
    }
%>