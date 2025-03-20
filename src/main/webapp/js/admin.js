function check(){
    if(frm.id.value === "" || frm.pwd.value === ""){
        alert("자료를 입력하세요");
        return;
    }
    frm.submit();
}