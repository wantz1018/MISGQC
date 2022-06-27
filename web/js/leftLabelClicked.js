window.onload = function ()
{
    document.getElementById("dataAnalysis").addEventListener("click", function () {
        document.getElementById("iframeView").setAttribute("src", "dataAnalysis.jsp")
    })

    document.getElementById("itemDataLabel").addEventListener("click", function () {
        document.getElementById("iframeView").setAttribute("src", "itemDataTable.jsp")
    })
    document.getElementById("dataEntry").addEventListener("click", function () {
        document.getElementById("iframeView").setAttribute("src", "itemDataInput.jsp")
    })
}