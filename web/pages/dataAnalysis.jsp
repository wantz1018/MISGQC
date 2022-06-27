<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="database.Stmt" %><%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/25
  Time: 10:32
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据分析页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataAnalysis.css">
    <script src="${pageContext.request.contextPath}/js/dataAnalysis.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/data.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="${pageContext.request.contextPath}/js/dataAnalysis.js"></script>
</head>
<%
    /*ResultSet resultSet = Stmt.getResult("select username from user where id = '" + session.getAttribute("userID") + "'");
    String username = "游客";
    try {
        assert resultSet != null;
        username = resultSet.getString("username");
    } catch (SQLException e) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }*/
%>
<body>
<div class="beSelectedArea">
    <table class="datatable" id="data">

    </table>
</div>
<div class="container"></div>
<div class="chartInformationArea">
    <form>
    <div class="chartInformation graph">
        <div>标题<input type="text" name="title" id="title"></div>
        <div>图表类型<select id="type">
            <option value="zzt">柱状图</option>
            <option value="txt">条形图</option>
            <option value="zxt">折线图</option>
            <option value="bt">饼图</option>
        </select></div>
    </div>
    <div class="chartInformation X-axis">
        <div class="dragTarget" >X轴</div>
        <div><select id="X-axis" name="X-axis">
            <option value="null"></option>
            <option value="id">编号</option>
            <option value="dateTime">检测日期</option>
            <option value="storeName">实际存储库点</option>
            <option value="shelfNo">货位号</option>
            <option value="variety">品种</option>
            <option value="moistureAndVolatiles">水分及挥发物</option>
            <option value="insolubleImpurity">不溶性杂质</option>
            <option value="solventResidue">溶剂残留量</option>
            <option value="acidValue">酸值</option>
            <option value="peroxideValue">过氧化值</option>
        </select></div>
    </div>
    <div class="chartInformation Y-axis">
        <div class="dragTarget">Y轴</div>
        <div><select id="Y-axis" name="Y-axis">
            <option value="null"></option>
            <option value="id">编号</option>
            <option value="dateTime">检测日期</option>
            <option value="storeName">实际存储库点</option>
            <option value="shelfNo">货位号</option>
            <option value="variety">品种</option>
            <option value="moistureAndVolatiles">水分及挥发物</option>
            <option value="insolubleImpurity">不溶性杂质</option>
            <option value="solventResidue">溶剂残留量</option>
            <option value="acidValue">酸值</option>
            <option value="peroxideValue">过氧化值</option>
        </select></div>
    </div>
    <div class="chartInformation Y-axis-ex">
        <div class="dragTarget">额外Y轴</div>
        <div><select id="ex-Y-axis" name="ex-Y-axis">
            <option value="null"></option>
            <option value="id">编号</option>
            <option value="dateTime">检测日期</option>
            <option value="storeName">实际存储库点</option>
            <option value="shelfNo">货位号</option>
            <option value="variety">品种</option>
            <option value="moistureAndVolatiles">水分及挥发物</option>
            <option value="insolubleImpurity">不溶性杂质</option>
            <option value="solventResidue">溶剂残留量</option>
            <option value="acidValue">酸值</option>
            <option value="peroxideValue">过氧化值</option>
        </select></div>
    </div>
    <div class="chartInformation">
        <input type="submit" value="生成" onclick="showChart()">
    </div>
    </form>
</div>
</body>
</html>
