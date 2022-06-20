<%@ taglib prefix="input" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/19
  Time: 12:17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/AddAction">
  <table>
    <tr>
      <th>用户新增</th>
    </tr>
    <tr>
      <td>id</td>
      <td><input type="text" name="id" required/></td>
    </tr>
    <tr>
      <td>姓名</td>
      <td><input type="text" name="username" required></td>
    </tr>
    <tr>
      <td>密码</td>
      <td><input type="password" name="password" required></td>
    </tr>
    <tr>
      <td>电子邮箱</td>
      <td><input type="text" name="email" required></td>
    </tr>
    <tr>
      <td><a href="userDataTable.jsp">返回</a> </td>
      <td><input type="submit" value="提交"></td>
    </tr>
  </table>
</form>
</body>
</html>
