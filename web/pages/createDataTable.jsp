<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.Stmt" %><%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/27
  Time: 13:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String X = request.getParameter("X");
  String Y = request.getParameter("Y");
  ResultSet resultSet_1 = Stmt.getResult("select " + X + " from record");
  ResultSet resultSet_2 = Stmt.getResult("select " + Y + " from record");
%>
</body>
</html>
