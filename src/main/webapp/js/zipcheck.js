window.onload = () => {
    document.querySelector("#btnZipFind").onclick = dongCheck;

    document.querySelector("#btnZipClose").onclick = function(){
        window.close();
    }
}

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