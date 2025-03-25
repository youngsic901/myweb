<%@ page import="pack.member.MemberDto" %>
<%@ page
        contentType="text/html;charset=UTF-8"
        pageEncoding="UTF-8"
%>
<jsp:useBean id="memberManager" class="pack.member.MemberManager"/>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");

    MemberDto memberDto = memberManager.getMember(id);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자-회원수정</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <script src="../js/script.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("btnUpdateOkAdmin").onclick = memberUpdateAdmin;
            document.getElementById("btnUpdateCancelAdmin").onclick = memberUpdateCancelAdmin;
            document.getElementById("btnZip").onclick = zipCheck;
        }
    </script>
</head>
<body>
<form name="updateFormAdmin" method="post" action="memberupdateproc_admin.jsp">
    <table border="1">
        <tr align="center" style="background-color: #8899aa">
            <td colspan="2">
                <b style="color: #FFFFFF"><%=memberDto.getName()%> 님의 정보 수정</b>
            </td>
        </tr>
        <tr>
            <td width="16%">아이디</td>
            <td width="57%">
                <%=memberDto.getId()%>
                <input type="hidden" name="id" value="<%=memberDto.getId()%>">
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
                <input type="button" value="수정완료(관리자)" id="btnUpdateOkAdmin">&nbsp;&nbsp;
                <input type="button" value="수정취소(관리자)" id="btnUpdateCancelAdmin">&nbsp;&nbsp;
            </td>
        </tr>
    </table>
</form>
</body>
</html>
