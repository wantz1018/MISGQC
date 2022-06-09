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
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
<%
    try {
        ResultSet resultSet = Stmt.getResultSet("select * from user");
        while (true) {
            assert resultSet != null;
            if (!resultSet.next()) break;
            out.print(resultSet.getString("username"));
        }
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
</table>
</body>
</html>
