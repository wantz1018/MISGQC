<%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/9
  Time: 21:14
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/UpdateAction">
    <table>
        <tr>
            <th>用户信息更新</th>
        </tr>
        <tr>
            <td>用户编号</td>
            <td>
                <input type="text" name="id" value="<%=request.getParameter("id")%>" readonly required>
            </td>
        </tr>
        <tr>
            <td>用户姓名</td>
            <td>
                <input type="text" name="username" value="<%=request.getParameter("username")%>" required>
            </td>
        </tr>
        <tr>
            <td>用户密码</td>
            <td>
                <input type="password" name="password" value="<%=request.getParameter("password")%>" required>
            </td>
        </tr>
        <tr>
            <td>确认密码</td>
            <td>
                <input type="password" required>
            </td>
        </tr>
        <tr>
            <td>电子邮箱</td>
            <td>
                <input type="text" name="email" value="<%=request.getParameter("email")%>" required>
            </td>
        </tr>
        <tr>
            <td>管理密码</td>
            <td>
                <input type="password" name="adminPassword" required>
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" src="main.jsp" value="返回">
            </td>
            <td>
                <input type="submit" value="确认修改">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
