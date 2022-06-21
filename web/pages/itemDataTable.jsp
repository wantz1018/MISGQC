<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.Stmt" %>
<%@ page import="java.util.Objects" %><%--
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
    <script src="${pageContext.request.contextPath}/js/urlFilter.js"></script>
</head>
<body>
<form>
<table style="text-align: center">
    <tr>
        <th colspan="10">质检信息表</th>
    </tr>
    <tr>
        <td colspan="10" id="filterArea">
            <div>
                <span class="conditionPrompt">字段</span>
                <span class="conditionPrompt">值</span>
            </div>
        </td>
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
    int Page = 1;
    if (request.getParameter("Page") != null) Page = Integer.parseInt(request.getParameter("Page"));
    int TotalPage = 0;
    int PageSize = 10;
    if (request.getParameter("PageSize") != null)
        PageSize = Integer.parseInt(request.getParameter("PageSize"));
    String expression;
    expression = request.getParameter("expression");
    try {

        int TotalRecord;    //总数据数
        String sql = "select count(*) as recordCount from record where true";
        String sql2 = "select * from record where true";

        if (expression != null) {
            if (!request.getParameter("expression").equals("") || request.getParameter("expression") != null) {
                sql = sql + " and " + request.getParameter("expression");
                sql2 = sql2 + " and " + request.getParameter("expression");
            }
        }
        ResultSet resultSet = Stmt.getResultSet("record", sql2);
        assert resultSet != null;
        ResultSet rs = Stmt.getResult(sql);
        TotalRecord = Objects.requireNonNull(rs).getInt("recordCount");
        if (TotalRecord % PageSize == 0)
            TotalPage = TotalRecord / PageSize;
        else
            TotalPage = (int) Math.floor(TotalRecord / PageSize) + 1;
        if (TotalPage == 0) TotalPage = 1;
        if (request.getParameter("Page") == null || request.getParameter("Page").equals("")) Page = 1;
        else
            try {
                Page = Integer.parseInt(request.getParameter("Page"));
            } catch (java.lang.NumberFormatException e) {
                Page = 1;
            }
        if (Page < 1) Page = 1;
        if (Page > TotalPage) Page = TotalPage;
        if (resultSet.next()) {
            resultSet.absolute((Page - 1) * PageSize + 1);
            for (int iPage = 1; iPage <= PageSize; iPage++) {
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
        <td><a href="updateItemForm.jsp?id=<%=resultSet.getString("id")%>">修改</a></td>
    </tr>
<%

                if (!resultSet.next()) break;
            }
        }
        else {
            out.println(
                    "<tr><td colspan='7'>无结果</td></tr>"
            );
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
    <tr>
        <td>
            <a href="itemDataTable.jsp?Page=<%=Page - 1%>&PageSize=<%=PageSize%>&expression=<%=expression%>">上一页</a>
        </td>
        <td>
            <span>第</span>
            <input id="Page" type="number" name="Page" value="<%=Page%>">
            <span>页</span>
        </td>
        <td>
            <span>/</span>
            <span>共</span>
            <span><%=TotalPage%></span>
            <span>页</span>
        </td>
        <td><a><button type="button" id="jumpButton">跳转</button></a></td>
        <td>
            <span>每页</span>
            <input type="number" value="<%=PageSize%>" name="PageSize">
            <span>条</span>
        </td>
        <td>
            <a href="itemDataTable.jsp?Page=<%=Page + 1%>&PageSize=<%=PageSize%>&expression=<%=expression%>">下一页</a>
        </td>
    </tr>
</table>
</form>
</body>
</html>
