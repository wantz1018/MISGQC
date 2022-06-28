        <%@ page import="java.sql.ResultSet" %>
<%@ page import="database.Stmt" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSetMetaData" %>
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
    ResultSet resultSet = null;
    if (("user").equals(request.getParameter("role"))) {
        resultSet = Stmt.getResult("select username from user where id = '" + session.getAttribute("userID") + "'");
    } else if (("administrator").equals(request.getParameter("role"))) {
        resultSet = Stmt.getResult("select name as username from administrator where id = '" + session.getAttribute("userID") + "'");
    }
    String username = "游客";
    String role = null;
    try {
        assert resultSet != null;
        username = resultSet.getString("username");
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        role = resultSetMetaData.getTableName(1);
    } catch (Exception e) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }

%>
<table class="preTable">
    <tr class="top-nav">
        <td class="topLeft" id="mainTop">
            <a href="${pageContext.request.contextPath}/pages/login.jsp">
        <div class="inline"><img src="https://www.sinograin.com.cn/image/logo.png"></div>
        <div class="inline"><span class="title">中储粮质检信息管理系统</span></div></a>
        </td>
        <td class="topRight">
        <span class="userInfo"><a href="login.jsp">注销</a></span>
        <span class="userInfo">欢迎您，<%=username%></span>
        </td>
    </tr>
</table>
<table class="mainTable">
    <tr style=" height: 90%">
        <td id="leftLabelArea">
            <div class="leftLabel" id="dataEntry">数据录入</div>
            <div class="leftLabel" id="itemDataLabel">全部数据</div>
            <div class="leftLabel" id="dataAnalysis">数据分析</div>
            <%
                try{
                assert role != null;
                if (role.equals("administrator")) {


            %>

            <div class="leftLabel" id="userManageLabel">用户管理</div>
            <script>
                    document.getElementById("userManageLabel").onclick = function () {
                        document.getElementById("iframeView").setAttribute("src", "userDataTable.jsp")
                }
            </script>
            <%
                }
                } catch (Exception ignored)  {}
            %>
        </td>
        <td id="iframe" >
            <iframe id="iframeView" src="itemDataTable.jsp" height="100%" width="100%">
            </iframe>
        </td>
    </tr>
</table>
</body>
</html>
