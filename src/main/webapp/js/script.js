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