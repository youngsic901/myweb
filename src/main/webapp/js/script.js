function zipCheck(){
    let url = "zipcheck.jsp?check=y";
    window.open(url, "post",
        "toolbar=no, width=500, height=400, top=200, left=100, status=yes, scrollbars=yes, menubar=no"
    );
}

function idCheck(){
    if(regForm.id.value === ""){
        alert("id를 입력하세요");
        regForm.id.focus();
    } else {
        const url = "idcheck.jsp?id=" + regForm.id.value;
        window.open(url, "id ",
            "toolbar=no, width=300, height=150, top=200, left=100");
    }
}

function inputCheck() {
    // 입력자료 검사 후 서버로 전송
    if(regForm.id.value === ""){
        alert("id를 입력하세요");
        regForm.id.focus();
        return;
    }

    // 입력값 검사 필요

    regForm.submit();
}

// zipcheck
function dongCheck(){
    if(zipForm.dongName.value === ""){
        alert("검색할 동 이름을 입력하세요");
        zipForm.dongName.focus();
        return;
    }

    zipForm.submit();
}

function sendDataFunc(code, a1, a2, a3, a4){
    // alert(code + a1 + a2 + a3 + a4);
    // opener zipcheck.jsp를 부른 멤버 리스트(memberlist.jsp 의 zipcode, address 태그)
    opener.document.regForm.zipcode.value = code;
    const addr = a1 + " " + a2 + " " + a3 + " ";
    opener.document.regForm.address.value = addr;

    window.close(); // 주소 검색창을 닫는다.
}

//회원 로그인 관련 ==> login
function funcLogin() {
    if(loginForm.id.value === ""){
        alert("회원 id 입력");
        loginForm.id.focus();
    } else if(loginForm.passwd.value === ""){
        alert("회원 비밀번호 입력");
        loginForm.passwd.focus();
    } else {
        loginForm.action = "loginproc.jsp";
        loginForm.method = "post";
        loginForm.submit();
    }
}

function funcNewMember() {
    location.href = "../member/register.jsp"
}

// 쇼핑몰 고객이 로그인 후 자신의 정보 수정
function memberUpdate(){
    // 입력자료 오류검사...

    document.updateForm.submit();
}

function memberUpdateCancel(){
    location.href = "../guest/guest_index.jsp";
}

function memberDelete(){
    alert("회원 탈퇴 불가.");
}

// 관리자 관련
function funcLogin(){
    if(adminLoginForm.admin_id.value === ""){
        alert("관리자 id를 입력하세요");
        adminLoginForm.admin_id.focus();
    } else if(adminLoginForm.admin_passwd.value === ""){
        alert("관리자 password를 입력하세요");
        adminLoginForm.admin_passwd.focus();
    } else {
        adminLoginForm.action = "loginproc.jsp";
        adminLoginForm.method = "post";
        adminLoginForm.submit();
    }
}

function funcAdminHome() {
    location.href = "../guest/guest_index.jsp";
}

function memberUpdate(id) { // 관리자 : 전체 회원 수정용
    document.updateFrm.id.value = id;
    document.updateFrm.submit();
}

function memberUpdateAdmin() {
    document.updateFormAdmin.submit();
}

function memberUpdateCancelAdmin() {
    location.href = "membermanager.jsp";
}