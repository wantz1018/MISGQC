<%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/7
  Time: 21:48
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>中储粮质检信息管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginTable.css">
    <meta charset="utf-8">
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body onload="createCheckCode()">
<form method="get" action="${pageContext.request.contextPath}/LoginAction">
    <table>
        <tr>
            <th colspan="3">用户登录</th>
        </tr>
        <tr>
            <td>
                <div class="prompt">用户id</div>
            </td>
            <td colspan="2"><input type="text" name="id" id="" required></td>
        </tr>
        <tr>
            <td>
                <div class="prompt">密码</div>
            </td>
            <td colspan="2"><input type="password" name="password" required></td>
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
            <td>
                <div><a href="">用户注册</a></div>
            </td>
            <td>
                <div><a href="">忘记密码</a></div>
            </td>
            <td id="checkCodeImgArea">
                <span class="prompt" id="checkCodeError"></span>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <input onclick="checkCheckCode()" id="loginButton" type="submit" value="登录">
            </td>
        </tr>
    </table>
</form>
</body>

</html>