<%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/20
  Time: 19:05
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/itemDataInput.css">
</head>
<body>
<form action="${pageContext.request.contextPath}/AddItemAction">
    <table>
        <tr>
            <th colspan="2">数据录入</th>
        </tr>
        <tr>
            <td>
                编号
            </td>
            <td>
                <input type="text" name="id">
            </td>
        </tr>
        <tr>
            <td>
                检测时间
            </td>
            <td>
                <input type="datetime-local" name="dateTime">
            </td>
        </tr>
        <tr>
            <td>实际存储库点</td>
            <td>
                <input type="text" name="storeName">
            </td>
        </tr>
        <tr>
            <td>
                货位号
            </td>
            <td>
                <input type="text" name="shelfNo">
            </td>
        </tr>
        <tr>
            <td>品种</td>
            <td>
                <input type="text" name="variety">
            </td>
        </tr>
        <tr>
            <td>水分及挥发物(%)</td>
            <td>
                <input type="text" name="moistureAndVolatiles">
            </td>
        </tr>
        <tr>
            <td>不溶性杂质(%)</td>
            <td>
                <input type="text" name="insolubleImpurity">
            </td>
        </tr>
        <tr>
            <td>溶剂残留量(mg/kg)</td>
            <td>
                <input type="text" name="solventResidue">
            </td>
        </tr>
        <tr>
            <td>酸值(mg/g)</td>
            <td>
                <input type="text" name="acidValue">
            </td>
        </tr>
        <tr>
            <td>过氧化值(mmol/kg)</td>
            <td>
                <input type="text" name="peroxideValue">
            </td>
        </tr>
        <tr>
            <td>
                <a href="itemDataTable.jsp"><button type="button">返回</button> </a>
            </td>
            <td>
                <input type="submit" value="添加">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
