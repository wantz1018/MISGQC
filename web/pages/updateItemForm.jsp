        <%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/21
  Time: 15:33
--%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.Stmt" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateItemForm.css">
</head>
<body>
<%
    String id = request.getParameter("id");
    String dateTime;
    String storeName;
    String shelfNo;
    String variety;
    String moistureAndVolatiles;
    String insolubleImpurity;
    String solventResidue;
    String acidValue;
    String peroxideValue;
    try {
        ResultSet resultSet = Stmt.getResultSet("record", "select * from record where id = " + id);
        assert resultSet != null;
        resultSet.next();
        dateTime = resultSet.getString("dateTime");
        storeName = resultSet.getString("storeName");
        shelfNo = resultSet.getString("shelfNo");
        variety = resultSet.getString("variety");
        moistureAndVolatiles = resultSet.getString("moistureAndVolatiles");
        insolubleImpurity = resultSet.getString("insolubleImpurity");
        solventResidue = resultSet.getString("solventResidue");
        acidValue = resultSet.getString("acidValue");
        peroxideValue = resultSet.getString("peroxideValue");
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<form action="${pageContext.request.contextPath}/UpdateItemAction">
    <table>
    <tr>
        <th colspan="6">信息更改</th>
    </tr>
    <tr>
        <td colspan="3">
            编号
        </td>
        <td colspan="3">
            <input type="text" name="id" value="<%=id%>" readonly>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            检测时间
        </td>
        <td colspan="3">
            <input type="datetime-local" name="dateTime" value="<%=dateTime%>">
        </td>
    </tr>
    <tr>
        <td colspan="3">实际存储库点</td>
        <td colspan="3">
            <input type="text" name="storeName" value="<%=storeName%>">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            货位号
        </td>
        <td colspan="3">
            <input type="text" name="shelfNo" value="<%=shelfNo%>">
        </td>
    </tr>
    <tr>
        <td colspan="3">品种</td>
        <td colspan="3">
            <input type="text" name="variety" value="<%=variety%>">
        </td>
    </tr>
    <tr>
        <td colspan="3">水分及挥发物(%)</td>
        <td colspan="3">
            <input type="text" name="moistureAndVolatiles" value="<%=moistureAndVolatiles%>">
        </td>
    </tr>
    <tr>
        <td colspan="3">不溶性杂质(%)</td>
        <td colspan="3">
            <input type="text" name="insolubleImpurity" value="<%=insolubleImpurity%>">
        </td>
    </tr>
    <tr>
        <td colspan="3">溶剂残留量(mg/kg)</td>
        <td colspan="3">
            <input type="text" name="solventResidue" value="<%=solventResidue%>">
        </td>
    </tr>
    <tr>
        <td colspan="3">酸值(mg/g)</td>
        <td colspan="3">
            <input type="text" name="acidValue" value="<%=acidValue%>">
        </td>
    </tr>
    <tr>
        <td colspan="3">过氧化值(mmol/kg)</td>
        <td colspan="3">
            <input type="text" name="peroxideValue" value="<%=peroxideValue%>">
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <a href="itemDataTable.jsp"><button type="button">返回</button> </a>
        </td>
        <td colspan="2">
        <input type="reset" value="重置">
        </td>
        <td colspan="2">
            <input type="submit" value="更改">
        </td>

    </tr>
    </table>
</form>
</body>
</html>
