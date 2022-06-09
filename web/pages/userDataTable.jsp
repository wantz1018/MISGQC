<%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/9
  Time: 19:48
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="database.Stmt" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>用户信息表</th>
    </tr>
    <tr>
        <td>id</td>
        <td>姓名</td>
        <td>密码</td>
        <td>电子邮箱</td>
        <td colspan="3">操作</td>
    </tr>
<%
    try {
        ResultSet resultSet = Stmt.getResultSet("user", "");
        do {
            assert resultSet != null;
%>
    <tr>
        <td><%=resultSet.getString("id")%></td>
        <td><%=resultSet.getString("username")%></td>
        <td><%=resultSet.getString("password")%></td>
        <td><%=resultSet.getString("email")%></td>
        <td>详细</td>
        <td><a href="updateForm.jsp?id=<%=resultSet.getString("id")%>&username=<%=resultSet.getString("username")%>&password=<%=resultSet.getString("password")%>&email=<%=resultSet.getString("email")%>">修改</a></td>
        <td>删除</td>
    </tr>
<%
        } while (resultSet.next());
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
    <tr>
        <td>新建</td>
    </tr>
</table>
</body>
</html>
