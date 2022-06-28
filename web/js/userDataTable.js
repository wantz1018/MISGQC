window.onload = function () {
    document.getElementById("jumpButton").addEventListener("click", function () {
        let url = location.href;
        let Page = document.getElementById("Page").value;
        let reg = /Page=/;
        if (!reg.test(url)) location.href = url + "?Page=" + Page;
        else location.href=location.href.replace(/Page=\d*/, "Page=" + Page);
    })
}

function deleteConfirm(target) {
    if (confirm("是否删除？") === true) {
        location.href = target;
    }
}