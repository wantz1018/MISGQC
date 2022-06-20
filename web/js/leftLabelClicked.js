window.onload = function ()
{
    document.getElementById("userManageLabel").addEventListener("click", function () {
        document.getElementById("iframeView").setAttribute("src", "userDataTable.jsp")
    })

    document.getElementById("itemDataLabel").addEventListener("click", function () {
        document.getElementById("iframeView").setAttribute("src", "itemDataTable.jsp")
    })
    document.getElementById("dataEntry").addEventListener("click", function () {
        document.getElementById("iframeView").setAttribute("src", "itemDataInput.jsp")
    })
}