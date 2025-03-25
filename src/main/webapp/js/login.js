window.onload = () => {
    document.querySelector("#btnLogin").addEventListener("click", funcLogin);
    document.querySelector("#btnNewMember").addEventListener("click", funcNewMember);
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