<%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/24
  Time: 17:39
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        #datatable {
            border: 1px solid #ccc;
            border-collapse: collapse;
            border-spacing: 0;
            font-size: 12px;
        }
        td,th {
            border: 1px solid #ccc;
            padding: 4px 20px;
        }
    </style>
    <script src="https://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/data.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
</head>
<body>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<p>数据表格</p>
<table id="datatable">
    <thead>
    <tr>
        <th></th>
        <th>小张</th>
        <th>小潘</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th>苹果</th>
        <td>3</td>
        <td>4</td>
    </tr>
    <tr>
        <th>梨</th>
        <td>2</td>
        <td>0</td>
    </tr>
    <tr>
        <th>葡萄</th>
        <td>5</td>
        <td>1</td>
    </tr>
    <tr>
        <th>香蕉</th>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <th>橘子</th>
        <td>2</td>
        <td>4</td>
    </tr>
    </tbody>
</table>
<script>
    var chart = Highcharts.chart('container', {
        data: {
            table: 'datatable'
        },
        chart: {
            type: 'spline'
        },
        title: {
            text: '从 HTML 表格中提取数据并生成图表'
            // 该功能依赖 data.js 模块，详见https://www.hcharts.cn/docs/data-modules
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: '个',
                rotation: 0
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' 个' + this.point.name.toLowerCase();
            }
        }
    });
</script>
</body>
</html>
