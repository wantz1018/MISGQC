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
</head>
<%
    ResultSet resultSet = Stmt.getResult("select username from user where id = '" + session.getAttribute("userID") + "'");
    String username = "游客";
    try {
        assert resultSet != null;
        username = resultSet.getString("username");
    } catch (SQLException e) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }
%>
<body>
<div class="beSelectedArea">
    <div class="dataItemArea">
    <div class="dataItem" id="id">序号</div>
    <div class="dataItem" id="dateTime">检测日期</div>
    <div class="dataItem" id="shoreName">实际储存库点</div>
    <div class="dataItem" id="shelfNo">货位号</div>
    <div class="dataItem" id="variety">品种</div>
    <div class="dataItem" id="moistureAndVolatiles">水分及挥发物</div>
    <div class="dataItem" id="insolubleImpurity">不溶性杂质</div>
    <div class="dataItem" id="solventResidue">溶剂残留量</div>
    <div class="dataItem" id="acidValue">酸值</div>
    <div class="dataItem" id="peroxideValue">过氧化值</div>
    </div>
</div>
<div class="container">图表区域</div>
<div class="chartInformationArea">所需信息</div>
</body>
</html>
