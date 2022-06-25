<%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/25
  Time: 15:27
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册页面</title>
    <script src="${pageContext.request.contextPath}/js/checkCode.js"></script>
    <script src="${pageContext.request.contextPath}/js/checkPassword.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registered.css">
</head>
<body onload="createCheckCode()">
<div id="registeredForm">
<form action="${pageContext.request.contextPath}/RegisteredAction">
    <table id="registeredTable">
        <tr>
            <th colspan="2">用户注册</th>
        </tr>
        <tr>
            <td>
                用户ID
            </td>
            <td>
                <input type="text" name="id" pattern="[0-9]{6}" autocomplete="false" required>
            </td>
        </tr>
        <tr>
            <td>
                用户名
            </td>
            <td>
                <input type="text" name="username" required>
            </td>
        </tr>
        <tr>
            <td>
                电子邮箱
            </td>
            <td>
                <input type="text" name="email" pattern="[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9]+" required>
            </td>
        </tr>
        <tr>
            <td>
                输入密码
            </td>
            <td>
                <input id="password" placeholder="至少6字符" type="password" name="password" pattern="[a-zA-Z0-9-_!@#$%^&*?]{6.}" required>
                <span class="prompt" id="passwordFormatError">密码格式不正确</span>
            </td>
        </tr>
        <tr>
            <td>
                再次输入
            </td>
            <td>
                <input id="passwordConfirm" type="password" required>
                <span class="prompt" id="passwordNotEqual">两次密码不一致</span>
            </td>
        </tr>
        <tr>
            <td>
                <div class="prompt">验证码</div>
            </td>
            <td>
                <input type="text" name="" id="checkCodeInputBox" required>
                <a href="#" onclick="createCheckCode()"><img id="checkCodeCanvas" src="">看不清？</a>
            </td>
        </tr>
        <tr>
            <td><a href="login.jsp">返回登录</a></td>
            <td>
                <span class="prompt" id="checkCodeError"></span>
            </td>
        </tr>
        <tr>
            <td colspan="2"><input onclick="checkCheckCode();checkPassword()" id="registeredButton" type="submit" value="注册"></td>
        </tr>
    </table>
</form>
</div>
</body>
</html>
