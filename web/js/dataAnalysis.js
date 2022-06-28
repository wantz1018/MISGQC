function showChart() {
    var chart = Highcharts.chart('container', {
        data: {
            table: 'datatable'
        },
        chart: {
            type: document.getElementById("type").value
        },
        title: {
            text: document.getElementById("title").value
            // 该功能依赖 data.js 模块，详见https://www.hcharts.cn/docs/data-modules
        },
        xAxis: {
            allowDecimals: false,
            title: document.getElementById("X-axis").value
        },
        yAxis: {
            allowDecimals: false,
            title: document.getElementById("Y-axis").value
        },
    });
}

function choose() {
    if (document.getElementById("X-axis").value === "null" || document.getElementById("Y-axis").value === "null" || document.getElementById("Y-type").value === "") {
        alert("请选择必要参数！")
        document.getElementById("chooseBtn").setAttribute("type", "button")

    }
    else {
        document.getElementById("chooseBtn").setAttribute("type", "submit")
    }
}