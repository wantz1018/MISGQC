function canLastPage() {
    let Page = document.getElementById("Page").value;
    return Page !== "1";
}

function canNextPage() {
    let Page = document.getElementById("Page").value;
    let totalPage = document.getElementById("totalPage").innerHTML;
    return Page !== totalPage;
}