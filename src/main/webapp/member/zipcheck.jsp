<%@ page import="pack.member.ZipcodeDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="memberManager" class="pack.member.MemberManager"/>

<%
    request.setCharacterEncoding("utf-8");

    String check = request.getParameter("check");   // y or n
    String dongName = request.getParameter("dongName");

    ArrayList<ZipcodeDto> zlist = memberManager.zipcodeRead(dongName);
%>
<html>
<head>
    <title>Title</title>
    <script src="../js/script.js"></script>
    <script type="text/javascript">
        window.onload = () => {
            document.querySelector("#btnZipFind").onclick = dongCheck;

            document.querySelector("#btnZipClose").onclick = function(){
                window.close();
            }
        }
    </script>
</head>
<body>
<strong>* 우편번호 찾기 *</strong>
<form action="zipcheck.jsp" name="zipForm" method="get">
    <table>
        <tr>
            <td>
                동 이름 입력 : <input type="text" name="dongName">
                <input type="button" value="검색" id="btnZipFind">
                <input type="button" value="닫기" id="btnZipClose">
                <input type="hidden" name="check" value="n">
            </td>
        </tr>
    </table>
</form>
<%
    if(check.equals("n")){
        if(zlist.isEmpty()){
%>
<b>검색 결과가 없습니다.</b>
<%
        } else {
%>
<table>
    <tr>
        <td style="text-align: center;">검색 자료를 클릭하면 주소가 입력됩니다.</td>
    </tr>
    <tr>
        <td>
<%
                for(int i = 0; i < zlist.size(); i++){
                    ZipcodeDto zipcodeDto = zlist.get(i);
                    String zipcode = zipcodeDto.getZipcode();
                    String area1 = zipcodeDto.getArea1();
                    String area2 = zipcodeDto.getArea2();
                    String area3 = zipcodeDto.getArea3();
                    String area4 = zipcodeDto.getArea4();
                    if(area4 == null) area4 = "";
%>
            <a href="javascript:sendDataFunc('<%=zipcode%>', '<%=area1%>', '<%=area2%>', '<%=area3%>','<%=area4%>')"><%=zipcode%> <%=area1%> <%=area2%> <%=area3%> <%=area4%></a>
            <br>
<%

//                    out.println(zipcode + " " + area1 + " " + area2 + " " + area3 + " " + area4 + "<br>");
                }
        }
    }
%>
        </td>
    </tr>
</table>
</body>
</html>
