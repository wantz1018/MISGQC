<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.Stmt" %><%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/10
  Time: 20:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
    <title>质检信息表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/itemDataTable.css">
</head>
<body>
<form>
<table style="text-align: center">
    <tr>
        <th colspan="10">质检信息表</th>
    </tr>
    <tr>
        <td colspan="5">筛选条件</td>
        <td colspan="5">值</td>
    </tr>
    <tr><td colspan="10"><input type="submit" value="筛选"></td></tr>
    <tr>
        <td>编号</td>
        <td>检测日期</td>
        <td>实际存储库点</td>
        <td>货位点</td>
        <td>品种</td>
        <td>水分及挥发物<br>(%)</td>
        <td>不溶性杂质<br>(%)</td>
        <td>溶剂残留量<br>(mg/kg)</td>
        <td>酸值<br>(mg/g)</td>
        <td>过氧化值<br>(mmol/kg)</td>
    </tr>
<%
    try {
        ResultSet resultSet = Stmt.getResultSet("record");
        do {
            assert resultSet != null;
%>
    <tr class="itemDataRow">
        <td><%=resultSet.getString("id")%></td>
        <td><%=resultSet.getString("dateTime")%></td>
        <td><%=resultSet.getString("storeName")%></td>
        <td><%=resultSet.getString("shelfNo")%></td>
        <td><%=resultSet.getString("variety")%></td>
        <td><%=resultSet.getString("moistureAndVolatiles")%></td>
        <td><%=resultSet.getString("insolubleImpurity")%></td>
        <td><%=resultSet.getString("solventResidue")%></td>
        <td><%=resultSet.getString("acidValue")%></td>
        <td><%=resultSet.getString("peroxideValue")%></td>
    </tr>
<%
        } while (resultSet.next());
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
</table>
</form>
</body>
</html>
