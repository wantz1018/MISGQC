<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.Stmt" %>
<%@ page import="java.sql.SQLException" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/8
  Time: 14:31
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>中储粮质检信息管理系统</title>

    <script src="${pageContext.request.contextPath}/js/leftLabelClicked.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainPageElement.css">
</head>
<body>
<%
    ResultSet resultSet = Stmt.getResult("select username from user where id = '" + session.getAttribute("userID") + "'");
    String username;
    try {
        assert resultSet != null;
        username = resultSet.getString("username");
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<table style="height: 100%;width: 100%; border: plum;">
    <tr style="background-color: lightgoldenrodyellow; height: 10%"><td id="mainTop" colspan="2">
        <span>欢迎您，<%=username%></span>
        <span><a href="login.jsp">注销</a></span>
    </td></tr>
    <tr style="background-color: aquamarine; height: 80%">
        <td style="width: 15%; background-color: khaki" id="leftLabelArea">
            <div class="leftLabel" id="dataEntry">数据录入</div>
            <div class="leftLabel" id="itemDataLabel">全部数据</div>
            <div class="leftLabel" id="dataAnalyse">数据分析</div>
            <div class="leftLabel" id="userManageLabel">用户管理</div>
        </td>
        <td style="background-color: burlywood; width: 75%; vertical-align: top">
            <iframe id="iframeView" src="itemDataTable.jsp" height="100%" width="100%">
            </iframe>
        </td>
    </tr>
    <tr style="background-color: chocolate; height: 10%"><td colspan="2"> </td></tr>
</table>
</body>
</html>
