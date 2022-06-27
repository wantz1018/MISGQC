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

        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' 个' + this.point.name.toLowerCase();
            }
        }
    });
}