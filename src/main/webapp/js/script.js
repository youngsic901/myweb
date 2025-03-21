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