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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addForm.css">
</head>
<body>
<form action="${pageContext.request.contextPath}/AddAction">
  <table>
    <tr>
      <th>用户新增</th>
    </tr>
    <tr>
      <td>id</td>
      <td><input type="text" name="id"  pattern="[0-9]{6}" autocomplete="false" required/></td>
    </tr>
    <tr>
      <td>姓名</td>
      <td><input type="text" name="username" autocomplete="false" required></td>
    </tr>
    <tr>
      <td>密码</td>
      <td><input type="password" name="password"  placeholder="至少6字符"   pattern="[a-zA-Z0-9-_!@#$%^&*?]{6.}" required></td>
    </tr>
    <tr>
      <td>电子邮箱</td>
      <td><input type="text" name="email" pattern="[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9]+" placeholder="admin@example.com" autocomplete="false" required></td>
    </tr>
    <tr>
      <td><a href="userDataTable.jsp">返回</a> </td>
      <td><input type="submit" value="提交"></td>
    </tr>
  </table>
</form>
</body>
</html>
