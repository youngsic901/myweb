window.onload = () => {
    document.querySelector("#btnSearch").onclick = function () {
        if(frm.searchWord.value === ""){
            // frm.searchWord.focus();
            frm.searchWord.placeholder="검색어를 입력하세요";
            return;
        }
        frm.submit();
    }
}