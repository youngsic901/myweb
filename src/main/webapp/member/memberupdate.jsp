<%@ page import="pack.member.MemberDto" %>
<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="memberManager" class="pack.member.MemberManager" scope="page"/>
<%
    request.setCharacterEncoding("utf-8");
    String id = (String)session.getAttribute("idKey");

    MemberDto memberDto = memberManager.getMember(id);

    if(memberDto == null){
        response.sendRedirect("../guest/guest_index.jsp");
        return;
    }
%>
<html>
<head>
    <title>회원수정</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <script src="../js/script.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            document.querySelector("#btnZip").onclick = zipCheck;
            document.querySelector("#btnUpdate").onclick = memberUpdate;
            document.querySelector("#btnUpdateCancel").onclick = memberUpdateCancel;
            document.querySelector("#btnDelete").onclick = memberDelete;
        }
    </script>
</head>
<body>
<form name="updateForm" method="post" action="memberupdateproc.jsp">
    <table border="1">
        <tr align="center" style="background-color: #8899aa">
            <td colspan="2">
                <b style="color: #FFFFFF"><%=memberDto.getName()%> 님의 정보 수정</b>
            </td>
        </tr>
        <tr>
            <td width="16%">아이디</td>
            <td width="57%">
                <%=memberDto.getId()%> <%-- id는 수정에서 제외 --%>
            </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="passwd" size="15" value="<%=memberDto.getPasswd()%>"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name" size="15" value="<%=memberDto.getName()%>"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="text" name="email" size="27" value="<%=memberDto.getEmail()%>"></td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td><input type="text" name="phone" size="20" value="<%=memberDto.getPhone()%>"></td>
        </tr>
        <tr>
            <td>우편번호</td>
            <td>
                <input type="text" name="zipcode" size="7" value="<%=memberDto.getZipcode()%>">
                <input type="button" value="우편번호찾기" id="btnZip">
            </td>
        </tr>
        <tr>
            <td>주소</td>
            <td><input type="text" name="address" size="60" value="<%=memberDto.getAddress()%>"></td>
        </tr>
        <tr>
            <td>직업</td>
            <td>
                <select name="job" >
                    <option value="<%=memberDto.getJob()%>"><%=memberDto.getJob()%>
                    <option value="회사원">회사원
                    <option value="학생">학생
                    <option value="자영업">자영업
                    <option value="기타">기타
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="button" value="수정완료" id="btnUpdate">&nbsp;&nbsp;
                <input type="button" value="수정취소" id="btnUpdateCancel">&nbsp;&nbsp;
                <input type="button" value="회원탈퇴" id="btnDelete">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
