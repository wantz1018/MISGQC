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
</head>
<body>
<table style="height: 100%;width: 100%; border: plum;">
    <tr style="background-color: lightgoldenrodyellow; height: 10%"><td colspan="2"> </td></tr>
    <tr style="background-color: aquamarine; height: 80%">
        <td style="width: 15%; background-color: khaki">
            <div>质检数据</div>
            <div>用户管理</div>
        </td>
        <td style="background-color: burlywood; width: 75%; vertical-align: top">
登录成功！
<%@ include file="userDataTable.jsp"%>
        </td>
    </tr>
    <tr style="background-color: chocolate; height: 10%"><td colspan="2"> </td></tr>
</table>
</body>
</html>
