window.onload = function() {
    document.querySelector("#check").onclick = check;
}


function check() {
    if(frm.pass.value === "") {
        frm.pass.focus();
        alert("비밀번호를 입력하세요");
        return;
    }

    if(confirm("정말 수정 할까요?")){
        frm.submit();
    }
}